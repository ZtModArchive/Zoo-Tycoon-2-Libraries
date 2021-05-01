include "scenario/scripts/misc.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/awards.lua";

function dinosafetyaward(group, index)

	local args = group[index].args;
	local tranqsRequired = args[1];
	
	local numTranqs = 0;
	local status = queryObject("ZTStatus");
	if (status) then
		numTranqs = status:ZT_GET_NUM_DINOS_TRANQD();
	end

	awards_update_bar(group.group_xml, index, numTranqs, tranqsRequired)
	if (numTranqs >= tranqsRequired) then
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
	-- args: arg[1] = sonar level of fossil game completed required for award
	{flag_name="dinosafetyaward1", icon_name="DinoSafety", locid="DinoSafety", args={1} },
	test_func=dinosafetyaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/DinoSafetygroup.xml"
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
