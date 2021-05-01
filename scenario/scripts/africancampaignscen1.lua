-- africancampaignscen1.lua

-- Include statements
include "scenario/scripts/misc.lua";
include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/needs.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/photoutil.lua";

SCENARIO_ANIMAL = "Meerkat"
DONATION_GOAL = 3500

function setinitialzoostate(comp)
	--BFLOG(SYSTRACE, "*********I'm here so show overview panel!********");
	completeshowoverview()
	showUI("goal panel", true);
	return 1;
end

function evalcratedMeerkat(arg)
	if (thisManyExist(SCENARIO_ANIMAL, 2) == true) then
		 if(allNeedSatisfied(SCENARIO_ANIMAL, "environment") == true) then
		 	return 1;
		 else
		 	BFLOG(SYSTRACE, "Meerkat is here but environment need not met");
			return 0;
		 end
	else
		BFLOG(SYSTRACE, "Meerkat not out yet");	
	end
end

function completecratedMeerkat(comp)
	--BFLOG(SYSTRACE, "Adopted an Meerkat!");
	showRule("meetMeerkatNeeds");
	showprimarygoals()
end

--function for 1 Meerkat to meet threshold of all basic needs
function evalMeetBasicNeeds(comp)

	--BFLOG(SYSTRACE, "Checking the Meerkat needs");
	
	if(thisManyExist(SCENARIO_ANIMAL, 2) == true) then	
		if(typeBasicNeedsSatisfied(SCENARIO_ANIMAL) == true) then	
			return 1;
		else
			BFLOG(SYSTRACE, "all needs don't meet threshold");
			return 0;
		end
	else
		return -1;
	end
		
	return 0;
end


function completeMeetBasicNeeds(comp)
	--BFLOG(SYSTRACE, "met basic needs, getting more Meerkats!");
	showRule("eightMeerkats");
	showRule("get6MoreMeerkats");
	showRule("meetEnvironment");
	showRule("happyMeerkats");
	
	completeshowoverview();
	
	-- Now place the three new Meerkats
	
	placeCratedObjectAtGate(SCENARIO_ANIMAL.."_Adult_M");
	placeCratedObjectAtGate(SCENARIO_ANIMAL.."_Adult_M");
	placeCratedObjectAtGate(SCENARIO_ANIMAL.."_Adult_M");
	placeCratedObjectAtGate(SCENARIO_ANIMAL.."_Adult_F");
	placeCratedObjectAtGate(SCENARIO_ANIMAL.."_Adult_F");
	placeCratedObjectAtGate(SCENARIO_ANIMAL.."_Adult_F");
	
end


function eval6MoreMeerkats(comp)
	if (countTypeDirect(SCENARIO_ANIMAL) == 8) then
		 return 1;
	else
		BFLOG(SYSTRACE, "new Meerkats not out yet");	
	end
end

function evalMeetEnvironment8Meerkats(comp)
	if (countTypeDirect(SCENARIO_ANIMAL) == 8) then
		if (allNeedSatisfied(SCENARIO_ANIMAL, "environment") == true) then
			return 1;
		else
			BFLOG(SYSTRACE, "8 Meerkats here but environment need not met");
			return 0;
		end
	else
		return -1
	end
	
	return 0;
	
end


