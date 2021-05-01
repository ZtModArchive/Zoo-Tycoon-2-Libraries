-- cheesecake.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

cheesecakeCHALLENGE_NAME = "cheesecake";

function validate()

	if (isChalDeclinedForever(cheesecakeCHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", cheesecakeCHALLENGE_NAME);
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, cheesecakeCHALLENGE_NAME);
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/cheesecake.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(cheesecakeCHALLENGE_NAME, "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalcheesecake(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(cheesecakeCHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(cheesecakeCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(cheesecakeCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(cheesecakeCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(cheesecakeCHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showinstantchallengepanel("Challengetext:CHVargasCheesecake");
			setglobalvar("challenge", "waiting")
		end
	end
	
	if (comp.accept == 1) then
		
		local totalFoodDrink = getLifetimeEconomyInfo("concessions_food_drink", "profit");
		
		BFLOG(SYSTRACE, "Current food/drink income: "..totalFoodDrink);
		
		if (totalFoodDrink >= 250) then
			return 1;
		end
	end
	
	return 0;
end


function completecheesecake(comp)	
	-- TODO:  Give our rhino bouncy ride
	
	placeCratedObjectAtGate("snackcart_cheesecake_df");
	
	showchallengewin("Challengetext:CHVargasCheesecakeSuccess");
	
	resetchallengeoverandcomplete(cheesecakeCHALLENGE_NAME);
	incrementglobalchallenges();
end

function failcheesecake(comp)
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHVargasCheesecakeFailure");
	end
	
	resetchallengeover(cheesecakeCHALLENGE_NAME);
	declinenotfail = nil;
end