-- MantaPhoto.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

mantaphotoCHALLENGE_NAME = "mantaphoto";
CHALLENGE_REWARD = 1250
function validate()

	if (isChalDeclinedForever(mantaphotoCHALLENGE_NAME) == true) then
		return 0;
	end
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
	
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, mantaphotoCHALLENGE_NAME);
		end
	
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
	
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/MantaPhoto.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(mantaphotoCHALLENGE_NAME, "skipped");
		end
		
		return 1;
	end

	return 0;
end


function evalmantaphoto(comp)
	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(mantaphotoCHALLENGE_NAME.."photo");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("mantaphoto");
		end
		
		logDebugChallengeInfo(mantaphotoCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar(mantaphotoCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(mantaphotoCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(mantaphotoCHALLENGE_NAME, "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHMantaPhoto");
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


function scoreMantaRayBreaching(comp)
	local animList = {"_Breach"}
	
	if (scoreAnyEntityTypeDoingMatchingAnimInList(comp, "RayManta", animList) >= 1) then
		return 1;
	end
	
	return 0;
end



function completemantaphoto(comp)
	
	giveCash(CHALLENGE_REWARD);
	
	showchallengewin("PhotoChallengetext:PHMantaPhotoSuccess");
	resetchallengeoverandcomplete(mantaphotoCHALLENGE_NAME);	
	incrementphotochallenges();
end


function failmantaphoto(comp)
	resetchallengeover(mantaphotoCHALLENGE_NAME);
	clearphotochallenge(mantaphotoCHALLENGE_NAME.."photo");
end
