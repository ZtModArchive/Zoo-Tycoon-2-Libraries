include "scenario/scripts/misc.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/awards.lua";

function fossilbuildingaward(group, index)

	local args = group[index].args;
	local puzzlesRequired = args[1];
	
	local numPuzzlesComplete = 0;
	local puzzleMgr = queryObject("ZTPuzzleMgr");
	if (puzzleMgr) then
		numPuzzlesComplete = puzzleMgr:ZT_GET_NUM_PUZZLES_BUILT();
	end

	awards_update_bar(group.group_xml, index, numPuzzlesComplete, puzzlesRequired)
	if (numPuzzlesComplete >= puzzlesRequired) then
		awards_set_received_graphics(group, index, true)
		showawardpanel();
		return true;
	end

end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = sonar level of fossil game completed required for award
	{flag_name="fossilbuildingaward1", icon_name="FossilBuildingOne", locid="FossilBuildingOne", args={1} },
	{flag_name="fossilbuildingaward2", icon_name="FossilBuildingTwo", locid="FossilBuildingTwo", args={10} },
	{flag_name="fossilbuildingaward3", icon_name="FossilBuildingThree", locid="FossilBuildingThree", args={25} },
	test_func=fossilbuildingaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/FossilBuildinggroup.xml"
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
end
