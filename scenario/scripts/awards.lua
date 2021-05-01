include("scenario/scripts/needs.lua")
include("scenario/scripts/ui.lua")
include("scripts/fixupawardui.lua")
include("scripts/uiutil.lua")
brand_new_award = false
brand_new_award_group = false
get_awards_panel = function(l_1_arg0)
   local l_1_1 = queryObject("UIRoot")
   assert(l_1_1)
   local l_1_2 = nil
   if l_1_arg0 then
      l_1_2 = l_1_1:UI_GET_CHILD("persistent awards layout")
   else
      l_1_2 = l_1_1:UI_GET_CHILD("current awards layout")
   end
   assert(l_1_2)
   local l_1_3 = l_1_2:UI_GET_CHILD("ZTAwardPanel")
   assert(l_1_3)
   return l_1_3
end

test_for_empty_awards_panel = function()
   local l_2_0 = get_awards_panel()
   assert(l_2_0)
   local l_2_1 = l_2_0:UI_GET_CHILDREN()
   local l_2_2 = false
   if l_2_1 == nil or type(l_2_1) ~= "table" or table.getn(l_2_1) == 0 then
      l_2_2 = true
   end
   l_2_0 = get_awards_panel(true)
   l_2_1 = l_2_0:UI_GET_CHILDREN()
   if l_2_2 == true and (l_2_1 == nil or type(l_2_1) ~= "table" or table.getn(l_2_1) == 0) then
      return true
   end
   return false
end

create_award_group_graphics = function(l_3_arg0)
   if l_3_arg0.is_challenge_only ~= nil and l_3_arg0.is_challenge_only == true and isFreeform() == true then
      return 
   end
   local l_3_1 = queryObject("ZTStatus")
   if l_3_1 and l_3_1:ZT_GET_IS_CAMPAIGN() == true and l_3_arg0.persistent_awards == nil then
      return 
   end
   local l_3_2 = l_3_arg0.group_xml
   local l_3_3 = queryObject("UIRoot")
   assert(l_3_3)
   local l_3_4 = get_awards_panel(l_3_arg0.persistent_awards)
   if awards_gotten_on_panel[l_3_2] then
      local l_3_5 = awards_gotten_on_panel[l_3_2].group_icon_name
      if l_3_4:UI_GET_CHILD(l_3_5) then
         return 
      end
   end
   local l_3_5 = l_3_4:UI_LOAD_CHILD(l_3_2)
   local l_3_6 = l_3_5:UI_GET_NAME()
   if awards_gotten_on_panel[l_3_2] == nil then
      local l_3_7 = awards_gotten_on_panel
      local l_3_8
      l_3_7[l_3_2], l_3_8 = l_3_8, {group_icon_name = l_3_6}
      l_3_7 = table
      l_3_7 = l_3_7.getn
      l_3_8 = l_3_arg0
      l_3_7 = l_3_7(l_3_8)
      l_3_8 = awards_gotten_on_panel
      l_3_8 = l_3_8[l_3_2]
      l_3_8.numchildren = l_3_7
      l_3_8 = awards_gotten_on_panel
      l_3_8 = l_3_8[l_3_2]
      l_3_8.award = {}
      l_3_8 = 1
      for l_3_9 = l_3_8, l_3_7 do
         l_3_8 = l_3_8 - 1
         local l_3_11 = awards_gotten_on_panel[l_3_2].award
         local l_3_12
         l_3_11[l_3_8], l_3_12 = l_3_12, {earned = false, icon_name = l_3_arg0[l_3_8].icon_name}
      end
   end
   awards_gotten_on_panel[l_3_2].earnedCount = 0
   dehighlightNewAwards()
end

process_award_group = function(l_4_arg0, l_4_arg1)
   if l_4_arg1.is_challenge_only ~= nil and l_4_arg1.is_challenge_only == true and isFreeform() == true then
      return 
   end
   local l_4_2 = queryObject("ZTStatus")
   if l_4_2 and l_4_2:ZT_GET_IS_CAMPAIGN() == true and l_4_arg1.persistent_awards == nil then
      return 
   end
   local l_4_3 = l_4_arg1.group_xml
   for l_4_4 = 1, table.getn(l_4_arg1) do
      local l_4_7 = l_4_arg1[l_4_4].flag_name
      local l_4_8 = l_4_arg1.test_func
      local l_4_9 = l_4_arg1[l_4_4].args
      if l_4_arg0[l_4_7] == nil then
         if l_4_8(l_4_arg1, l_4_4) == true then
            l_4_arg0[l_4_7] = 1
            -- Tried to add an 'end' here but it's incorrect
            if not l_4_arg1.process_whole_group then
               do break end
            elseif awards_gotten_on_panel[l_4_3].award[l_4_4].earned == false then
               awards_set_received_graphics(l_4_arg1, l_4_4, false)
            end
            -- Tried to add an 'end' here but it's incorrect
         end
end

