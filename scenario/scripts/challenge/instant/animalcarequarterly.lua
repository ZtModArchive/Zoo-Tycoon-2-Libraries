-- AnimalCareQuarterly.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

animalcarequarterlyCHALLENGE_NAME = "animalcarequarterly";
CHALLENGE_REWARD = 1500

function validate()

	if (isChalDeclinedForever(animalcarequarterlyCHALLENGE_NAME) == true) then
		return 0;
	end
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
	
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, animalcarequarterlyCHALLENGE_NAME);
		end
	
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
	
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/animalcarequarterly.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(animalcarequarterlyCHALLENGE_NAME, "skipped");
		end
		
		return 1;
	end

	return 0;
end


function evalanimalcarequarterly(comp)
BFLOG(SYSTRACE, "eval acq")
	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(animalcarequarterlyCHALLENGE_NAME.."photo");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("animalcarequarterly");
		end
		
		logDebugChallengeInfo(animalcarequarterlyCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar(animalcarequarterlyCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(animalcarequarterlyCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(animalcarequarterlyCHALLENGE_NAME, "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHAnimalCareQuarterly");
			setglobalvar("challenge", "waiting")
		end
	end

	if (comp.accept == 1) then
	BFLOG(SYSTRACE, "accept")
		-- Sanity check to see if the challenge was changed by some
		-- external trigger (UI probably) to the bogus challenge
		if (numPhotoRequirements() == 0) then
			BFLOG(SYSTRACE, "photo requirements")
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


function scoreGuestViewBuffalo(comp)
	BFLOG(SYSTRACE, "score guest")
	local view_animal_table = { "GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench" }
	if (scoreAnyDoingTaskInList(comp,"Guest", view_animal_table) >= 1.0) and (numberOfT1(comp, "BuffaloAfrican") >= 1) then
	      return 1
	end
	
	return 0;
end




function completeanimalcarequarterly(comp)
	
	giveCash(CHALLENGE_REWARD);
	
	showchallengewin("PhotoChallengetext:PHAnimalCareQuarterlySuccess");
	resetchallengeoverandcomplete(animalcarequarterlyCHALLENGE_NAME);	
	incrementphotochallenges();
end


function failanimalcarequarterly(comp)
	resetchallengeover(animalcarequarterlyCHALLENGE_NAME);
	clearphotochallenge(animalcarequarterlyCHALLENGE_NAME.."photo");
end
