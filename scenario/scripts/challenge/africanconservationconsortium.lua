-- africanconservationconsortium.lua

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";

CHALLENGE_NAME = "africanconservationconsortium";

function validate()

	if (isChalDeclinedForever(CHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", CHALLENGE_NAME);
	
	local donealready = getglobalvar(CHALLENGE_NAME.."_over");
	if (donealready == nil) or (donealready ~= "true") then
	
		-- Prereq: 2 stars 
		if (getHalfStars() >= 4) then
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
					mgr:BFS_ADDSCENARIO("scenario/goals/challenge/africanconservationconsortium.xml");
				elseif (getPrereqGather() == false) then
					logDebugChallengeInfo(CHALLENGE_NAME, "skipped");
				end
						
				return 1;
			end
		end
	end
		
	return 0;
end


function evalAfricanConservationConsortium(comp)

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
		
			showchallengepanel("Challengetext:CHAfricanConservationConsortium");
			setglobalvar("challenge", "waiting")
		end
	end
	
	if (comp.accept == 1) then
		-- The first time through here, build a table of all african babies so that we
		-- know what they already have and don't count them in the future
		if (comp.oldtable == nil) then
			comp.oldtable = { };
					
			--get table of african animals
			local animaltable = getAnimalsFromLocation("africa");
			
			for i = 1, table.getn(animaltable) do
				local single = resolveTable(animaltable[i].value);
				if (single) then
					-- If it's a child store it in comp.oldtable
					if (isChild(single)) then
						--BFLOG("adding child to oldtable");
						comp.oldtable[table.getn(comp.oldtable) + 1] = animaltable[i];
					end
				end
			end
			
			-- Set the breedcount to 0
			comp.breedcount = 0;
		end
		
		-- Otherwise, check to see if they have a new young african animal which does not share 
		-- a species with anything in comp.oldtable
		local animaltable = getAnimalsFromLocation("africa");
		if (comp.newChildTable == nil) then
			comp.newChildTable = { };
		end
		
		--BFLOG("num of african anim: "..table.getn(animaltable))
		for i = 1, table.getn(animaltable) do
			local single = resolveTable(animaltable[i].value);
			if (single) then
				if (isChild(single)) then
					--BFLOG("Single is child")
					local found = false;
					for j = 1, table.getn(comp.oldtable) do
						local oldsingle = resolveTable(comp.oldtable[j].value);
						if (areCompsEqual(single, oldsingle) == true) then
							found = true;
						end
					end
					
								
					if (found == false) then
						comp.newChildTable[table.getn(comp.newChildTable) + 1]= animaltable[i]
						--BFLOG("incrementing breed count");
						comp.oldtable[table.getn(comp.oldtable) + 1] = animaltable[i];
					end
				end
			else
				BFLOG("Strange entity problem");
			end
		end
	
		--BFLOG("new Children: "..table.getn(comp.newChildTable));
		local tempTable = getUniqueSpeciesList(comp.newChildTable)
		--BFLOG("filtered children: "..table.getn(tempTable));
		-- Test do we have 3 african animals
		if (table.getn(tempTable) >= 3) then
			return 1;
		end
		
		
		--set timer first time through
		if (comp.aactimer == nil) then
			comp.aactimer = getCurrentMonth();
			comp.aactimerday = getCurrentTimeOfDay();
		end
		
		-- If 2 months has passed, then return true
		local monthnow = getCurrentMonth();
		local daynow = getCurrentTimeOfDay();
		local time = comp.aactimer + 3;
		if ((monthnow >= time) and (daynow >= comp.aactimerday)) or (monthnow >= time + 2) then
			return -1;
		end
		
	end
	
	return 0;
end

function getUniqueSpeciesList(entitylist)

	
	if (entitylist == nil) then
		return nil;
	end

	local specTable = { };
	local entityTable = { };
	
	local num = table.getn(entitylist);
	--BFLOG("Number of animals: "..num);
	local count = 1;
	for i = 1, num do
		local single = resolveTable(entitylist[i].value);
		if (single ~= nil) then
			local thetype = single:BFG_GET_BINDER_TYPE();		
			-- Remove the _Adult_X from the string
			thetype = getSpeciesFromType(thetype);
			
			-- Check to make sure that thetype is not already in specTable.
			local numspec = table.getn(specTable);
			local found = false;
			for j = 1, numspec do
				if (thetype == specTable[j]) then
					found = true;
				end
			end
			
			if (found == false) then
				specTable[numspec + 1] = thetype;
				--BFLOG("table count: "..count-1);
				entityTable[count] = entitylist[i]
				count = count + 1
			end
		end
	end
	
	return entityTable;
end




function completeAfricanConservationConsortium(comp)	

	giveCash(20000);
	
	showchallengewin("Challengetext:CHAfricanConservationConsortiumSuccess");
	
	resetchallengeoverandcomplete(CHALLENGE_NAME);
	incrementglobalchallenges();
end

function failAfricanConservationConsortium(comp)

	
	if (declinenotfail == nil) then
		showchallengefail("Challengetext:CHAfricanConservationConsortiumFailure");
	end
	
	resetchallengeover(CHALLENGE_NAME);
	declinenotfail = nil;
end