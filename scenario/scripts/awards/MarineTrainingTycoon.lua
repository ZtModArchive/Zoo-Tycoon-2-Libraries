include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/Shows.lua";

function xaward(group, index)

	local args = group[index].args;
	local neededLevel = args[1]
	
	
	local curLevel = 0
	local ZTStatus = queryObject("ZTStatus");
	if (ZTStatus) then
		curLevel = ZTStatus:ZT_NUM_TRAINING_PERFECTS()
	end
	
	
	awards_update_bar(group.group_xml, index, curLevel, neededLevel)
	
	
	if (curLevel >= neededLevel) then

		showawardpanel();
		if(index == 3) then
			-- Notify the user that their item has been delivered
			local showtext = getLocID("awards:itemdelivery");
			local itemname = getLocID("entityname:Statue_Training_mm");
			local showme = string.format(showtext, itemname);
			genericokpaneltext(nil, showme);
			-- Unlock proper things here
			local unlockme = args[2];
			setglobalvar(unlockme, "true");		
		end
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
	{flag_name="MarineTrainingtycoonawardpart1", icon_name="MarineTrainingTycoonOne", locid="MarineTrainingTycoonOne", args={1 } },
	{flag_name="MarineTrainingtycoonawardpart2", icon_name="MarineTrainingTycoonTwo", locid="MarineTrainingTycoonTwo", args={10 } },
	{flag_name="MarineTrainingtycoonawardpart3", icon_name="MarineTrainingTycoonThree", locid="MarineTrainingTycoonThree", args={100,"trainingstatuelock" } },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/MarineTrainingTycoongroup.xml",
	process_whole_group=true,
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
	local unlocked = getglobalvar("trainingstatuelock")
	if(unlocked == "true") then
		placeCratedObjectAtGate("Statue_Training_mm");
		setglobalvar("trainingstatuelock", "earned")	
	end
end
