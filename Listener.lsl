string chatKey = "";
string NPCNAME="INVALID";
key npc = NULL_KEY;
integer gListener=-1;
integer zListener=-1;
integer aviNameLength;
string status = "";
integer lightOn = 0;
list talkedUids;
integer nameLength;
integer isPrompt;
string filter;
key controllerKey=NULL_KEY;
integer channel;
integer listener = -1;

startListening()
{
   if (listener == -1)
   {
       channel = -1 - (integer)("0x" + llGetSubString( (string) llGetOwner(), -6, -1) )-19 ;
       listener = llListen(channel, "", "","");
       llSetTimerEvent(120);
    }
}

key dialogUser;
// Event handlers
default
{
    state_entry()
    {
        // script was reset while already attached
        if (llGetAttached() != 0) {
            key id = llGetOwner();
            if (id!=NULL_KEY)
            {
                string name= llKey2Name(llGetOwner());
                NPCNAME = llToLower(llGetSubString(name, 0, llSubStringIndex(name, " ") - 1));
                nameLength = llStringLength(NPCNAME);
                filter = NPCNAME + " ";
                zListener = llListen(0, "", "", "");
                //llSay(0, NPCNAME+ " listening");
            }
                //llRegionSay(68, "LISTENERSTART "+llGetKey()+ " "+llGetOwner());
        }
    }
    on_rez(integer i) {
        llResetScript();
    }
    listen(integer chan, string name, key id, string mes)
    {
            if (chan==0)
            {
                if (id == llGetOwner()) return;
                if (isPrompt)
                {
                    // dont filter, but  dont prompt again
                    isPrompt=0;
                }
                else
                {
                    if (llToLower(llGetSubString(mes, 0, nameLength)) != filter)
                    return;
                }
                   //  llSay(0,"Got " +mes);
                if (controllerKey != NULL_KEY)
                {
                    osMessageObject(controllerKey, "! "+(string)id+ " " +NPCNAME+ " "+mes);
                }
                else
                    llRegionSay(68, "! "+(string)id+ " " +NPCNAME+ " "+mes);
            }
            else if (chan == channel)
            {
                if (mes == "CANCEL") return;
                else if (mes == "^") mes="f";
                else if (mes == "<") mes="l";
                else if (mes == ">") mes="r";
                llRegionSay(68, "! "+(string)dialogUser+ " " +NPCNAME+ " "+NPCNAME+ " "+mes);
                //llOwnerSay( "! "+(string)dialogUser+ " " +NPCNAME+ " "+NPCNAME+ " "+mes);
            }
    }
    dataserver(key qid, string mes)
    {
        if (mes == "find-balls")
        {
            llSensor("~ball3", "", SCRIPTED, 16, PI);
            llSensor("~ball2", "", SCRIPTED, 16, PI);
            llSensor("~ball1", "", SCRIPTED, 16, PI);
            llSensor("~ball0", "", SCRIPTED, 16, PI);
            status="looking1";
        }
        else if (llGetSubString(mes, 0,1) == "do")
        {
            string bn = llGetSubString(mes, 3, llStringLength(mes));
            llSensor(bn, "", SCRIPTED, 16, PI);
            status="looking2";
        }
        else if (llGetSubString(mes, 0,6) == "lookfor")
        {
            string bn = llGetSubString(mes, 3, llStringLength(mes));
            llSensor(bn, "", ACTIVE, 30, PI);
            status="looking2";
        }
        else if (llGetSubString(mes, 0,10) == "listenregex")
        {
            string regex = llGetSubString(mes, 12, -1);
            llListenRemove(zListener);
            zListener = osListenRegex(0, "", "", regex, OS_LISTEN_REGEX_MESSAGE);
        }
        else if (llGetSubString(mes, 0, 5) == "prompt")
        {
            isPrompt =1;
        }
        else if (llGetSubString(mes, 0, 5) == "listen")
        {
            llListenRemove(zListener);
            zListener = llListen(0, "", "", "");
        }
        else if (llGetSubString(mes, 0,12) == "controllerkey")
        {
            //list tok = llParseString2List(mes, [" "], []);
            controllerKey = (key)llGetSubString(mes, 14, -1);
            //llSay(0,"Controller key = "+(string)controllerKey);
        }
        else if (llGetSubString(mes, 0,4) == "sound")
        {
            list tok = llParseString2List(mes, [" "], []);
            llPlaySound(llList2Key(tok,1), llList2Float(tok,2));
        }
        else if (llGetSubString(mes, 0, 4) == "light")
        {
            lightOn = !lightOn;
            llSetPrimitiveParams([PRIM_POINT_LIGHT, lightOn, <0.973, 0.543, 0.055>, 1.0, 20.0, 0.1]);
        }

    }
    sensor(integer detected)
    {

        list det = [];
        integer i;
        for (i=0;i < detected; i++)
        {
            key k = llDetectedKey(i);
            det += k;
        }
        llRegionSay(68, "FBALL "+NPCNAME+" "+llDumpList2String(det," "));
    }
    timer()
    {
        if (listener != -1)
        {
            llListenRemove(listener);
            listener = -1;
            llSetTimerEvent(0);
        }
    }
}
