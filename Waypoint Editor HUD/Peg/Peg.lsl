/* The Peg script for waypoint management */

integer num;
string notecard;
list links;
integer channel;
string name;
string status;
vector pos;
integer zListener;
integer gListener;
integer PEG_CHAN=699;
integer CONTROLLER_CHAN=68;
integer curTarget;
vector myPos;
list linkUids;

doReport()
{
            string str = "MARKER|"+(string)num+"|"+(string)llGetPos()+"|"+name+"|"+(string)llGetKey();
            llRegionSay(CONTROLLER_CHAN, str);
}

default
{
    on_rez(integer m)
    {
        num = m;
        llSetText("Uninitialized", <1,1,1>, 1.0);
        //zListener =  llListen(channel, "","","");
        gListener =  llListen(PEG_CHAN, "","","");
        string str = "MARKER|"+(string)num+"|"+(string)llGetPos()+"|"+name+"|"+(string)llGetKey();
        llRegionSay(CONTROLLER_CHAN, "MRKKEY|"+(string)num+"|"+(string)llGetKey());

    }

    touch_start(integer n)
    {
            string str="Peg Num:"+(string)num+"\nName:"+name+"\nLinks:"+llList2CSV(links)+"\nNotecard:"+notecard;
            //llOwnerSay(str);
            llRegionSay(CONTROLLER_CHAN, "CLICKED|"+num);
            //llDialog(llGetOwner(), " "+ str, ["Name", "Links", "Notecard"], channel);
    }

    listen(integer chan, string wname, key id, string data)
    {
            if (data == "die")
            {
                llDie();
            }
            else if (data == "REPORT")
            {
                doReport();
            }

            list l = llParseStringKeepNulls(data, ["|"], []);
            if ((integer)llList2String(l,0) != num)     return;

            string cmd = llList2String(l,1);

            if (cmd == "SETDATA")
            {
                pos = (vector)llList2String(l, 2);
                name =   llList2String(l, 3);
                string lstr  = llList2String(l, 4);
                notecard  = llList2String(l, 5);
                links = llParseString2List(lstr, [","],[]);
                lstr  = llList2String(l, 6);
                linkUids = llParseString2List(lstr, [","],[]);
                llSetRegionPos(pos);
                llSetText("Num="+(string)num+"\nName="+name+"\nLinks:"+llList2CSV(links), <1,0,0>, 1.0);
                if (llGetListLength(linkUids))
                    llSetTimerEvent(2);
                myPos = pos;

            }

    }

    timer()
    {
        if (llGetPos() != myPos)
        {
                myPos = llGetPos();
                doReport();
        }

        if (llGetListLength(linkUids))
        {
            curTarget +=1;
            if (curTarget >= llGetListLength(linkUids))
                curTarget =0;
            key tkey = llList2Key(linkUids, curTarget);

                llParticleSystem(
                [
                    PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_DROP,
                    PSYS_SRC_BURST_RADIUS,0.1,
                    PSYS_SRC_ANGLE_BEGIN,0,
                    PSYS_SRC_ANGLE_END,0.05,
                    PSYS_PART_START_COLOR,<0.2,0.99, 0.5>,
                    PSYS_PART_END_COLOR,<0.9,0.9,.9>,
                    PSYS_PART_START_ALPHA,.9,
                    PSYS_PART_END_ALPHA,.9,
                    PSYS_PART_START_GLOW,0,
                    PSYS_PART_END_GLOW,0,
                    PSYS_PART_START_SCALE,<1., 1, 0.000000>,
                    PSYS_PART_END_SCALE,<1., 1., 0.000000>,
                    PSYS_SRC_MAX_AGE,2.0,
                    PSYS_SRC_TARGET_KEY, tkey,
                    PSYS_PART_MAX_AGE,6,
                    PSYS_SRC_BURST_RATE,0.05,
                    PSYS_SRC_BURST_PART_COUNT,1,
                    PSYS_SRC_OMEGA,<0.000000,0.000000,.000000>,
                    PSYS_SRC_BURST_SPEED_MIN,.1,
                    PSYS_SRC_BURST_SPEED_MAX,.1,
                    PSYS_PART_FLAGS,
                        0 |
                        PSYS_PART_EMISSIVE_MASK |
                        PSYS_PART_TARGET_LINEAR_MASK
                ]);
        }
        else
            llParticleSystem([]);
    }
}
