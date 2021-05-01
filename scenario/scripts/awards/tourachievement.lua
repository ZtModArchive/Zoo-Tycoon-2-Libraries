include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function tourrating(group, index)
	local args = group[index].args;	
	local tourtype = args[1];
	
	local rating = maxStationTypeStarRating(tourtype);
	
	awards_update_bar(group.group_xml, index, rating, 5)

	if (rating >= 5) then
		awards_set_received_graphics(group, index, false);
		showawardpanel();
		return true;
	end

	
	return false;
end

awards_group={
	-- incremental awards set: player gets first award, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of guests to check for
	{flag_name="groundtouraward", icon_name="GroundTourAchievementRating", locid="GroundTourAchievementRating", args={"groundstation"}},
	{flag_name="skytouraward", icon_name="SkyTourAchievementRating", locid="SkyTourAchievementRating", args={"skystation"}},
	test_func=tourrating,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/TourAchievementRatinggroup.xml",
	process_whole_group=true,
	is_challenge_only=true
}

-- this function stays the same in every awards LUA script
function initaward(comp)
	create_award_group_graphics(awards_group)
end

-- this function stays the same in every awards LUA script
function processaward(comp)
	--BFLOG("=====> WELCOME TO GUESTPOPULATION.LUA")
	process_award_group(comp, awards_group)
end

-- this function gets called when the awards group is completely won
function postawardgroupcomplete()
	setglobalvar("skytowerlock", "true");
end