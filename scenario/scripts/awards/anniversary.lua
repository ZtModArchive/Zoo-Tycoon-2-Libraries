include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function nthanniversary(group, index)
-- this function gets called every time we want to check for anniversary N

	local args = group[index].args;
	
	local goalmonths = args[1]
	
	local month = getCurrentMonth();
	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	--BFLOG(SYSTRACE, "-------->  Month: "..month.. "     goalmonths: "..goalmonths..".");
	
	awards_update_bar(group.group_xml, index, month, goalmonths, (index > 1) and group[index-1].args[1] or 0)
	if (month >= goalmonths) then
		-- If they have gone goalmonths months
		awards_set_received_graphics(group, index, true)
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
	{flag_name="firstanniversary", icon_name="12", locid="FirstAnniversary", args={12}},
	{flag_name="fifthanniversary", icon_name="60", locid="FifthAnniversary", args={60}},
	{flag_name="tenthanniversary", icon_name="120", locid="TenthAnniversary", args={120}},
	{flag_name="twentiethanniversary", icon_name="240", locid="TwentiethAnniversary", args={240}},
	test_func=nthanniversary,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/ZooAnniversary.xml"
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
	-- Unlock the blimp here
	local ZTAIAmbientsMgr = queryObject("ZTAIAmbientsMgr");
	if (ZTAIAmbientsMgr) then
		BFLOG("Setting blimp as ambient");
		ZTAIAmbientsMgr:ZT_ADD_ADDITIONAL_AMBIENT("Blimp_end");
	else
		BFLOG("couldn't get ZTAIAmbientsMgr");
	end
end
