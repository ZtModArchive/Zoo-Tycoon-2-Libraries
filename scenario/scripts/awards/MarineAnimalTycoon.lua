include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

SPECIAL_GATE_BINDER = "frontgate_mm"

function xaward(group, index)

	local args = group[index].args;
	local amount = args[1]
	
	-- Need to get total guests who have taken tours here
	local totaldonations = getDonationsMarineSpecies()

	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group.group_xml, index, totaldonations, amount)
	if (totaldonations >= amount) then
		awards_set_received_graphics(group, index, true)
		
		if(index == 4) then
			-- Give them out the special gate
			setglobalvar("specialgate", SPECIAL_GATE_BINDER);

			-- Total hack to get the gate to change right away
			adjustZooFame(nil);
		else
			-- Unlock proper things here
			local unlockme = args[2];
			setglobalvar(unlockme, "true");
		end
		
		showawardpanel();
		return true;
	end

end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = donation amount to check for, arg[2] = type of award (ed. or ent.)
	{flag_name="MarineAnimaltycoonawardpart1", icon_name="MarineAnimalTycoonOne", locid="MarineAnimalTycoonOne", args={5000, "dolphinarchlock"} },
	{flag_name="MarineAnimaltycoonawardpart2", icon_name="MarineAnimalTycoonTwo", locid="MarineAnimalTycoonTwo", args={20000, "seahorseridelock"} },
	{flag_name="MarineAnimaltycoonawardpart3", icon_name="MarineAnimalTycoonThree", locid="MarineAnimalTycoonThree", args={100000, "marinefountainlock"} },
	{flag_name="MarineAnimaltycoonawardpart4", icon_name="MarineAnimalTycoonFour", locid="MarineAnimalTycoonFour", args={200000, "marinegatelock"} },	
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/MarineAnimalTycoongroup.xml",
	process_whole_group=true,
	is_challenge_only=true
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

function getDonationsMarineSpecies()
	local marineList = getMarineSpeciesList();
	BFLOG("Number of marine animals in zoo "..table.getn(marineList)) 
	local totalDonations  = 0;
	for i=1, table.getn(marineList) do
		totalDonations = totalDonations + getDonations(marineList[i])
	end
	BFLOG("Total Donations from marine animals "..totalDonations)
	return totalDonations
end