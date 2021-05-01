include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function xaward(group, index)

	-- Figure out how many of the challenges they have completed
	local c1 = getglobalvar("award_eaapart1");
	local c2 = getglobalvar("award_eaapart2");
	local c3 = getglobalvar("award_eaapart3");
	
	local count = 0;

	if (c1 ~= nil and c1 == "true") then
		count = count + 1;
	end

	if (c2 ~= nil and c2 == "true") then
		count = count + 1;
	end
	
	if (c3 ~= nil and c3 == "true") then
		count = count + 1;
	end

	-- we set true because there was a previous milestone amount
	-- that must be subtracted in calculating green bar length
	-- (e.g. 100 guests before we get to 1000 guests -- if 101 guests, only .1%
	--  of second bar gets filled)
	awards_update_bar(group.group_xml, index, count, 3)
	if (count >= 3) then
		awards_set_received_graphics(group, index, false)
		
		setglobalvar("photostandlock", "true");
		
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
	{flag_name="endangeredphotographeraward", icon_name="EndangeredSpeciesPhotographer_award", locid="EndangeredSpeciesPhotographer", args={} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/EndangeredSpeciesPhotographer.xml",
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
	--do animal crating or whatever
end
