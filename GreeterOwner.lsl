/**
 * Adapted version to greet only owner.
 *
 * Simple greeter script that checks for visitors. If a new, previously unseen
 * visitor is found, it sends a number of commands to an NPC.  The commands
 * teleport the NPC in front  of the user, and say a welcome message.
 */

integer GREETVISITORS = FALSE;
integer GREETOWNER = TRUE;
string GREETER = "Emilie";
string OWNERGREETER = "Betty";

integer channel = 68;

list seen = [];
list already = [];

string vec2str(vector v)
{
    return "<"+v.x+","+v.y+","+v.z+">";
}

checkVisitors()
{
    list avis = llGetAgentList(AGENT_LIST_REGION, []);
    integer howmany = llGetListLength(avis);
    integer i;
    for ( i = 0; i < howmany; i++ ) {
        if ( ! osIsNpc(llList2Key(avis, i)) )
        {
            key u = llList2Key(avis, i);
            if (llListFindList(seen, [u])<0)
            {
                list ud =llGetObjectDetails(u, [OBJECT_NAME,OBJECT_POS, OBJECT_ROT]);
                vector v = llList2Vector(ud, 1);
                rotation r = llList2Rot(ud, 2);

                string scr;
                if ( llListFindList(already, [u])<0)
                {
                    string greeter;
                    string name = llKey2Name(u);

                    scr = "teleport "+vec2str(v+<2,0,0>*r) +";"
                    + "stop;"
                    + "lookat "+vec2str(v)+";"
                    + "anim bow;"
                    + "anim smile;";

                    if( u == llGetOwner() && GREETOWNER ) {
                        greeter = OWNERGREETER;
                        scr += "say Welcome home, " + name + "!;"
                        + "wait 50;"
                        + "follow " + name + ";";
                        llOwnerSay("Greet Owner ");
                        } else if( u != llGetOwner() && GREETVISITORS ) {
                            greeter = GREETER;
                            scr += "say  Welcome to My Region;"
                            + "wait 50;"
                            + "leave;";
                        }

                        // scr = "say I am ready now";
                        string cmd = "! 0000-0000-0000-0000 " + greeter + " " + greeter + " batch " + scr;
                        llOwnerSay("Greeting " + name + "\n/68 "+ cmd);
                        llRegionSay(channel, cmd);

                        already += u;
                    }
                }
            }
        }
        seen = avis;
    }

    default
    {
        state_entry()
        {
            llSetTimerEvent(30);
            checkVisitors();
        }
        timer()
        {
            checkVisitors();
        }
    }
