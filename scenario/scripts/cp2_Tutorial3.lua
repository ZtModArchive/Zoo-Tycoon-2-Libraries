include("scenario/scripts/tutorial.lua")
include("scenario/scripts/needs.lua")
include("scripts/ZooFame.lua")
fossilEdCenter = nil
local l_0_0
local l_0_1
l_0_1 = {rulename = nil, panelPosition = nil, heading = "Tutoriallabels:cp2_T3", body = nil, completion = "cp2_tutorial3:welcomeTutorialThree", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
local l_0_2 = {"construction"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openConstructionPanelHeading", body = "cp2_tutorial3:openConstructionPanel", completion = nil, completiontextposition = nil, image = "construction", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Building Tab"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openBuildingTabHeading", body = "cp2_tutorial3:openBuildingTab", completion = nil, completiontextposition = nil, image = "buildingtab", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"FossilEducationCenter"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:placeExtinctEdCenterHeading", body = "cp2_tutorial3:placeExtinctResearchLab", completion = "cp2_tutorial3:placeExtinctResearchLabCompleted", completiontextposition = nil, image = "fossileducationcenter", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:GetDirtyHeading", body = nil, completion = "cp2_tutorial3:GetDirty", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"construction"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openConstructionPanelHeading2", body = "cp2_tutorial3:openConstructionPanel2", completion = nil, completiontextposition = nil, image = "construction", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"FossilDigPit"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:placeDigPitHeading", body = "cp2_tutorial3:placeDigPit", completion = "cp2_tutorial3:placeDigPitCompleted", completiontextposition = nil, image = "fossildigpit", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:EntertainerIntroHeading", body = nil, completion = "cp2_tutorial3:EntertainerIntro", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"staff"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openStaffPanelHeading", body = "cp2_tutorial3:openStaffPanel", completion = nil, completiontextposition = nil, image = "staff", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"StageEntertainer"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:placeEntertainerStageHeading", body = "cp2_tutorial3:placeEntertainerStage", completion = "cp2_tutorial3:placeEntertainerStageCompleted", completiontextposition = nil, image = "stageentertainer", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"EntertainerExtinct_Adult_M_01"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:placeEntertainerHeading", body = "cp2_tutorial3:placeEntertainer", completion = "cp2_tutorial3:placeEntertainerCompleted", completiontextposition = nil, image = "entertainerextinct_adult_m_01", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:PaleoIntroHeading", body = nil, completion = "cp2_tutorial3:PaleoIntro", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"staff"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openStaffPanelHeading2", body = "cp2_tutorial3:openStaffPanel2", completion = nil, completiontextposition = nil, image = "staff", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Paleontologist_Adult_M_01"}
l_0_2 = {w = 50, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:placePaleontologistHeading", body = "cp2_tutorial3:placePaleontologist", completion = "cp2_tutorial3:placePaleontologistCompleted", completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:selectDodoHeading", body = "cp2_tutorial3:selectDodo", completion = "cp2_tutorial3:selectDodoCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"Animal Info", "in game sort button"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openDodoRecommendationsHeading", body = "cp2_tutorial3:openDodoRecommendations", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Sort Panel", "Animal Enrichment Tab Rec"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:openDodoRecommendationsHeading", body = "cp2_tutorial3:openDodoRecommendationsComplete", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Sort Panel", "MistyWaterfall"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:placeWaterfallHeading", body = "cp2_tutorial3:placeWaterfall", completion = "cp2_tutorial3:placeWaterfallComplete", completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial3:BackToEdCenterHeading", body = "cp2_tutorial3:BackToEdCenter", completion = "cp2_tutorial3:BackToEdCenterCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
ruledata, l_0_0 = l_0_0, {welcome = l_0_1, openconstructionpanel = l_0_1, selectbuildingtab = l_0_1, placeedcenter = l_0_1, getdirty = l_0_1, openconstructionpanel2 = l_0_1, placedigpit = l_0_1, entertainerintro = l_0_1, openstaffpanel = l_0_1, placeentertainerstage = l_0_1, placeentertainer = l_0_1, paleointro = l_0_1, openstaffpanel2 = l_0_1, placepaleo = l_0_1, selectdodo = l_0_1, opendodorecommendations = l_0_1, selectenrichmentobjects = l_0_1, placewaterfall = l_0_1, backtoedcenter = l_0_1}
l_0_0 = function(l_1_arg0)
   if disablecp2_tutorial3UIelements ~= nil then
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
   setglobalvar("CloningCenter", "true")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("FossilEducationCenter")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("FossilDigPit")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("MistyWaterfall")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("StageEntertainer")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("EntertainerExtinct")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("Paleontologist")
   setMaxFame(100)
   l_1_2:UI_DISABLE("Camera Set")
   l_1_2:UI_HIDE("firstperson")
   l_1_2:UI_HIDE("photo")
   l_1_2:UI_DISABLE("View filter layout")
   l_1_2:UI_DISABLE("building button")
   l_1_2:UI_DISABLE("foliage button")
   l_1_2:UI_DISABLE("Water_Filter")
   l_1_2:UI_DISABLE("Guest Multilist Tab")
   l_1_2:UI_DISABLE("Staff Multilist Tab")
   l_1_2:UI_DISABLE("Vehicle Multilist Tab")
   l_1_2:UI_DISABLE("multi list animal filters")
   l_1_2:UI_DISABLE("undo")
   l_1_2:UI_DISABLE("filter_maximize")
   l_1_2:UI_DISABLE("Buy Animal Tab")
   l_1_2:UI_DISABLE("Adopt Animal Tab")
   l_1_2:UI_DISABLE("open zoo toggle button")
   l_1_2:UI_DISABLE("close zoo toggle button")
   l_1_2:UI_DISABLE("Primary Game Button Pointers")
   l_1_2:UI_DISABLE("Main Game Buttons")
   l_1_2:UI_DISABLE("Selection Buttons")
   l_1_2:UI_DISABLE("multinfo button")
   l_1_2:UI_DISABLE("Zoofinance")
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
   l_1_2:UI_DISABLE("sort button")
   l_1_2:UI_DISABLE("photo")
   l_1_2:UI_DISABLE("TextButton Save")
   l_1_2:UI_DISABLE("TextButton Save Hover")
   l_1_2:UI_DISABLE("TextButton Load")
   l_1_2:UI_DISABLE("TextButton Load Hover")
   l_1_2:UI_HIDE("exit with save option")
   l_1_2:UI_SHOW("exit no save option")
   l_1_2:UI_HIDE("release to wild")
   l_1_2:UI_HIDE("crate")
   disablecp2_tutorial3UIelements = 1
   local l_1_3 = queryObject("UIRoot")
   if l_1_3 ~= nil then
      local l_1_4 = l_1_3:UI_GET_CHILD("Buy Animal Tab")
      if l_1_4 then
         l_1_4:UI_ACTIVATE_OFF()
         l_1_4:UI_ACTIVATE_ON()
      end
      local l_1_5 = queryObject("ZTMode")
      if l_1_5 then
         l_1_5:sendMessage("ZT_SETMODE", "mode_biome")
         local l_1_6 = getComponent
         local l_1_7 = {"Biome Droplist Layout", "biomefilter", "BiomeFilterList", "reef"}
         l_1_6 = l_1_6(l_1_7)
         if l_1_6 ~= nil then
            l_1_7(l_1_6)
            l_1_7 = l_1_6:UI_ACTIVATE_ON
         end
         l_1_7(l_1_5, "ZT_SETMODE", "mode_selection")
         l_1_7 = l_1_5:sendMessage
      end
      local l_1_6 = l_1_3:UI_GET_CHILD("Fence Tab")
      if l_1_6 ~= nil then
         l_1_6:UI_ACTIVATE_ON()
      end
      local l_1_7 = l_1_3:UI_GET_CHILD("terraform")
      if l_1_7 then
         l_1_7:UI_ACTIVATE_OFF()
      end
      local l_1_8 = l_1_3:UI_GET_CHILD("biome")
      if l_1_8 ~= nil then
         l_1_8:UI_ACTIVATE_ON()
      end
   end
   disableEyedropper()
   coverUndoButton()
   disableAllPanelButtons("Sell")
   disableAllPanelButtons("PickUp")
   disableAllPanelButtons("put up for adoption")
   disableSaveGameButton()
   disableAnimalOperations()
   return 1
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

welcomesuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openconstructionpanel)
      UIenable("construction")
   end
   if isAlternateByName("construction") == true then
      return 1
   end
   return 0
end

openconstructionpanel = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

openconstructionpanelsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectbuildingtab)
      UIenable("Building Tab")
   end
   if isAlternateByName("Building Tab") == true then
      BFLOG("selectbuildingtab completed")
      return 1
   end
   local l_6_0 = verifyButton
   local l_6_1 = {"Primary Game Button Panel", "construction"}
   l_6_0(l_6_1, true)
   l_6_0 = 0
   return l_6_0
