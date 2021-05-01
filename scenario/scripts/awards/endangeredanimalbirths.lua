include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";

function xaward(group, index)

	local args = group[index].args;
	-- Figure out the total number of endangered species
	-- And out of these endangered species, how many has the player released?
	if (end_table == nil) then
		end_table = getAllEndangeredSpeciesList();
	end
	
	--local total_species = table.getn(end_table);
	local total_species = 10;
	
	local young_species = 0;
	
	-- Now figure out how many of these species we have had a baby of
	local ZTStatus = queryObject("ZTStatus");
	if (ZTStatus) then
		for i = 1, table.getn(end_table) do
			local numBabies = ZTStatus:ZT_GET_ENTITY_TYPE_INDEX(end_table[i].."_Young");
			if (numBabies >= 1) then
				young_species = young_species + 1;
			end
		end
	end


	awards_update_bar(group.group_xml, index, young_species, total_species)
	if (young_species >= total_species) then
		
		
		-- Notify the user that their item has been delivered
		local showtext = getLocID("awards:itemdelivery");
		local itemname = getLocID("entityname:Statue_AnimalBabies");
		local showme = string.format(showtext, itemname);
		genericokpaneltext(nil, showme);
	
		
		showawardpanel();
		-- Unlock proper things here
		local unlockme = args[1];
		BFLOG("Unlock "..unlockme)
		setglobalvar(unlockme, "true");		
		awards_set_received_graphics(group, index, false);
		return true;
		
	end
end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: arg[1] = donation amount to check for, arg[2] = type of award (ed. or ent.)
	{flag_name="endangeredanimalbirth", icon_name="EndangeredBabies_name_award", locid="EndangeredBabies", args={"AnimalBabieslock"} },
	test_func=xaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/EndangeredBabies.xml",
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
	-- Give them a baby animal statue
	local unlocked = getglobalvar("AnimalBabieslock")
	if(unlocked == "true") then
		placeCratedObjectAtGate("Statue_AnimalBabies");
		setglobalvar("AnimalBabieslock", "earned")			
	end
end
