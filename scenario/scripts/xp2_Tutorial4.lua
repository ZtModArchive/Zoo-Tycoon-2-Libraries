include("scenario/scripts/tutorial.lua")
include("scenario/scripts/Shows.lua")
local l_0_0
local l_0_1
l_0_1 = {rulename = nil, panelPosition = nil, heading = "Tutoriallabels:xp2_T4", body = nil, completion = "xp2_tutorial4:welcome", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:showIntroHeading", body = "xp2_tutorial4:showIntro", completion = "xp2_tutorial4:showIntroCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
local l_0_2 = {"construction"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:openConstructionPanelHeading", body = "xp2_tutorial4:openConstructionPanel", completion = "xp2_tutorial4:openConstructionPanelCompleted", image = "construction", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Show Objects"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:openShowObjectsHeading", body = "xp2_tutorial4:openShowObjects", completion = "xp2_tutorial4:openShowObjectsCompleted", completiontextposition = nil, image = "ShowObjects", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"ShowPlatform_mm"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:placeShowPlatformHeading", body = "xp2_tutorial4:placeShowPlatform", completion = "xp2_tutorial4:placeShowPlatformCompleted", completiontextposition = nil, image = "showplatform", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"tankuiportal"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:placeDolphinPortalHeading", body = "xp2_tutorial4:placeDolphinPortal", completion = "xp2_tutorial4:placeDolphinPortalCompleted", completiontextposition = nil, image = "showportal", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Show Objects Layout", "Grandstand_III_mm"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:placeGrandstandHeading", body = "xp2_tutorial4:placeGrandstand", completion = "xp2_tutorial4:placeGrandstandCompleted", completiontextposition = nil, image = "grandstand3", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:selectShowPlatformHeading", body = "xp2_tutorial4:selectShowPlatform", completion = "xp2_tutorial4:selectShowPlatformCompleted", completiontextposition = nil, image = "showplatform", ring = nil, ringsize = nil}
l_0_2 = {"Show Info", "new"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:createShowHeading", body = "xp2_tutorial4:createShow", completion = "xp2_tutorial4:createShowCompleted", completiontextposition = nil, image = "newshow", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {x = 50, y = 565}
l_0_2 = {w = 110, h = 75}
l_0_2 = {"mixer layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:chooseAnimalOneHeading", body = "xp2_tutorial4:chooseAnimalOne", completion = "xp2_tutorial4:chooseAnimalOneCompleted", completiontextposition = nil, image = "addanimal", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_2 = {x = 50, y = 630}
l_0_2 = {w = 110, h = 75}
l_0_2 = {"mixer layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:chooseAnimalTwoHeading", body = "xp2_tutorial4:chooseAnimalTwo", completion = "xp2_tutorial4:chooseAnimalTwoCompleted", completiontextposition = nil, image = "addanimal", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_2 = {x = 196, y = 565}
l_0_2 = {w = 75, h = 75}
l_0_2 = {"mixer layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:assignAnimalOneTrickOneHeading", body = "xp2_tutorial4:assignAnimalOneTrickOne", completion = "xp2_tutorial4:assignAnimalOneTrickOneCompleted", completiontextposition = nil, image = "addtrick", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_2 = {x = 196, y = 630}
l_0_2 = {w = 75, h = 75}
l_0_2 = {"mixer layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:assignAnimalTwoTrickHeading", body = "xp2_tutorial4:assignAnimalTwoTrick", completion = "xp2_tutorial4:assignAnimalTwoTrickCompleted", completiontextposition = nil, image = "addtrick", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_2 = {x = 261, y = 565}
l_0_2 = {w = 75, h = 75}
l_0_2 = {"mixer layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:assignAnimalOneTrickTwoHeading", body = "xp2_tutorial4:assignAnimalOneTrickTwo", completion = "xp2_tutorial4:assignAnimalOneTrickTwoCompleted", completiontextposition = nil, image = "addtrick", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_2 = {"mixer layout", "accept"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:saveShowHeading", body = "xp2_tutorial4:saveShow", completion = "xp2_tutorial4:saveShowCompleted", completiontextposition = nil, image = "saveshow", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Show Manager Panel", "show mixer manager", "insert break"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial4:insertBreakHeading", body = "xp2_tutorial4:insertBreak", completion = "xp2_tutorial4:insertBreakCompleted", completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {x = 750, y = 110}
l_0_2 = {"ShowEnabled"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = l_0_2, heading = "xp2_tutorial4:disableShowHeading", body = "xp2_tutorial4:disableShow", completion = "xp2_tutorial4:disableShowCompleted", completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
ruledata, l_0_0 = l_0_0, {welcome = l_0_1, showIntro = l_0_1, openConstructionPanel = l_0_1, openShowObjects = l_0_1, placeShowPlatform = l_0_1, placeDolphinPortal = l_0_1, placeGrandstand = l_0_1, selectShowPlatform = l_0_1, createShow = l_0_1, chooseAnimalOne = l_0_1, chooseAnimalTwo = l_0_1, assignAnimalOneTrickOne = l_0_1, assignAnimalTwoTrick = l_0_1, assignAnimalOneTrickTwo = l_0_1, saveShow = l_0_1, insertBreak = l_0_1, disableShow = l_0_1}
l_0_0 = function(l_1_arg0)
   if disablexp2_tutorial1UIelements ~= nil then
      return 0
   end
   local l_1_1 = countType("frontgate_df")
   if l_1_1 <= 0 then
      return 0
   end
   local l_1_2 = queryObject("BFScenarioMgr")
   if l_1_2 == nil then
      return 0
   end
   l_1_2:BFS_ADD_SCENARIO_OBJECT("ShowPlatform_mm")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("Grandstand_III_mm")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("tankuiportal")
   setMaxFame(100)
   l_1_2:UI_DISABLE("Camera Set")
   l_1_2:UI_HIDE("firstperson")
   l_1_2:UI_HIDE("photo")
   l_1_2:UI_DISABLE("View filter layout")
   l_1_2:UI_DISABLE("building button")
   l_1_2:UI_DISABLE("foliage button")
   l_1_2:UI_DISABLE("Guest Multilist Tab")
   l_1_2:UI_DISABLE("Staff Multilist Tab")
   l_1_2:UI_DISABLE("Vehicle Multilist Tab")
   l_1_2:UI_DISABLE("multi list animal filters")
   l_1_2:UI_DISABLE("undo")
   l_1_2:UI_DISABLE(" filter_maximize")
   l_1_2:UI_DISABLE("Buy Animal Tab")
   l_1_2:UI_DISABLE("Adopt Animal Tab")
   l_1_2:UI_DISABLE("open zoo toggle button")
   l_1_2:UI_DISABLE("Primary Game Button Pointers")
   l_1_2:UI_DISABLE("Main Game Buttons")
   l_1_2:UI_DISABLE("Selection Buttons")
   l_1_2:UI_DISABLE("multinfo button")
   l_1_2:UI_DISABLE("Zoofinance")
   l_1_2:UI_DISABLE("undo")
   l_1_2:UI_DISABLE("Photo Album")
   l_1_2:UI_DISABLE("delete")
   l_1_2:UI_DISABLE("Buy Area Container")
   l_1_2:UI_DISABLE("minimize")
   l_1_2:UI_DISABLE("awards")
   l_1_2:UI_DISABLE("scenariogoals")
   l_1_2:UI_DISABLE("Animal Info ToggleSet")
   l_1_2:UI_DISABLE("PickUp")
   l_1_2:UI_DISABLE("put up for adoption")
   l_1_2:UI_DISABLE("in game sort button")
   l_1_2:UI_DISABLE("elevated path lower")
   l_1_2:UI_DISABLE("elevated path raise")
   l_1_2:UI_DISABLE("Elevated Path Placement Method")
   l_1_2:UI_DISABLE("firstperson")
   l_1_2:UI_DISABLE("photo")
   l_1_2:UI_DISABLE("TextButton Save")
   l_1_2:UI_DISABLE("TextButton Save Hover")
   l_1_2:UI_DISABLE("TextButton Load")
   l_1_2:UI_DISABLE("TextButton Load Hover")
   l_1_2:UI_HIDE("exit with save option")
   l_1_2:UI_SHOW("exit no save option")
   l_1_2:UI_HIDE("release to wild")
   l_1_2:UI_HIDE("crate")
   disablexp2_tutorial1UIelements = 1
   local l_1_3 = queryObject("UIRoot")
   if l_1_3 ~= nil then
      local l_1_4 = l_1_3:UI_GET_CHILD("Fence Tab")
      if l_1_4 ~= nil then
         l_1_4:UI_ACTIVATE_ON()
      end
      local l_1_5 = l_1_3:UI_GET_CHILD("terraform")
      if l_1_5 then
         l_1_5:UI_ACTIVATE_OFF()
      end
      if l_1_3:UI_GET_CHILD("biome") ~= nil then
         l_1_3:UI_GET_CHILD("biome"):UI_ACTIVATE_ON()
      end
   end
   if queryObject("ZTMode") then
      queryObject("ZTMode"):sendMessage("ZT_SETMODE", "mode_biome")
      --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

setinitialtutorialstate = l_0_0
l_0_0 = function()
   initTutorialRuleInfo(ruledata.welcome)
   return 1
end

welcome = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

welcomeSuccess = l_0_0
l_0_0 = function()
   initTutorialRuleInfo(ruledata.showIntro)
   return 1
end

intro = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

introSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openConstructionPanel)
      local l_6_0 = getComponent
      local l_6_1 = {"Main Game Buttons", "construction"}
      l_6_0 = l_6_0(l_6_1)
      if l_6_0 ~= nil then
         l_6_1(l_6_0, "construction")
         l_6_1 = l_6_0:UI_ENABLE
      end
   end
   if isAlternateByName("construction") then
      return 1
   end
   return 0
end

openConstructionPanel = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_7_0 = queryObject("ZTMode")
   if l_7_0 ~= nil then
      l_7_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

openConstructionPanelSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openShowObjects)
      UIenable("Show Objects")
   end
   local l_8_0 = getComponent
   local l_8_1 = {"Show Objects Layout", "Grandstand_III_mm"}
   l_8_0 = l_8_0(l_8_1)
   if l_8_0 ~= nil then
      l_8_1(l_8_0)
      l_8_1 = l_8_0:UI_DISABLE
   end
   l_8_1 = getComponent
   local l_8_2 = {"Show Objects Layout", "Water_Filter"}
   l_8_1 = l_8_1(l_8_2)
   l_8_0 = l_8_1
   if l_8_0 ~= nil then
      l_8_1, l_8_2 = l_8_0:UI_DISABLE, l_8_0
      l_8_1(l_8_2)
   end
   l_8_1 = unlockEntity
   l_8_2 = "Grandstand_III_mm"
   l_8_1(l_8_2)
   l_8_1 = unlockEntity
   l_8_2 = "Water_Filter"
   l_8_1(l_8_2)
   l_8_1 = UIdisable
   l_8_2 = "ShowPlatform_mm"
   l_8_1(l_8_2)
   l_8_1 = UIdisable
   l_8_2 = "Grandstand_III_mm"
   l_8_1(l_8_2)
   l_8_1 = UIdisable
   l_8_2 = "tankuiportal"
   l_8_1(l_8_2)
   l_8_1 = isAlternateByName
   l_8_2 = "Show Objects"
   l_8_1 = l_8_1(l_8_2)
   l_8_2 = true
   if l_8_1 == l_8_2 then
      l_8_1 = 1
      return l_8_1
   end
   l_8_1 = verifyButton
   l_8_2 = {"Primary Game Button Panel", "construction"}
   l_8_1(l_8_2, true)
   l_8_1 = 0
   return l_8_1
end

openShowObjects = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_9_0 = queryObject("ZTMode")
   if l_9_0 ~= nil then
      l_9_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

openShowObjectsSuccess = l_0_0
l_0_0 = function(l_10_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeShowPlatform)
      l_10_arg0.placeShowPlatformCount = countType("ShowPlatform_mm")
      UIenable("ShowPlatform_mm")
   end
   local l_10_1 = verifyButton
   local l_10_2 = {"Main Game Buttons", "construction"}
   l_10_1(l_10_2, true)
   l_10_1 = countType
   l_10_2 = "ShowPlatform_mm"
   l_10_1 = l_10_1(l_10_2)
   l_10_2 = getComponent
   local l_10_3 = {"Show Objects Layout", "Grandstand_III_mm"}
   l_10_2 = l_10_2(l_10_3)
   if l_10_2 ~= nil then
      l_10_3(l_10_2)
      l_10_3 = l_10_2:UI_DISABLE
   end
   l_10_3 = getComponent
   local l_10_4 = {"Show Objects Layout", "Water_Filter"}
   l_10_3 = l_10_3(l_10_4)
   l_10_2 = l_10_3
   if l_10_2 ~= nil then
      l_10_3, l_10_4 = l_10_2:UI_DISABLE, l_10_2
      l_10_3(l_10_4)
   end
   l_10_3 = l_10_arg0.placeShowPlatformCount
   if l_10_3 < l_10_1 then
      l_10_3 = 1
      return l_10_3
   end
   l_10_3 = queryObject
   l_10_4 = "ZTMode"
   l_10_3 = l_10_3(l_10_4)
   if l_10_3 ~= nil then
      l_10_4(l_10_3, "ZT_SETMODE", "mode_placement")
      l_10_4 = l_10_3:sendMessage
      --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

placeShowPlatform = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

placeShowPlatformSuccess = l_0_0
l_0_0 = function(l_12_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeDolphinPortal)
      l_12_arg0.placeTankPortalCount = countType("tankportalsegment")
   end
   UIdisable("ShowPlatform_mm")
   local l_12_1 = getComponent
   local l_12_2 = {"Show Objects Layout", "Grandstand_III_mm"}
   l_12_1 = l_12_1(l_12_2)
   if l_12_1 ~= nil then
      l_12_2(l_12_1)
      l_12_2 = l_12_1:UI_DISABLE
   end
   l_12_2 = getComponent
   local l_12_3 = {"Show Objects Layout", "Water_Filter"}
   l_12_2 = l_12_2(l_12_3)
   l_12_1 = l_12_2
   if l_12_1 ~= nil then
      l_12_2, l_12_3 = l_12_1:UI_DISABLE, l_12_1
      l_12_2(l_12_3)
   end
   l_12_2 = verifyButton
   l_12_3 = {"Main Game Buttons", "construction"}
   l_12_2(l_12_3, true)
   l_12_2 = countType
   l_12_3 = "tankportalsegment"
   l_12_2 = l_12_2(l_12_3)
   l_12_3 = l_12_arg0.placeTankPortalCount
   if l_12_3 < l_12_2 then
      l_12_3 = getAvailableShowAnimals
      l_12_3 = l_12_3()
      if l_12_3 >= 2 then
         l_12_3 = 1
         return l_12_3
      end
   end
   l_12_3 = queryObject
   l_12_3 = l_12_3("ZTMode")
   if l_12_3 ~= nil then
      l_12_3:sendMessage("ZT_SETMODE", "mode_fence_placement")
      if l_12_3:sendMessage("ZT_IS_TYPE_ON_CURSOR", "tankseg_portal_mm") == false then
         l_12_3:sendMessage("ZT_SETMODE", "mode_fence_placement")
         l_12_3:sendMessage("ZT_SETFENCEPLACEMENTMODE", "gate")
         l_12_3:sendMessage("ZT_SETPLACEMENTFENCE", "tankseg_portal_mm")
      end
   end
   return 0
end

placeDolphinPortal = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_13_0 = queryObject("ZTMode")
   if l_13_0 ~= nil then
      l_13_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIdisable("ShowPlatform_mm")
   unlockEntity("Grandstand_III_mm")
   UIdisable("tankuiportal")
   return 1
end

placeDolphinPortalSuccess = l_0_0
l_0_0 = function(l_14_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeGrandstand)
      l_14_arg0.placeGrandstandCount = countType("Grandstand_III_mm")
      local l_14_1 = getComponent
      l_14_1 = l_14_1({"Show Objects Layout", "Grandstand_III_mm"})
      if l_14_1 ~= nil then
         l_14_1:UI_ENABLE()
      end
   end
   UIdisable("ShowPlatform_mm")
   local l_14_1 = getComponent
   local l_14_2 = {"Show Objects Layout", "Water_Filter"}
   l_14_1 = l_14_1(l_14_2)
   if l_14_1 ~= nil then
      l_14_2(l_14_1)
      l_14_2 = l_14_1:UI_DISABLE
   end
   l_14_2 = verifyButton
   local l_14_3 = {"Main Game Buttons", "construction"}
   l_14_2(l_14_3, true)
   l_14_2 = countType
   l_14_3 = "Grandstand_III_mm"
   l_14_2 = l_14_2(l_14_3)
   l_14_3 = l_14_arg0.placeGrandstandCount
   if l_14_3 < l_14_2 then
      l_14_3 = findType
      l_14_3 = l_14_3("Grandstand_III_mm")
      if l_14_3 ~= nil then
         for l_14_4 = 1, table.getn(l_14_3) do
            if resolveTable(l_14_3[l_14_4].value) then
               BFLOG("Facing X:" .. resolveTable(l_14_3[l_14_4].value):BFG_GET_ENTITY_FACING_DIRECTION().x .. " Y:" .. resolveTable(l_14_3[l_14_4].value):BFG_GET_ENTITY_FACING_DIRECTION().y .. " Z:" .. resolveTable(l_14_3[l_14_4].value):BFG_GET_ENTITY_FACING_DIRECTION().z)
               if resolveTable(l_14_3[l_14_4].value):BFG_GET_ENTITY_FACING_DIRECTION().x == 0 and resolveTable(l_14_3[l_14_4].value):BFG_GET_ENTITY_FACING_DIRECTION().y == 1 and resolveTable(l_14_3[l_14_4].value):BFG_GET_ENTITY_FACING_DIRECTION().z == 0 then
                  return 1
               end
            end
         end
      end
   end
   if l_14_2 > 0 then
      l_14_3 = queryObject
      l_14_3 = l_14_3("UIRoot")
      local l_14_4 = getComponent
      l_14_5 = {"tutorial layout", "tutorial info"}
      l_14_4 = l_14_4(l_14_5)
      if l_14_4 ~= nil then
         l_14_5(l_14_4)
         l_14_5 = l_14_4:UI_HIDE
         l_14_5(l_14_4)
         l_14_5 = l_14_4:UI_WIND_ANIMATION
      end
      l_14_5 = initTutorialRuleInfo
      l_14_5(ruledata.placeGrandstand)
      --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

placeGrandstand = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_15_0 = getComponent
   local l_15_1 = {"construction"}
   l_15_0 = l_15_0(l_15_1)
   if l_15_0 ~= nil then
      l_15_1(l_15_0)
      l_15_1 = l_15_0:UI_ACTIVATE_OFF
      l_15_1(l_15_0)
      l_15_1 = l_15_0:UI_DISABLE
   end
   l_15_1 = queryObject
   l_15_1 = l_15_1("ZTMode")
   if l_15_1 ~= nil then
      l_15_1:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIdisable("ShowPlatform_mm")
   UIdisable("Grandstand_III_mm")
   UIdisable("tankuiportal")
   return 1
end

placeGrandstandSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectShowPlatform)
      disableEyedropper()
   end
   UIdisable("edit")
   local l_16_0 = getComponent
   local l_16_1 = {"show mixer manager", "delete"}
   l_16_0 = l_16_0(l_16_1)
   if l_16_0 ~= nil then
      l_16_1(l_16_0)
      l_16_1 = l_16_0:UI_DISABLE
   end
   l_16_1 = getComponent
   local l_16_2 = {"Scenery Info", "Ride in"}
   l_16_1 = l_16_1(l_16_2)
   l_16_0 = l_16_1
   if l_16_0 ~= nil then
      l_16_1, l_16_2 = l_16_0:UI_DISABLE, l_16_0
      l_16_1(l_16_2)
      l_16_1 = BFLOG
      l_16_2 = "Disable ride in button"
      l_16_1(l_16_2)
   end
   l_16_1 = UIdisable
   l_16_2 = "move up"
   l_16_1(l_16_2)
   l_16_1 = UIdisable
   l_16_2 = "move down"
   l_16_1(l_16_2)
   l_16_1 = UIdisable
   l_16_2 = "insert break"
   l_16_1(l_16_2)
   l_16_1 = UIdisable
   l_16_2 = "zoopedia link"
   l_16_1(l_16_2)
   l_16_1 = UIdisable
   l_16_2 = "Show Info ToggleSet"
   l_16_1(l_16_2)
   l_16_1 = UIdisable
   l_16_2 = "ShowEnabled"
   l_16_1(l_16_2)
   l_16_1 = UIdisable
   l_16_2 = "Show Info"
   l_16_1(l_16_2, "Sell")
   l_16_1 = UIdisable
   l_16_2 = "purchase upgrades"
   l_16_1(l_16_2)
   l_16_1 = getSelectedEntity
   l_16_1 = l_16_1()
   if l_16_1 ~= nil then
      l_16_2 = isEntityKindOf
      l_16_2 = l_16_2(l_16_1, "ShowPlatform_mm")
      if l_16_2 then
         l_16_2 = 1
         return l_16_2
      end
   end
   l_16_2 = 0
   return l_16_2
end

selectShowPlatform = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectShowPlatformSuccess = l_0_0
l_0_0 = function(l_18_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.createShow)
      UIenable("new")
      local l_18_1 = getComponent
      l_18_1 = l_18_1({"cancel_edit_show_confirmation", "continue"})
      if l_18_1 ~= nil then
         l_18_1:UI_DISABLE()
      end
      l_18_1 = getComponent({"show_platform_confirmation", "continue"})
      if l_18_1 ~= nil then
         l_18_1:UI_DISABLE()
      end
      l_18_1 = getComponent({"delete_show_confirmation", "continue"})
      if l_18_1 ~= nil then
         l_18_1:UI_DISABLE()
      end
   end
   if isVisibleByName("mixer layout") == true then
      return 1
   end
   local l_18_1 = getComponent
   local l_18_2 = {"show mixer manager", "delete"}
   l_18_1 = l_18_1(l_18_2)
   if l_18_1 ~= nil then
      l_18_2(l_18_1)
      l_18_2 = l_18_1:UI_DISABLE
   end
   l_18_2 = UIdisable
   l_18_2("move up")
   l_18_2 = UIdisable
   l_18_2("move down")
   l_18_2 = UIdisable
   l_18_2("insert break")
   l_18_2 = UIdisable
   l_18_2("ShowEnabled")
   l_18_2 = UIdisable
   l_18_2("zoopedia link")
   l_18_2 = UIdisable
   l_18_2("Show Info ToggleSet")
   l_18_2 = UIdisable
   l_18_2("purchase upgrades")
   l_18_2 = verifyEntitySelected
   l_18_2("ShowPlatform_mm", "Show Info")
   l_18_2 = 0
   return l_18_2
end

createShow = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

createShowSuccess = l_0_0
l_0_0 = function(l_20_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.chooseAnimalOne)
      local l_20_1 = getComponent
      l_20_1 = l_20_1({"mixer layout", "close"})
      if l_20_1 ~= nil then
         l_20_1:UI_DISABLE()
      end
      l_20_1 = getComponent({"mixer layout", "decline"})
      if l_20_1 ~= nil then
         l_20_1:UI_DISABLE()
      end
      l_20_1 = getComponent({"mixer layout", "accept"})
      if l_20_1 ~= nil then
         l_20_1:UI_DISABLE()
      end
      l_20_1 = getComponent({"mixer layout", "view_edit_toggle"})
      if l_20_1 ~= nil then
         l_20_1:UI_DISABLE()
      end
      l_20_1 = getComponent({"mixer layout components", "mixer drag"})
      if l_20_1 ~= nil then
         l_20_1:UI_HIDE()
      end
      mixerDisableAllOtherAnimals("0")
   end
   mixerDisableAllOtherAnimals("0")
   mixerDisableAllTricks()
   if hasSpeciesInShow("DolphinBottlenose_Adult") == 1 and hasSpeciesInShow("WhaleOrca_Adult") ~= 1 then
      return 1
   end
   UIdisable("new")
   UIdisable("edit")
   local l_20_1 = getComponent
   local l_20_2 = {"show mixer manager", "delete"}
   l_20_1 = l_20_1(l_20_2)
   if l_20_1 ~= nil then
      l_20_2(l_20_1)
      l_20_2 = l_20_1:UI_DISABLE
   end
   l_20_2 = UIdisable
   l_20_2("move up")
   l_20_2 = UIdisable
   l_20_2("move down")
   l_20_2 = UIdisable
   l_20_2("insert break")
   l_20_2 = UIdisable
   l_20_2("ShowEnabled")
   l_20_2 = UIdisable
   l_20_2("zoopedia link")
   l_20_2 = UIdisable
   l_20_2("Show Info ToggleSet")
   l_20_2 = UIdisable
   l_20_2("purchase upgrades")
   l_20_2 = verifyEntitySelected
   l_20_2("ShowPlatform_mm", "Show Info")
   l_20_2 = 0
   return l_20_2
end

chooseAnimalOne = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

chooseAnimalOneSuccess = l_0_0
l_0_0 = function(l_22_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.chooseAnimalTwo)
      mixerDisableAllTricks()
      mixerDisableAllOtherAnimals("1")
   end
   if hasSpeciesInShow("WhaleOrca_Adult") == 1 then
      return 1
   end
   verifyEntitySelected("ShowPlatform_mm", "Show Info")
   UIdisable("new")
   UIdisable("edit")
   local l_22_1 = getComponent
   local l_22_2 = {"show mixer manager", "delete"}
   l_22_1 = l_22_1(l_22_2)
   if l_22_1 ~= nil then
      l_22_2(l_22_1)
      l_22_2 = l_22_1:UI_DISABLE
   end
   l_22_2 = UIdisable
   l_22_2("move up")
   l_22_2 = UIdisable
   l_22_2("move down")
   l_22_2 = UIdisable
   l_22_2("insert break")
   l_22_2 = UIdisable
   l_22_2("ShowEnabled")
   l_22_2 = UIdisable
   l_22_2("zoopedia link")
   l_22_2 = UIdisable
   l_22_2("Show Info ToggleSet")
   l_22_2 = UIdisable
   l_22_2("purchase upgrades")
   l_22_2 = 0
   return l_22_2
end

chooseAnimalTwo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

chooseAnimalTwoSuccess = l_0_0
l_0_0 = function(l_24_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.assignAnimalOneTrickOne)
      mixerEnableTrick("DolphinBottlenose_Adult", 0)
      mixerDisableAllAnimals()
   end
   if hasSpeciesInShowWithXNumTricks("DolphinBottlenose_Adult", 1) == 1 then
      if not mixerIsWaitTrick("DolphinBottlenose_Adult", 0) then
         return 1
      else
         mixerEnableTrick("DolphinBottlenose_Adult", 0)
      end
   end
   verifyEntitySelected("ShowPlatform_mm", "Show Info")
   UIdisable("new")
   UIdisable("edit")
   local l_24_1 = getComponent
   local l_24_2 = {"show mixer manager", "delete"}
   l_24_1 = l_24_1(l_24_2)
   if l_24_1 ~= nil then
      l_24_2(l_24_1)
      l_24_2 = l_24_1:UI_DISABLE
   end
   l_24_2 = UIdisable
   l_24_2("move up")
   l_24_2 = UIdisable
   l_24_2("move down")
   l_24_2 = UIdisable
   l_24_2("insert break")
   l_24_2 = UIdisable
   l_24_2("ShowEnabled")
   l_24_2 = UIdisable
   l_24_2("zoopedia link")
   l_24_2 = UIdisable
   l_24_2("Show Info ToggleSet")
   l_24_2 = UIdisable
   l_24_2("purchase upgrades")
   l_24_2 = 0
   return l_24_2
end

assignAnimalOneTrickOne = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

assignAnimalOneTrickOneSuccess = l_0_0
l_0_0 = function(l_26_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.assignAnimalTwoTrick)
      mixerEnableTrick("WhaleOrca_Adult", 0)
   end
   if hasSpeciesInShowWithXNumTricks("WhaleOrca_Adult", 1) == 1 then
      if not mixerIsWaitTrick("WhaleOrca_Adult", 0) then
         return 1
      else
         mixerEnableTrick("WhaleOrca_Adult", 0)
      end
   end
   verifyEntitySelected("ShowPlatform_mm", "Show Info")
   UIdisable("new")
   UIdisable("edit")
   local l_26_1 = getComponent
   local l_26_2 = {"show mixer manager", "delete"}
   l_26_1 = l_26_1(l_26_2)
   if l_26_1 ~= nil then
      l_26_2(l_26_1)
      l_26_2 = l_26_1:UI_DISABLE
   end
   l_26_2 = UIdisable
   l_26_2("move up")
   l_26_2 = UIdisable
   l_26_2("move down")
   l_26_2 = UIdisable
   l_26_2("insert break")
   l_26_2 = UIdisable
   l_26_2("ShowEnabled")
   l_26_2 = UIdisable
   l_26_2("zoopedia link")
   l_26_2 = UIdisable
   l_26_2("Show Info ToggleSet")
   l_26_2 = UIdisable
   l_26_2("purchase upgrades")
   l_26_2 = 0
   return l_26_2
end

assignAnimalTwoTrick = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

assignAnimalTwoTrickSuccess = l_0_0
l_0_0 = function(l_28_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.assignAnimalOneTrickTwo)
      mixerEnableTrick("DolphinBottlenose_Adult", 1)
   end
   if hasSpeciesInShowWithXNumTricks("DolphinBottlenose_Adult", 2) == 1 then
      if not mixerIsWaitTrick("DolphinBottlenose_Adult", 1) then
         return 1
      else
         mixerEnableTrick("DolphinBottlenose_Adult", 1)
      end
   end
   verifyEntitySelected("ShowPlatform_mm", "Show Info")
   UIdisable("new")
   UIdisable("edit")
   local l_28_1 = getComponent
   local l_28_2 = {"show mixer manager", "delete"}
   l_28_1 = l_28_1(l_28_2)
   if l_28_1 ~= nil then
      l_28_2(l_28_1)
      l_28_2 = l_28_1:UI_DISABLE
   end
   l_28_2 = UIdisable
   l_28_2("move up")
   l_28_2 = UIdisable
   l_28_2("move down")
   l_28_2 = UIdisable
   l_28_2("insert break")
   l_28_2 = UIdisable
   l_28_2("ShowEnabled")
   l_28_2 = UIdisable
   l_28_2("zoopedia link")
   l_28_2 = UIdisable
   l_28_2("Show Info ToggleSet")
   l_28_2 = UIdisable
   l_28_2("purchase upgrades")
   l_28_2 = 0
   return l_28_2
end

assignAnimalOneTrickTwo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

assignAnimalOneTrickTwoSuccess = l_0_0
l_0_0 = function(l_30_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.saveShow)
      local l_30_1 = getComponent
      l_30_1 = l_30_1({"mixer layout", "accept"})
      if l_30_1 ~= nil then
         l_30_1:UI_ENABLE()
      end
      mixerDisableAllTricks()
   end
   UIdisable("new")
   UIdisable("edit")
   local l_30_1 = getComponent
   local l_30_2 = {"show mixer manager", "delete"}
   l_30_1 = l_30_1(l_30_2)
   if l_30_1 ~= nil then
      l_30_2(l_30_1)
      l_30_2 = l_30_1:UI_DISABLE
   end
   l_30_2 = UIdisable
   l_30_2("move up")
   l_30_2 = UIdisable
   l_30_2("move down")
   l_30_2 = UIdisable
   l_30_2("zoopedia link")
   l_30_2 = UIdisable
   l_30_2("insert break")
   l_30_2 = UIdisable
   l_30_2("ShowEnabled")
   l_30_2 = UIdisable
   l_30_2("Show Donation Tab Button")
   l_30_2 = UIdisable
   l_30_2("Show Commerce Tab Button")
   l_30_2 = UIdisable
   l_30_2("Show Info Status Tab Button")
   l_30_2 = UIdisable
   l_30_2("Show Thoughts Tab Button")
   l_30_2 = UIdisable
   l_30_2("purchase upgrades")
   l_30_2 = isVisibleByName
   l_30_2 = l_30_2("mixer layout components")
   if l_30_2 == false then
      l_30_2 = 1
      return l_30_2
   end
   l_30_2 = verifyEntitySelected
   l_30_2("ShowPlatform_mm", "Show Info")
   l_30_2 = 0
   return l_30_2
end

saveShow = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_31_0 = getComponent
   local l_31_1 = {"cancel_edit_show_confirmation", "continue"}
   l_31_0 = l_31_0(l_31_1)
   if l_31_0 ~= nil then
      l_31_1(l_31_0)
      l_31_1 = l_31_0:UI_ENABLE
   end
   l_31_1 = getComponent
   local l_31_2 = {"show_platform_confirmation", "continue"}
   l_31_1 = l_31_1(l_31_2)
   l_31_0 = l_31_1
   if l_31_0 ~= nil then
      l_31_1, l_31_2 = l_31_0:UI_ENABLE, l_31_0
      l_31_1(l_31_2)
   end
   l_31_1 = getComponent
   l_31_2 = {"delete_show_confirmation", "continue"}
   l_31_1 = l_31_1(l_31_2)
   l_31_0 = l_31_1
   if l_31_0 ~= nil then
      l_31_1, l_31_2 = l_31_0:UI_ENABLE, l_31_0
      l_31_1(l_31_2)
   end
   l_31_1 = 1
   return l_31_1
end

saveShowSuccess = l_0_0
l_0_0 = function(l_32_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.insertBreak)
      local l_32_1 = getComponent
      l_32_1 = l_32_1({"insert break"})
      if l_32_1 ~= nil then
         l_32_1:UI_ENABLE()
      end
   end
   UIdisable("new")
   UIdisable("edit")
   local l_32_1 = getComponent
   local l_32_2 = {"show mixer manager", "delete"}
   l_32_1 = l_32_1(l_32_2)
   if l_32_1 ~= nil then
      l_32_2(l_32_1)
      l_32_2 = l_32_1:UI_DISABLE
   end
   l_32_2 = UIdisable
   l_32_2("move up")
   l_32_2 = UIdisable
   l_32_2("move down")
   l_32_2 = UIdisable
   l_32_2("zoopedia link")
   l_32_2 = UIdisable
   l_32_2("ShowEnabled")
   l_32_2 = UIdisable
   l_32_2("Show Donation Tab Button")
   l_32_2 = UIdisable
   l_32_2("Show Commerce Tab Button")
   l_32_2 = UIdisable
   l_32_2("Show Info Status Tab Button")
   l_32_2 = UIdisable
   l_32_2("Show Thoughts Tab Button")
   l_32_2 = UIdisable
   l_32_2("purchase upgrades")
   l_32_2 = getComponent
   local l_32_3 = {"Show Manager Panel", "show mixer manager", "insert break"}
   l_32_2 = l_32_2(l_32_3)
   if l_32_2 ~= nil then
      l_32_3 = BFLOG
      l_32_3("found")
   else
      l_32_3 = BFLOG
      l_32_3("not found")
   end
   l_32_3 = isVisibleByName
   l_32_3 = l_32_3("ShowEntry Break")
   if not l_32_3 then
      l_32_3 = isActivated
      l_32_3 = l_32_3(l_32_2)
   if l_32_3 then
      end
      l_32_3 = 1
      return l_32_3
      -- Tried to add an 'end' here but it's incorrect
      l_32_3 = verifyEntitySelected
      l_32_3("ShowPlatform_mm", "Show Info")
      l_32_3 = 0
      return l_32_3
end

insertBreak = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

insertBreakSuccess = l_0_0
l_0_0 = function(l_34_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.disableShow)
      local l_34_1 = getComponent
      local l_34_2 = {"ShowEnabled"}
      l_34_1 = l_34_1(l_34_2)
      if l_34_1 ~= nil then
         l_34_2(l_34_1)
         l_34_2 = l_34_1:UI_ENABLE
      end
   end
   local l_34_1 = getOpenShows()
   if l_34_1 ~= nil and table.getn(l_34_1) < 1 then
      return 1
   end
   verifyEntitySelected("ShowPlatform_mm", "Show Info")
   UIdisable("new")
   UIdisable("edit")
   local l_34_2 = getComponent
   local l_34_3 = {"show mixer manager", "delete"}
   l_34_2 = l_34_2(l_34_3)
   if l_34_2 ~= nil then
      l_34_3(l_34_2)
      l_34_3 = l_34_2:UI_DISABLE
   end
   l_34_3 = UIdisable
   l_34_3("move up")
   l_34_3 = UIdisable
   l_34_3("move down")
   l_34_3 = UIdisable
   l_34_3("zoopedia link")
   l_34_3 = UIdisable
   l_34_3("insert break")
   l_34_3 = UIdisable
   l_34_3("Show Donation Tab Button")
   l_34_3 = UIdisable
   l_34_3("Show Commerce Tab Button")
   l_34_3 = UIdisable
   l_34_3("Show Info Status Tab Button")
   l_34_3 = UIdisable
   l_34_3("Show Thoughts Tab Button")
   l_34_3 = UIdisable
   l_34_3("purchase upgrades")
   l_34_3 = 0
   return l_34_3
end

disableShow = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

disableShowSuccess = l_0_0
l_0_0 = function()
   return 1
end

endscenario = l_0_0
l_0_0 = function()
   setuservar("xp2_Tutorial4", "completed")
   showtutorialwin("xp2_tutorial4:tutorial_complete", "xp2_Tutorial5")
   return 1
end

endscenariosuccess = l_0_0