end

selectbuildingtab = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_7_0 = queryObject("ZTMode")
   if l_7_0 ~= nil then
      l_7_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

selectbuildingtabsuccess = l_0_0
l_0_0 = function(l_8_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeedcenter)
      l_8_arg0.placeEdCentercount = countTypeDirect("FossilEducationCenter")
      local l_8_1 = queryObject("ZTResearchMgr")
      if l_8_1 ~= nil then
         l_8_1:ZT_RESEARCH_UNLOCK_ENTITY_KIND("FossilEducationCenter")
      end
   end
   local l_8_1 = countTypeDirect("FossilEducationCenter")
   if l_8_arg0.placeEdCentercount < l_8_1 then
      local l_8_2 = findTypeDirect("FossilEducationCenter")
      if table.getn(l_8_2) > 0 then
         fossilEdCenter = resolveTable(l_8_2[table.getn(l_8_2)].value)
      end
      return 1
   end
   local l_8_2 = verifyButton
   local l_8_3 = {"Primary Game Button Panel", "construction"}
   l_8_2(l_8_3, true)
   l_8_2 = queryObject
   l_8_3 = "UIRoot"
   l_8_2 = (l_8_2(l_8_3))
   l_8_3 = nil
   if l_8_2 ~= nil then
      l_8_3 = l_8_2:UI_GET_CHILD("Building Panel")
      if l_8_3 ~= nil then
         component = l_8_3:UI_GET_CHILD("StageEntertainer")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_8_3:UI_GET_CHILD("FossilDigPit")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_8_3:UI_GET_CHILD("FossilEducationCenter")
         if component ~= nil then
            component:UI_ENABLE()
         end
      end
   end
   return 0
