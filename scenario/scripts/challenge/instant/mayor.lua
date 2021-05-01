-- mayor.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

mayorCHALLENGE_NAME = "mayor";

function validate()

	if (isChalDeclinedForever(mayorCHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", mayorCHALLENGE_NAME);
	
	local mgr = queryObject("BFScenarioMgr");
	if (mgr) then
		-- If we are gathering prereqs, output the challenge name
		if (getPrereqGather() == true) then
			BFLOG(SYSTRACE, mayorCHALLENGE_NAME);
		end
				
		-- Increment the number of challenges which have been offered
		incChallengesOffered();
			
		-- Only give the scenario if we are not suppressing them
		if (getAddScenarioSuppression() == false) then
			mgr:BFS_ADDSCENARIO("scenario/goals/challenge/mayor.xml");
		elseif (getPrereqGather() == false) then
			logDebugChallengeInfo(mayorCHALLENGE_NAME, "skipped");
		end
				
		return 1;
	end
		
	return 0;
end


function evalmayor(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(mayorCHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(mayorCHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(mayorCHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(mayorCHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(mayorCHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
			
			comp.animalNeeded = nil;
		
			-- Get a list of species on their adoption panel
			local availableTable = { };
			local speciesTable = getAvailableSpecies();
			
			BFLOG("speciesTable size = "..table.getn(speciesTable));
			for i = 1, table.getn(speciesTable) do
				BFLOG(SYSTRACE, i.." = "..speciesTable[i].value);
				availableTable[i] = speciesTable[i].value;
			end
			
			if (availableTable ~= nil) then
				-- Now get all of the animals which you can get on a 1/2 star
				local starTable = getAnimalsAvailableByStars(1);
				
				local possibleTable = difTables(starTable, availableTable);
				
				comp.animalNeeded = possibleTable[math.random(table.getn(possibleTable))];
			end
	
			local newrule = getLocID("Challengetext:CHMayorsChallengeShort");
			local subrule = string.format(newrule, getlocidfromspecies(comp.animalNeeded));
			setAltText("mayor", "neutral", subrule);
	
			local part1 = getLocID("Challengetext:CHInstantChallengeWelcome");
			local part2 = getLocID("Challengetext:CHMayorsChallenge");
			local part2real = string.format(part2, getlocidfromspecies(comp.animalNeeded));
			setAltOverviewText("mayor", "neutral", part2real);
	
			showinstantchallengepaneltext(part2real);
			setglobalvar("challenge", "waiting");
		end
	end
	
	if (comp.accept == 1) then
		
		if (countType(comp.animalNeeded) >= 1) then
			animalNeeded = comp.animalNeeded;
			return 1;
		end
		
		if (comp.mayortimer == nil) then
			comp.mayortimer = getCurrentMonth();
			comp.mayortimerday = getCurrentTimeOfDay();
		end
		
		local monthnow = getCurrentMonth();
		local daynow = getCurrentTimeOfDay();
		
		if (((monthnow >= comp.mayortimer + 1) and (daynow > comp.mayortimerday)) or (monthnow >= comp.mayortimer + 2)) then
			animalNeeded = comp.animalNeeded;
			return -1;
		end
		
		return 0;
	end
	
	return 0;
end


function completemayor(comp)	
	incrementAwardPoints(1);
	giveCash(750);
	
	local stringdat = getLocID("Challengetext:CHMayorsChallengeSuccess");
	local showme = string.format(stringdat, getlocidfromspecies(animalNeeded));
	setaltoverviewtext("mayor", "success", showme);
	
	showchallengewintext(showme);
		
	stringdat = getLocID("Challengetext:CHMayorsChallengeSuccessShort");
	showme = string.format(stringdat, getlocidfromspecies(animalNeeded));
	setalttext("mayor", "success", showme);
	
	resetchallengeoverandcomplete(mayorCHALLENGE_NAME);
	incrementglobalchallenges();
end

function failmayor(comp)
	if (declinenotfail == nil) then
		local stringdat = getLocID("Challengetext:CHMayorsChallengeFailure");
		local showme = string.format(stringdat, getlocidfromspecies(animalNeeded));
		setaltoverviewtext("mayor", "failure", showme);
		
		stringdat = getLocID("Challengetext:CHMayorsChallengeFailureShort");
		showme = string.format(stringdat, getlocidfromspecies(animalNeeded));
		setalttext("mayor", "failure", showme);
		
		showchallengefailtext(showme);
	end
	
	resetchallengeover(mayorCHALLENGE_NAME);
	declinenotfail = nil;
end