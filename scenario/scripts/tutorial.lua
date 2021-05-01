include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
completionSound = "photo_challenges_completed"
ringLayout = "tutorial ring"
tutorialPanelName = "tutorial info"
local l_0_0
defaultPanelPosition, l_0_0 = l_0_0, {x = 25, y = 125}
defaultPanelSize, l_0_0 = l_0_0, {x = 250, y = 172}
l_0_0 = 0
ruleinitialized = l_0_0
l_0_0 = nil
completionText = l_0_0
l_0_0 = nil
completionTextPosition = l_0_0
l_0_0 = nil
initData = l_0_0
l_0_0 = nil
chaseComponent = l_0_0
l_0_0 = 0
ringStartTime = l_0_0
l_0_0 = function(l_1_arg0)
   local l_1_1 = nil
   local l_1_2 = queryObject("UIRoot")
   if l_1_2 and l_1_arg0 then
      local l_1_3 = table.getn(l_1_arg0)
      for l_1_4 = 1, l_1_3 do
         if l_1_1 == nil then
            l_1_1 = l_1_2:UI_GET_CHILD(l_1_arg0[l_1_4])
         else
            l_1_1 = l_1_1:UI_GET_CHILD(l_1_arg0[l_1_4])
         end
      end
   end
   return l_1_1
end

getComponent = l_0_0
l_0_0 = function(l_2_arg0)
   initData = l_2_arg0
   completionText = l_2_arg0.completion
   completionTextPosition = l_2_arg0.completiontextposition
   local l_2_1 = queryObject("ZTStatus")
   if l_2_1 then
      l_2_1:ZT_SET_TUTORIALRULE_ACTIVE(true)
   end
   if l_2_arg0.heading then
      showTutorialHeading(l_2_arg0.heading)
   end
   local l_2_2 = defaultPanelSize.y
   if l_2_arg0.body then
      local l_2_3 = getComponent
      local l_2_4 = {"tutorial info", "tutorial text"}
      l_2_3 = l_2_3(l_2_4)
      if l_2_3 ~= nil then
         l_2_4(l_2_3, l_2_arg0.body)
         l_2_4 = l_2_3:UI_SET_LOCID
         --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

initTutorialRuleInfo = l_0_0
l_0_0 = function()
   local l_3_0 = queryObject("UIRoot")
   if l_3_0 then
      local l_3_1 = l_3_0:UI_GET_CHILD("primary goals tab")
      if l_3_1 then
         l_3_1:UI_REPRESS()
         l_3_1:UI_ACTIVATE_ON()
      end
   end
   local l_3_1 = queryObject("ZTStatus")
   if l_3_1 then
      l_3_1:ZT_SET_TUTORIALRULE_ACTIVE(false)
   end
   ruleinitialized = 0
   playSound(completionSound)
   if l_3_0 then
      local l_3_2 = l_3_0:UI_GET_CHILD(tutorialPanelName)
      if l_3_2 then
         l_3_2:UI_HIDE()
         l_3_2:UI_WIND_ANIMATION()
      end
   end
end

tutorialgoalcompleted = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      local l_4_0 = defaultPanelSize.y
      local l_4_1 = getComponent
      local l_4_2 = {"tutorial info", "tutorial text"}
      l_4_1 = l_4_1(l_4_2)
      if l_4_1 ~= nil then
         l_4_2(l_4_1, completionText)
         l_4_2 = l_4_1:UI_SET_LOCID
         --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

showcompletiontext = l_0_0
l_0_0 = function()
   ruleinitialized = 0
   local l_5_0 = queryObject("UIRoot")
   if l_5_0 then
      local l_5_1 = l_5_0:UI_GET_CHILD(tutorialPanelName)
      if l_5_1 ~= nil then
         l_5_1:UI_HIDE()
         l_5_1:UI_WIND_ANIMATION()
      end
   end
   return 1
end

showcompletiontextsuccess = l_0_0
l_0_0 = function(l_6_arg0)
   return 1
end

blinktutorialring = l_0_0
l_0_0 = function()
   local l_7_0 = queryObject("UIRoot")
   if l_7_0 == nil then
      return 
   end
   local l_7_1 = l_7_0:UI_GET_CHILD(ringLayout)
   if l_7_1 == nil then
      return 
   end
   local l_7_2 = queryObject("ZTWorldMgr")
   if l_7_2 ~= nil then
      ringStartTime = l_7_2:ZT_GET_REAL_TIME()
   end
   if initData.ring ~= nil and initData.ringsize ~= nil then
      l_7_1:UI_SHOW()
      local l_7_3 = getComponent
      local l_7_4 = {"tutorial layout", "ring timer"}
      l_7_3 = l_7_3(l_7_4)
      if l_7_3 ~= nil then
         l_7_4(l_7_3)
         l_7_4 = l_7_3:UI_ACTIVATE_ON
      end
      l_7_4 = initData
      l_7_4 = l_7_4.ring
      l_7_4 = l_7_4.x
      if l_7_4 ~= nil then
         l_7_4 = initData
         l_7_4 = l_7_4.ring
         l_7_4 = l_7_4.y
         if l_7_4 ~= nil then
            l_7_4 = getComponent
            l_7_4 = l_7_4(initData.ringtracker)
            chaseComponent = l_7_4
      end
      l_7_4 = getComponent
      l_7_4 = l_7_4(initData.ring)
      chaseComponent = l_7_4
   else
      l_7_1:UI_HIDE()
   end
   local l_7_3 = l_7_1:UI_GET_CHILDREN()
   local l_7_4 = table.getn(l_7_3)
   for l_7_5 = 1, l_7_4 do
      local l_7_8 = resolveTable(l_7_3[l_7_5].value)
      if l_7_8 ~= nil then
         local l_7_9, l_7_10 = l_7_8:UI_SET_POS, l_7_8
         local l_7_11
         l_7_9(l_7_10, l_7_11)
         l_7_11 = {x = -500, y = 0}
      end
   end
