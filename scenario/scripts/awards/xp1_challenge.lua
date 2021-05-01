include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/misc.lua";

function xaward(group, index)

	local args = group[index].args;
	local type = args[1];
	local total = args[2];

	local num = getglobalvar(type);
	if (num == nil) then
		num = 0;
	end
	
	num = tonumber(num);
	
	awards_update_bar(group.group_xml, index, num, total, false);
	if (num >= total) then
		-- Figure out which set we want to unlock
		if (type == "numendangeredchallcomplete") then
			local end_lock = getuservar("endangeredlock");
			if ((end_lock == nil) or (end_lock ~= "true")) then
				showchallengewin("itemunlock:newitemendangered");
				setuservar("endangeredlock", "true");
				saveOptions();
			end
		end
	
		awards_set_received_graphics(group, index, true)
		showpersistentawardpanel();

		return true;	
	end
	
	-- We also need to check the case where they already have the award from another game
	if (type == "numendangeredchallcomplete") then
		local end_lock = getuservar("endangeredlock");
		if (end_lock ~= nil) then
			awards_set_received_graphics(group, index, false)
		end
	end
	
	
	return false;
end

awards_group={
	{flag_name="xp1challenges", icon_name="EndangeredTheme_name_award", locid="EndangeredTheme", args={"numendangeredchallcomplete", 2} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/XP1_Challenge.xml",
	persistent_awards = true,
	process_whole_group=true
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