end

placeedcenter = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_9_0 = queryObject("ZTMode")
   if l_9_0 ~= nil then
      l_9_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIactivateOff("construction")
   return 1
end

placeedcentersuccess = l_0_0
l_0_0 = function(l_10_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.getdirty)
   end
   return 1
end

getdirty = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

getdirtysuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openconstructionpanel2)
      UIdisable("staff")
      UIenable("construction")
   end
   if isAlternateByName("construction") == true then
      return 1
   end
   return 0
end

openconstructionpanel2 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_13_0 = queryObject("ZTMode")
   if l_13_0 ~= nil then
      l_13_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

openconstructionpanelsuccess2 = l_0_0
l_0_0 = function(l_14_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placedigpit)
      l_14_arg0.placeDigPitcount = countTypeDirect("FossilDigPit")
      local l_14_1 = queryObject("ZTResearchMgr")
      if l_14_1 ~= nil then
         l_14_1:ZT_RESEARCH_UNLOCK_ENTITY_KIND("FossilDigPit")
      end
   end
   local l_14_1 = countTypeDirect("FossilDigPit")
   if l_14_arg0.placeDigPitcount < l_14_1 then
      return 1
   end
   local l_14_2 = verifyButton
   local l_14_3 = {"Primary Game Button Panel", "construction"}
   l_14_2(l_14_3, true)
   l_14_2 = queryObject
   l_14_3 = "UIRoot"
   l_14_2 = (l_14_2(l_14_3))
   l_14_3 = nil
   if l_14_2 ~= nil then
      l_14_3 = l_14_2:UI_GET_CHILD("Building Panel")
      if l_14_3 ~= nil then
         component = l_14_3:UI_GET_CHILD("StageEntertainer")
         if component ~= nil then
            BFLOG("Disabled entertainer stage button")
            component:UI_DISABLE()
         end
         component = l_14_3:UI_GET_CHILD("FossilDigPit")
         if component ~= nil then
            BFLOG("Enabled fossil dig pit button")
            component:UI_ENABLE()
         end
         component = l_14_3:UI_GET_CHILD("FossilEducationCenter")
         if component ~= nil then
            BFLOG("Disabled fossil education center button")
            component:UI_DISABLE()
         end
      end
   end
   return 0
end

placedigpit = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_15_0 = queryObject("ZTMode")
   if l_15_0 ~= nil then
      l_15_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

placedigpitsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.entertainerintro)
   end
   return 1
end

entertainerintro = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

entertainerintrosuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openstaffpanel)
      UIdisable("construction")
      UIenable("staff")
   end
   if isAlternateByName("staff") == true then
      return 1
   end
   return 0
end

openstaffpanel = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_19_0 = queryObject("ZTMode")
   if l_19_0 ~= nil then
      l_19_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

openstaffpanelsuccess = l_0_0
l_0_0 = function(l_20_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeentertainerstage)
      l_20_arg0.placeEntertainerStagecount = countTypeDirect("StageEntertainer")
   end
   local l_20_1 = countTypeDirect("StageEntertainer")
   if l_20_arg0.placeEntertainerStagecount < l_20_1 then
      return 1
   end
   local l_20_2 = verifyButton
   local l_20_3 = {"Staff Panel", "StageEntertainer"}
   l_20_2(l_20_3, false)
   l_20_2 = queryObject
   l_20_3 = "UIRoot"
   l_20_2 = (l_20_2(l_20_3))
   l_20_3 = nil
   if l_20_2 ~= nil then
      l_20_3 = l_20_2:UI_GET_CHILD("Staff Panel")
      if l_20_3 ~= nil then
         component = l_20_3:UI_GET_CHILD("StageEntertainer")
         if component ~= nil then
            component:UI_ENABLE()
         end
         component = l_20_3:UI_GET_CHILD("EntertainerExtinct_Adult_M_01")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_20_3:UI_GET_CHILD("Paleontologist_Adult_M_01")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_20_3:UI_GET_CHILD("FossilEducationCenter")
         if component ~= nil then
            component:UI_DISABLE()
         end
      end
   end
   return 0
end

placeentertainerstage = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_21_0 = queryObject("ZTMode")
   if l_21_0 ~= nil then
      l_21_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

placeentertainerstagesuccess = l_0_0
l_0_0 = function(l_22_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeentertainer)
      l_22_arg0.placeEntertainercount = countType("Entertainer")
   end
   local l_22_1 = countType("Entertainer")
   if l_22_arg0.placeEntertainercount < l_22_1 then
      return 1
   end
   local l_22_2 = verifyButton
   local l_22_3 = {"Staff Panel", "EntertainerExtinct_Adult_M_01"}
   l_22_2(l_22_3, false)
   l_22_2 = queryObject
   l_22_3 = "UIRoot"
   l_22_2 = (l_22_2(l_22_3))
   l_22_3 = nil
   if l_22_2 ~= nil then
      l_22_3 = l_22_2:UI_GET_CHILD("Staff Panel")
      if l_22_3 ~= nil then
         component = l_22_3:UI_GET_CHILD("StageEntertainer")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_22_3:UI_GET_CHILD("EntertainerExtinct_Adult_M_01")
         if component ~= nil then
            component:UI_ENABLE()
         end
         component = l_22_3:UI_GET_CHILD("Paleontologist_Adult_M_01")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_22_3:UI_GET_CHILD("FossilEducationCenter")
         if component ~= nil then
            component:UI_DISABLE()
         end
      end
   end
   return 0
end

placeentertainer = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_23_0 = queryObject("ZTMode")
   if l_23_0 ~= nil then
      l_23_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIactivateOff("staff")
   return 1
end

placeentertainersuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.paleointro)
   end
   return 1
end

paleointro = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

paleointrosuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openstaffpanel2)
      UIdisable("construction")
      UIenable("staff")
   end
   if isAlternateByName("staff") == true then
      return 1
   end
   return 0
end

openstaffpanel2 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_27_0 = queryObject("ZTMode")
   if l_27_0 ~= nil then
      l_27_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

