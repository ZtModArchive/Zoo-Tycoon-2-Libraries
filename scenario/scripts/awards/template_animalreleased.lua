include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function nlevelanimalreleased(group, index)
-- get this once (for each important animal-released-to-the-wild milestone)

	local args = group[index].args;

	local num = args[1]
	
	local numreleased = getAnimalsReleased();

	if (numreleased ~= nil) then
		-- we set true because there was a previous milestone amount
		-- that must be subtracted in calculating green bar length
		-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
		--  of second bar gets filled)
		awards_update_bar(group, index, numreleased, num, true)
		if (numreleased >= num) then
			awards_set_received(group, index)
			incrementAwardPoints(1);
			showawardpanel();
			return true;
		end
	end
	
	return false;
end

-- STEVE S: must fill in ### with actual values
awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of releases to wild to check for
	{flag_name="releaseLvl1", icon_name="###", locid="###", args={1}},
	{flag_name="releaseLvl2", icon_name="###", locid="###", args={10}},
	{flag_name="releaseLvl3", icon_name="###", locid="###", args={25}},
	test_func=nlevelanimalreleased,
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
