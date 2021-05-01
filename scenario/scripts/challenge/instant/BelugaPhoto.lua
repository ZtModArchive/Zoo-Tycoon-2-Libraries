-- BelugaPhoto.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

belugaphotoCHALLENGE_NAME = "belugaphoto";
CHALLENGE_REWARD = 750
CHALLENGE_ANIMAL = "Beluga"
function validate()

	if (isChalDeclinedForever(belugaphotoCHALLENGE_NAME) == true) then
		return 0;
	end
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
	
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, belugaphotoCHALLENGE_NAME);
		end
	
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
	
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/BelugaPhoto.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(belugaphotoCHALLENGE_NAME, "skipped");
		end
		
		return 1;
	end

	return 0;
end


function evalbelugaphoto(comp)
	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(belugaphotoCHALLENGE_NAME.."photo");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("belugaphoto");
		end
		
		logDebugChallengeInfo(belugaphotoCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar(belugaphotoCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(belugaphotoCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(belugaphotoCHALLENGE_NAME, "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHBelugaPhoto");
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


function scoreGuestViewBeluga(comp)
	BFLOG(SYSTRACE, "score guest")
	local view_animal_table = { "GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench" }
	if (scoreAnyDoingTaskInList(comp,"Guest", view_animal_table) >= 1.0) and (numberOfT1(comp, CHALLENGE_ANIMAL) >= 1) then
	      return 1
	end
	
	return 0;
end



function completebelugaphoto(comp)
	
	giveCash(CHALLENGE_REWARD);
	
	showchallengewin("PhotoChallengetext:PHBelugaPhotoSuccess");
	resetchallengeoverandcomplete(belugaphotoCHALLENGE_NAME);	
	incrementphotochallenges();
end


function failbelugaphoto(comp)
	resetchallengeover(belugaphotoCHALLENGE_NAME);
	clearphotochallenge(belugaphotoCHALLENGE_NAME.."photo");
end
