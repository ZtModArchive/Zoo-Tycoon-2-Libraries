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
		awards_update_bar(group.group_xml, index, numreleased, num, (index > 1) and group[index-1].args[1] or 0)
		if (numreleased >= num) then
			awards_set_received_graphics(group, index, true)
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
	{flag_name="releaseLvl1", icon_name="Effort", locid="ConservationEffort", args={1}},
	{flag_name="releaseLvl2", icon_name="Achieve", locid="ConservationAchieve", args={10}},
	{flag_name="releaseLvl3", icon_name="Exel", locid="ConservationExel", args={25}},
	test_func=nlevelanimalreleased,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/ZooConservation.xml"
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