awards_update_bar = function(l_5_arg0, l_5_arg1, l_5_arg2, l_5_arg3, l_5_arg4)
   local l_5_5 = awards_gotten_on_panel[l_5_arg0].group_icon_name
   local l_5_6 = queryObject("UIRoot")
   assert(l_5_6, "no uimgr")
   local l_5_7 = l_5_6:UI_GET_CHILD(l_5_5)
   assert(l_5_7, "no group entry")
   local l_5_8 = l_5_7:UI_GET_CHILD("awardslist")
   assert(l_5_8, "no list box")
   local l_5_9 = l_5_8:UI_GET_CHILD(awards_gotten_on_panel[l_5_arg0].award[l_5_arg1].icon_name)
   assert(l_5_9, "we cannot get the icon for " .. l_5_arg0 .. ", " .. awards_gotten_on_panel[l_5_arg0].award[l_5_arg1].icon_name)
   local l_5_10 = l_5_9:UI_GET_CHILD("bar")
   l_5_10:UI_SHOW()
   local l_5_11 = l_5_9:UI_GET_CHILD("highlightbar")
   if l_5_11 then
      if brand_new_award then
         playSound("uicheck")
         l_5_11:UI_SHOW()
      else
         l_5_11:UI_HIDE()
      end
   end
   local l_5_12 = 0
   if l_5_arg4 then
      l_5_12 = l_5_arg4
   end
   local l_5_13 = 100 * ((l_5_arg2 - l_5_12) / (l_5_arg3 - l_5_12))
   if l_5_10 then
      local l_5_14, l_5_15 = l_5_10:UI_SET_SIZE, l_5_10
      local l_5_16
      l_5_14(l_5_15, l_5_16)
      l_5_16 = {x = l_5_13, y = 0}
   end
   brand_new_award = false
end

awards_update_group_bar = function(l_6_arg0, l_6_arg1)
   local l_6_2 = awards_gotten_on_panel[l_6_arg0].group_icon_name
   local l_6_3 = queryObject("UIRoot")
   local l_6_4 = l_6_3:UI_GET_CHILD(l_6_2)
   assert(l_6_4, "cannot get group_entry")
   if awards_gotten_on_panel[l_6_arg0].earnedCount == awards_gotten_on_panel[l_6_arg0].numchildren then
      local l_6_5 = l_6_4:UI_GET_CHILD("optional awards layout")
      if l_6_5 then
         local l_6_6 = l_6_5:UI_GET_CHILD("bar")
         local l_6_7, l_6_8 = l_6_6:UI_SET_SIZE, l_6_6
         local l_6_9
         l_6_7(l_6_8, l_6_9)
         l_6_9 = {x = 100, y = 0}
         l_6_7, l_6_8 = l_6_6:UI_SHOW, l_6_6
         l_6_7(l_6_8)
         l_6_7, l_6_8 = l_6_5:UI_GET_CHILD, l_6_5
         l_6_9 = "highlightbar"
         l_6_7 = l_6_7(l_6_8, l_6_9)
         if l_6_7 then
            l_6_8 = brand_new_award_group
            if l_6_8 then
               l_6_8, l_6_9 = l_6_7:UI_SHOW, l_6_7
               l_6_8(l_6_9)
            else
               l_6_8, l_6_9 = l_6_7:UI_HIDE, l_6_7
               l_6_8(l_6_9)
            end
         end
      end
   end
   brand_new_award_group = false
end

