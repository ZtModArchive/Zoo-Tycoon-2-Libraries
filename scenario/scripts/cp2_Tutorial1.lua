include("scenario/scripts/tutorial.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/entity.lua")
include("scripts/ZooFame.lua")
diseasedDodo = nil
local l_0_0
local l_0_1
l_0_1 = {rulename = nil, panelPosition = nil, heading = "Tutoriallabels:cp2_T1", body = nil, completion = "cp2_tutorial1:welcomeTutorialOne", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
local l_0_2 = {"construction"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:openConstructionPanelHeading", body = "cp2_tutorial1:openConstructionPanel", completion = nil, completiontextposition = nil, image = "construction", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Building Tab"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:openBuildingTabHeading", body = "cp2_tutorial1:openBuildingTab", completion = nil, completiontextposition = nil, image = "buildingtab", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Buy Area", "CloningCenter"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:placeExtinctResearchLabHeading", body = "cp2_tutorial1:placeExtinctResearchLab", completion = "cp2_tutorial1:placeExtinctResearchLabCompleted", completiontextposition = nil, image = "cloningcenter", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectExtinctResearchLabHeading", body = "cp2_tutorial1:selectExtinctResearchLab", completion = "cp2_tutorial1:selectExtinctResearchLabCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"Cloning Center Info Fossil Tab"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectFossilFindingTabHeading", body = "cp2_tutorial1:selectFossilFindingTab", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Cloning Center Info Fossil", "Fossil Button"}
l_0_2 = {w = 45, h = 45}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectFossilFindingButtonHeading", body = "cp2_tutorial1:selectFossilFindingButton", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:FossilFindingHeading", body = "cp2_tutorial1:FossilFindingFirstFind", completion = "cp2_tutorial1:FossilFindingFirstFindCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:FossilDigHeading", body = "cp2_tutorial1:FossilFindingFirstDig", completion = "cp2_tutorial1:FossilFindingFirstDigCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:FossilFindingHeading", body = "cp2_tutorial1:FossilFindingSecondFind", completion = "cp2_tutorial1:FossilFindingSecondFindCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:FossilDigHeading", body = "cp2_tutorial1:FossilFindingSecondDig", completion = "cp2_tutorial1:FossilFindingSecondDigCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:FossilDigHeading", body = "cp2_tutorial1:FossilFindingDigRest", completion = "cp2_tutorial1:FossilFindingDigRestCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectExtinctResearchLabHeading", body = "cp2_tutorial1:selectExtinctResearchLabBuilding", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"Cloning Center Info Puzzle Tab"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectFossilBuildingTabHeading", body = "cp2_tutorial1:selectFossilBuildingTab", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Cloning Center Info Puzzle", "Puzzle Button"}
l_0_2 = {w = 45, h = 45}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:AssembleHeading", body = "cp2_tutorial1:selectFossilBuildingButton", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:enterFossilBuildingHeading", body = nil, completion = "cp2_tutorial1:enterFossilBuilding", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:BuildDodoHeading", body = "cp2_tutorial1:BuildDodo", completion = "cp2_tutorial1:BuildDodoCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectExtinctResearchLabBuilding", body = "cp2_tutorial1:selectExtinctResearchLabBuilding", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"Cloning Center Info Cloning Tab"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectAnimalCreationTabHeading", body = "cp2_tutorial1:selectAnimalCreationTab", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Cloning Center Info Cloning", "Cloning Button"}
l_0_2 = {w = 45, h = 45}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:selectAnimalCreationButtonHeading", body = "cp2_tutorial1:selectAnimalCreationButton", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:enterAnimalCreationHeading", body = nil, completion = "cp2_tutorial1:enterAnimalCreation", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:enterAnimalCreationHeading", body = "cp2_tutorial1:createDodo", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:creatingDodoCompletedHeading", body = nil, completion = "cp2_tutorial1:creatingDodoCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:placeDodoHeading", body = "cp2_tutorial1:placeDodo", completion = "cp2_tutorial1:placeDodoCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = "cp2_tutorial1:DiseaseIntro", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"AnimalFindButtonsLayout", "diseased_animal_button"}
l_0_2 = {w = 180, h = 180}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:PressBigDiseaseButtonHeading", body = "cp2_tutorial1:PressBigDiseaseButton", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Animal Info", "cure disease button"}
l_0_2 = {w = 160, h = 160}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:PressTrackDiseasedAnimalButtonHeading", body = "cp2_tutorial1:PressTrackDiseasedAnimalButton", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = "cp2_tutorial1:DiseaseCureMode", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = "cp2_tutorial1:TutorialDisease", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial1:TutorialCureDisease", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial1:TutorialApplyCureHeading", body = "cp2_tutorial1:TutorialApplyCure", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
ruledata, l_0_0 = l_0_0, {welcome = l_0_1, openconstructionpanel = l_0_1, selectbuildingtab = l_0_1, placeresearchlab = l_0_1, selectresearchlab = l_0_1, selectfossilfinding = l_0_1, enterfossilfinding = l_0_1, findfossils1 = l_0_1, digfossils1 = l_0_1, findfossils2 = l_0_1, digfossils2 = l_0_1, digfossils3 = l_0_1, selectresearchlab2 = l_0_1, selectfossilbuilding = l_0_1, enterfossilbuilding = l_0_1, startfossilbuilding = l_0_1, builddodo = l_0_1, selectresearchlab3 = l_0_1, selectanimalcreation = l_0_1, enteranimalcreation = l_0_1, startanimalcreation = l_0_1, createdodo = l_0_1, dodocloned = l_0_1, placedodo = l_0_1, diseaseintro = l_0_1, pressbigdiseasebutton = l_0_1, selectdiseasebutton = l_0_1, startdiseasemode = l_0_1, tutorialdisease = l_0_1, curedisease = l_0_1, applycure = l_0_1}
l_0_0 = function(l_1_arg0)
   if disablecp2_tutorial1UIelements ~= nil then
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
   l_1_2:BFS_ADD_SCENARIO_OBJECT("CloningCenter")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("Dodo")
   setMaxFame(100)
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
   l_1_2:UI_DISABLE("undo")
   l_1_2:UI_DISABLE("Photo Album")
   l_1_2:UI_DISABLE("delete")
   l_1_2:UI_DISABLE("Buy Area Container")
   l_1_2:UI_DISABLE("minimize")
   l_1_2:UI_DISABLE("awards")
   l_1_2:UI_DISABLE("scenariogoals")
   l_1_2:UI_DISABLE("Animal Info ToggleSet")
   l_1_2:UI_DISABLE("Sell")
   l_1_2:UI_DISABLE("put up for adoption")
   l_1_2:UI_DISABLE("in game sort button")
   l_1_2:UI_DISABLE("elevated path lower")
   l_1_2:UI_DISABLE("elevated path raise")
   l_1_2:UI_DISABLE("Elevated Path Placement Method")
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
   disablecp2_tutorial1UIelements = 1
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
   return 1
