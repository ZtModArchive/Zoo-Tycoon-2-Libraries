include "scenario/scripts/misc.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/awards.lua";

function fedaward(group, index)

	local args = group[index].args;
	
	local maxFossilEducationCenterLevel = 0;
	local levelsPerSkeleton = 0;
		
	local ztMgr = queryObject("ZTWorldMgr");
	if (ztMgr) then
		levelsPerSkeleton = ztMgr:BFG_GET_ATTR_FLOAT({key="FossilEducationCenter", val="f_NumLevels"});
	end
	BFLOG(levelsPerSkeleton.." levels per skeleton.");
					
	if (levelsPerSkeleton == 0) then
		levelsPerSkeleton = 10;
	end
	
	local BFGameMgr = queryObject("BFGManager");
	local centers = findTypeDirect("FossilEducationCenter");
	if(centers ~= nil) then
		local count = table.getn(centers)
		for i = 1, count do
			local entity = resolveTable(centers[i].value)
			if (entity ~= nil) then
				local level = entity:BFG_GET_ATTR_FLOAT("f_BoneLevel");
				if (level > maxFossilEducationCenterLevel) then
					maxFossilEducationCenterLevel = level;
				end
			end
		end
	end
	
	local whichSkeleton = 1;
	local completionLevel = levelsPerSkeleton - 1;
	while (maxFossilEducationCenterLevel > completionLevel) do
		maxFossilEducationCenterLevel = maxFossilEducationCenterLevel - levelsPerSkeleton;
		whichSkeleton = whichSkeleton + 1;
	end

	awards_update_bar(group.group_xml, index, maxFossilEducationCenterLevel, completionLevel)
	if (maxFossilEducationCenterLevel >= completionLevel and index == whichSkeleton) then
		awards_set_received_graphics(group, index, true)

		-- Unlock proper things here
--		local crateme = args[1];
--		placeCratedObjectAtGate(crateme);

		showawardpanel();
		return true;
	end

end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = reward object
	{flag_name="fossileducationaward1", icon_name="FossilEducationOne", locid="FossilEducationOne", args={"Statue_Mammoth"} },
	{flag_name="fossileducationaward2", icon_name="FossilEducationTwo", locid="FossilEducationTwo", args={"Statue_IrishElk"} },
	{flag_name="fossileducationaward3", icon_name="FossilEducationThree", locid="FossilEducationThree", args={"Statue_TyrannosaurusRex"} },
	{flag_name="fossileducationaward4", icon_name="FossilEducationFour", locid="FossilEducationFour", args={"Statue_Pteranodon"} },
	test_func=fedaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/FossilEducationgroup.xml"
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
