include "scenario/scripts/misc.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/awards.lua";

function medicalmarvelaward(group, index)

	local args = group[index].args;
	local curesRequired = args[1];
	
	local numCures = 0;
	local diseaseMgr = queryObject("ZTDiseaseMgr");
	if (diseaseMgr) then
		numCures = diseaseMgr:ZT_GET_NUM_DISEASES_CURED();
	end

	awards_update_bar(group.group_xml, index, numCures, curesRequired)
	if (numCures >= curesRequired) then
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
	{flag_name="medicalmarvelaward1", icon_name="MedicalMarvel", locid="MedicalMarvel", args={3} },
	test_func=medicalmarvelaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/MedicalMarvelgroup.xml"
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
