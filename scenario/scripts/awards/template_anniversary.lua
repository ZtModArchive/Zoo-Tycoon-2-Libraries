include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function nthanniversary(group, index)
-- this function gets called every time we want to check for anniversary N

	local args = group[index].args;
	
	local numyears = args[1]
	
	local month = getCurrentMonth();
	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group, index, month, (numyears * 12), true)
	if (month >= (numyears * 12)) then
		-- If they have gone numyears years
		awards_set_received(group, index)
		incrementAwardPoints(1);
		showawardpanel();
		return true;
	end
	
	return false;
end

-- STEVE S: must fill in ### with actual values
awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of years to check for
	{flag_name="firstanniversary", icon_name="1", locid="ZooAttendance100", args={1}},
	{flag_name="fifthanniversary", icon_name="5", locid="ZooAttendance1000", args={5}},
	{flag_name="tenthanniversary", icon_name="10", locid="ZooAttendance5000", args={10}},
	{flag_name="twentiethanniversary", icon_name="20", locid="ZooAttendance10000", args={20}},
	test_func=nthanniversary,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/Anniversary.xml"
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