openstaffpanel2success = l_0_0
l_0_0 = function(l_28_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placepaleo)
      l_28_arg0.placePaleocount = countType("Paleontologist")
   end
   local l_28_1 = countType("Paleontologist")
   if l_28_arg0.placePaleocount < l_28_1 then
      return 1
   end
   local l_28_2 = verifyButton
   local l_28_3 = {"Staff Panel", "Paleontologist_Adult_M_01"}
   l_28_2(l_28_3, false)
   l_28_2 = queryObject
   l_28_3 = "UIRoot"
   l_28_2 = (l_28_2(l_28_3))
   l_28_3 = nil
   if l_28_2 ~= nil then
      l_28_3 = l_28_2:UI_GET_CHILD("Staff Panel")
      if l_28_3 ~= nil then
         component = l_28_3:UI_GET_CHILD("StageEntertainer")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_28_3:UI_GET_CHILD("EntertainerExtinct_Adult_M_01")
         if component ~= nil then
            component:UI_DISABLE()
         end
         component = l_28_3:UI_GET_CHILD("Paleontologist_Adult_M_01")
         if component ~= nil then
            component:UI_ENABLE()
         end
         component = l_28_3:UI_GET_CHILD("FossilEducationCenter")
         if component ~= nil then
            component:UI_DISABLE()
         end
      end
   end
   return 0
end

placepaleo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_29_0 = queryObject("ZTMode")
   if l_29_0 ~= nil then
      l_29_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIactivateOff("staff")
   return 1
end

placepaleosuccess = l_0_0
l_0_0 = function(l_30_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectdodo)
   end
   local l_30_1 = getSelectedEntity()
   if l_30_1 ~= nil and isKindOf(l_30_1:BFG_GET_BINDER_TYPE(), "Dodo") == true then
      if fossilEdCenter ~= nil then
         fossilEdCenter:BFG_SET_ATTR_FLOAT("f_BoneLevel", 2)
         -- Tried to add an 'end' here but it's incorrect
         return 1
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

selectdodo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectdodosuccess = l_0_0
l_0_0 = function(l_32_arg0)
   local l_32_1 = queryObject("UIRoot")
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.opendodorecommendations)
      local l_32_2 = l_32_1:UI_GET_CHILD("in game sort button")
      if l_32_2 then
         l_32_2:UI_ENABLE()
      end
   end
   verifyEntitySelected("Dodo", "Animal Info")
   local l_32_2 = getSelectedEntity()
   if l_32_2 ~= nil and isKindOf(l_32_2:BFG_GET_BINDER_TYPE(), "Dodo") == true and isAlternateByName("in game sort button") == true then
      return 1
   end
   return 0
end

opendodorecommendations = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

opendodorecommendationssuccess = l_0_0
l_0_0 = function(l_34_arg0)
   local l_34_1 = queryObject("UIRoot")
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectenrichmentobjects)
   end
   if isAlternateByName("Animal Enrichment Tab Rec") == true then
      return 1
   end
   verifyEntitySelected("Dodo", "Animal Info")
   if selectedent ~= nil and isKindOf(selectedent:BFG_GET_BINDER_TYPE(), "Dodo") == true then
      return 1
   end
   return 0
end

selectenrichmentobjects = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectenrichmentobjectssuccess = l_0_0
l_0_0 = function(l_36_arg0)
   local l_36_1 = queryObject("UIRoot")
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placewaterfall)
      local l_36_2 = queryObject("ZTResearchMgr")
      if l_36_2 ~= nil then
         l_36_2:ZT_RESEARCH_UNLOCK_ENTITY_KIND("MistyWaterfall")
      end
   end
   local l_36_2 = findTypeDirect("Dodo")
   local l_36_3 = table.getn(l_36_2)
   for l_36_4 = 1, l_36_3 do
      if needMeetsThreshold(resolveTable(l_36_2[l_36_4].value), "biome", 26) then
         return 1
      end
   end
   local l_36_4 = verifyButton
   l_36_5 = {"Sort Panel", "Animal Enrichment Tab Rec"}
   l_36_4(l_36_5, false)
   l_36_4 = 0
   return l_36_4
end

placewaterfall = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_37_0 = queryObject("ZTMode")
   if l_37_0 ~= nil then
      l_37_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIactivateOff("in game sort button")
   return 1
end

placewaterfallsuccess = l_0_0
l_0_0 = function(l_38_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.backtoedcenter)
   end
   local l_38_1 = getSelectedEntity()
   if l_38_1 ~= nil and isKindOf(l_38_1:BFG_GET_BINDER_TYPE(), "FossilEducationCenter") == true then
      return 1
   end
   return 0
end

backtoedcenter = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

backtoedcentersuccess = l_0_0
l_0_0 = function()
   return 1
end

endscenario = l_0_0
l_0_0 = function()
   setuservar("cp2tutorialthree", "completed")
   showtutorialwin("cp2_tutorial3:TutorialThreeComplete", nil)
   return 1
end

endscenariosuccess = l_0_0

