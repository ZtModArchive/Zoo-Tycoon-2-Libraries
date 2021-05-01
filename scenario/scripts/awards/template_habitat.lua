include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function habitattrophy(group, index)
-- test for having a zoo with every biome represented

-- They need to have an animal with enviro < 10 for each of each biome types

	local bor = {"BearGrizzly", "Moose"}

	local tem = {"PandaRed", "PandaGiant", "PeafowlCommon"}
	
	local des = {"CamelDromedary"}
	
	local tro = {"Chimpanzee", "Okapi", "LemurRingtailed", "Jaguar", "TigerBengal", "GorillaMountain"}
	
	local sav = {"Cheetah", "Giraffe", "ElephantAfrican", "GazelleThomsons", "ZebraCommon", 
		"RhinocerosBlack", "Ostrich"}
	
	local scr = {"Kangaroo", "Gemsbok"}
	
	local alp = {"LeopardSnow", "Ibex"}
	
	local tun = {"BearPolar", "PenguinEmperor"}
	
	local wetl = {"FlamingoGreater", "Hippopotamus", "CrocodileNile", "BeaverAmerican"}

	-- refers to all the environments specified above
	local enviro_tab = {bor, tem, des, tro, sav, scr, alp, tun, wetl}
	
	-- if there is an environment where the threshold is not met, then this function fails
	for i=1,table.getn(enviro_tab) do
		if (animalTableMeetsThreshold(enviro_tab[i], "environment", 10) == false) then
			return false;
		end
	end

	awards_set_received(group, index)
	incrementAwardPoints(1);
	showawardpanel();

	return true;
end

-- STEVE S: must fill in ### with actual values
awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	{flag_name="habitattrophy", icon_name="###", locid="###"},
	test_func=habitattrophy,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/###.xml"
}

-- this function stays the same in every awards LUA script
function initaward(comp)
	display_award_group(awards_group)
end

-- this function stays the same in every awards LUA script
function processaward(comp)
	process_award_group(comp, awards_group)
end

-- this function gets called when the awards group is completely won
function postawardgroupcomplete()
	--do animal crating or whatever
end
