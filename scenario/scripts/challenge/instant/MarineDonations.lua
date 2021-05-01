-- marinedonations.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

marinedonationsCHALLENGE_NAME = "marinedonations";
CASH_GOAL = 500

function validate()

	if (isChalDeclinedForever(marinedonationsCHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", marinedonationsCHALLENGE_NAME);
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, marinedonationsCHALLENGE_NAME);
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/marinedonations.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(marinedonationsCHALLENGE_NAME, "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalMarineDonations(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(marinedonationsCHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(marinedonationsCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(marinedonationsCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(marinedonationsCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(marinedonationsCHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showinstantchallengepanel("Challengetext:CHMarineDonations");
			setglobalvar("challenge", "waiting")
		end
	end
	
	-- Check to see if we have reach Goal
	if (comp.accept == 1) then
		if(getDonationsMarineSpecies() >= CASH_GOAL) then
			return 1
		end
		
		return checkTimeLimit(comp,2,0)
	end
	
	return 0;
end

function getDonationsMarineSpecies()
	local marineList = getMarineSpeciesList();
	BFLOG("Number of marine animals in zoo "..table.getn(marineList)) 
	local totalDonations  = 0;
	for i=1, table.getn(marineList) do
		totalDonations = totalDonations + getDonations(marineList[i])
	end
	BFLOG("Total Donations from marine animals "..totalDonations)
	return totalDonations
end

function completeMarineDonations(comp)	
	-- Give out marine Gift Cart
	placeCratedObjectAtGate("giftcart_mm");
	
	showchallengewin("Challengetext:CHMarineDonationsSuccess");
	
	resetchallengeoverandcomplete(marinedonationsCHALLENGE_NAME);
	incrementglobalchallenges();
end

function failMarineDonations(comp)
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHMarineDonationsFailure");
	end
	
	resetchallengeover(marinedonationsCHALLENGE_NAME);
	declinenotfail = nil;
end