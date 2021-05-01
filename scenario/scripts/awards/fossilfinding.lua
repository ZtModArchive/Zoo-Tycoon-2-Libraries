include "scenario/scripts/misc.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/awards.lua";

function fossilfindingaward(group, index)

	local args = group[index].args;
	local sonarLevel = tostring(args[1]);
	
	local numPuzzles = 0;
	local numPuzzlesReady = 0;
	local puzzleMgr = queryObject("ZTPuzzleMgr");
	if (puzzleMgr) then
		numPuzzles = puzzleMgr:ZT_GET_NUM_PUZZLES(sonarLevel);
		numPuzzlesReady = puzzleMgr:ZT_GET_NUM_PUZZLES_READY(sonarLevel);
	end

	awards_update_bar(group.group_xml, index, numPuzzlesReady, numPuzzles)
	if (numPuzzlesReady >= numPuzzles) then
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
	{flag_name="fossilfindingaward1", icon_name="FossilFindingOne", locid="FossilFindingOne", args={1} },
	{flag_name="fossilfindingaward2", icon_name="FossilFindingTwo", locid="FossilFindingTwo", args={3} },
	{flag_name="fossilfindingaward3", icon_name="FossilFindingThree", locid="FossilFindingThree", args={5} },
	test_func=fossilfindingaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/FossilFindinggroup.xml"
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
