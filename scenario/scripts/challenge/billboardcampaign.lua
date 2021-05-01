-- billboardcampaign.lua
 
include "scenario/scripts/ui.lua";
include "scenario/scripts/photoutil.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

CHALLENGE_NAME = "billboardcampaign";
CHALLENGE_REWARD = 10

function validate()

	if (isChalDeclinedForever(CHALLENGE_NAME) == true) then
		return 0;
	end
	
	local donealready = getglobalvar(CHALLENGE_NAME.."_over");
	if (donealready == nil) or (donealready ~= "true") then	
		if (countType("Caracal") >= 1 or countType("Mandrill") >= 1 ) then
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


function evalbillboardcampaign(comp)

	challenge = getglobalvar("challenge")
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(CHALLENGE_NAME.."photo");
		end
		
		-- define the photochallege
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(CHALLENGE_NAME);
		end
		
		logDebugChallengeInfo(CHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		comp.accept = 1;
		showphotogoals();
		
	elseif (challenge == "decline") then
		
		if (getDeclineForever() == true) then
			setglobalvar(CHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(CHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(CHALLENGE_NAME, "declined");
		end

		return -1;
	end
	

	if (comp.accept == nil) then
		if (challenge == nil) then
			local showchallengepanel = showchallengepanel("PhotoChallengetext:PHBillboardCampaign");
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


function scoreHyenaUsingBone(comp)
	
	if (scoreAnyEntityTypeDoingTarget(comp, "HyenaStriped", "Bone") >= 1.0) then
		return 1;
	end
	
	return 0;
end

function scoreCaracalUsingToy(comp)

	if (scoreAnyEntityTypeDoingTarget(comp, "Caracal", "SqueakyToy") >= 1.0) then
		return 1;
	end
		
	return 0;

end

function scoreMandrillSocialYawn(comp)
	local animList = {"_YawnThreat"}
	if (scoreAnyEntityTypeDoingMatchingAnimInList(comp, "Mandrill", animList) >= 1.0) then
		return 1;
	end
	
	return 0;
end

function completebillboardcampaign(comp)
	giveGuest(CHALLENGE_REWARD)	
	
	showchallengewin("PhotoChallengetext:PHBillboardCampaignSuccess");
	resetchallengeoverandcomplete(CHALLENGE_NAME);	
	incrementphotochallenges();
end


function failbillboardcampaign(comp)
	resetchallengeover(CHALLENGE_NAME);
	clearphotochallenge(CHALLENGE_NAME.."photo");
end
