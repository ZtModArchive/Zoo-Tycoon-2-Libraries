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
	
	local released_species = 0;
	
	local animalsreleased = {};
	local ZTStatus = queryObject("ZTStatus");
	if (ZTStatus) then
		animalsreleased = ZTStatus:ZT_GET_ALL_ANIMALS_RELEASED();
	end
	
	if (animalsreleased) then
		local animaltable = { };
		for i = 1, table.getn(animalsreleased) do
			animaltable[i] = animalsreleased[i].value;
		end

		for j = 1, table.getn(end_table) do
			if (howManySpeciesInTable(animaltable, end_table[j]) >= 1) then
				released_species = released_species + 1;
			end
		end
	end

	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group.group_xml, index, released_species, total_species)
	if (released_species >= total_species) then
		awards_set_received_graphics(group, index, false);
		
		-- Give out the endangerd zoowall fences here
		setglobalvar("endangered_zoowall_fence", "true");
		
		-- If they had previously gotten the posts then give them the completely new walls
		-- Otherwise justs replace the fence segment
		local hadPosts = getglobalvar("endangered_zoowall_posts");
		local targetType = "";
		if (hadPosts ~= nil and hadPosts == "true") then
			targetType = "zoowall_end";
		else
			targetType = "zoowallfence_end";
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
	{flag_name="endangeredanimalrelease", icon_name="EndangeredAnimalReleaseEffort_award", locid="EndangeredAnimalReleaseEffort", args={} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/EndangeredAnimalReleaseEffort.xml",
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
