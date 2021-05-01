include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function xaward(group, index)

	-- Figure out the total number of endangered species
	-- And out of these endangered species, how many has the player released?
	if (end_table == nil) then
		end_table = getAllEndangeredSpeciesList();
	end
	
	--local total_species = table.getn(end_table);
	local total_species = 20;
	
	local cur_species = 0;
	
	for j = 1, table.getn(end_table) do
		if (countType(end_table[j]) >= 1) then
			cur_species = cur_species + 1;
		end
	end

	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group.group_xml, index, cur_species, total_species)
	if (cur_species >= total_species) then
		awards_set_received_graphics(group, index, true)
		
		-- TODO:  Give out new zoo posts here
		setglobalvar("endangered_zoowall_posts", "true");
		
		-- If they had previously gotten the posts then give them the completely new walls
		-- Otherwise justs replace the fence segment
		local hadFence = getglobalvar("endangered_zoowall_fence");
		local targetType = "";
		if (hadFence ~= nil and hadFence == "true") then
			targetType = "zoowall_end";
		else
			targetType = "zoowallposts_end";
		end
		
		local ZTWorldMgr = queryObject("ZTWorldMgr");
		if (ZTWorldMgr) then
			ZTWorldMgr:ZT_REPLACE_ZOO_WALLS(targetType);
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
	{flag_name="endangeredspeciesaward", icon_name="EndangeredSpecies_award", locid="EndangeredSpecies", args={} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/EndangeredSpecies.xml",
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
	--do animal crating or whatever
end
