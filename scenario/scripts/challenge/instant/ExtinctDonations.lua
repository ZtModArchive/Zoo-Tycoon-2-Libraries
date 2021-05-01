-- extinctdonations.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";


function validate()

	if (isChalDeclinedForever("extinctdonations") == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", "extinctdonations");
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, "extinctdonations");
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/extinctdonations.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo("extinctdonations", "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalExtinctDonations(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE("extinctdonations");
		end
		
		
		logDebugChallengeInfo("extinctdonations", "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar("extinctdonations".."_decline_forever", "true");
			
			logDebugChallengeInfo("extinctdonations", "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo("extinctdonations", "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showinstantchallengepanel("Challengetext:CHExtinctDonations");
			setglobalvar("challenge", "waiting")
		end
	end
	
	-- Check to see if we have reach Goal
	if (comp.accept == 1) then
		if(getDonationsExtinctSpecies() >= 1500) then
			return 1
		end
		
		return checkTimeLimit(comp,2,0)
	end
	
	return 0;
end

function getDonationsExtinctSpecies()
	local extinctList = getAllExtinctSpeciesList();
	BFLOG("Number of extinct animals in zoo "..table.getn(extinctList)) 
	local totalDonations  = 0;
	for i=1, table.getn(extinctList) do
		totalDonations = totalDonations + getDonations(extinctList[i])
	end
	BFLOG("Total Donations from extinct animals "..totalDonations)
	return totalDonations
end

function completeExtinctDonations(comp)	
	-- Give out Reward
	local rewardAnimal = "CowAuroch_Adult_";
	if (math.random(2) == 0) then
		rewardAnimal = rewardAnimal.."M";
	else
		rewardAnimal = rewardAnimal.."F";
	end
	placeCratedObjectAtGate(rewardAnimal);
	
	showchallengewin("Challengetext:CHExtinctDonationsSuccess");
	
	resetchallengeoverandcomplete("extinctdonations");
	incrementglobalchallenges();
end

function failExtinctDonations(comp)
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHExtinctDonationsFailure");
	end
	
	resetchallengeover("extinctdonations");
	declinenotfail = nil;
end