awards_set_received_graphics = function(l_7_arg0, l_7_arg1, l_7_arg2)
   local l_7_3 = false
   local l_7_4 = l_7_arg0.group_xml
   awards_gotten_on_panel[l_7_4].award[l_7_arg1].earned = true
   if l_7_arg2 then
      brand_new_award = true
      l_7_3 = true
   end
   local l_7_5 = awards_gotten_on_panel[l_7_4].group_icon_name
   local l_7_6 = queryObject("UIRoot")
   local l_7_7 = l_7_6:UI_GET_CHILD(l_7_5)
   assert(l_7_7, "cannot get group_entry")
   local l_7_8 = l_7_7:UI_GET_CHILD("awardslist")
   assert(l_7_8, "cannot get list_box")
   local l_7_9 = l_7_8:UI_GET_CHILD(l_7_arg0[l_7_arg1].icon_name)
   assert(l_7_9, "cannot get the_entry")
   l_7_9:UI_ENABLE()
   local l_7_10 = l_7_9:UI_GET_CHILD("pre")
   local l_7_11 = l_7_9:UI_GET_CHILD("post")
   if l_7_10 and l_7_11 then
      l_7_10:UI_HIDE()
      l_7_11:UI_SHOW()
   end
   local l_7_12 = get_awards_panel(l_7_arg0.persistent_awards)
   local l_7_13 = l_7_12:UI_GET_SCROLL("y")
   local l_7_14, l_7_15 = l_7_12:UI_SET_SCROLL, l_7_12
   local l_7_16
   l_7_14(l_7_15, l_7_16)
   l_7_16 = {x = 0, y = -l_7_13}
   l_7_14, l_7_15 = l_7_7:UI_GET_SRC_RECT, l_7_7
   l_7_14 = l_7_14(l_7_15)
   l_7_15, l_7_16 = l_7_12:UI_SET_SCROLL, l_7_12
   local l_7_17
   l_7_15(l_7_16, l_7_17)
   l_7_17 = {x = 0, y = -l_7_14.y}
   l_7_15 = awards_update_bar
   l_7_16 = l_7_4
   l_7_17 = l_7_arg1
   l_7_15(l_7_16, l_7_17, 1, 1)
   l_7_15 = awards_gotten_on_panel
   l_7_15 = l_7_15[l_7_4]
   l_7_16 = awards_gotten_on_panel
   l_7_16 = l_7_16[l_7_4]
   l_7_16 = l_7_16.earnedCount
   l_7_16 = l_7_16 + 1
   l_7_15.earnedCount = l_7_16
   l_7_15 = awards_gotten_on_panel
   l_7_15 = l_7_15[l_7_4]
   l_7_15 = l_7_15.earnedCount
   l_7_16 = awards_gotten_on_panel
   l_7_16 = l_7_16[l_7_4]
   l_7_16 = l_7_16.numchildren
   if l_7_15 == l_7_16 then
      l_7_15, l_7_16 = l_7_7:UI_GET_CHILD, l_7_7
      l_7_17 = "optional awards layout"
      l_7_15 = l_7_15(l_7_16, l_7_17)
      if l_7_15 then
         l_7_16, l_7_17 = l_7_15:UI_ENABLE, l_7_15
         l_7_16(l_7_17)
         l_7_16, l_7_17 = l_7_15:UI_GET_CHILD, l_7_15
         l_7_16 = l_7_16(l_7_17, "pre")
         --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

getAllAwardGroups = function()
   local l_8_0 = {}
   local l_8_1 = queryObject("BFScenarioMgr")
   if l_8_1 then
      local l_8_2 = l_8_1:BFS_GETALLCHALLENGES("scenario/scripts/awards/")
      for l_8_3 = 1, table.getn(l_8_2) do
         local l_8_6 = table.getn(l_8_0) + 1
         l_8_0[l_8_6] = l_8_2[l_8_3].value
      end
   end
   return l_8_0
end

award_scripts_cache = nil
checkawards = function(l_9_arg0)
   nextcheck = getglobalvar("challenge")
   if nextcheck ~= nil then
      BFLOG(SYSTRACE, "bailing out of awards...")
      return 0
   end
   local l_9_1 = queryObject("UIRoot")
   if l_9_1 then
      local l_9_2 = l_9_1:UI_GET_CHILD("Challenge Won Layout")
      if l_9_2 and isNormal(l_9_2) == true then
         BFLOG(SYSTRACE, "bailing out of awards...")
         return 0
      end
      local l_9_3 = l_9_1:UI_GET_CHILD("Challenge Failed Layout")
      if l_9_3 and isNormal(l_9_3) == true then
         BFLOG(SYSTRACE, "bailing out of awards...")
         return 0
      end
   end
   local l_9_2 = getAllAwardGroups()
   table.sort(l_9_2)
   local l_9_3 = queryObject("ZTMode")
   if l_9_3 then
      if not award_scripts_cache then
         award_scripts_cache = {}
         -- Tried to add an 'end' here but it's incorrect
         local l_9_4 = test_for_empty_awards_panel()
         if awards_gotten_on_panel == nil or l_9_4 then
            award_scripts_cache = {}
            awards_gotten_on_panel = {}
            timeslice_cur_index = nil
         end
         local l_9_5 = queryObject("ZTWorldMgr")
         if l_9_5 == nil then
            return 
         end
         TIMESLICE_INC = 2
         if timeslice_cur_index == nil then
            timeslice_cur_index = 0
            TIMESLICE_INC = table.getn(l_9_2)
         end
         for l_9_6 = 1, TIMESLICE_INC do
            timeslice_cur_index = timeslice_cur_index + 1
            timeslice_cur_index = math.mod(timeslice_cur_index - 1, table.getn(l_9_2)) + 1
            local l_9_9 = string.find(l_9_2[timeslice_cur_index], "template_")
            if l_9_9 == nil then
               if not award_scripts_cache[timeslice_cur_index] then
                  local l_9_10 = "scenario/scripts/awards/" .. l_9_2[timeslice_cur_index] .. ".lua"
                  if l_9_10 ~= nil then
                     if l_9_5:ZT_RETURN_SCRIPT_AS_STRING(l_9_10) == nil then
                        local l_9_11, l_9_11 = ""
                        -- Tried to add an 'end' here but it's incorrect
                        --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

dehighlightNewAwards = function()
   sendMessageToChildrenByName(getUI("awards tab layout"), "highlightbar", "UI_HIDE")
end


