-- africancamaignscen3.lua
-- lua script for African campaign (African Diversity Zoo)

include "scenario/scripts/misc.lua";
include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/needs.lua";
include "scenario/scripts/economy.lua";

LUALOG(SYSERROR, "africancamaignscen3.lua started")

function setinitialzoostate(comp)
	completeshowoverview()
	showUI("goal panel", true)
	return 1
end

function numAnimalsPreferedBiome(location,biome)
	BFLOG(SYSTRACE,"num animals")
	local loctable = getAnimalsFromLocation(location,true)
	local biometable = getAnimalsFromBiome(biome)
	local totalanimals = {}
	
	for i = 1, table.getn(loctable) do
		local single_loc = resolveTable(loctable[i].value)
		if(single_loc) then
			for j = 1, table.getn(biometable) do
				local single_biome = resolveTable(biometable[j].value)	
				if(single_biome) then
					if(single_loc == single_biome) then
						totalanimals[table.getn(totalanimals) + 1] = biometable[j];
					end
				end
			end
		end
	end
	local num = table.getn(getUniqueSpecies(totalanimals))
	BFLOG(SYSTRACE,"num of animals that prefer "..biome.."==> "..num)
       return num				
end

function eval14Species(comp)

	if(comp.overSavannah == nil) then
		comp.overSavannah = true
	end
	
	local africanAnimalsTable = getAnimalsFromLocation("africa",true)
	--BFLOG(SYSTRACE, "number of african animals "..table.getn(africanAnimalsTable))
	local uniqueAfricanTable = getUniqueSpecies(africanAnimalsTable)
	local numUniqueAfrican = table.getn(uniqueAfricanTable)
	--BFLOG(SYSTRACE, "number of unique animals "..numUniqueAfrican)
	local numSavannah = numAnimalsPreferedBiome("africa","savannah")
	
	if((numUniqueAfrican >= 15) and (numSavannah >= 5) and comp.overSavannah) then
		comp.overSavannah = false
		genericokpanel(nil, "AfricaCampaign:AfricanDiversitySavannahExcess")
	end
	if((numUniqueAfrican >= 14) and (numSavannah <= 4)) then
		return 1
	end
	return 0
end

function complete14Species()
	giveCash(70000)
	return 1
end

function completetotalwin()
   -- Mark the scenario as completed
	setuservar("AfricaCampaignscenario3", "completed")
   -- Give them the completed scenario window
	showscenariowin("AfricaCampaign:AfricanDiversitySuccessOverview")	
   -- Unlock Desert Theme Items
   	setuservar("desertlock", "true");
   	showchallengewin("AfricaCampaign:newitemdesert");
  
	return 1
end


function eval4Species()
	if(table.getn(getUniqueSpecies(getAnimalsFromLocation("africa",true))) >= 4) then
		return 1
	end
	
	return 0
		
end

function complete4Species()
	giveCash(20000)
	showRule("Have8Species")
	completeshowoverview()
	return 1
end

function eval8Species()
	if(table.getn(getUniqueSpecies(getAnimalsFromLocation("africa",true))) >= 8) then
			return 1
	end
end

function complete8Species()
	giveCash(40000)
	completeshowoverview()
	return 1
end

function evalScrub()
	--Note biome must be lowercase
	if(numAnimalsPreferedBiome("africa","scrub") >= 2) then
		return 1
	end
	return 0
end

function completeScrub()
	giveCash(10000)
	showRule("GrassAnimals")
	completeshowoverview()
	return 1
end

function evalGrass()
	--Note biome must be lowercase
	if(numAnimalsPreferedBiome("africa","grassland") >= 2) then
		return 1
	end
	return 0

end

function completeGrass()
	giveCash(20000)
	completeshowoverview()
	return 1
end
