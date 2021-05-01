include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function speciesgrantn(group, index)
-- for each of the following money grants, display the grant panel with the 
-- locid moneygrants:speciesgrant (same locid for all)

-- get this once (for each species grant)

-- give player $5000 when 5 different species in zoo
-- give player $10000 when 12 different species in zoo
-- give player $15000 when 18 different species in zoo

	local args = group[index].args;
	
	local numspecies = args[1]
	local cash = args[2]
	
	local numinzoo = howManyAnimalsInZoo();

	if (numinzoo ~= nil) then
		-- we set true because there was a previous milestone amount
		-- that must be subtracted in calculating green bar length
		-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
		--  of second bar gets filled)
		awards_update_bar(group, index, numinzoo, numspecies, true)
		if (numinzoo >= numspecies) then
			awards_set_received(group, index)
			giveCash(cash);
			showgivecash("moneygrants:speciesgrant", cash);
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
	-- args: arg[1] = number of species to check for, arg[2] = cash reward to provide
	{flag_name="speciesgrantone", icon_name="###", locid="###", args={5, 5000}},
	{flag_name="speciesgranttwo", icon_name="###", locid="###", args={12, 10000}},
	{flag_name="speciesgrantthree", icon_name="###", locid="###", args={18, 15000}},
	{flag_name="speciesgrantfour", icon_name="###", locid="###", args={30, 25000}},
	test_func=speciesgrantn,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/###.xml"
}

-- this function stays the same in every awards LUA script
function initaward(comp)
	display_award_group(awards_group)
end

-- this function stays the same in every awards LUA script
-- Okay, well not in THIS script
function processaward(comp)
	if (docashrewards == true) then
		process_award_group(comp, awards_group)
	end
end

-- this function gets called when the awards group is completely won
function postawardgroupcomplete()
	--do animal crating or whatever
end
