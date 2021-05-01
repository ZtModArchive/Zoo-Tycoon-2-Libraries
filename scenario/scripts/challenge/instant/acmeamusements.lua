-- acmeamusements.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

acmeamusementsCHALLENGE_NAME = "acmeamusements";

function validate()

	if (isChalDeclinedForever(acmeamusementsCHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", acmeamusementsCHALLENGE_NAME);
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, acmeamusementsCHALLENGE_NAME);
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/acmeamusements.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(acmeamusementsCHALLENGE_NAME, "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalacmeamusements(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(acmeamusementsCHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(acmeamusementsCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(acmeamusementsCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(acmeamusementsCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(acmeamusementsCHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showinstantchallengepanel("Challengetext:CHAcmeAmusements");
			setglobalvar("challenge", "waiting")
		end
	end
	
	if (comp.accept == 1) then
		local totaldon = 0;
		
		totaldon = totaldon + getDonationsAllAnimals() + getDonations("Education");
		
		if (totaldon >= 1000) then
			return 1;
		end	
	end
	
	-- If we are into month 2 and we haven't won this challenge yet then fail
	if (getCurrentMonth() >= 1) then
		return -1;
	end
	
	return 0;
end


function completeacmeamusements(comp)	
	-- Give out rhino bouncy ride
	placeCratedObjectAtGate("Rhino_df");
	
	showchallengewin("Challengetext:CHAcmeAmusementsSuccess");
	
	resetchallengeoverandcomplete(acmeamusementsCHALLENGE_NAME);
	incrementglobalchallenges();
end

function failacmeamusements(comp)
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHAcmeAmusementsFailure");
	end
	
	resetchallengeover(acmeamusementsCHALLENGE_NAME);
	declinenotfail = nil;
end