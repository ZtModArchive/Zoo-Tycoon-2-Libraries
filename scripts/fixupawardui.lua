AWARD_DEBUGGING = false
verticallyCenter = function(l_1_arg0, l_1_arg1)
   if l_1_arg0 == nil or l_1_arg1 == nil then
      return 
   end
   parentRegion = l_1_arg0:UI_GET_SRC_RECT()
   childRegion = l_1_arg1:UI_GET_SRC_RECT()
   local l_1_2 = (parentRegion.h - childRegion.h) / 2
   local l_1_3, l_1_4 = l_1_arg1:UI_SET_POS, l_1_arg1
   local l_1_5
   l_1_3(l_1_4, l_1_5)
   l_1_5 = {x = childRegion.x, y = l_1_2}
end

fixupSingleAwardGroup = function(l_2_arg0)
   if l_2_arg0 == nil or type(l_2_arg0) ~= "table" then
      DEBUGLOG(SYSTRACE, "Problem with group passed into fixupSingleAward()")
      return 
   end
   local l_2_1 = l_2_arg0:UI_GET_CHILDREN()
   if l_2_1 == nil or type(l_2_1) ~= "table" then
      return 
   end
   local l_2_2 = table.getn(l_2_1)
   if l_2_2 ~= 2 then
      DEBUGLOG("Top level listbox on the award does not have 2 children!!! = " .. l_2_2 .. ".")
   end
   fixupAward(l_2_arg0, resolveTable(l_2_1[1].value))
end

fixupAward = function(l_3_arg0, l_3_arg1)
   if l_3_arg1 == nil or type(l_3_arg1) ~= "table" then
      DEBUGLOG(SYSTRACE, "Error with award list coming into fixupAwardLeftHalf()")
      return 
   end
   if l_3_arg0 == nil or type(l_3_arg0) ~= "table" then
      DEBUGLOG(SYSTRACE, "Error with parent component coming into fixupAwardLeftHalf()")
      return 
   end
   local l_3_2 = l_3_arg1:UI_GET_CHILDREN()
   if l_3_2 == nil or type(l_3_2) ~= "table" then
      DEBUGLOG(SYSTRACE, "Error getting award_list children in fixupAwardLeftHalf()")
      return 
   end
   local l_3_3 = nil
   local l_3_4 = table.getn(l_3_2)
   DEBUGLOG(SYSTRACE, "This group contains " .. l_3_4 .. " awards.")
   for l_3_5 = 1, l_3_4 do
      local l_3_8 = resolveTable(l_3_2[l_3_5].value)
      DEBUGLOG(SYSTRACE, "award_layout name: " .. l_3_8:UI_GET_NAME())
      local l_3_9 = l_3_8:UI_GET_CHILD("label")
      if l_3_9 == nil or type(l_3_9) ~= "table" then
         DEBUGLOG(SYSTRACE, "Error getting awardstext")
      else
         l_3_9:UI_AUTOSIZE_REGION()
         l_3_3 = l_3_9:UI_GET_SRC_RECT()
         DEBUGLOG(SYSTRACE, "Award text autosized. New Region is " .. l_3_3.x .. "," .. l_3_3.y .. " " .. l_3_3.w .. "x" .. l_3_3.h)
      end
      l_3_8:UI_AUTOSIZE_REGION()
      l_3_3 = l_3_8:UI_GET_SRC_RECT()
      l_3_3.w = l_3_3.w + 10
      local l_3_10, l_3_11 = l_3_8:UI_SET_SIZE, l_3_8
      local l_3_12 = {l_3_3.w, l_3_3.h}
      l_3_10(l_3_11, l_3_12)
      l_3_10 = DEBUGLOG
      l_3_11 = SYSTRACE
      l_3_12 = "Award layout's new region is "
      l_3_12 = l_3_12 .. l_3_3.x .. "," .. l_3_3.y .. " " .. l_3_3.w .. "x" .. l_3_3.h
      l_3_10(l_3_11, l_3_12)
      l_3_10, l_3_11 = l_3_8:UI_GET_CHILD, l_3_8
      l_3_12 = "image"
      l_3_10 = l_3_10(l_3_11, l_3_12)
      l_3_11 = verticallyCenter
      l_3_12 = l_3_8
      l_3_11(l_3_12, l_3_10)
   end
   l_3_arg1:UI_AUTOSIZE_REGION()
   local l_3_5 = l_3_arg1:UI_GET_SRC_RECT()
   local l_3_6, l_3_7 = l_3_arg0:UI_SET_SIZE, l_3_arg0
   local l_3_8
   l_3_6(l_3_7, l_3_8)
   l_3_8 = {x = 0, y = l_3_5.h}
