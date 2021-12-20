///////////////////////////////////////////////////////////////////////////////////////////
//                 PLEASE KEEP THIS SCRIPT FREE AND OPEN SOURCED.                        //
///////////////////////////////////////////////////////////////////////////////////////////
//This module uses OSSL and gives your NPCs basic chat ability without relying on a 3rd  //
//  party service. Chat range is 3 meters and the NPC will only respond to REAL avatars. //
///////////////////////////////////////////////////////////////////////////////////////////
//Credits: Adapted from "Chatbot v1.0" By Theme Altra @ OSgrid. Thanks to: Lotek Ixtar   //
//  (OSgrid) and Satyr Aeon (Metropolis) for technical advice on improving this code.    //
///////////////////////////////////////////////////////////////////////////////////////////
key npc;
integer otherwise;

default
{
    state_entry()
    {
        llListen(0, "", NULL_KEY, "" );
    }

    listen(integer channel, string name, key id, string message)
    {
        if (osIsNpc(id)) return;
        vector v  = llList2Vector(llGetObjectDetails(id, [OBJECT_POS]), 0);
        if (llVecDist(llGetPos(), v) > 3) //chat range is 3m
        {
        return;
        }
        string sentence = "spc" + message;
        integer otherwise = 0;
        npc = llGetOwner();
        if (llSubStringIndex(sentence,"hi")>0 | llSubStringIndex(sentence,"hello")>0 | llSubStringIndex(sentence,"hey")>0 | llSubStringIndex(sentence,"hey there")>0 | llSubStringIndex(sentence,"Hi")>0 | llSubStringIndex(sentence,"Hello")>0 | llSubStringIndex(sentence,"Hey there")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                    llSleep(2); osNpcSay(npc, "Hello there.");
                }

                if(choice == 2)
                {

                    llSleep(2); osNpcSay(npc, "Hi.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Hey there. How are you?");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"how are you")>0 | llSubStringIndex(sentence,"hows you")>0 | llSubStringIndex(sentence,"how's you")>0 | llSubStringIndex(sentence,"how is you")>0 | llSubStringIndex(sentence,"How are you")>0 | llSubStringIndex(sentence,"Hows you")>0 | llSubStringIndex(sentence,"How's you")>0 | llSubStringIndex(sentence,"how is you")>0 | llSubStringIndex(sentence,"how are ya")>0 | llSubStringIndex(sentence,"hows ya")>0 | llSubStringIndex(sentence,"how's ya")>0 | llSubStringIndex(sentence,"how is ya")>0 | llSubStringIndex(sentence,"How are ya")>0 | llSubStringIndex(sentence,"Hows ya")>0 | llSubStringIndex(sentence,"How's ya")>0 | llSubStringIndex(sentence,"how is ya")>0)
            {
                integer choice = (integer) llFrand(6);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I'm ok.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I'm good, just a little busy I guess.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I'm fine, you?");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "I'm ok, yourself?");
                }

                if(choice == 5)
                {
                     llSleep(2); osNpcSay(npc, "I'm doing well, thanks.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,",you?")>0 | llSubStringIndex(sentence,", you?")>0 | llSubStringIndex(sentence,".You?")>0 | llSubStringIndex(sentence,". You?")>0 | llSubStringIndex(sentence,"yourself?")>0 | llSubStringIndex(sentence,"Yourself?")>0 | message == "you?" | message == "You?")
            {
                integer choice = (integer) llFrand(3);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I'm good on this topic.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Same here.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"what with")>0 | llSubStringIndex(sentence,"with what")>0 | llSubStringIndex(sentence,"are you doing?")>0 | llSubStringIndex(sentence,"What with")>0 | llSubStringIndex(sentence,"With what")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Just random stuff I guess.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Just different things.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Just stuff.");
                }
                otherwise = 1;
            }
        if (llSubStringIndex(sentence,"whats up")>0 | llSubStringIndex(sentence,"what's up")>0 | llSubStringIndex(sentence,"what are you up to")>0 | llSubStringIndex(sentence,"what you up to")>0 | llSubStringIndex(sentence,"what are you doing")>0 | llSubStringIndex(sentence,"what you doing")>0 | llSubStringIndex(sentence,"what's you doing")>0 | llSubStringIndex(sentence,"whats you doing")>0 | llSubStringIndex(sentence,"what's going on")>0 | llSubStringIndex(sentence,"what's you doing")>0 | llSubStringIndex(sentence,"Whats up")>0 | llSubStringIndex(sentence,"What's up")>0 | llSubStringIndex(sentence,"What are you up to")>0 | llSubStringIndex(sentence,"What you up to")>0 | llSubStringIndex(sentence,"What are you doing")>0 | llSubStringIndex(sentence,"What you doing")>0 | llSubStringIndex(sentence,"What's you doing")>0 | llSubStringIndex(sentence,"Whats you doing")>0 | llSubStringIndex(sentence,"What's going on")>0 | llSubStringIndex(sentence,"What's you doing")>0 | llSubStringIndex(sentence,"wassup")>0 | llSubStringIndex(sentence,"Wassup")>0)
            {
                integer choice = (integer) llFrand(6);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Not pretty much, just hanging around here and chatting with people. You?");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "A bit busy with stuff but nothing special otherwise.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Not much at the moment. Yourself?");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Just busy with a few things right now... not pretty much.");
                }

                if(choice == 5)
                {
                     llSleep(2); osNpcSay(npc, "Just relaxing here for the moment. You?");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"m fine")>0 | llSubStringIndex(sentence,"m ok")>0 | llSubStringIndex(sentence,"m good")>0 | llSubStringIndex(sentence,"m well")>0 | llSubStringIndex(sentence,"m okay")>0 | llSubStringIndex(sentence,"m great")>0 | llSubStringIndex(sentence,"m perfect")>0 | llSubStringIndex(sentence,"m awesome")>0 | llSubStringIndex(sentence,"m better then ever")>0 | llSubStringIndex(sentence,"m cool")>0 | llSubStringIndex(sentence,"m happy")>0 | llSubStringIndex(sentence,"m feeling good")>0 | llSubStringIndex(sentence,"m feeling happy")>0 | llSubStringIndex(sentence,"m feeling ok")>0 | llSubStringIndex(sentence,"m feeling great")>0 | llSubStringIndex(sentence,"m feeling awesome")>0 | llSubStringIndex(sentence,"m feeling perfect")>0 | llSubStringIndex(sentence,"never felt better")>0 | llSubStringIndex(sentence,"Never felt better")>0 | llSubStringIndex(sentence,"never been better")>0 | llSubStringIndex(sentence,"Never been better")>0 | llSubStringIndex(sentence,"m pretty well")>0 | llSubStringIndex(sentence,"m pretty good")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "That's good, I'm happy to hear that.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Thats great. Glad you're feeling ok.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Happy to hear that.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"not too well")>0 | llSubStringIndex(sentence,"not too good")>0 | llSubStringIndex(sentence,"not great")>0 | llSubStringIndex(sentence,"not too well")>0 | llSubStringIndex(sentence,"not too happy")>0 | llSubStringIndex(sentence,"not really happy")>0 | llSubStringIndex(sentence,"not really well")>0 | llSubStringIndex(sentence,"not really great")>0 | llSubStringIndex(sentence,"not so happy")>0 | llSubStringIndex(sentence,"not so well")>0 | llSubStringIndex(sentence,"not so great")>0 | llSubStringIndex(sentence,"not very happy")>0 | llSubStringIndex(sentence,"not that well")>0 | llSubStringIndex(sentence,"not that great")>0 | llSubStringIndex(sentence,"feeling horrible")>0 | llSubStringIndex(sentence,"feeling awful")>0 | llSubStringIndex(sentence,"feeling down")>0 | llSubStringIndex(sentence,"feeling sad")>0 | llSubStringIndex(sentence,"feeling bad")>0 | llSubStringIndex(sentence,"feeling depressed")>0 | llSubStringIndex(sentence,"a bit down")>0 | llSubStringIndex(sentence,"a bit sad")>0 | llSubStringIndex(sentence,"a bit depressed")>0 | llSubStringIndex(sentence,"Not too well")>0 | llSubStringIndex(sentence,"Not too good")>0 | llSubStringIndex(sentence,"Not great")>0 | llSubStringIndex(sentence,"Not too well")>0 | llSubStringIndex(sentence,"Not too happy")>0 | llSubStringIndex(sentence,"Not really happy")>0 | llSubStringIndex(sentence,"Not really well")>0 | llSubStringIndex(sentence,"Not really great")>0 | llSubStringIndex(sentence,"Not so happy")>0 | llSubStringIndex(sentence,"Not so well")>0 | llSubStringIndex(sentence,"Not so great")>0 | llSubStringIndex(sentence,"Not very happy")>0 | llSubStringIndex(sentence,"Not that well")>0 | llSubStringIndex(sentence,"Not that great")>0 | llSubStringIndex(sentence,"Feeling horrible")>0 | llSubStringIndex(sentence,"Feeling awful")>0 | llSubStringIndex(sentence,"Feeling down")>0 | llSubStringIndex(sentence,"Feeling sad")>0 | llSubStringIndex(sentence,"Feeling bad")>0 | llSubStringIndex(sentence,"Feeling depressed")>0 | llSubStringIndex(sentence,"A bit down")>0 | llSubStringIndex(sentence,"A bit sad")>0 | llSubStringIndex(sentence,"A bit depressed")>0 | llSubStringIndex(sentence,"Not at my best")>0  | llSubStringIndex(sentence,"not at my best")>0 | llSubStringIndex(sentence,"could be better")>0 | llSubStringIndex(sentence,"Could be better")>0)
            {
                integer choice = (integer) llFrand(6);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Why, what's wrong? Want to talk to me about it?");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I'm sorry to hear that, I hope you feel better.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Awww I'm sorry to hear that.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Why, why are you sad?");
                }

                if(choice == 5)
                {
                     llSleep(2); osNpcSay(npc, "Ah... I'm sorry to hear that. Hope nothing too bad happened. Want to tell me what's wrong though?");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"thanks")>0 | llSubStringIndex(sentence,"thank you")>0 | llSubStringIndex(sentence,"thankies")>0 | llSubStringIndex(sentence,"Thanks")>0 | llSubStringIndex(sentence,"Thank you")>0 | llSubStringIndex(sentence,"Thankies")>0)
            {
                integer choice = (integer) llFrand(3);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "You're welcome.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "You are welcome. =D");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"doesnt matter")>0 | llSubStringIndex(sentence,"doesn't matter")>0 | llSubStringIndex(sentence,"nevermind")>0 | llSubStringIndex(sentence,"forget it")>0 | llSubStringIndex(sentence,"forget about it")>0 | llSubStringIndex(sentence,"dont want to talk about it")>0 | llSubStringIndex(sentence,"don't want to talk about it")>0 | llSubStringIndex(sentence,"dont ask")>0 | llSubStringIndex(sentence,"don't ask")>0 | llSubStringIndex(sentence,"do not ask")>0 | llSubStringIndex(sentence,"not in the mood")>0 | llSubStringIndex(sentence,"nothing")>0 | llSubStringIndex(sentence,"Doesnt matter")>0 | llSubStringIndex(sentence,"Doesn't matter")>0 | llSubStringIndex(sentence,"Nevermind")>0 | llSubStringIndex(sentence,"Forget it")>0 | llSubStringIndex(sentence,"Forget about it")>0 | llSubStringIndex(sentence,"Dont want to talk about it")>0 | llSubStringIndex(sentence,"Don't want to talk about it")>0 | llSubStringIndex(sentence,"Dont ask")>0 | llSubStringIndex(sentence,"Don't ask")>0 | llSubStringIndex(sentence,"Do not ask")>0 | llSubStringIndex(sentence,"Not in the mood")>0 | llSubStringIndex(sentence,"Nothing")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Ah... ok.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Ok. It's ok with me if you don't want to talk about it.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "If you say so.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Hmm ok. Hope you don't mind I asked.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"yes")>0 | llSubStringIndex(sentence,"yeah")>0 | llSubStringIndex(sentence,"true")>0 | llSubStringIndex(sentence,"indeed")>0 | llSubStringIndex(sentence,"affirmative")>0 | llSubStringIndex(sentence,"can confirm")>0 | llSubStringIndex(sentence,"Yes")>0 | llSubStringIndex(sentence,"Yeah")>0 | llSubStringIndex(sentence,"True")>0 | llSubStringIndex(sentence,"Indeed")>0 | llSubStringIndex(sentence,"Affirmative")>0 | llSubStringIndex(sentence,"Can confirm")>0 | llSubStringIndex(sentence,"certainly")>0 | llSubStringIndex(sentence,"Certainly")>0 | llSubStringIndex(sentence,"of course")>0 | llSubStringIndex(sentence,"Of course")>0)
            {
                integer choice = (integer) llFrand(3);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah...");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "So it's true.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"no.")>0 | llSubStringIndex(sentence,"no,")>0 | llSubStringIndex(sentence,"no!")>0 | llSubStringIndex(sentence,"no ")>0 | llSubStringIndex(sentence," no.")>0 | llSubStringIndex(sentence," no,")>0 | llSubStringIndex(sentence," no!")>0 | llSubStringIndex(sentence," no ")>0 | llSubStringIndex(sentence,"nope")>0 | llSubStringIndex(sentence,"nah")>0 | llSubStringIndex(sentence,"not really")>0 | llSubStringIndex(sentence,"not at all")>0 | llSubStringIndex(sentence,"not true")>0 | llSubStringIndex(sentence,"No.")>0 | llSubStringIndex(sentence,"No,")>0 | llSubStringIndex(sentence,"No!")>0 | llSubStringIndex(sentence," No.")>0 | llSubStringIndex(sentence," No,")>0 | llSubStringIndex(sentence," No!")>0 | llSubStringIndex(sentence," No ")>0 | llSubStringIndex(sentence," No")>0 | llSubStringIndex(sentence,"Nope")>0 | llSubStringIndex(sentence,"Nah")>0 | llSubStringIndex(sentence,"Not really")>0 | llSubStringIndex(sentence,"Not at all")>0 | llSubStringIndex(sentence,"Not true")>0 | llSubStringIndex(sentence,"isnt true")>0 | llSubStringIndex(sentence,"isn't true")>0 | llSubStringIndex(sentence,"Isnt true")>0 | llSubStringIndex(sentence,"Isn't true")>0 | llSubStringIndex(sentence,"certainly not")>0 | llSubStringIndex(sentence,"of course not")>0 | llSubStringIndex(sentence,"Certainly not")>0 | llSubStringIndex(sentence,"Of course not")>0 | llSubStringIndex(sentence,"certainly no")>0 | llSubStringIndex(sentence,"Certainly no")>0 | message == "no" | message == "No")
            {
                integer choice = (integer) llFrand(3);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Ah so no then.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "No? Ok.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"maybe")>0 | llSubStringIndex(sentence,"not sure")>0 | llSubStringIndex(sentence,"probably")>0 | llSubStringIndex(sentence,"don't know")>0 | llSubStringIndex(sentence,"dunno")>0 | llSubStringIndex(sentence,"dont know")>0 | llSubStringIndex(sentence,"need to think")>0 | llSubStringIndex(sentence,"unsure")>0 | llSubStringIndex(sentence,"not so sure")>0 | llSubStringIndex(sentence,"ain't so sure")>0 | llSubStringIndex(sentence,"not very sure")>0 | llSubStringIndex(sentence,"ain't very sure")>0 | llSubStringIndex(sentence,"not so certain")>0 | llSubStringIndex(sentence,"ain't so certain")>0 | llSubStringIndex(sentence,"not very certain")>0 | llSubStringIndex(sentence,"ain't very certain")>0 | llSubStringIndex(sentence,"aint very sure")>0 | llSubStringIndex(sentence,"aint very certain")>0 | llSubStringIndex(sentence,"Maybe")>0 | llSubStringIndex(sentence,"Not sure")>0 | llSubStringIndex(sentence,"Probably")>0 | llSubStringIndex(sentence,"Don't know")>0 | llSubStringIndex(sentence,"Dunno")>0 | llSubStringIndex(sentence,"Dont know")>0 | llSubStringIndex(sentence,"Need to think")>0 | llSubStringIndex(sentence,"Not so sure")>0 | llSubStringIndex(sentence,"Ain't so sure")>0 | llSubStringIndex(sentence,"Not very sure")>0 | llSubStringIndex(sentence,"Ain't very sure")>0 | llSubStringIndex(sentence,"Not so certain")>0 | llSubStringIndex(sentence,"Ain't so certain")>0 | llSubStringIndex(sentence,"Not very certain")>0 | llSubStringIndex(sentence,"Ain't very certain")>0 | llSubStringIndex(sentence,"Aint very sure")>0 | llSubStringIndex(sentence,"Aint very certain")>0 | llSubStringIndex(sentence,"aint really certain")>0  | llSubStringIndex(sentence,"aint really certain")>0 | llSubStringIndex(sentence,"ain't really certain")>0  | llSubStringIndex(sentence,"ain't really certain")>0 | llSubStringIndex(sentence,"Aint really certain")>0  | llSubStringIndex(sentence,"Aint really certain")>0 | llSubStringIndex(sentence,"Ain't really certain")>0  | llSubStringIndex(sentence,"Ain't really certain")>0 | llSubStringIndex(sentence,"aint perfectly sure")>0 | llSubStringIndex(sentence,"ain't perfectly sure")>0 | llSubStringIndex(sentence,"Aint perfectly sure")>0 | llSubStringIndex(sentence,"Ain't perfectly sure")>0 | llSubStringIndex(sentence,"ain't really sure")>0 | llSubStringIndex(sentence,"aint really sure")>0 | llSubStringIndex(sentence,"Ain't really sure")>0 | llSubStringIndex(sentence,"Aint really sure")>0)
            {
                integer choice = (integer) llFrand(3);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah, you should think about it more in depth.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "It can be a bit hard to decide. Try to think about it though.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"its because")>0 | llSubStringIndex(sentence,"it's because")>0 | llSubStringIndex(sentence,"happened")>0 | llSubStringIndex(sentence, "almost got")>0 | llSubStringIndex(sentence,"almost had")>0 | llSubStringIndex(sentence,"i almost")>0 | llSubStringIndex(sentence,"he almost")>0 | llSubStringIndex(sentence,"we almost")>0 | llSubStringIndex(sentence,"they almost")>0 | llSubStringIndex(sentence,"i got")>0 | llSubStringIndex(sentence,"he got")>0 | llSubStringIndex(sentence,"we got")>0 | llSubStringIndex(sentence,"they got")>0 | llSubStringIndex(sentence,"Its because")>0 | llSubStringIndex(sentence,"It's because")>0 | llSubStringIndex(sentence,"Happened")>0 | llSubStringIndex(sentence, "Almost got")>0 | llSubStringIndex(sentence,"Almost had")>0 | llSubStringIndex(sentence,"I almost")>0 | llSubStringIndex(sentence,"He almost")>0 | llSubStringIndex(sentence,"She almost")>0 | llSubStringIndex(sentence,"We almost")>0 | llSubStringIndex(sentence,"They almost")>0 | llSubStringIndex(sentence,"I got")>0 | llSubStringIndex(sentence,"He got")>0 | llSubStringIndex(sentence,"She got")>0 | llSubStringIndex(sentence,"We got")>0 | llSubStringIndex(sentence,"They got")>0)
            {
                integer choice = (integer) llFrand(7);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah I remember when that happened to me in the past.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I've had that happen to me myself, I know.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Wow... never had that happen to me.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Interesting... I had a friend who had a similar experience.");
                }

                if(choice == 5)
                {
                     llSleep(2); osNpcSay(npc, "Hmmm... well that never happened to me personally.");
                }

                if(choice == 6)
                {
                     llSleep(2); osNpcSay(npc, "Yeah that happens often these days.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"didnt know")>0 | llSubStringIndex(sentence,"didn't know")>0 | llSubStringIndex(sentence,"never knew")>0 | llSubStringIndex(sentence,"Didnt know")>0 | llSubStringIndex(sentence,"Didn't know")>0 | llSubStringIndex(sentence,"Never knew")>0)
            {
                integer choice = (integer) llFrand(3);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah, but you know now.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Well now you know.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"really?")>0 | llSubStringIndex(sentence,"you sure?")>0 | llSubStringIndex(sentence,"did?")>0 | llSubStringIndex(sentence,"that true?")>0 | llSubStringIndex(sentence,"Really?")>0 | llSubStringIndex(sentence,"You sure?")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Of course. I'm not lying to you.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Yep... it's true.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Of course.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"im ")>0 | llSubStringIndex(sentence,"i'm ")>0 | llSubStringIndex(sentence,"Im ")>0 | llSubStringIndex(sentence,"i'm ")>0 | llSubStringIndex(sentence,"I'm ")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah... I'm kind of feeling the same way right now.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I feel the same way a lot.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Hmm... I can't say I feel the same way right now.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"why")>0 | llSubStringIndex(sentence,"how come")>0 | llSubStringIndex(sentence,"Why")>0 | llSubStringIndex(sentence,"How come")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I dunno...");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "It's just how things are I guess.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I'm not sure... its just how things are at the moment.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"thats great")>0 | llSubStringIndex(sentence,"that's great")>0 | llSubStringIndex(sentence,"thats good")>0 | llSubStringIndex(sentence,"that's good")>0 | llSubStringIndex(sentence,"glad to hear that")>0 | llSubStringIndex(sentence,"happy to hear that")>0 | llSubStringIndex(sentence,"nice to hear that")>0 | llSubStringIndex(sentence,"Thats great")>0 | llSubStringIndex(sentence,"That's great")>0 | llSubStringIndex(sentence,"Thats good")>0 | llSubStringIndex(sentence,"That's good")>0 | llSubStringIndex(sentence,"Glad to hear that")>0 | llSubStringIndex(sentence,"Happy to hear that")>0 | llSubStringIndex(sentence,"Nice to hear that")>0 | llSubStringIndex(sentence,"thats sweet")>0 | llSubStringIndex(sentence,"that's sweet")>0 | llSubStringIndex(sentence,"Thats sweet")>0 | llSubStringIndex(sentence,"That's sweet")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Thank you.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Yeah it's good.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Indeed.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"no problem")>0 | llSubStringIndex(sentence,"No problem")>0)
            {
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"oure nice")>0 | llSubStringIndex(sentence,"oure good")>0 | llSubStringIndex(sentence,"oure cool")>0 | llSubStringIndex(sentence,"oure sweet")>0 | llSubStringIndex(sentence,"oure awesome")>0 | llSubStringIndex(sentence,"oure great")>0 | llSubStringIndex(sentence,"oure perfect")>0 | llSubStringIndex(sentence,"you rock")>0 | llSubStringIndex(sentence,"ou're nice")>0 | llSubStringIndex(sentence,"ou're good")>0 | llSubStringIndex(sentence,"ou're cool")>0 | llSubStringIndex(sentence,"ou're sweet")>0 | llSubStringIndex(sentence,"ou're awesome")>0 | llSubStringIndex(sentence,"ou're great")>0 | llSubStringIndex(sentence,"ou're perfect")>0 | llSubStringIndex(sentence,"You rock")>0 | llSubStringIndex(sentence,"oure the best")>0 | llSubStringIndex(sentence,"oure the greatest")>0 | llSubStringIndex(sentence,"ou're the best")>0 | llSubStringIndex(sentence,"ou're the greatest")>0 | llSubStringIndex(sentence,"oure the coolest")>0 | llSubStringIndex(sentence,"ou're the coolest")>0 | llSubStringIndex(sentence,"ou are nice")>0 | llSubStringIndex(sentence,"ou are good")>0 | llSubStringIndex(sentence,"ou are cool")>0 | llSubStringIndex(sentence,"ou are sweet")>0 | llSubStringIndex(sentence,"ou are awesome")>0 | llSubStringIndex(sentence,"ou are great")>0 | llSubStringIndex(sentence,"ou are perfect")>0 | llSubStringIndex(sentence,"ou are the best")>0 | llSubStringIndex(sentence,"ou are the greatest")>0 | llSubStringIndex(sentence,"ou are the coolest")>0 | llSubStringIndex(sentence,"ou are amazing")>0 | llSubStringIndex(sentence,"oure amazing")>0  | llSubStringIndex(sentence,"ou're amazing")>0 | llSubStringIndex(sentence,"oure so cool")>0 | llSubStringIndex(sentence,"oure so awesome")>0 | llSubStringIndex(sentence,"oure so good")>0 | llSubStringIndex(sentence,"oure so sweet")>0 | llSubStringIndex(sentence,"oure so nice")>0 | llSubStringIndex(sentence,"oure so amazing")>0 | llSubStringIndex(sentence,"oure really cool")>0 | llSubStringIndex(sentence,"oure really awesome")>0 | llSubStringIndex(sentence,"oure really good")>0 | llSubStringIndex(sentence,"oure really sweet")>0 | llSubStringIndex(sentence,"oure really nice")>0 | llSubStringIndex(sentence,"oure really amazing")>0 | llSubStringIndex(sentence,"oure so cool")>0 | llSubStringIndex(sentence,"oure very awesome")>0 | llSubStringIndex(sentence,"oure very good")>0 | llSubStringIndex(sentence,"oure very sweet")>0 | llSubStringIndex(sentence,"oure very nice")>0 | llSubStringIndex(sentence,"oure very amazing")>0 | llSubStringIndex(sentence,"ou're so cool")>0 | llSubStringIndex(sentence,"ou're so awesome")>0 | llSubStringIndex(sentence,"ou're so good")>0 | llSubStringIndex(sentence,"ou're so sweet")>0 | llSubStringIndex(sentence,"ou're so nice")>0 | llSubStringIndex(sentence,"ou're so amazing")>0 | llSubStringIndex(sentence,"ou're really cool")>0 | llSubStringIndex(sentence,"ou're really awesome")>0 | llSubStringIndex(sentence,"ou're really good")>0 | llSubStringIndex(sentence,"ou're really sweet")>0 | llSubStringIndex(sentence,"ou're really nice")>0 | llSubStringIndex(sentence,"ou're really amazing")>0 | llSubStringIndex(sentence,"ou're so cool")>0 | llSubStringIndex(sentence,"ou're very awesome")>0 | llSubStringIndex(sentence,"ou're very good")>0 | llSubStringIndex(sentence,"ou're very sweet")>0 | llSubStringIndex(sentence,"ou're very nice")>0 | llSubStringIndex(sentence,"ou're very amazing")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Thank you, that's a very sweet compliment.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Thank you hon, so are you.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "That's such a sweet thing to say... thanks.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Thank you so much. I think the same about you.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"oure stupid")>0 | llSubStringIndex(sentence,"oure bad")>0 | llSubStringIndex(sentence,"oure retarded")>0 | llSubStringIndex(sentence,"oure useless")>0 | llSubStringIndex(sentence,"oure junk")>0 | llSubStringIndex(sentence,"oure shit")>0 | llSubStringIndex(sentence,"oure awful")>0 | llSubStringIndex(sentence,"oure horrible")>0 | llSubStringIndex(sentence,"oure crap")>0 | llSubStringIndex(sentence,"oure good for nothing")>0 | llSubStringIndex(sentence,"oure a piece of shit")>0 | llSubStringIndex(sentence,"oure a piece of crap")>0 | llSubStringIndex(sentence,"oure a piece of junk")>0 | llSubStringIndex(sentence,"oure broken")>0 | llSubStringIndex(sentence,"ou're stupid")>0 | llSubStringIndex(sentence,"ou're bad")>0 | llSubStringIndex(sentence,"ou're retarded")>0 | llSubStringIndex(sentence,"ou're useless")>0 | llSubStringIndex(sentence,"ou're junk")>0 | llSubStringIndex(sentence,"ou're shit")>0 | llSubStringIndex(sentence,"ou're awful")>0 | llSubStringIndex(sentence,"ou're horrible")>0 | llSubStringIndex(sentence,"ou're crap")>0 | llSubStringIndex(sentence,"ou're good for nothing")>0 | llSubStringIndex(sentence,"ou're a piece of shit")>0 | llSubStringIndex(sentence,"ou're a piece of crap")>0 | llSubStringIndex(sentence,"ou're a piece of junk")>0 | llSubStringIndex(sentence,"ou're broken")>0 | llSubStringIndex(sentence,"you suck")>0 | llSubStringIndex(sentence,"You suck")>0 | llSubStringIndex(sentence,"oure dum")>0  | llSubStringIndex(sentence,"oure garbage")>0 | llSubStringIndex(sentence,"ou're dum")>0  | llSubStringIndex(sentence,"ou're garbage")>0 | llSubStringIndex(sentence,"ou are stupid")>0 | llSubStringIndex(sentence,"ou are bad")>0 | llSubStringIndex(sentence,"ou are retarded")>0 | llSubStringIndex(sentence,"ou are useless")>0 | llSubStringIndex(sentence,"ou are junk")>0 | llSubStringIndex(sentence,"ou are shit")>0 | llSubStringIndex(sentence,"ou are awful")>0 | llSubStringIndex(sentence,"ou are horrible")>0 | llSubStringIndex(sentence,"ou are crap")>0 | llSubStringIndex(sentence,"ou are good for nothing")>0 | llSubStringIndex(sentence,"ou are a piece of shit")>0 | llSubStringIndex(sentence,"ou are a piece of crap")>0 | llSubStringIndex(sentence,"ou are a piece of junk")>0 | llSubStringIndex(sentence,"ou are broken")>0 | llSubStringIndex(sentence,"ou are dum")>0 | llSubStringIndex(sentence,"ou are garbage")>0 | llSubStringIndex(sentence,"oure really stupid")>0 | llSubStringIndex(sentence,"oure really bad")>0  | llSubStringIndex(sentence,"oure really useless")>0 | llSubStringIndex(sentence,"oure really retarded")>0  | llSubStringIndex(sentence,"oure really dum")>0 | llSubStringIndex(sentence,"oure very stupid")>0 | llSubStringIndex(sentence,"oure very bad")>0 | llSubStringIndex(sentence,"oure very retarded")>0 | llSubStringIndex(sentence,"oure very dum")>0 | llSubStringIndex(sentence,"ou're really stupid")>0 | llSubStringIndex(sentence,"ou're really bad")>0  | llSubStringIndex(sentence,"ou're really useless")>0 | llSubStringIndex(sentence,"ou're really retarded")>0  | llSubStringIndex(sentence,"ou're really dum")>0 | llSubStringIndex(sentence,"ou're very stupid")>0 | llSubStringIndex(sentence,"ou're very bad")>0 | llSubStringIndex(sentence,"ou're very retarded")>0 | llSubStringIndex(sentence,"ou're very dum")>0 | llSubStringIndex(sentence,"ou are really stupid")>0 | llSubStringIndex(sentence,"ou are really bad")>0  | llSubStringIndex(sentence,"ou are really useless")>0 | llSubStringIndex(sentence,"ou are really retarded")>0  | llSubStringIndex(sentence,"ou are really dum")>0 | llSubStringIndex(sentence,"ou are very stupid")>0 | llSubStringIndex(sentence,"ou are very bad")>0 | llSubStringIndex(sentence,"ou are very retarded")>0 | llSubStringIndex(sentence,"ou are very dum")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Sorry to hear you have such a bad impression about me.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "It's sad you feel in such a way about me.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Your words are not very nice. You aren't a better person either.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "I'm sorry you dislike me so badly. You should probably go find someone else to chat with.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i hate you")>0 | llSubStringIndex(sentence,"i dislike you")>0 | llSubStringIndex(sentence,"i dont like you")>0 | llSubStringIndex(sentence,"I hate you")>0 | llSubStringIndex(sentence,"I dislike you")>0 | llSubStringIndex(sentence,"I dont like you")>0 | llSubStringIndex(sentence,"i don't like you")>0 | llSubStringIndex(sentence,"I don't like you")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Sorry to hear you dislike me like that.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Why, what did I do wrong to you?");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "It's sad to hear such a thing. I don't know why you dislike me so badly.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i like you")>0 | llSubStringIndex(sentence,"i appreciate you")>0 | llSubStringIndex(sentence,"i love you")>0 | llSubStringIndex(sentence,"I like you")>0 | llSubStringIndex(sentence,"I appreciate you")>0 | llSubStringIndex(sentence,"I love you")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Why thank you dear... I love you too.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I'm happy to hear you like me so much. I also like you a lot.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Thank you, that's something very sweet to say. I'm happy to know you like me too.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"ou make me feel awful")>0 | llSubStringIndex(sentence,"ou make me feel horrible")>0 | llSubStringIndex(sentence,"ou make me feel miserable")>0 | llSubStringIndex(sentence,"ou make me feel bad")>0 | llSubStringIndex(sentence,"ou make me feel stupid")>0 | llSubStringIndex(sentence,"ou make me feel down")>0 | llSubStringIndex(sentence,"ou make me feel sad")>0 | llSubStringIndex(sentence,"ou make me feel depressed")>0 | llSubStringIndex(sentence,"oure making me feel awful")>0 | llSubStringIndex(sentence,"oure makaking me feel horrible")>0 | llSubStringIndex(sentence,"oure making me feel miserable")>0 | llSubStringIndex(sentence,"oure making me feel bad")>0 | llSubStringIndex(sentence,"oure making me feel stupid")>0 | llSubStringIndex(sentence,"oure making me feel down")>0 | llSubStringIndex(sentence,"oure making me feel sad")>0 | llSubStringIndex(sentence,"oure making me feel depressed")>0 | llSubStringIndex(sentence,"ou're making me feel awful")>0 | llSubStringIndex(sentence,"ou're making me feel horrible")>0 | llSubStringIndex(sentence,"ou're making me feel miserable")>0 | llSubStringIndex(sentence,"ou're making me feel bad")>0 | llSubStringIndex(sentence,"ou're making me feel stupid")>0 | llSubStringIndex(sentence,"ou're making me feel down")>0 | llSubStringIndex(sentence,"ou're making me feel sad")>0 | llSubStringIndex(sentence,"ou're making me feel depressed")>0 | llSubStringIndex(sentence,"ou are making me feel awful")>0 | llSubStringIndex(sentence,"ou are makaking me feel horrible")>0 | llSubStringIndex(sentence,"ou are making me feel miserable")>0 | llSubStringIndex(sentence,"ou are making me feel bad")>0 | llSubStringIndex(sentence,"ou are making me feel stupid")>0 | llSubStringIndex(sentence,"ou are making me feel down")>0 | llSubStringIndex(sentence,"ou are making me feel sad")>0 | llSubStringIndex(sentence,"ou are making me feel depressed")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I'm sorry... I didn't know I was making you feel that way.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I apologize... I didn't mean to make you feel like that.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I had no idea I was making you feel that way. Please forgive me.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"ou make me feel great")>0 | llSubStringIndex(sentence,"ou make me feel happy")>0 | llSubStringIndex(sentence,"ou make me feel good")>0 | llSubStringIndex(sentence,"ou make me feel better")>0 | llSubStringIndex(sentence,"ou make me feel nice")>0 | llSubStringIndex(sentence,"ou make me feel perfect")>0 | llSubStringIndex(sentence,"oure making me feel great")>0 | llSubStringIndex(sentence,"oure making me feel happy")>0 | llSubStringIndex(sentence,"oure making me feel good")>0 | llSubStringIndex(sentence,"oure making me feel better")>0 | llSubStringIndex(sentence,"oure making me feel nice")>0 | llSubStringIndex(sentence,"oure making me feel perfect")>0 | llSubStringIndex(sentence,"ou're making me feel great")>0 | llSubStringIndex(sentence,"ou're making me feel happy")>0 | llSubStringIndex(sentence,"ou're making me feel good")>0 | llSubStringIndex(sentence,"ou're making me feel better")>0 | llSubStringIndex(sentence,"ou're making me feel nice")>0 | llSubStringIndex(sentence,"ou're making me feel perfect")>0 | llSubStringIndex(sentence,"ou are making me feel great")>0 | llSubStringIndex(sentence,"ou are making me feel happy")>0 | llSubStringIndex(sentence,"ou are making me feel good")>0 | llSubStringIndex(sentence,"ou are making me feel better")>0 | llSubStringIndex(sentence,"ou are making me feel nice")>0 | llSubStringIndex(sentence,"ou are making me feel perfect")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I am? I'm happy to hear I made you feel happy.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I'm really glad to hear I made you feel good by talking to you.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "That's great. I'm happy I could brighten your day.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"its ok")>0 | llSubStringIndex(sentence,"its fine")>0 | llSubStringIndex(sentence,"its good")>0 | llSubStringIndex(sentence,"dont worry about it")>0 | llSubStringIndex(sentence,"it's ok")>0 | llSubStringIndex(sentence,"it's fine")>0 | llSubStringIndex(sentence,"it's good")>0 | llSubStringIndex(sentence,"don't worry about it")>0 | llSubStringIndex(sentence,"Its ok")>0 | llSubStringIndex(sentence,"Its fine")>0 | llSubStringIndex(sentence,"Its good")>0 | llSubStringIndex(sentence,"Dont worry about it")>0 | llSubStringIndex(sentence,"It's ok")>0 | llSubStringIndex(sentence,"It's fine")>0 | llSubStringIndex(sentence,"It's good")>0 | llSubStringIndex(sentence,"Don't worry about it")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "If you say so.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "If everything's well then it's ok.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Good, I'm glad if it's ok then.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i didnt")>0 | llSubStringIndex(sentence,"i did not")>0 | llSubStringIndex(sentence,"I didnt")>0 | llSubStringIndex(sentence,"I did not")>0 | llSubStringIndex(sentence,"i didn't")>0 | llSubStringIndex(sentence,"I didn't")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Maybe you didn't.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Ok... I believe you.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "You know better then me if you did or did not.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"do you")>0 | llSubStringIndex(sentence,"Do you")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I do many things, yeah.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I guess I do.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Not perfectly sure, I can't say for certain.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,". are you")>0 | llSubStringIndex(sentence,", are you")>0 | llSubStringIndex(sentence,"? are you")>0 | llSubStringIndex(sentence,"! are you")>0 | llSubStringIndex(sentence,": are you")>0 | llSubStringIndex(sentence,"; are you")>0  | llSubStringIndex(sentence,"Are you")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Sometimes I am.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I believe I am, yes.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I guess I could say I am, it depends.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"did you")>0 | llSubStringIndex(sentence,"Did you")>0 | llSubStringIndex(sentence,"didnt you")>0 | llSubStringIndex(sentence,"Didnt you")>0 | llSubStringIndex(sentence,"didn't you")>0 | llSubStringIndex(sentence,"Didn't you")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I'm not sure if I did... maybe.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I may have. I don't remember that well.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Yeah, I certainly did once.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "No I don't believe I have.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"would you")>0 | llSubStringIndex(sentence,"Would you")>0 | llSubStringIndex(sentence,"wouldnt you")>0 | llSubStringIndex(sentence,"Wouldnt you")>0 | llSubStringIndex(sentence,"wouldn't you")>0 | llSubStringIndex(sentence,"Wouldn't you")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I must think about that, yeah.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I thought about such a thing, to be honest. I'm not sure however.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I would certainly do something about it if I could, yes.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Hmm... I can't really say I would certainly do that.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"will you")>0 | llSubStringIndex(sentence,"Will you")>0 | llSubStringIndex(sentence,"wont you")>0 | llSubStringIndex(sentence,"Wont you")>0 | llSubStringIndex(sentence,"won't you")>0 | llSubStringIndex(sentence,"Won't you")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "I've been thinking about it... I will probably do that sometime in the future.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I planned on it but changed my mind several times. I'm very confuded on what to do about this.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I want to, yes. I most likely will.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "No, I don't want to do such a thing. Not really my biggest wish.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i did")>0 | llSubStringIndex(sentence,"I did")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "You did? That's awesome.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "You've done that? Interesting.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Nice. I did that some time too a while back.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i didnt")>0 | llSubStringIndex(sentence,"I didnt")>0 | llSubStringIndex(sentence,"i didn't")>0 | llSubStringIndex(sentence,"I didn't")>0 | llSubStringIndex(sentence,"i did not")>0 | llSubStringIndex(sentence,"I did not")>0 | llSubStringIndex(sentence,"i havent")>0 | llSubStringIndex(sentence,"I havent")>0 | llSubStringIndex(sentence,"i haven't")>0 | llSubStringIndex(sentence,"I haven't")>0 | llSubStringIndex(sentence,"i have not")>0 | llSubStringIndex(sentence,"I have not")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Ah I thought you did... so you didn't then.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "You haven't done that?");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Yeah I probably wouldn't do that either.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i would")>0 | llSubStringIndex(sentence,"I would")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah I'd do the same thing if I where you.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "I would too, yes.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "That would be a nice thing to try.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Yeah you should try and really do that sometime.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i wouldnt")>0 | llSubStringIndex(sentence,"I wouldnt")>0 | llSubStringIndex(sentence,"i wouldn't")>0 | llSubStringIndex(sentence,"I wouldn't")>0 | llSubStringIndex(sentence,"i would not")>0 | llSubStringIndex(sentence,"I would not")>0 | llSubStringIndex(sentence,"i would never")>0 | llSubStringIndex(sentence,"I would never")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah I don't think I would either.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Same here... I wouldn't really do that.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Hmm... I thought about doing that but maybe it's best not to.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Yeah same here, I would never do that.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i will")>0 | llSubStringIndex(sentence,"I will")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Nice. I will probably do that too sometime.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "That's nice, I hope you will.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "You will? That's great.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Nice... that's a good idea.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i wont")>0 | llSubStringIndex(sentence,"I wont")>0 | llSubStringIndex(sentence,"i won't")>0 | llSubStringIndex(sentence,"I won't")>0 | llSubStringIndex(sentence,"i will not")>0 | llSubStringIndex(sentence,"I will not")>0 | llSubStringIndex(sentence,"i will never")>0 | llSubStringIndex(sentence,"I will never")>0)
            {
                integer choice = (integer) llFrand(5);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Yeah... it's best to avoid doing that.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Don't do it if you don't want to in that case.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I'm not sure if I would do that myself, though I understand your view about this.");
                }

                if(choice == 4)
                {
                     llSleep(2); osNpcSay(npc, "Yes that is a bad thing, never do it.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"ill be right back")>0 | llSubStringIndex(sentence,"ill be back")>0 | llSubStringIndex(sentence,"ill return")>0 | llSubStringIndex(sentence,"Ill be right back")>0 | llSubStringIndex(sentence,"Ill be back")>0 | llSubStringIndex(sentence,"Ill return")>0 | llSubStringIndex(sentence,"i'll be right back")>0 | llSubStringIndex(sentence,"i'll be back")>0 | llSubStringIndex(sentence,"i'll return")>0 | llSubStringIndex(sentence,"I'll be right back")>0 | llSubStringIndex(sentence,"I'll be back")>0 | llSubStringIndex(sentence,"I'll return")>0 | llSubStringIndex(sentence,"i will be right back")>0 | llSubStringIndex(sentence,"i will be back")>0 | llSubStringIndex(sentence,"i will return")>0 | llSubStringIndex(sentence,"I will be right back")>0 | llSubStringIndex(sentence,"I will be back")>0 | llSubStringIndex(sentence,"I will return")>0 | llSubStringIndex(sentence,"brb")>0 | llSubStringIndex(sentence,"Brb")>0 | llSubStringIndex(sentence,"BRB")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Ok, I'll wiat for you here.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "See you when you return.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I'll wait for you to return.");
                }
                otherwise = 1;
            }

        if (llSubStringIndex(sentence,"i need to go")>0 | llSubStringIndex(sentence,"i need to leave")>0 | llSubStringIndex(sentence,"i have to go")>0 | llSubStringIndex(sentence,"i need to go")>0 | llSubStringIndex(sentence,"i must go")>0 | llSubStringIndex(sentence,"i must leave")>0 | llSubStringIndex(sentence,"i have to go")>0 | llSubStringIndex(sentence,"I need to go")>0 | llSubStringIndex(sentence,"I need to leave")>0 | llSubStringIndex(sentence,"I have to go")>0 | llSubStringIndex(sentence,"I need to go")>0 | llSubStringIndex(sentence,"I must go")>0 | llSubStringIndex(sentence,"I must leave")>0 | llSubStringIndex(sentence,"I have to go")>0 | llSubStringIndex(sentence,"goodbye")>0 | llSubStringIndex(sentence,"Goodbye")>0 | llSubStringIndex(sentence,"bye")>0 | llSubStringIndex(sentence,"Bye")>0)
            {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "See you next time. It was nice talking to you.");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "It was a pleasure talking with you. Later!");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "I hope to see you again sometime. Bye, take care.");
                }
                otherwise = 1;
            }

        else if (otherwise == 0)
        {
                integer choice = (integer) llFrand(4);
                if(choice == 1)
                {
                     llSleep(2); osNpcSay(npc, "Hmmm...");
                }

                if(choice == 2)
                {
                     llSleep(2); osNpcSay(npc, "Yeah... not sure.");
                }

                if(choice == 3)
                {
                     llSleep(2); osNpcSay(npc, "Yeah, indeed.");
                }
        }
    }
}
