//EDITS: Help Line (59) Beds (1) & (84-128)
integer rezzedBeds =0;
string vec2str(vector v) //string without spaces
{
   return "<"+(string)v.x+","+(string)v.y+","+(string)v.z+">";
}

key getAgentByName(string firstName)
{
        firstName = llToLower(firstName);
        list ag = osGetAvatarList();
        integer howmany = llGetListLength(ag);
        integer i;
        for (i =0; i < howmany; i+=3)
        {
            string name = llList2String(ag, i+2);
            integer sep = llSubStringIndex(name, " ");
            if (llToLower(llGetSubString(name, 0,sep-1)) == firstName)
            {
                return llList2Key(ag, i);
            }
        }
    return NULL_KEY;
}

// This can be used to send a command back to the controller, e.g. ControllerDo("Bob", "say i am an NPC");
 ControllerDo(string npcName, string msg)
{
    llMessageLinked(LINK_THIS, 0, "! "+(string)NULL_KEY+" "+npcName+" " +npcName+ " "+msg, NULL_KEY);
}


default
{
    link_message(integer lnk, integer num, string command, key uNPC) // This script is in the object too.
    {
        if (num!=-1) return;/// Only process what the controller sent

        list tokens = llParseString2List(command, [",", " "], [] );

        if (llList2String(tokens,0) == "!")
        {
            // The commands are of the form "! <sending-object-uuid> Bob Bob follow me" (notice the name of the NPC given twice)

            string sendUid = llList2String(tokens,1);
            string npcName = llToLower(llList2String(tokens,2));

            string name2 = llToLower(llList2String(tokens,3));
            string cmd1 = llList2String(tokens, 4);
            string cmd2 = llList2String(tokens, 5);


            if (cmd1=="hide" || cmd1 == "show")
            {
                // This can be used to hide-show attachments in the hands that use the ClothesListener script.
                osMessageAttachments(uNPC, cmd2+"-"+cmd1, [OS_ATTACH_MSG_ALL], 0);
            }
            else if (cmd1 == "help")
            {
            osNpcSay(uNPC, "I accept the following commands:\n Say '"+ npcName+ " follow me' <or name> and I will follow.\n Say '"+ npcName+ " use <object>' I will sit on the object you specify.\n Say '"+ npcName+ " dance' and I will dance for you.\n Say '"+ npcName+ " kiss me' for a kiss and hug animation.\n More information can be obtained at:\n https://github.com/opensimworld/active-npcs ");
            }
            else if (cmd1 == "go") //walk back (b) forward (f) right (r) or left (l)
            {

                rotation r = osNpcGetRot(uNPC);
                vector v = osNpcGetPos(uNPC);
                float mf = (float)cmd2;
                if  (mf <=0) mf = 1.; // Default one meter
                vector m;
                if (cmd2 == "f") m = <1,0,0>;
                else if (cmd2 == "b") m = <-1,0,0>;
                else if (cmd2 == "l") m = <0,1,0>;
                else if (cmd2 == "r") m = <0,-1,0>;

                osNpcMoveToTarget(uNPC, v + mf*m*r, OS_NPC_NO_FLY );
            }
            else if (cmd1 == "runaround")
            {
                // The Npc will start to aimlessly run around in the specified radius (default 5m). Example: "Bob runaround 10"
                float rad = (float)cmd2;
                if (rad <=0) rad = 5;
                vector v = osNpcGetPos(uNPC);
                ControllerDo(npcName, "batch @loop; runtovr "+vec2str(v-<rad,rad,0>)+" " + vec2str(v+<rad,rad,0>)+"; jump loop");
            }
            // add commands here between () separated by || as shown below
            else if (cmd1 == "kiss" || cmd1 == "hug")
            //else if (cmd1 == "kiss" || cmd1 == "hug" || cmd1 == "yourCMD")
            {
                key who = (key)sendUid;
                if (cmd2!="me")
                    who = getAgentByName(cmd2);

                if (who != NULL_KEY)
                {
                    list userData=llGetObjectDetails((key)who, [OBJECT_NAME,OBJECT_POS, OBJECT_ROT]);
                    vector v= llList2Vector(userData, 1);
                    vector size = llGetAgentSize(who);

                    string mf = "specialbedF";
                    if (npcName == "alba" || npcName == "julia" || npcName =="livia")
                    {
                        mf = "specialbedF";

                    }
                    else
                    {
                        mf = "specialbed";

                    }

                    osNpcStand(uNPC);
                    rotation br = llEuler2Rot(<0,0,2*PI*llFrand(1.)>);
                    //if you added a command above add a statement for the animation bed you want rezzed in this section
                    //the +hugbed and +yourbed are identical to the +kissbed you you can rename and modify those objects.
                    //if you change their names ensure it matches the names in this script.
                    if (cmd1 == "kiss")
                        llRezObject("+kissbed", llGetPos()+<1,0,0>, ZERO_VECTOR, br, ++rezzedBeds);
                    else if (cmd1 == "hug")
                        llRezObject("+hugbed", llGetPos()+<1,0,0>, ZERO_VECTOR, br, ++rezzedBeds);
                    //else if (cmd1 == "yourCMD") // <--Example
                        //llRezObject("+hugbed", llGetPos()+<1,0,0>, ZERO_VECTOR, br, ++rezzedBeds); // <-- Example
                    else
                        llRezObject("+yourbed", llGetPos()+<1,0,0>, ZERO_VECTOR, br, ++rezzedBeds);
                    mf = "animbed"+rezzedBeds;
                    llSleep(3);
                    llRegionSay(1980, mf+" "+ (vec2str(v-<0,0,size.z/1.5-0.2 -.2 >)) ) ;
                    llRegionSay(1980, mf+" forcesit "+ (string)who);
                    string script = "batch runtov "+ vec2str(v)+ ";use "+mf+";wait 96600;stop";

                    ControllerDo(npcName, script);
                }
             }
             else if (cmd1 == "fetch")
             {
                // Used to teleport a user near you . Example: "Bob fetch alice" . Requires osTeleportAgent permissions
                key u = getAgentByName(cmd2);

                if (u != NULL_KEY)
                {
                    list userData=llGetObjectDetails((key)sendUid, [OBJECT_NAME,OBJECT_POS, OBJECT_ROT]);
                    vector v= llList2Vector(userData, 1);
                    osTeleportAgent(u, v + <0,0,1>, <0,0,0>);
                }

            }
            else if (cmd1 == "daytime")
            {
                // Sets the time of day . E.g. "Bob daytime 1". Say "Bob daytime off" to revert to region default
                float dt = (float)cmd2;
                if (cmd2 =="off")
                {
                    osSetRegionSunSettings( FALSE, FALSE, 0 );
                    osNpcSay(uNPC," Setting day time to default");
                }
                else
                {
                    osSetRegionSunSettings( FALSE, TRUE, (float)(dt) );
                    osNpcSay(uNPC," Setting day time to "+(string)dt+"h");
                }
            }
            else if (cmd1 =="undress")
            {
                ControllerDo(npcName, "dress naked");
                llSleep(2);
                osNpcSay(uNPC, "Now I feel like Britney: free!");
            }
            else if (cmd1 == "get" && cmd2 == "balls")
            {
                ControllerDo(npcName, "dress hir");
            }
            else
            {
              /* Unknown command */
            }
        }
    }
}