end

fixupAwardRightHalf = function(l_4_arg0)
   if l_4_arg0 == nil then
      DEBUGLOG(SYSTRACE, "Error with award list coming into fixupAwardRightHalf()")
   end
   local l_4_1 = l_4_arg0:UI_GET_CHILD("optional awards layout")
   if l_4_1 == nil then
      return 
   end
   local l_4_2 = l_4_1:UI_GET_CHILD("label")
   if l_4_2 ~= nil then
      l_4_2:UI_AUTOSIZE_REGION()
   end
   l_4_1:UI_AUTOSIZE_REGION()
   verticallyCenter(l_4_1, l_4_2)
   verticallyCenter(l_4_1, l_4_1:UI_GET_CHILD("image"))
   verticallyCenter(l_4_arg0, l_4_1)
end

fixupAwardUI = function(l_5_arg0)
   if l_5_arg0 == nil then
      return 
   end
   local l_5_1 = queryObject("UIRoot")
   if l_5_1 == nil then
      DEBUGLOG(SYSTRACE("Error grasping UIRoot"))
      return 
   end
   local l_5_2 = l_5_1:UI_GET_CHILD(l_5_arg0)
   if l_5_2 == nil then
      DEBUGLOG(SYSTRACE, "Error grasping: " .. l_5_arg0)
      return 
   end
   local l_5_3 = l_5_2:UI_GET_CHILD("ZTAwardPanel")
   if l_5_3 == nil then
      DEBUGLOG(SYSTRACE, "Error grasping ZTAwardPanel")
   end
   local l_5_4 = l_5_3:UI_GET_CHILDREN()
   if l_5_4 == nil or type(l_5_4) ~= "table" then
      return 
   end
   local l_5_5 = table.getn(l_5_4)
   DEBUGLOG(SYSTRACE, "Number of awards in panel: " .. l_5_5)
   for l_5_6 = 1, l_5_5 do
      local l_5_9 = resolveTable(l_5_4[l_5_6].value)
      if l_5_9 ~= nil then
         DEBUGLOG(SYSTRACE, "child resolved successfully.")
         DEBUGLOG(SYSTRACE, "name: " .. l_5_9:UI_GET_NAME())
         fixupSingleAwardGroup(l_5_9)
      else
         DEBUGLOG(SYSTRACE, "Problem resolving child")
      end
      fixupAwardRightHalf(l_5_9)
   end
end

run = function()
   DEBUGLOG(SYSTRACE, "-------------------------------------------------")
   DEBUGLOG(SYSTRACE, "fixupAwardUI.lua start")
   DEBUGLOG(SYSTRACE, "-------------------------------------------------")
   fixupAwardUI("persistent awards layout")
   fixupAwardUI("current awards layout")
   DEBUGLOG(SYSTRACE, "-------------------------------------------------")
   DEBUGLOG(SYSTRACE, "fixupAwardUI.lua end")
   DEBUGLOG(SYSTRACE, "-------------------------------------------------")
end

DEBUGLOG = function(l_7_arg0, l_7_arg1)
   if AWARD_DEBUGGING then
      BFLOG(l_7_arg0, l_7_arg1)
   end
end


