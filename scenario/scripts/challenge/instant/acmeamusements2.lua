-- acmeamusements2.lua
-- Instant Chanllenge: Get 20 guest in one month recieve gift cart

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

acmeamusements2CHALLENGE_NAME = "acmeamusements2";
GUEST_AMOUNT = 20

function validate()

	if (isChalDeclinedForever(acmeamusements2CHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", acmeamusements2CHALLENGE_NAME);
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, acmeamusements2CHALLENGE_NAME);
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/acmeamusements2.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(acmeamusements2CHALLENGE_NAME, "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalacmeamusements2(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(acmeamusements2CHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(acmeamusements2CHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(acmeamusements2CHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(acmeamusements2CHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(acmeamusements2CHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showinstantchallengepanel("Challengetext:CHAcmeAmusements2");
			setglobalvar("challenge", "waiting")
		end
	end
	
	-- Check to see if we have reach Guest Goal
	if (comp.accept == 1) then
		local total_guests = getNumGuests(-1)
		if (total_guests >= GUEST_AMOUNT) then
			return 1
	        end
	end
	if comp.acme2timer == nil then
		comp.acme2timer = getCurrentMonth();
		comp.acme2timerday = getCurrentTimeOfDay();
		BFLOG(SYSTRACE, "Acme2 Challenge timer started");
	end
	        	
       	-- If we are into month 2 and we haven't won this challenge yet then fail
		if (getCurrentMonth() >= 1) then
			return -1;
	end
	
	return 0;
end


function completeacmeamusements2(comp)	
	-- Give out Gift Cart
	placeCratedObjectAtGate("giftcart_df");
	
	showchallengewin("Challengetext:CHAcmeAmusements2Success");
	
	resetchallengeoverandcomplete(acmeamusements2CHALLENGE_NAME);
	incrementglobalchallenges();
end

function failacmeamusements2(comp)
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHAcmeAmusements2Failure");
	end
	
	resetchallengeover(acmeamusements2CHALLENGE_NAME);
	declinenotfail = nil;
end