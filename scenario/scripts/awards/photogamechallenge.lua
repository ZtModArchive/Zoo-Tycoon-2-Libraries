include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/misc.lua";

function pchal(group, index)
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
		if (type == "numchallcomplete") then
			local sf_lock = getuservar("safarilock");
			if ((sf_lock == nil) or (sf_lock ~= "true")) then
				showchallengewin("itemunlock:newitemsafari");
				setuservar("safarilock", "true");
				-- Save out the user options
				saveOptions();
			end
		end
		
		if (type == "numphotocomplete") then
			local ju_lock = getuservar("junglelock");
			if ((ju_lock == nil) or (ju_lock ~= "true")) then
				showchallengewin("itemunlock:newitemjungle");
				setuservar("junglelock", "true");
				-- Save out the user options
				saveOptions();
			end
		end
	
		awards_set_received_graphics(group, index, true)
		showpersistentawardpanel();

		return true;	
	end
	
	-- We also need to check the case where they already have the award from another game
	if (type == "numchallcomplete") then
		local sf_lock = getuservar("safarilock");
		if (sf_lock ~= nil) then
			awards_set_received_graphics(group, index, false)
		end
	end
	
	if (type == "numphotocomplete") then
		local ju_lock = getuservar("junglelock");
		if (ju_lock ~= nil) then
			awards_set_received_graphics(group, index, false)
		end
	end
	
	
	return false;
end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of years to check for
	{flag_name="photochallenges", icon_name="Photo Challenges Reward", locid="PhotoChallenges", args={"numphotocomplete", 5} },
	{flag_name="gamechallenges", icon_name="Game Challenges Reward", locid="GameChallengesReward", args={"numchallcomplete", 5} },
	test_func=pchal,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/Photo_Game_Challenge.xml",
	process_whole_group=true,
	persistent_awards=true
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