-- backfromextinction.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

function validate()

	if (isChalDeclinedForever("backfromextinction") == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", "backfromextinction");
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, "backfromextinction");
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/backfromextinction.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo("backfromextinction", "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalBackFromExtinction(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE("BackFromExtinction");
		end
		
		
		logDebugChallengeInfo("backfromextinction", "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar("backfromextinction".."_decline_forever", "true");
			
			logDebugChallengeInfo("backfromextinction", "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo("backfromextinction", "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showinstantchallengepanel("Challengetext:CHBackFromExtinction");
			setglobalvar("challenge", "waiting")
		end
	end
	
	-- Check to see if we have reach Goal
	if (comp.accept == 1) then
		local extinctTable = getExtinctSpeciesList()
		local numExtinctAnimals = table.getn(extinctTable)
		BFLOG("BackFromExtinction -- numExtinctAnimals ="..numExtinctAnimals)
		if(numExtinctAnimals >= 4) then
			return 1
		end
		return checkTimeLimit(comp,2,0)
	end
	
	return 0;
end

function completeBackFromExtinction(comp)	
	-- give 5 guests and a tick of zoo fame
	BFLOG("Current Fame level: "..getZooFame())
	setMaxFame(getZooFame() + 1.875)
	BFLOG("New Fame level(one tick higher): "..getZooFame())
	incrementAwardPoints(1);			
	giveCash(3500);
	
	showchallengewin("Challengetext:CHBackFromExtinctionSuccess");
	
	resetchallengeoverandcomplete("backfromextinction");
	incrementglobalchallenges();
end

function failBackFromExtinction(comp)
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHBackFromExtinctionFailure");
	end
	
	resetchallengeover("backfromextinction");
	declinenotfail = nil;
end