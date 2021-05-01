-- africanconservationconsortium2.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

CHALLENGE_NAME = "africanconservationconsortium2";
DONATION_GOAL = 8000
GOAL_REWARD = 8000

function validate()
	BFLOG(SYSTRACE, CHALLENGE_NAME);
	if (isChalDeclinedForever(CHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", CHALLENGE_NAME);
	
	local donealready = getglobalvar(CHALLENGE_NAME.."_over");
	if (donealready == nil) or (donealready ~= "true") then
		-- prereq: 3 star fame
		if (getHalfStars() >= 6) then
			local mgr = queryObject("BFScenarioMgr");
			if (mgr) then
				-- If we are gathering prereqs, output the challenge name
				if (getPrereqGather() == true) then
					BFLOG(SYSTRACE, CHALLENGE_NAME);
				end
						
				-- Increment the number of challenges which have been offered
				incChallengesOffered();
					
				-- Only give the scenario if we are not suppressing them
				if (getAddScenarioSuppression() == false) then
					BFLOG("giving out challenge");
					mgr:BFS_ADDSCENARIO("scenario/goals/challenge/"..CHALLENGE_NAME..".xml");
				elseif (getPrereqGather() == false) then
					logDebugChallengeInfo(CHALLENGE_NAME, "skipped");
				end
						
				return 1;
			end
		end
	end
		
	return 0;
end


function evalafricanconservationconsortium2(comp)
	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(CHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(CHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(CHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(CHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(CHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showchallengepanel("Challengetext:CHAfricanConservationConsortium2");
			setglobalvar("challenge", "waiting")
		end
	end
	
	if (comp.accept == 1) then
		--set timer first time through, add up all donations prior to recieving challenge
		if (comp.aa2timer == nil) then
			comp.aa2timer = getCurrentMonth();
			comp.aa2timerday = getCurrentTimeOfDay();
			local prevDonations = 0
			local animaltable = getAnimalsFromLocation("africa",true);
			local uniqueTable = getUniqueSpecies(animaltable)
			-- Test each african animal and add up donations
			for i = 1, table.getn(uniqueTable) do
				local single = uniqueTable[i]
				if (single) then
					--[[
					Note: single is a table of entity in world from africa. 
					You must get species name from table.
					--]]
					local donAmount = getDonations(single);
					prevDonations = prevDonations + donAmount
				end	
		        end
		        comp.prevDonations = prevDonations
		end
		
		local totalDonations = 0
		local animaltable = getAnimalsFromLocation("africa",true);
		local uniqueTable = getUniqueSpecies(animaltable)
		-- Test each african animal and add up donations
		for i = 1, table.getn(animaltable) do
			local single = uniqueTable[i]
			if (single ~= nil) then
				local donAmount = getDonations(single);
				totalDonations = totalDonations + donAmount
		
			end	
		end
		BFLOG("Previous: "..comp.prevDonations)
		BFLOG("Current: "..totalDonations)
		BFLOG("Total: "..(totalDonations - comp.prevDonations))
		if(comp.prevDonations ~=nil) then
			if((totalDonations - comp.prevDonations) >= DONATION_GOAL) then
				return 1
			end
		else
			if(totalDonations >= DONATION_GOAL) then
				return 1
			end
		end
		
		-- If one months has passed, then return true
		local monthnow = getCurrentMonth();
		local daynow = getCurrentTimeOfDay();
		local time = comp.aa2timer + 1;
		if ((monthnow >= time) and (daynow >= comp.aa2timerday)) or (monthnow >= time + 1) then
			return -1;
		end
		
	end
	
	return 0;
end


function completeafricanconservationconsortium2(comp)	

	giveCash(GOAL_REWARD)
	showchallengewin("Challengetext:CHAfricanConservationConsortium2Success");
	
	resetchallengeoverandcomplete(CHALLENGE_NAME);
	incrementglobalchallenges();
end

function failafricanconservationconsortium2(comp)

	-- TODO: 

	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHAfricanConservationConsortium2Failure");
	end
	
	resetchallengeover(CHALLENGE_NAME);
	declinenotfail = nil;
end