-- bluebuckaurochphoto.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

function validate()

	if (isChalDeclinedForever("bluebuckaurochphoto") == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", "bluebuckaurochphoto");
	
	local donealready = getglobalvar("bluebuckaurochphoto_over");
	if (donealready == nil) or (donealready ~= "true") then
		local mgr = queryObject("BFScenarioMgr");
		if (mgr) then

			-- If we are gathering prereqs, output the challenge name
			if (getPrereqGather() == true) then
				BFLOG(SYSTRACE, "bluebuckaurochphoto");
			end

			-- Increment the number of challenges which have been offered
			incChallengesOffered();

			-- Only give the scenario if we are not suppressing them
			if (getAddScenarioSuppression() == false) then
				mgr:BFS_ADDSCENARIO("scenario/goals/challenge/bluebuckaurochphoto.xml");
			elseif (getPrereqGather() == false) then
				logDebugChallengeInfo("bluebuckaurochphoto", "skipped");
			end

			return 1;
		end
	end

	return 0;
end


function evalbluebuckaurochphoto(comp)
	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE("bluebuckaurochphoto");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("BluebuckAurochPhoto");
		end
		
		logDebugChallengeInfo("bluebuckaurochphoto", "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar("bluebuckaurochphoto".."_decline_forever", "true");
			
			logDebugChallengeInfo("bluebuckaurochphoto", "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo("bluebuckaurochphoto", "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHBluebuckAurochPhoto");
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


function scoreBluebuck(comp)
	BFLOG(SYSTRACE, "score Bluebuck")
	if (numberOfT1(comp, "Bluebuck") >= 1 ) then
	      return 1
	end
	
	return 0;
end

function scoreAuroch(comp)
	BFLOG(SYSTRACE, "score Auroch")
	if (numberOfT1(comp, "CowAuroch") >= 1 ) then
	      return 1
	end
	
	return 0;
end

function completebluebuckaurochphoto(comp)
	
	giveCash(2500);
	
	showchallengewin("PhotoChallengetext:PHBluebuckAurochPhotoSuccess");
	resetchallengeoverandcomplete("bluebuckaurochphoto");	
	incrementphotochallenges();
end


function failbluebuckaurochphoto(comp)
	resetchallengeover("bluebuckaurochphoto");
	clearphotochallenge("bluebuckaurochphoto");
end
