include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function checkchal(group, index)

	local args = group[index].args;
	local testChal = args[1];

	-- Check to see if global var has been set on challenge completion
	local donealready = getglobalvar(testChal.."_complete");
	if (donealready ~= nil) and (donealready == "true") then	
		awards_set_received_graphics(group, index, true)
		showawardpanel();
		return true;
	end
end

-- STEVE S: must fill in ### with actual values
awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = donation amount to check for, arg[2] = type of award (ed. or ent.)
	{flag_name="alfredaward", icon_name="AlfredWindsor", locid="AlfredWindsor", args={"alfredwindsorschool"}},
	{flag_name="conservation", icon_name="ConservationImage", locid="ConservationImage", args={"centeranimalconservation"}},
	{flag_name="beckenspot", icon_name="Beckenspot", locid="Beckenspot", args={"primatepictures"}},
	{flag_name="wildlife", icon_name="Wildlife", locid="Wildlife", args={"wildlifemagazine"}},
	test_func=checkchal,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/ChallengeAwards.xml",
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