end

selectbuildingtabsuccess = l_0_0
l_0_0 = function(l_8_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeresearchlab)
      l_8_arg0.labcount = countTypeDirect("CloningCenter")
   end
   local l_8_1 = countTypeDirect("CloningCenter")
   if l_8_arg0.labcount < l_8_1 then
      return 1
   end
   local l_8_2 = verifyButton
   local l_8_3 = {"Primary Game Button Panel", "construction"}
   l_8_2(l_8_3, false)
   l_8_2 = queryObject
   l_8_3 = "UIRoot"
   l_8_2 = (l_8_2(l_8_3))
   l_8_3 = nil
   if l_8_2 ~= nil then
      l_8_3 = l_8_2:UI_GET_CHILD("Building Panel")
      if l_8_3 ~= nil then
         local l_8_4 = l_8_3:UI_GET_CHILD("CloningCenter")
         if l_8_4 ~= nil then
            BFLOG("Enabled cloning center button")
            l_8_4:UI_ENABLE()
         end
      end
   end
   return 0
end

placeresearchlab = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_9_0 = queryObject("ZTMode")
   if l_9_0 ~= nil then
      l_9_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIactivateOff("construction")
   return 1
end

placeresearchlabsuccess = l_0_0
l_0_0 = function(l_10_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectresearchlab)
   end
   local l_10_1 = getSelectedEntity()
   if l_10_1 ~= nil and isKindOf(l_10_1:BFG_GET_BINDER_TYPE(), "CloningCenter") == true then
      l_10_1:sendMessage("ZT_SET_RESEARCH_TIME_REMAINING", "1.0")
      return 1
   end
   return 0
end

selectresearchlab = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectresearchlabsuccess = l_0_0
l_0_0 = function(l_12_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectfossilfinding)
      UIenable("Cloning Center Info Fossil Tab")
   end
   if isAlternateByName("Cloning Center Info Fossil Tab") == true then
      return 1
   end
   return 0
end

