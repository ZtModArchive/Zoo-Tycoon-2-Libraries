include "scenario/scripts/misc.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/awards.lua";

function grlaward(group, index)

	local args = group[index].args;
	local numSuperClonesRequired = args[1];
	
	local numSuperClones = 0;
	local ztStatus = queryObject("ZTStatus");
	if (ztStatus) then
		numSuperClones = ztStatus:ZT_NUM_SUPER_CLONES();
	end
	BFLOG(numSuperClones.." super clones");

	awards_update_bar(group.group_xml, index, numSuperClones, numSuperClonesRequired)
	if (numSuperClones >= numSuperClonesRequired) then
		awards_set_received_graphics(group, index, true)
		showawardpanel();
		return true;
	end

end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = number of super clones required for award
	{flag_name="geneticresearchaward1", icon_name="GeneticResearchOne", locid="GeneticResearchOne", args={1} },
	{flag_name="geneticresearchaward2", icon_name="GeneticResearchTwo", locid="GeneticResearchTwo", args={10} },
	{flag_name="geneticresearchaward3", icon_name="GeneticResearchThree", locid="GeneticResearchThree", args={25} },
	test_func=grlaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/GeneticResearchgroup.xml"
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