function evalHappyMeerkats(comp)
	--BFLOG(SYSTRACE, "evalhappyMeerkats");
	if(comp.startevalhappyMeerkats == 1) then
		if (countType(SCENARIO_ANIMAL) < 8) then
			return -1
		end
	end
	
	-- Only do this once
	if (comp.startevalhappyMeerkats == nil) then
		comp.startevalhappyMeerkats = 1;
		
		comp.startbad = { };
		comp.startgood = { };
		comp.happyMeerkattimer = getCurrentMonth();
		comp.happyMeerkattimerday = getCurrentTimeOfDay(); 
				
		-- Make a table of each Meerkat and it's good/bad need points
		-- Table points from safe handle pointer -> value
		
		-- Grab all of the objects of type type
		local objects = findType(SCENARIO_ANIMAL);
	
		local num = 0;

		-- Loop through all of the objects in the table
		num = table.getn(objects);

		if (num ~= 8) then
			BFLOG(SYSTRACE, "You have a strange number of Meerkats!!!!!");
			return -1
		end
		
		comp.startbad = { };
		comp.startgood = { };
		comp.animalsave = { };

		for i = 1, num do
		
			comp.animalsave[i] = objects[i];
			comp.animalsave[i].id = i;
		
			-- Grab the needpointsbad and good for each Meerkat
			local single = resolveTable(objects[i].value);
			
			comp.startbad[i] = getNeedPointsBadCum(single);
			comp.startgood[i] = getNeedPointsGoodCum(single);
			
			if (getNeedPointsBadCum(single) ~= nil) then
				BFLOG(SYSTRACE, "Bad: "..getNeedPointsBadCum(single)..".");
			end
			
			if (getNeedPointsGoodCum(single) ~= nil) then
				BFLOG(SYSTRACE, "Good: "..getNeedPointsGoodCum(single)..".");
			end
		end
	end
	
	-- Check to see if the three months are over
	local curmonth = getCurrentMonth();
	local curday = getCurrentTimeOfDay();
	
	--BFLOG(SYSTRACE, "start month: "..comp.happyMeerkattimer.."   current month: "..curmonth);
	--BFLOG(SYSTRACE, "start day: "..comp.happyMeerkattimerday.."  current day: "..curday);
	
	if(comp.donationsdone == nil and curday >= comp.happyMeerkattimerday + .04) then
		BFLOG(SYSTRACE, "************************** time for new rule **********************************");
		comp.donationsdone = 1
		showRule("getDonations")
		completeshowoverview();
	end
	
	
	
	if ((curmonth >= comp.happyMeerkattimer + 2) and (curday >= comp.happyMeerkattimerday)) or (curmonth >= comp.happyMeerkattimer + 3) then
	
		--BFLOG(SYSTRACE, "Finishing evalhappyMeerkats goal");
	
		-- If so, we'll end the goal here one way or another
		
		comp.endbad = { };
		comp.endgood = { }; 
		
		local num = table.getn(comp.animalsave);

		-- If there are less than 8 Meerkats, they should fail
		if (num ~= 8) then
			BFLOG(SYSTRACE, "You have a strange number of Meerkats!!!!!");
			
			if (num < 8) then
				BFLOG("You have < 4 Meerkats.  Most likely one of them died.");
				return -1;
			end
		end

		for i = 1, num do
			--BFLOG(SYSTRACE, "i = "..i..".");
		
			-- Grab the needpointsbad and good for each Meerkat
			local single = resolveTable(comp.animalsave[i].value);
			
			-- If single is nil then one of them died.
			if (single == nil) then
				return -1;
			end
			
			
			comp.endbad[comp.animalsave[i].id] = getNeedPointsBadCum(single);
			comp.endgood[comp.animalsave[i].id] = getNeedPointsGoodCum(single);
			
			if (getNeedPointsBadCum(single) ~= nil) then
				BFLOG(SYSTRACE, "Bad: "..getNeedPointsBadCum(single)..".");
			end
			
			if (getNeedPointsGoodCum(single) ~= nil) then
				BFLOG(SYSTRACE, "Good: "..getNeedPointsGoodCum(single)..".");
			end
		end

	
		-- Now that we have all tables, check each Meerkat one at a time
		-- To see if he's ok
		for i = 1, num do
			local goodval = comp.endgood[comp.animalsave[i].id] - comp.startgood[comp.animalsave[i].id];
			local badval = comp.endbad[comp.animalsave[i].id] - comp.startbad[comp.animalsave[i].id];
			
			--BFLOG(SYSTRACE, "!!!!!!!!  goodval = "..goodval.."    badval = "..badval..".");
			
			if (goodval - badval < 0) then
				return -1;
			end
		end

		-- If we make it here then we passed
		return 1;

	end
	
	
	return 0;
	
end


function evalMeerkatDonations(comp)
	--BFLOG(SYSTRACE,"**************** eval donations ****************")
	local total_donations = getDonations(SCENARIO_ANIMAL);
		
	if (total_donations >= DONATION_GOAL) then
		return 1;
	end
end

function completeMeerkatDonations(comp)
	--BFLOG(SYSTRACE,"**************** complete donation goal ****************")
	placeCratedObjectAtGate("MeerkatBurrow_Shelter");
	showRule("MeerkatPhoto")
	completeshowoverview();
end

function evalMeerkatPhoto(comp)
	--BFLOG(SYSTRACE,"**************** eval photo set 1 ****************")
	-- First set up the photochallenge
	if (comp.secretary1PhotoChallengeStarted == nil) then
		local pcmgr = queryObject("ZTPhotoChallengesComponent");
		if (pcmgr) then
			pcmgr:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("AfricaCampaignMeerkat1");
		end
		
		-- Disable the 'Decline Challenge' button
		local BFScenarioMgr = queryObject("BFScenarioMgr");
		if (BFScenarioMgr) then
			BFScenarioMgr:UI_ENABLE("photo challenges layout");
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


function scoreMeerkatPhoto(comp)
	
	if (scoreAnyEntityTypeDoingTarget(comp, SCENARIO_ANIMAL, "MeerkatBurrow_Shelter") >= 1.0) then
		return 1;
	end
		
	return 0;
end

function completeMeerkatPhoto()
	--BFLOG(SYSTRACE,"**************** complete photo goal ****************")
	giveCash(10000);
	showprimarygoals();
end

function complete6MoreMeerkats()	
	--BFLOG(SYSTRACE, "WIN");
	
	local alreadydone = getuservar("AfricaCampaignscenario2");
	
	if (alreadydone ~= "completed") then
		setuservar("AfricaCampaignscenario2", "unlocked");
	end
	
	setuservar("AfricaCampaignscenario1", "completed");
	
	showscenariowin("AfricaCampaign:MeerkatsFinishMeetNeedsOverview", "AfricaCampaignscenario2");
end



function failMeerkats()
	local objects = findType(SCENARIO_ANIMAL);
	local num = 0;
	
	num = table.getn(objects);
	local gameMgr = queryObject("BFGManager");
	if (gameMgr ~= nil) then
		for i = 1, num do
			local single = resolveTable(objects[i].value)
			gameMgr:BFG_REMOVE_ENTITY(single);
			
		end
	else
		BFLOG(SYSTRACE, "Failed to get manager");
	end

	showscenariofail("AfricaCampaign:MeerkatsFailedMeetNeedsOverview","AfricaCampaignscenario1");

end