selectfossilfinding = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectfossilfindingsuccess = l_0_0
l_0_0 = function(l_14_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.enterfossilfinding)
      UIenable("Fossil Button")
   end
   local l_14_1 = getCurrentModeName()
   if l_14_1 == "mode_find_fossils" then
      return 1
   end
   verifyEntitySelected("CloningCenter", "Cloning Center Info Fossil")
   return 0
end

enterfossilfinding = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

enterfossilfindingsuccess = l_0_0
l_0_0 = function(l_16_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.findfossils1)
   end
   local l_16_1 = countType("fossilmarker")
   if l_16_1 > 0 then
      return 1
   end
   local l_16_2 = queryObject("ZTPuzzleMgr")
   if l_16_2 and l_16_2:sendMessage("ZT_GET_NUM_PIECES_FOUND") > 0 then
      return 1
   end
   return 0
end

findfossils1 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

findfossils1success = l_0_0
l_0_0 = function(l_18_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.digfossils1)
      local l_18_1 = queryObject("ZTMode")
      if l_18_1 then
         l_18_1:sendMessage("UI_RBUTTONDOWN")
      end
   end
   local l_18_1 = queryObject("ZTPuzzleMgr")
   if l_18_1 and l_18_1:sendMessage("ZT_GET_NUM_PIECES_FOUND") > 0 then
      return 1
   end
   return 0
end

digfossils1 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

digfossils1success = l_0_0
l_0_0 = function(l_20_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.findfossils2)
      local l_20_1 = queryObject("ZTMode")
      if l_20_1 then
         l_20_1:sendMessage("UI_RBUTTONDOWN")
      end
   end
   local l_20_1 = countType("fossilmarker")
   if l_20_1 > 0 then
      return 1
   end
   local l_20_2 = queryObject("ZTPuzzleMgr")
   if l_20_2 and l_20_2:sendMessage("ZT_GET_NUM_PIECES_FOUND") > 1 then
      return 1
   end
   return 0
end

findfossils2 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

findfossils2success = l_0_0
l_0_0 = function(l_22_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.digfossils2)
      local l_22_1 = queryObject("ZTMode")
      if l_22_1 then
         l_22_1:sendMessage("UI_RBUTTONDOWN")
      end
   end
   local l_22_1 = queryObject("ZTPuzzleMgr")
   if l_22_1 and l_22_1:sendMessage("ZT_GET_NUM_PIECES_FOUND") > 1 then
      return 1
   end
   return 0
end

digfossils2 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

digfossils2success = l_0_0
l_0_0 = function(l_24_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.digfossils3)
      local l_24_1 = queryObject("ZTPuzzleMgr")
      if l_24_1 ~= nil then
         l_24_1:sendMessage("ZT_PLACE_FOSSIL_MARKERS")
      end
      local l_24_2 = queryObject("ZTMode")
      if l_24_2 ~= nil then
         l_24_2:sendMessage("ZT_SETMODE", "mode_super_staff")
      end
   end
   local l_24_1 = queryObject("ZTPuzzleMgr")
   if l_24_1 and l_24_1:sendMessage("ZT_GET_NUM_PIECES_FOUND") > 5 then
      return 1
   end
   return 0
end

digfossils3 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

digfossils3success = l_0_0
l_0_0 = function(l_26_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectresearchlab2)
      local l_26_1 = queryObject("ZTMode")
      if l_26_1 ~= nil then
         l_26_1:sendMessage("ZT_EXITMODE")
      end
   end
   local l_26_1 = getSelectedEntity()
   if l_26_1 ~= nil and isKindOf(l_26_1:BFG_GET_BINDER_TYPE(), "CloningCenter") == true then
      return 1
   end
   return 0
end

selectresearchlab2 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectresearchlab2success = l_0_0
l_0_0 = function(l_28_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectfossilbuilding)
      UIenable("Cloning Center Info Puzzle Tab")
   end
   if isAlternateByName("Cloning Center Info Puzzle Tab") == true then
      return 1
   end
   return 0
end

selectfossilbuilding = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectfossilbuildingsuccess = l_0_0
l_0_0 = function(l_30_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.enterfossilbuilding)
      UIenable("Puzzle Button")
   end
   local l_30_1 = getCurrentModeName()
   if l_30_1 == "mode_puzzle" then
      return 1
   end
   verifyEntitySelected("CloningCenter", "Cloning Center Info Puzzle")
   return 0
end

enterfossilbuilding = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

enterfossilbuildingsuccess = l_0_0
l_0_0 = function(l_32_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.startfossilbuilding)
   end
   return 1
end

startfossilbuilding = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