end

initializeTutorialRing = l_0_0
l_0_0 = function()
   local l_8_0 = queryObject("ZTWorldMgr")
   if initData == nil or l_8_0 == nil then
      return 
   end
   local l_8_1 = l_8_0:ZT_GET_REAL_TIME() - ringStartTime
   local l_8_2
   local l_8_3 = nil
   if initData.ringsize ~= nil then
      local l_8_4
      l_8_3, l_8_4 = l_8_4, {w = initData.ringsize.w, h = initData.ringsize.h}
   end
   if l_8_3 == nil then
      return 
   end
   if initData.ring.x ~= nil then
      l_8_2 = {x = 0, y = 0, x = initData.ring.x + l_8_3.w / 2, y = initData.ring.y + l_8_3.h / 2}
   elseif chaseComponent == nil then
      return 
   end
   do
      local l_8_4 = chaseComponent:UI_GET_SCREEN_RECT()
      if l_8_4 == nil and initData.ring ~= nil and initData.ringsize ~= nil then
         initializeTutorialRing()
         return 
      end
      l_8_2.x = l_8_4.x + l_8_4.w / 2
      l_8_2.y = l_8_4.y + l_8_4.h / 2
   end
   local l_8_4 = getComponent
   local l_8_5 = {"tutorial ring"}
   l_8_4 = l_8_4(l_8_5)
   if l_8_4 == nil then
      return 
   end
   l_8_5 = chaseComponent
   if l_8_5 ~= nil then
      l_8_5 = chaseComponent
      --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

updateTutorialRing = l_0_0
l_0_0 = function()
   local l_9_0 = getComponent
   local l_9_1 = {"tutorial layout", "tutorial info"}
   l_9_0 = l_9_0(l_9_1)
   if l_9_0 == nil then
      return 
   end
   --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

dumpPanelPosition = l_0_0
l_0_0 = function(l_10_arg0, l_10_arg1)
   local l_10_2 = getComponent(l_10_arg0)
   if l_10_2 == nil then
      return 
   end
   if l_10_2:UI_IS_ALTERNATE() == true then
      return 
   end
   l_10_2:UI_ACTIVATE_ON()
   if l_10_arg1 ~= true then
      return 
   end
   local l_10_3 = queryObject("ZTMode")
   if l_10_3 == nil then
      return 
   end
   l_10_3:ZT_SETMODE("mode_selection")
   local l_10_4 = getComponent
   local l_10_5 = {"Buy Area"}
   l_10_4 = l_10_4(l_10_5)
   if l_10_4 == nil then
      return 
   end
   l_10_5 = {"Fence Typelist", "Transportation Typelist", "Path Typelist", "Elevated Path Typelist", "Elevated Curb Typelist", "Biome", "Terrain Deformation", "Rock Typelist", "Tree Typelist", "Plant Typelist", "Staff Typelist", "Animal Typelist", "ZTAdoptionPanel", "Enrichment Typelist", "Food Typelist", "Shelters Typelist", "Building Typelist", "Scenery Typelist"}
   local l_10_6 = table.getn(l_10_5)
   for l_10_7 = 1, l_10_6 do
      l_10_2 = l_10_4:UI_GET_CHILD(l_10_5[l_10_7])
      if l_10_2 ~= nil then
         l_10_2:UI_ACTIVATE_OFF()
      end
   end
end

verifyButton = l_0_0
l_0_0 = function(l_11_arg0, l_11_arg1)
   local l_11_2 = getComponent(l_11_arg0)
   if isVisible(l_11_2) then
      return 
   end
   l_11_2 = getComponent(l_11_arg1)
   if l_11_2 == nil then
      return 
   end
   l_11_2:UI_ACTIVATE()
end

verifyPanelVisible = l_0_0
l_0_0 = function(l_12_arg0, l_12_arg1)
   if isVisibleByName(l_12_arg1) and isEntityKindOf(getSelectedEntity(), l_12_arg0) then
      return 
   end
   local l_12_2 = findType(l_12_arg0)
   if l_12_2 == nil or table.getn(l_12_2) <= 0 then
      return 
   end
   local l_12_3 = queryObject("ZTMode")
   if l_12_3 == nil then
      return 
   end
   l_12_3:sendMessage("ZT_SET_SELECTED_ENTITY", resolveTable(l_12_2[1].value))
end

verifyEntitySelected = l_0_0
l_0_0 = function()
   local l_13_0 = getComponent
   local l_13_1 = {"tutorial layout"}
   l_13_0 = l_13_0(l_13_1)
   if l_13_0 == nil then
      return 
   end
   l_13_1(l_13_0)
   l_13_1 = l_13_0:UI_MOVE_TO_FRONT
end

moveTutorialPanelToFront = l_0_0

