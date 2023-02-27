include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/Shows.lua";

function xaward(group, index)

	local args = group[index].args;
	local stars = args[1]
	local hasStars, curStars = hasShowOfStarRatingX(stars)
	
	if(curStars ~= nil) then
		awards_update_bar(group.group_xml, index, curStars, stars)
	end
	
	if (hasStars == 1) then
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
	{flag_name="MarineStartycoonawardpart1", icon_name="MarineStarTycoonOne", locid="MarineStarTycoonOne", args={1 , "tanklightlock"} },
	{flag_name="MarineStartycoonawardpart2", icon_name="MarineStarTycoonTwo", locid="MarineStarTycoonTwo", args={3 , "showfencelock"} },
	{flag_name="MarineStartycoonawardpart3", icon_name="MarineStarTycoonThree", locid="MarineStarTycoonThree", args={5 , "marinetanklock"} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/MarineStarTycoongroup.xml",
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
