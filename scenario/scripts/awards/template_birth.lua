include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function birthaward(group, index)

	local args = group[index].args;
	
	local animalname = args[1]
	
	if (existNumChildren(animalname, 1) == true) then
		awards_set_received(group, index)
		incrementAwardPoints(1);
		showawardpanel();
		return true
	end
end

-- STEVE S: must fill in ### with actual values
awards_group={
	-- non-incremental awards set: these events can occur in any order
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = animal birth to check for
	{flag_name="birthchimp", icon_name="###", locid="###", args={"Chimpanzee"}},
	{flag_name="birthelephant", icon_name="###", locid="###", args={"ElephantAfrican"}},
	{flag_name="birthgiant", icon_name="###", locid="###", args={"PandaGiant"}},
	{flag_name="birthgorilla", icon_name="###", locid="###", args={"GorillaMountain"}},
	{flag_name="birthgrizzly", icon_name="###", locid="###", args={"BearGrizzly"}},
	{flag_name="birthokapi", icon_name="###", locid="###", args={"Okapi"}},
	{flag_name="birthred", icon_name="###", locid="###", args={"PandaRed"}},
	{flag_name="birthrhino", icon_name="###", locid="###", args={"RhinocerosBlack"}},
	{flag_name="birthsnow", icon_name="###", locid="###", args={"LeopardSnow"}},
	{flag_name="birthtiger", icon_name="###", locid="###", args={"TigerBengal"}},
	test_func=birthaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/###.xml",
	-- set this flag because this is a non-incremental awards set
	process_whole_group=true
}

-- this function stays the same in every awards LUA script
function initaward(comp)
	display_award_group(awards_group)
end

-- this function stays the same in every awards LUA script
function processaward(comp)
	process_award_group(comp, awards_group)
end

-- this function gets called when the awards group is completely won
function postawardgroupcomplete()
	--do animal crating or whatever
end
