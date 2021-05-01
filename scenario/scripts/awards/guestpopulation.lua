include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/misc.lua";

function nguests(group, index)
-- this function gets called every time we want to check for the presence of N guests

	local args = group[index].args;
	
	-- num DESIRED guests, that is
	local numguests = args[1]
	
	local totalguests = getNumGuests(-1);

	if (totalguests ~= nil) then
		-- we set true because there was a previous milestone amount
		-- that must be subtracted in calculating green bar length
		-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
		--  of second bar gets filled)
		awards_update_bar(group.group_xml, index, totalguests, numguests, (index > 1) and group[index-1].args[1] or 0)
	
		if (totalguests >= numguests) then
			
			incrementAwardPoints(1);
			-- If we are on the final award we need to give them a panel notification of the award object
			if (index == 5) then
				local showtext = getLocID("awards:itemdelivery");
				local itemname = getLocID("entityname:Zoo_Attendance_Statue");
				local showme = string.format(showtext, itemname);
				genericokpaneltext(nil, showme);
				-- Unlock proper things here
				local unlockme = args[2];
				BFLOG("Unlock "..unlockme)
				setglobalvar(unlockme, "true");	
				awards_set_received_graphics(group, index, true)
			else
				awards_set_received_graphics(group, index, true)
			end
			
			showawardpanel();
			return true;
		end
	end
	
	return false;
end

awards_group={
	-- incremental awards set: player gets first award, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of guests to check for
	{flag_name="hundredguests", icon_name="100", locid="ZooAttendance100", args={100}},
	{flag_name="thousandguests", icon_name="1000", locid="ZooAttendance1000", args={1000}},
	{flag_name="fivethousandguests", icon_name="5000", locid="ZooAttendance5000", args={5000}},
	{flag_name="tenthousandguests", icon_name="10000", locid="ZooAttendance10000", args={10000}},
	{flag_name="twentythousandguests", icon_name="20000", locid="ZooAttendance20000", args={20000,"TwentyKGuestslock"}},
	test_func=nguests,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/ZooAttendance.xml"
}

-- this function stays the same in every awards LUA script
function initaward(comp)
	create_award_group_graphics(awards_group)
end

-- this function stays the same in every awards LUA script
function processaward(comp)
	--BFLOG("=====> WELCOME TO GUESTPOPULATION.LUA")
	process_award_group(comp, awards_group)
end

-- this function gets called when the awards group is completely won
function postawardgroupcomplete()
	local unlocked = getglobalvar("TwentyKGuestslock")
	if(unlocked == "true") then
		placeCratedObjectAtGate("Statue_TwentyKGuests");
		setglobalvar("TwentyKGuestslock", "earned")			
	end
end