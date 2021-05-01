include("scenario/scripts/tutorial.lua")
include("scenario/scripts/needs.lua")
include("scripts/ZooFame.lua")
rampagingTRex = nil
rampagingAnkylo = nil
local l_0_0
local l_0_1
l_0_1 = {rulename = nil, panelPosition = nil, heading = "Tutoriallabels:cp2_T2", body = nil, completion = "cp2_tutorial2:welcomeTutorialTwo", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = "cp2_tutorial2:BeforeRampage", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = "cp2_tutorial2:TriggerRampage", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
local l_0_2 = {"AnimalFindButtonsLayout", "rampaging_animal_button"}
l_0_2 = {w = 180, h = 180}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial2:selectTrex", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Animal Info", "tranq animal button"}
l_0_2 = {w = 160, h = 160}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial2:clickTranquilize", completion = nil, completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial2:TranquilizeInstructions", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial2:TranquilizeComplete", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial2:DRTMessage", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"construction"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial2:openConstructionPanelHeading", body = "cp2_tutorial2:openConstructionPanel", completion = nil, completiontextposition = nil, image = "construction", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Building Tab"}
l_0_2 = {w = 70, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial2:openBuildingTabHeading", body = "cp2_tutorial2:openBuildingTab", completion = nil, completiontextposition = nil, image = "buildingtab", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"DinoRecoveryBuilding"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "cp2_tutorial2:placeDRTHeading", body = "cp2_tutorial2:placeDRT", completion = "cp2_tutorial2:placeDRTCompleted", completiontextposition = nil, image = "dinorecoverybuilding", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = "cp2_tutorial2:AnkyloRampage", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = "cp2_tutorial2:AnkyloRampageWait", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
ruledata, l_0_0 = l_0_0, {welcome = l_0_1, beforerampage = l_0_1, triggerrampage = l_0_1, selecttrex = l_0_1, clicktranquilize = l_0_1, tranquilizetrex = l_0_1, cratetrex = l_0_1, drtmessage = l_0_1, openconstructionpanel = l_0_1, selectbuildingtab = l_0_1, placedrt = l_0_1, ankylorampage = l_0_1, ankylorampagewait = l_0_1}
l_0_0 = function(l_1_arg0)
   if disablecp2_tutorial2UIelements ~= nil then
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
   l_1_2:BFS_ADD_SCENARIO_OBJECT("TyrannosaurusRex")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("Ankylosaurus")
   l_1_2:BFS_ADD_SCENARIO_OBJECT("DinoRecoveryBuilding")
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
   disablecp2_tutorial2UIelements = 1
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
   disableSaveGameButton()
   disableAnimalOperations()
   local l_1_4 = queryObject("BFGRampageMgr")
   if l_1_4 then
      l_1_4:BFG_SUPPRESS_RAMPAGE_TIMEOUT(true)
   else
      BFLOG(SYSTRACE, "**************** rampageMgr nil ****************")
   end
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
l_0_0 = function(l_4_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.beforerampage)
   end
   return 1
end

beforerampage = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

beforerampagesuccess = l_0_0
l_0_0 = function(l_6_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.triggerrampage)
      local l_6_1 = queryObject("BFGRampageMgr")
      if l_6_1 ~= nil then
         local l_6_2 = findTypeDirect("TyrannosaurusRex_Adult")
         local l_6_3 = table.getn(l_6_2)
         if l_6_3 > 0 then
            local l_6_4 = resolveTable(l_6_2[1].value)
            if l_6_4 ~= nil then
               l_6_1:sendMessage("BFG_FORCE_RAMPAGE", l_6_4)
            else
               BFLOG("Adult TRex is nil")
            end
         else
            BFLOG("No Adult TRex found!")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
   end
   return 1
end

triggerrampage = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

triggerrampagesuccess = l_0_0
l_0_0 = function(l_8_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selecttrex)
   end
   local l_8_1 = getSelectedEntity()
   if l_8_1 ~= nil and isKindOf(l_8_1:BFG_GET_BINDER_TYPE(), "TyrannosaurusRex_Adult") == true and l_8_1:BFG_GET_ATTR_BOOLEAN("b_Rampage") == true then
      rampagingTRex = l_8_1
      return 1
   end
   return 0
end

selecttrex = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selecttrexsuccess = l_0_0
l_0_0 = function(l_10_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.clicktranquilize)
   end
   local l_10_1 = getCurrentModeName()
   if l_10_1 == "mode_tranquilize" then
      return 1
   end
   verifyEntitySelected("TyrannosaurusRex_Adult", "Animal Info")
   return 0
end

clicktranquilize = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

clicktranquilizesuccess = l_0_0
l_0_0 = function(l_12_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.tranquilizetrex)
   end
   if rampagingTRex ~= nil then
      local l_12_1 = rampagingTRex:BFG_GET_ATTR_BOOLEAN("b_Rampage")
      if l_12_1 == false then
         rampagingTRex:BFG_SET_ATTR_BOOLEAN("b_showCrate", true)
         return 1
      end
   end
   return 0
end

tranquilizetrex = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

tranquilizetrexsuccess = l_0_0
l_0_0 = function(l_14_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.cratetrex)
      local l_14_1 = queryObject("ZTMode")
      if l_14_1 ~= nil then
         l_14_1:sendMessage("ZT_EXITMODE")
      end
   end
   local l_14_1 = getSelectedEntity()
   if l_14_1 ~= nil and isKindOf(l_14_1:BFG_GET_BINDER_TYPE(), "TyrannosaurusRex_Adult") == true then
      UIdisable("PickUp")
   end
   if isCratedEntity(rampagingTRex) then
      return 1
   end
   return 0
end

cratetrex = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

cratetrexsuccess = l_0_0
l_0_0 = function(l_16_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.drtmessage)
   end
   return 1
end

drtmessage = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

drtmessagesuccess = l_0_0
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
   local l_20_0 = verifyButton
   local l_20_1 = {"Primary Game Button Panel", "construction"}
   l_20_0(l_20_1, true)
   l_20_0 = 0
   return l_20_0
end

selectbuildingtab = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectbuildingtabsuccess = l_0_0
l_0_0 = function(l_22_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placedrt)
      l_22_arg0.drtcount = countTypeDirect("DinoRecoveryBuilding")
      local l_22_1 = queryObject("ZTResearchMgr")
      if l_22_1 ~= nil then
         l_22_1:ZT_RESEARCH_UNLOCK_ENTITY_KIND("DinoRecoveryBuilding")
      end
   end
   local l_22_1 = countTypeDirect("DinoRecoveryBuilding")
   if l_22_arg0.drtcount < l_22_1 then
      return 1
   end
   local l_22_2 = verifyButton
   local l_22_3 = {"Primary Game Button Panel", "construction"}
   l_22_2(l_22_3, false)
   l_22_2 = queryObject
   l_22_3 = "UIRoot"
   l_22_2 = (l_22_2(l_22_3))
   l_22_3 = nil
   if l_22_2 ~= nil then
      l_22_3 = l_22_2:UI_GET_CHILD("Building Panel")
      if l_22_3 ~= nil then
         local l_22_4 = l_22_3:UI_GET_CHILD("DinoRecoveryBuilding")
         if l_22_4 ~= nil then
            BFLOG("Enabled drt button")
            l_22_4:UI_ENABLE()
         end
      end
   end
   return 0
end

placedrt = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_23_0 = queryObject("ZTMode")
   if l_23_0 ~= nil then
      l_23_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   UIactivateOff("construction")
   return 1
end

placedrtsuccess = l_0_0
l_0_0 = function(l_24_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.ankylorampage)
      local l_24_1 = queryObject("BFGRampageMgr")
      if l_24_1 ~= nil then
         l_24_1:sendMessage("BFG_SET_DRT_TIMEIN_OVERRIDE", "5.0")
         local l_24_2 = findTypeDirect("Ankylosaurus_Adult")
         local l_24_3 = table.getn(l_24_2)
         if l_24_3 > 0 then
            local l_24_4 = resolveTable(l_24_2[1].value)
            if l_24_4 ~= nil then
               l_24_1:sendMessage("BFG_FORCE_RAMPAGE", l_24_4)
               rampagingAnkylo = l_24_4
            else
               BFLOG("Adult Ankylo is nil")
            end
         else
            BFLOG("No Adult Ankylo found!")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
   end
   return 1
end

ankylorampage = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

ankylorampagesuccess = l_0_0
l_0_0 = function(l_26_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.ankylorampagewait)
   end
   if rampagingAnkylo ~= nil and rampagingAnkylo:BFG_GET_ATTR_BOOLEAN("b_Rampage") == false then
      return 1
   end
   return 0
end

ankylorampagewait = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

ankylorampagewaitsuccess = l_0_0
l_0_0 = function()
   local l_28_0 = queryObject("BFGRampageMgr")
   if l_28_0 then
      l_28_0:BFG_SUPPRESS_RAMPAGE_TIMEOUT(false)
   else
      BFLOG(SYSTRACE, "**************** rampageMgr nil ****************")
   end
   return 1
end

endscenario = l_0_0
l_0_0 = function()
   local l_29_0 = queryObject("BFGRampageMgr")
   if l_29_0 then
      l_29_0:BFG_SUPPRESS_RAMPAGE_TIMEOUT(false)
   else
      BFLOG(SYSTRACE, "**************** rampageMgr nil ****************")
   end
   setuservar("cp2tutorialtwo", "completed")
   showtutorialwin("cp2_tutorial2:TutorialTwoCompleted", "cp2tutorialthree")
   return 1
end

endscenariosuccess = l_0_0

