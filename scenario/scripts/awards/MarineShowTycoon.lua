include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function xaward(group, index)

	local args = group[index].args;
	local amount = args[1]
	
	-- Need to get all tour donations here
	local totaldon = getDonations("Show")

	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group.group_xml, index, totaldon, amount)
	if (totaldon >= amount) then
		awards_set_received_graphics(group, index, true)
		
		-- Unlock proper things here
		local unlockme = args[2];
		setglobalvar(unlockme, "true");
		
		
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
	{flag_name="marineshowtycoonawardpart1", icon_name="MarineShowTycoonOne", locid="MarineShowTycoonOne", args={25000, "upgradedgrandstandIIlock"} },
	{flag_name="marineshowtycoonawardpart2", icon_name="MarineShowTycoonTwo", locid="MarineShowTycoonTwo", args={100000, "upgradedgrandstandIIIlock"} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/MarineShowTycoongroup.xml",
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
