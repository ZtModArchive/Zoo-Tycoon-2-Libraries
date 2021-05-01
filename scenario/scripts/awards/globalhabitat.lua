include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/misc.lua";

BIOME_SMALL_THRESHOLD = 10;

function globalaward(group, index)
-- get this once
-- for having a zoo with animals from north america, africa, asia, australia

	local args = group[index].args;
	local type = args[1];
	
	if (type == "global") then

		-- North America
		local namertable = getAnimalsFromLocation("northamerica",true);
		local arctable = getAnimalsFromLocation("arctic",false);
		local natotal = table.getn(namertable) + table.getn(arctable);
		
		-- Asia
		local chinatable = getAnimalsFromLocation("china",true);
		local asiatable = getAnimalsFromLocation("asia",true);
		local asiatotal = table.getn(chinatable) + table.getn(asiatable);
		
		-- Africa
		local atable = getAnimalsFromLocation("africa",true);
		local madtable = getAnimalsFromLocation("madagascar",true);
		local africatotal = table.getn(atable) + table.getn(madtable);
		
		-- Australia
		local austable = getAnimalsFromLocation("australia",true);
		local austotal = table.getn(austable);

		if (natotal < 1) then
			return false;
		elseif (asiatotal < 1) then
			return false;
		elseif (africatotal < 1) then
			return false;
		elseif (austotal < 1) then
			return false;
		else
			awards_set_received_graphics(group, index, true);
			incrementAwardPoints(1);
			showawardpanel();
			return true;
		end
	else
		local alpinetable = getAnimalsFromBiome("alpine");
		local borealtable = getAnimalsFromBiome("borealforest");
		local deserttable = getAnimalsFromBiome("desert");
		local savannahtable = getAnimalsFromBiome("savannah");
		local scrubtable = getAnimalsFromBiome("scrub");
		local temptable = getAnimalsFromBiome("temperateforest");
		local troptable = getAnimalsFromBiome("tropicalrainforest");
		local tundratable = getAnimalsFromBiome("tundra");
		local wettable = getAnimalsFromBiome("wetlands");
		

		if (existEntityMeetsEnvThreshhold(alpinetable, "alpine", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(borealtable, "borealforest", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(deserttable, "desert", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(savannahtable, "savannah", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(scrubtable, "scrub", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(temptable, "temperateforest", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(troptable, "tropicalrainforest", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(tundratable, "tundra", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		elseif (existEntityMeetsEnvThreshhold(wettable, "wetlands", BIOME_SMALL_THRESHOLD) == false) then
			return false;
		else
			awards_set_received_graphics(group, index, true)
			incrementAwardPoints(1);
			showawardpanel();

			return true;	
		end
	end
end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of years to check for
	{flag_name="globalaward", icon_name="Global", locid="Global", args={"global"} },
	{flag_name="habitataward", icon_name="Habitat", locid="Habitat", args={"habitat"} },
	test_func=globalaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/ZooHabitatSpecies.xml",
	process_whole_group=true
}

-- this function stays the same in every awards LUA script
function initaward(comp)
	create_award_group_graphics(awards_group)
end

-- this function stays the same in every awards LUA script
function processaward(comp)
	process_award_group(comp, awards_group)
end

-- this function gets called when the awards group is completely won
function postawardgroupcomplete()
	--do animal crating or whatever
end
