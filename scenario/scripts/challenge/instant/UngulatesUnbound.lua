-- UngulatesUnbound.lua
-- Functions for the bear biologist challenge

include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

ungulatesunboundCHALLENGE_NAME = "ungulatesunbound";
function validate()

	if (isChalDeclinedForever(ungulatesunboundCHALLENGE_NAME) == true) then
		return 0;
	end
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
	
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, ungulatesunboundCHALLENGE_NAME);
		end
	
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
	
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/UngulatesUnbound.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(ungulatesunboundCHALLENGE_NAME, "skipped");
		end
		
		return 1;
	end

	return 0;
end

function unboundchallenge(comp)

	BFLOG(SYSTRACE, "evalUngulatesUnbound");
	
	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		BFLOG(SYSTRACE, "*******You accepted!")
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE("UngulatesUnbound");
		end
		
		
		setchallengeactive();
		
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
		BFLOG(SYSTRACE, "You declined!");
		
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("Challengetext:CHUngulatesUnbound");
			setglobalvar("challenge", "waiting")
		end
	end
	-- if the challenge is going find out how many buffalos there are
	if (comp.accept == 1) then

		-- start a time counter... 
       	if comp.unboundtimer == nil then
	        comp.unboundtimer = getCurrentMonth();
	        comp.unboundtimerday = getCurrentTimeOfDay();
			BFLOG(SYSTRACE, "Unbound Challenge timer started");
       	end
        	
       	if comp.unboundover == nil then
       		local tmpmonth = getCurrentMonth();
       		local tmpday = getCurrentTimeOfDay();
       		--one month timer
    		local time = comp.unboundtimer + 1;
            if ((tmpmonth >= time) and (tmpday >= comp.unboundtimerday)) or (tmpmonth >= time + 1) then
				BFLOG(SYSTRACE, "FAILED unbound Challenge");
        	    comp.unboundover = 1;
        	            	    
        	    return -1;
        	end
        	
        	if(countType("BuffaloAfrican") >= 3)then
        		return 1;
        	end
        	
        	return 0;
	    end
	end	
	return 0;
end



-- this function called by bearbiologistschallenge.xml when bearbiologistschallenge rule is successful
function completeunboundchallenge(comp)
	
	-- Give the player Thomson's gazelle 
	placeCratedObjectAtGate("GazelleThomsons_Adult_M")
	
	showchallengewin("Challengetext:CHUngulatesUnboundSuccess");
	
	BFLOG(SYSTRACE, "Completed unbound challenge");
	
	resetchallengeoverandcomplete("ungulatesunbound");
	
	incrementglobalchallenges();
	
end

-- this function called by bearbiologistschallenge.xml when bearbiologistschallenge rule is failed
function failunboundchallenge(comp)
	
	--[[
	setglobalvar("challenge", nil)
	setglobalvar("challengeactive", "false");
	-- If we never want to see this challenge again, set a global variable
	setglobalvar("bearchallenge_over", "true");
	--]]
	
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHUngulatesUnboundFailure");
	end
	
	resetchallengeover("ungulatesunbound");
	declinenotfail = nil;
	BFLOG(SYSTRACE, "Failed unbound challenge");
end