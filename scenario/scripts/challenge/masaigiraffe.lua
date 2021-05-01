-- masaigiraffe.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

CHALLENGE_NAME = "masaigiraffe";
CHALLENGE_REWARD1 = "RhinocerosWhite_Adult_M" 
CHALLENGE_REWARD2 = "RhinocerosWhite_Adult_F" 
CHALLENGE_ANIMAL = "GiraffeMasai"

function validate()

	if (isChalDeclinedForever(CHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", CHALLENGE_NAME);
	
	local donealready = getglobalvar(CHALLENGE_NAME.."_over");
	if (donealready == nil) or (donealready ~= "true") then
	
		local dangerlist = getEndangeredSpeciesList();
		-- Prereq:  2.5 stars and 2 different endangered species
		if (countType(CHALLENGE_ANIMAL) >= 1) then
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
					BFLOG("giving out challenge");
					mgr:BFS_ADDSCENARIO("scenario/goals/challenge/masaigiraffe.xml");
				elseif (getPrereqGather() == false) then
					logDebugChallengeInfo(CHALLENGE_NAME, "skipped");
				end
						
				return 1;
			end
		end
	end
		
	return 0;
end


function evalmasaigiraffe(comp)

	challenge = getglobalvar("challenge");
	
	if (challenge == "accept") then
		local mgr = queryObject("BFScenarioMgr");	
		if (mgr) then
			mgr:BFS_SHOWRULE(CHALLENGE_NAME);
		end
		
		
		logDebugChallengeInfo(CHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		comp.accept = 1;
		showprimarygoals();
	elseif (challenge == "decline") then
	
		if (getDeclineForever() == true) then
			setglobalvar(CHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(CHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(CHALLENGE_NAME, "declined");
		end
	
		declinenotfail = 1;
		
		-- Return failure
		return -1;
	end
	
	if (comp.accept == nil) then
		if (challenge == nil) then
		
			showchallengepanel("Challengetext:CHMasaiGiraffe");
			setglobalvar("challenge", "waiting")
		end
	end
	
	if (comp.accept == 1) then
		
		-- The first time through here, build a table of all Masai Giraffe babies so that we
		-- know what they already have and don't count them in the future
		if (comp.oldtable == nil) then
			comp.oldtable = { };
			comp.speciesused = { };
		
			local animaltable = findType(CHALLENGE_ANIMAL);
			
			for i = 1, table.getn(animaltable) do
				local single = resolveTable(animaltable[i].value);
				if (single) then
					if (isChild(single)) then
						BFLOG("adding child to oldtable");
						comp.oldtable[table.getn(comp.oldtable) + 1] = animaltable[i];
					end
				end
			end
			
			-- Set the breedcount to 0
			comp.breedcount = 0;
		end
		
		
		-- Otherwise, check to see if they have a new young Masai Giraffe
		local animaltable = findType(CHALLENGE_ANIMAL);
		for i = 1, table.getn(animaltable) do
			local single = resolveTable(animaltable[i].value);
			if (single) then
				if (isChild(single)) then
					local found = false;
				
					for j = 1, table.getn(comp.oldtable) do
						local oldsingle = resolveTable(comp.oldtable[j].value);
						
						if (areCompsEqual(single, oldsingle) == true) then
							found = true;
						end
					end
					
					
					if (found == false) then
						comp.breedcount = comp.breedcount + 1;
						BFLOG("incrementing breed count");
						comp.oldtable[table.getn(comp.oldtable) + 1] = animaltable[i];
					end
				end
			else
				BFLOG("Strange entity problem");
			end
		end
		
		BFLOG("breedcount: "..comp.breedcount);
		
		if (comp.breedcount >= 1) then
			return 1;
		end
		
		
		
		--set timer first time through
		if (comp.masaitimer == nil) then
			comp.masaitimer = getCurrentMonth();
			comp.masaitimerday = getCurrentTimeOfDay();
		end
		
		-- If 2 months has passed, then return true
		local monthnow = getCurrentMonth();
		local daynow = getCurrentTimeOfDay();
		local time = comp.masaitimer + 4;
		if ((monthnow >= time) and (daynow >= comp.masaitimerday)) or (monthnow >= time + 3) then
			return -1;
		end		
	end
	
	return 0;
end


function completemasaigiraffe(comp)	

	placeCratedObjectAtGate(CHALLENGE_REWARD1)
	placeCratedObjectAtGate(CHALLENGE_REWARD2)
	
	showchallengewin("Challengetext:CHMasaiGiraffeSuccess");
		
	resetchallengeoverandcomplete(CHALLENGE_NAME);
	incrementglobalchallenges();
end

function failmasaigiraffe(comp)

	-- TODO: 

	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHMasaiGiraffeFailure");
	end
	
	resetchallengeover(CHALLENGE_NAME);
	declinenotfail = nil;
end