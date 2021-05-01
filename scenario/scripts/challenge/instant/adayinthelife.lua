-- adayinthelife.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

adayinthelifeCHALLENGE_NAME = "adayinthelife";

function validate()

	if (isChalDeclinedForever(adayinthelifeCHALLENGE_NAME) == true) then
		return 0;
	end
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
	
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, adayinthelifeCHALLENGE_NAME);
		end
	
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
	
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/adayinthelife.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(adayinthelifeCHALLENGE_NAME, "skipped");
		end
		
		return 1;
	end

	return 0;
end


function evaladayinthelife(comp)

	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(adayinthelifeCHALLENGE_NAME.."photo");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(adayinthelifeCHALLENGE_NAME);
		end
		
		logDebugChallengeInfo(adayinthelifeCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar(adayinthelifeCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(adayinthelifeCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(adayinthelifeCHALLENGE_NAME, "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHADayInTheLife");
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


function scoreKeeperFillingDish(comp)
	if ((scoreAnyEntityTypeDoingAnimX(comp, "Keeper", "PlaceFood_Idle") >= 1.0) or
	   (scoreAnyEntityTypeDoingAnimX(comp, "Keeper", "PourItem_Idle") >= 1.0) or
	   (scoreAnyEntityTypeDoingAnimX(comp, "Keeper", "TossFood_Idle") >= 1.0)) then
	   
	   return 1;
	end

	return 0;
end

function scoreWorkerEmptyingGarbage(comp)

	if (scoreAnyEntityTypeDoingAnimX(comp, "Worker", "Stand_EmptyTrash") >= 1.0) then
		return 1;
	end

	return 0;
end

function scoreGuestsEnteringZoo(comp)

	if (numberOfT1(comp, "Guest") >= 1) then
		if (numberOfT1(comp, "frontgate_collision_proxy") >= 1) then
			return 1;
		end
		
		if (numberOfT1(comp, "entrance") >= 1) then
			return 1;
		end	
	end

	return 0;
end


function completeadayinthelife(comp)
	
	giveCash(1000);
	incrementAwardPoints(1);
	
	local showme = getLocID("PhotoChallengetext:PHADayInTheLifeSuccess");
	local zooname = getZooName();
	showme = string.format(showme, zooname);
	setaltoverviewtext(adayinthelifeCHALLENGE_NAME.."photo", "success", showme);
	
	showchallengewintext(showme);
	
	resetchallengeoverandcomplete(adayinthelifeCHALLENGE_NAME);	
	incrementphotochallenges();
end


function failadayinthelife(comp)
	resetchallengeover(adayinthelifeCHALLENGE_NAME);
	clearphotochallenge(adayinthelifeCHALLENGE_NAME.."photo");
end
