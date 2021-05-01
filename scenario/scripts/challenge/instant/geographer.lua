-- geographer.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

geographerCHALLENGE_NAME = "geographer";

function validate()

	if (isChalDeclinedForever(geographerCHALLENGE_NAME) == true) then
		return 0;
	end
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
	
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, geographerCHALLENGE_NAME);
		end
	
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
	
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/geographer.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(geographerCHALLENGE_NAME, "skipped");
		end
		
		return 1;
	end

	return 0;
end


function evalgeographer(comp)

	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(geographerCHALLENGE_NAME.."photo");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("geographer");
		end
		
		logDebugChallengeInfo(geographerCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar(geographerCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(geographerCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(geographerCHALLENGE_NAME, "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			showinstantchallengepanel("PhotoChallengetext:PHInternationalGeographer");
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


function scoreCaribou(comp)
	if (numberOfT1(comp, "Caribou") >= 1) then
	
		-- Also make sure they have a caribou with a satisfied environment need
		local ctable = findType("Caribou");
		for i = 1, table.getn(ctable) do
			local entity = resolveTable(ctable[i].value);
			if (needMeetsThreshold(entity, "environment", 10) == true) then
				return 1;
			end
		end
	end
	
	return 0;
end

function scoreCamel(comp)
	if (numberOfT1(comp, "CamelDromedary") >= 1) then
		-- Also make sure they have a caribou with a satisfied environment need
		local ctable = findType("CamelDromedary");
		for i = 1, table.getn(ctable) do
			local entity = resolveTable(ctable[i].value);
			if (needMeetsThreshold(entity, "environment", 10) == true) then
				return 1;
			end
		end
	end
	
	return 0;
end


function completegeographer(comp)
	
	giveCash(2000);
	
	showchallengewin("PhotoChallengetext:PHInternationalGeographerSuccess");
	resetchallengeoverandcomplete(geographerCHALLENGE_NAME);	
	incrementphotochallenges();
end


function failgeographer(comp)
	resetchallengeover(geographerCHALLENGE_NAME);
	clearphotochallenge(geographerCHALLENGE_NAME.."photo");
end
