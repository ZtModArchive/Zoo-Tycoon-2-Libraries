include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

-- Award file for lockable campaign objects

function checkcamp(group, index)

	local args = group[index].args;
	local testCamp = args[1];

	-- Check to see if user var has been set to unlock this item
	local isUnlocked = getuservar(testCamp);
	if (isUnlocked ~= nil) and (isUnlocked == "true") then	
		awards_set_received_graphics(group, index, true)
		return true;
	end
end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = donation amount to check for, arg[2] = type of award (ed. or ent.)
	{flag_name="marineanimalscampaign", icon_name="MarineAnimalsCampaign_name_award", locid="MarineAnimalsCampaign", args={"whalehalllock"}},
	{flag_name="marineshowscampaign", icon_name="MarineShowsCampaign_name_award", locid="MarineShowsCampaign", args={"showcanopylock"}},
	test_func=checkcamp,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/XP2_Campaign.xml",
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
	--do animal crating or whatever
end
