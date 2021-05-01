include "scenario/scripts/needs.lua";
include "scenario/scripts/awards.lua";
include "scenario/scripts/entity.lua";

-- Award file for lockable campaign objects

function extinctreleaseaward(group, index)

	local args = group[index].args;
	local testRelease = args[1];

	local numExtinctSpecies = 0;
	local extinctSpecies = getAllExtinctSpeciesList(true)
	if (extinctSpecies ~= nil) then
		numExtinctSpecies = table.getn(extinctSpecies);
	end

	-- Check to see if user var has been set to unlock this item from a previous game before evaluating
	local isUnlocked = getuservar(testRelease);
	if (isUnlocked ~= nil) and (isUnlocked == "true") then	
		awards_update_bar(group.group_xml, index, numExtinctSpecies, numExtinctSpecies)
		awards_set_received_graphics(group, index, true)
		return true;
	end

	BFLOG(numExtinctSpecies.." extinct species found");
	if (numExtinctSpecies > 0) then
		local mgr = queryObject("ZTStatus");
		if (mgr) then
			local numExtinctSpeciesReleased = mgr:ZT_GET_NUM_EXTINCT_SPECIES_RELEASED();
			local numExtinctSpeciesExceptQuagga = numExtinctSpecies - 1;
			BFLOG(numExtinctSpeciesReleased.." extinct species have been released of 30");
			awards_update_bar(group.group_xml, index, numExtinctSpeciesReleased, numExtinctSpecies)
			if (numExtinctSpeciesReleased >= numExtinctSpeciesExceptQuagga) then
				setuservar(testRelease, "true");
				awards_set_received_graphics(group, index, true)
				incrementAwardPoints(1);
				showpersistentawardpanel();
				return true;
			end
		end
	end
end

awards_group={
	-- incremental awards set: player gets first set, then second, then third...
	-- flag_name: flag in comps to set when condition becomes true
	-- icon_name: refers to names to in XML file named by group_xml below
	-- locid: refers to "before" and "after" loc ids found in lang\1033\awards.XML
	-- args: lock flag to unlock
	{flag_name="extinctrelease", icon_name="ExtinctRelease", locid="ExtinctRelease", args={"quagga_xtlock"}},
	test_func=extinctreleaseaward,
	-- the XML file that defines graphic for this awards group
	group_xml="awards/ExtinctReleasegroup.xml",
	persistent_awards = true
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
