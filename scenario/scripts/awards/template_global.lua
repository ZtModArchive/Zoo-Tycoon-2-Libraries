include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function globalaward(group, index)
-- get this once
-- for having a zoo with animals from north america, africa, asia, australia

	local na = {"BearGrizzly", "Moose", "BeaverAmerican", "BearPolar"}
	
	local af = {"CamelDromedary", "Chimpanzee", "Okapi", "LemurRingtailed", "GorillaMountain", "Lion", 
		"Cheetah", "Giraffe", "ElephantAfrican", "GazelleThomsons", "ZebraCommon", "RhinocerosBlack", 
		"Ostrich", "Gemsbok", "FlamingoGreater", "Hippopotamus", "CrocodileNile"}

	local as = {"CamelDromedary", "TigerBengal", "LeopardSnow", "Ibex", "PeafowlCommon"}

	local au = {"Kangaroo"}

	
	if (howManyInTableExist(na) < 1) then
		return false;
	elseif (howManyInTableExist(af) < 1) then
		return false;
	elseif (howManyInTableExist(as) < 1) then
		return false;
	elseif (howManyInTableExist(au) < 1) then
		return false;	

	else
		awards_set_received(group, index)
		incrementAwardPoints(1);
		showawardpanel();
		return true;
	end

end

awards_group={
	-- incremental awards set: only one in this group
	-- flag_name: flag in comps to set when condition becomes true
	{flag_name="globalaward", args={xmlfile="awards/Global.xml"}},
	test_func=globalaward
}

-- STEVE S: must fill in ### with actual values
awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of years to check for
	{flag_name="globalaward", icon_name="###", locid="###"},
	test_func=globalaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/###.xml"
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