startfossilbuildingsuccess = l_0_0
l_0_0 = function(l_34_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.builddodo)
   end
   local l_34_1 = queryObject("ZTMode")
   if l_34_1 ~= nil and l_34_1:sendMessage("ZT_GET_PUZZLE_COMPLETE") == true then
      return 1
   end
   return 0
end

builddodo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

builddodosuccess = l_0_0
l_0_0 = function(l_36_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectresearchlab3)
      local l_36_1 = queryObject("ZTMode")
      if l_36_1 ~= nil then
         l_36_1:sendMessage("ZT_EXITMODE")
      end
   end
   local l_36_1 = getSelectedEntity()
   if l_36_1 ~= nil and isKindOf(l_36_1:BFG_GET_BINDER_TYPE(), "CloningCenter") == true then
      return 1
   end
   return 0
end

selectresearchlab3 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectresearchlab3success = l_0_0
l_0_0 = function(l_38_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectanimalcreation)
      UIenable("Cloning Center Info Cloning Tab")
   end
   if isAlternateByName("Cloning Center Info Cloning Tab") == true then
      return 1
   end
   return 0
end

selectanimalcreation = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectanimalcreationsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.enteranimalcreation)
   end
   local l_40_0 = getCurrentModeName()
   if l_40_0 == "mode_cloning_gesture" then
      return 1
   end
   verifyEntitySelected("CloningCenter", "Cloning Center Info")
   return 0
end

enteranimalcreation = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_41_0 = queryObject("ZTMode")
   if l_41_0 ~= nil then
      l_41_0:sendMessage("ZT_DISABLE_AUTO_EXIT")
      l_41_0:sendMessage("ZT_ALLOW_FAILURE", false)
   end
   return 1
end

enteranimalcreationsuccess = l_0_0
l_0_0 = function(l_42_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.startanimalcreation)
   end
   return 1
end

startanimalcreation = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

startanimalcreationsuccess = l_0_0
l_0_0 = function(l_44_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.createdodo)
      l_44_arg0.dodocount = countType("Dodo")
   end
   local l_44_1 = countType("Dodo")
   BFLOG("dodocount is " .. l_44_1)
   if l_44_arg0.dodocount < l_44_1 then
      return 1
   end
   return 0
end

createdodo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_45_0 = queryObject("ZTMode")
   if l_45_0 ~= nil then
      l_45_0:sendMessage("ZT_ALLOW_FAILURE", true)
   end
   return 1
end

createdodosuccess = l_0_0
l_0_0 = function(l_46_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.dodocloned)
   end
   return 1
end

dodocloned = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

dodoclonedsuccess = l_0_0
l_0_0 = function()
   local l_48_0 = queryObject("ZTMode")
   if l_48_0 ~= nil then
      l_48_0:sendMessage("ZT_EXITMODE")
   end
   return showcompletiontextsuccess()
end

dcshowcompletiontextsuccess = l_0_0
l_0_0 = function(l_49_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placedodo)
   end
   if l_49_arg0.clonedDodo == nil then
      local l_49_1 = getSelectedEntity()
      if l_49_1 then
         local l_49_2 = l_49_1:BFG_FIND_CONTAINED_ENTITY("Dodo")
         if l_49_2 ~= nil then
            l_49_1 = l_49_2
         end
         if l_49_1 then
            l_49_arg0.clonedDodo = l_49_1:BFG_GET_ENTITY_ID()
            local l_49_3 = getComponent
            l_49_3 = l_49_3({"Crate Info", "PickUp"})
            if l_49_3 ~= nil then
               l_49_3:UI_ENABLE()
            end
         end
      end
   end
   if l_49_arg0.clonedDodo ~= nil then
      local l_49_1 = findEntityByID(l_49_arg0.clonedDodo)
      if l_49_1 then
         local l_49_2 = getSelectedEntity()
         if l_49_2 then
            local l_49_3 = getComponent
            local l_49_4 = {"Animal Info", "PickUp"}
            l_49_3 = l_49_3(l_49_4)
            if l_49_3 ~= nil then
               if l_49_2 == l_49_1 then
                  l_49_4(l_49_3)
                  l_49_4 = l_49_3:UI_ENABLE
               else
                  l_49_4(l_49_3)
                  l_49_4 = l_49_3:UI_DISABLE
               end
            end
         end
         local l_49_3 = findTypeDirect("SmallRockCave_Shelter")
         if l_49_3 ~= nil then
            local l_49_4 = table.getn(l_49_3)
            if l_49_4 > 0 then
               local l_49_5 = resolveTable(l_49_3[1].value)
               if l_49_5 ~= nil and inSameHabitat(l_49_1, l_49_5) then
                  return 1
               end
            end
         end
      end
   end
   return 0
