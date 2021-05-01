-- africancampaignscen2.lua

include "scenario/scripts/misc.lua";
include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/needs.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/photoutil.lua";

-- Set up the zoo
function setinitialzoostate(comp)
	--BFLOG(SYSTRACE,"**************** set intial zoo state ****************")
	completeshowoverview()
	showUI("goal panel", true);
	return 1;
end

function evalsecretaryphotos1(comp)
	--BFLOG(SYSTRACE,"**************** eval photo set 1 ****************")
	-- First set up the photochallenge
	if (comp.secretary1PhotoChallengeStarted == nil) then
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("AfricaCampaignSecretary1");
		end
		
		-- Disable the 'Decline Challenge' button
		local BFScenarioMgr = queryObject("BFScenarioMgr");
		if (BFScenarioMgr) then
			BFScenarioMgr:UI_DISABLE("photo challenges");
		end
		
		comp.secretary1PhotoChallengeStarted = true;
	end
	
	-- Check to see if they have completed the photochallenge
	local pm = queryObject("ZTPhotoChallengesComponent");
	local flag = pm:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED();
	if (flag) then			
		return 1;
	end
	
	return 0;
end

function completesecretaryphotos1()
	--BFLOG(SYSTRACE,"**************** complete photo set 1 ****************")
	giveCash(10000)
	showRule("SecretaryPhotoSet2");
	completeshowoverview();
end

function scoreSecretaryBirdPreen(comp)
	local animList = {"_2Preen", "Preen_", "_Clean", "Clean"}
	if (scoreAnyEntityTypeDoingMatchingAnimInList(comp, "BirdSecretary", animList) >= 1.0) then
			return 1;
	end
	

	return 0;
end

function scoreSecretaryBirdFlap(comp)
	local animList = {"Attack_Idle", "Fly_", "_2Fly","_Fly", "WingSpread_" }
	if (scoreAnyEntityTypeDoingMatchingAnimInList(comp, "BirdSecretary", animList) >= 1.0) then
		return 1
	end
	
	return 0;
end

function evalsecretaryphotos2(comp)
	BFLOG(SYSTRACE,"**************** eval photo set 2 ****************")
	-- First set up the photochallenge
	if (comp.secretary2PhotoChallengeStarted == nil) then
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("AfricaCampaignSecretary2");
		end
		
		-- Disable the 'Decline Challenge' button
		local BFScenarioMgr = queryObject("BFScenarioMgr");
		if (BFScenarioMgr) then
			BFScenarioMgr:UI_DISABLE("photo challenges");
		end
		
		comp.secretary2PhotoChallengeStarted = true;
	end
	
	-- Check to see if they have completed the photochallenge
	local pm = queryObject("ZTPhotoChallengesComponent");
	local flag = pm:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED();
	if (flag) then			
		return 1;
	end
	
	return 0;
end

function completesecretaryphotos2()
	--BFLOG(SYSTRACE,"**************** complete photo set 1 ****************")
	--giveCash(10000);
	
	-- Give them out a female rhino
	--placeCratedObjectAtGate("BirdSecretary_Adult_F");

	showRule("SecretaryPhotoSet3");
	completeshowoverview();
end

function scoreSecretaryBirdLizard(comp)
	
	local animList = {"Stalk_", "_2Stalk", "StalkPause_","_2StalkPause"}
	if (scoreAnyEntityTypeDoingMatchingAnimInList(comp, "BirdSecretary", animList) >= 1.0) then
		return 1;
	end
	
	
	
	return 0;
end

function scoreSecretaryBirdPursuitBall(comp)
	
	if (scoreAnyEntityTypeDoingTarget(comp, "BirdSecretary", "PursuitBall") >= 1.0) then
		return 1;
	end
		
	return 0;
end

function evalGuest()
    -- BFLOG(SYSTRACE,"**************** eval guest goal ****************")
     local total_guests = getNumGuests(-1)
	if (total_guests >= 75) then
		return 1
	end
  
	return 0
end

function completeGuest()
	--BFLOG(SYSTRACE,"**************** complete guest goal ****************")
	giveCash(20000);
	showprimarygoals();
end


function evalsecretaryphotos3(comp)
	--BFLOG(SYSTRACE,"**************** eval photo set 3 ****************")
	-- First set up the photochallenge
	if (comp.secretary3PhotoChallengeStarted == nil) then
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("AfricaCampaignSecretary3");
		end
		
		-- Disable the 'Decline Challenge' button
		local BFScenarioMgr = queryObject("BFScenarioMgr");
		if (BFScenarioMgr) then
			BFScenarioMgr:UI_DISABLE("photo challenges");
		end
		
		comp.secretary3PhotoChallengeStarted = true;
	end
	
	-- Check to see if they have completed the photochallenge
	local pm = queryObject("ZTPhotoChallengesComponent");
	local flag = pm:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED();
	if (flag) then			
		return 1;
	end
	
	return 0;
end

function completesecretaryphotos3(comp)
	--BFLOG(SYSTRACE,"**************** complete photo set 3 ****************")
	showprimarygoals();
end

function completesecretaryscenario(comp)
	-- Mark the scenario as completed
	setuservar("AfricaCampaignscenario2", "completed");
	
	-- Unlock the next scenario
	local alreadydone = getuservar("AfricaCampaignscenario3");
	if (alreadydone ~= "completed") then
		setuservar("AfricaCampaignscenario3", "unlocked");
	end
	
	showscenariowin("AfricaCampaign:SecretaryBirdSuccessOverview","AfricaCampaignscenario3")
end

function scoreSecretaryBirdEgg(comp)
	if (numberOfT1(comp, "BirdSecretary_Egg") >= 1) then
		return 1;
	end
	
	return 0;
end