include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function xaward(group, index)
-- get this once for an entertainment award and once for an education award

	local args = group[index].args;
	
	local amount = args[1]
	local type = args[2]
	
	local totaldon
	if (type == "entertainment") then
		totaldon = getDonationsAllAnimals()
	elseif (type == "education") then
		totaldon = getDonations("Education")
	end

	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group, index, totaldon, amount)
	if (totaldon >= amount) then
		awards_set_received(group, index)
		incrementAwardPoints(1);
		showawardpanel();
		return true;
	end
end

-- STEVE S: must fill in ### with actual values
awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = donation amount to check for, arg[2] = type of award (ed. or ent.)
	{flag_name="entertainmentaward", icon_name="###", locid="###", args={100000, "entertainment"}},
	{flag_name="educationaward", icon_name="###", locid="###", args={25000, "education"}},
	test_func=xaward,
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