end

placedodo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_50_0 = queryObject("ZTMode")
   if l_50_0 ~= nil then
      l_50_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   return 1
end

placedodosuccess = l_0_0
l_0_0 = function(l_51_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.diseaseintro)
      local l_51_1 = getComponent
      local l_51_2 = {"Animal Info", "PickUp"}
      l_51_1 = l_51_1(l_51_2)
      if l_51_1 ~= nil then
         l_51_2(l_51_1)
         l_51_2 = l_51_1:UI_DISABLE
      end
   end
   return 1
end

diseaseintro = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

diseaseintrosuccess = l_0_0
l_0_0 = function(l_53_arg0)
   if ruleinitialized == 0 then
      UIenable("diseased_animal_button")
      initTutorialRuleInfo(ruledata.pressbigdiseasebutton)
      local l_53_1 = queryObject("ZTDiseaseMgr")
      if l_53_1 ~= nil then
         local l_53_2 = findTypeDirect("Dodo_Adult")
         local l_53_3 = table.getn(l_53_2)
         if l_53_3 > 0 then
            diseasedDodo = resolveTable(l_53_2[1].value)
            if diseasedDodo ~= nil then
               local l_53_4 = getName(diseasedDodo)
               local l_53_5
               l_53_1:ZT_FORCE_DISEASE(l_53_5)
               l_53_5 = {key = "TutorialLove", val = l_53_4}
            else
               BFLOG("Adult Dodo is nil")
            end
         else
            BFLOG("No Adult Dodos found!")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
   end
   local l_53_1 = getSelectedEntity()
   --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

selectbigdiseasebutton = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectbigdiseasebuttonsuccess = l_0_0
l_0_0 = function(l_55_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectdiseasebutton)
   end
   local l_55_1 = getCurrentModeName()
   if l_55_1 == "mode_cure_disease" then
      return 1
   end
   local l_55_2 = getSelectedEntity()
   if l_55_2 ~= nil and isKindOf(l_55_2:BFG_GET_BINDER_TYPE(), "CloningCenter") == true then
      UIdisable("Disease Button")
   end
   return 0
end

selectdiseasebutton = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectdiseasebuttonsuccess = l_0_0
l_0_0 = function(l_57_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.startdiseasemode)
   end
   return 1
end

startdiseasemode = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

startdiseasemodesuccess = l_0_0
l_0_0 = function(l_59_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.tutorialdisease)
   end
   return 1
end

tutorialdisease = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

tutorialdiseasesuccess = l_0_0
l_0_0 = function(l_61_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.curedisease)
      local l_61_1 = queryObject("ZTMode")
      if l_61_1 then
         l_61_1:sendMessage("UI_RBUTTONDOWN")
      end
   end
   local l_61_1 = findType("Keeper")
   if l_61_1 == 0 then
      BFLOG(SYSERROR, "Worker table is nil")
      return -1
   end
   local l_61_2 = table.getn(l_61_1)
   l_61_arg0.workernames = {}
   l_61_arg0.workergenders = {}
   for l_61_3 = 1, l_61_2 do
      local l_61_6 = resolveTable(l_61_1[l_61_3].value)
      if l_61_6 ~= nil then
         l_61_arg0.workernames[l_61_3] = l_61_6:BFG_GET_ATTR_STRING("s_name")
         if isMale(l_61_6) == true then
            l_61_arg0.workergenders[l_61_3] = "M"
         else
            l_61_arg0.workergenders[l_61_3] = "F"
         end
         deleteEntity(l_61_6)
      end
   end
   local l_61_3 = queryObject("ZTDiseaseMgr")
   if l_61_3 ~= nil and l_61_3:ZT_DISEASE_CURE_QUERY("TutorialLove") == true then
      return 1
   end
   return 0
end

curedisease = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

curediseasesuccess = l_0_0
l_0_0 = function(l_63_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.applycure)
   end
   if diseasedDodo:BFG_GET_ATTR_BOOLEAN("b_Disease") == false then
      return 1
   end
   return 0
end

applycure = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

applycuresuccess = l_0_0
l_0_0 = function()
   return 1
end

endscenario = l_0_0
l_0_0 = function()
   setuservar("cp2tutorialone", "completed")
   showtutorialwin("cp2_tutorial1:TutorialOneCompleted", "cp2tutorialtwo")
   return 1
end

endscenariosuccess = l_0_0

