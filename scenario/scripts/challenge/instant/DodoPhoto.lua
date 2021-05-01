-- dodophoto.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

function validate()

	if (isChalDeclinedForever("dodophoto") == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", "dodophoto");
	
	local donealready = getglobalvar("dodophoto_over");
	if (donealready == nil) or (donealready ~= "true") then
		local mgr = queryObject("BFScenarioMgr");
		if (mgr) then

			-- If we are gathering prereqs, output the challenge name
			if (getPrereqGather() == true) then
				BFLOG(SYSTRACE, "dodophoto");
			end

			-- Increment the number of challenges which have been offered
			incChallengesOffered();

			-- Only give the scenario if we are not suppressing them
			if (getAddScenarioSuppression() == false) then
				mgr:BFS_ADDSCENARIO("scenario/goals/challenge/dodophoto.xml");
			elseif (getPrereqGather() == false) then
				logDebugChallengeInfo("dodophoto", "skipped");
			end

			return 1;
		end
	end

	return 0;
end


function evalDodoPhoto(comp)
	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE("DodoPhoto");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("DodoPhoto");
		end
		
		logDebugChallengeInfo("dodophoto", "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar("dodophoto".."_decline_forever", "true");
			
			logDebugChallengeInfo("dodophoto", "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo("dodophoto", "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHDodoPhoto");
			setglobalvar("challenge", "waiting")
		end
	end

	if (comp.accept == 1) then
		-- Sanity check to see if the challenge was changed by some
		-- external trigger (UI probably) to the bogus challenge
		if (numPhotoRequirements() == 0) then
			return 1;
		end
	
		numPhotoRequirementsMet();
	
		local pm = queryObject("ZTPhotoChallengesComponent");
		local flag = pm:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED();
		if (flag) then			
			return 1;
		else
			return 0;
		end
	end
	
	return 0;

end


function scoreDodoAndRock(comp)
	BFLOG(SYSTRACE, "score Dodo and Dodo Rock")
	if (numberOfT1(comp, "Dodo") >= 1 and numberOfT1(comp, "DodoRock") >= 1) then
	      return 1
	end
	
	return 0;
end



function completeDodoPhoto(comp)
	
	giveCash(750);
	
	showchallengewin("PhotoChallengetext:PHDodoPhotoSuccess");
	resetchallengeoverandcomplete("dodophoto");	
	incrementphotochallenges();
end


function failDodoPhoto(comp)
	resetchallengeover("dodophoto");
	clearphotochallenge("dodophoto");
end
