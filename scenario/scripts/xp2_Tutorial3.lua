include("scenario/scripts/tutorial.lua")
include("scenario/scripts/Shows.lua")
local l_0_0
local l_0_1
l_0_1 = {rulename = nil, panelPosition = nil, heading = "Tutoriallabels:xp2_T3", body = nil, completion = "xp2_tutorial3:welcome", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:trainingIntroHeading", body = "xp2_tutorial3:trainingIntro", completion = "xp2_tutorial3:trainingIntroCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:selectDolphinHeading", body = "xp2_tutorial3:selectDolphin", completion = "xp2_tutorial3:selectDolphinCompleted", completiontextposition = nil, image = "dolphin", ring = nil, ringsize = nil}
local l_0_2 = {"Animal Info", "1st person training"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:openTrainingHeading", body = "xp2_tutorial3:openTraining", completion = "xp2_tutorial3:openTrainingCompleted", completiontextposition = nil, image = "button_firstpersontrainer", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:placeTrainingAreaHeading", body = "xp2_tutorial3:placeTrainingArea", completion = "xp2_tutorial3:placeTrainingCompleted", completiontextposition = nil, image = "TrainingArea", ring = nil, ringsize = l_0_2}
l_0_2 = {x = 625, y = 552}
l_0_2 = {w = 75, h = 75}
l_0_2 = {"player training layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:selectJumpHeading", body = "xp2_tutorial3:selectJump", completion = "xp2_tutorial3:selectJumpCompleted", completiontextposition = nil, image = "trick_icon_jump", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:gestureIntroHeading", body = "xp2_tutorial3:gestureIntro", completion = "xp2_tutorial3:gestureIntroCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:makeGestureOneHeading", body = "xp2_tutorial3:makeGestureOne", completion = "xp2_tutorial3:makeGestureOneCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = nil, body = nil, completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:rewardDolphinOneHeading", body = "xp2_tutorial3:rewardDolphinOne", completion = "xp2_tutorial3:rewardDolphinOneCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {x = 625, y = 552}
l_0_2 = {w = 75, h = 75}
l_0_2 = {"player training layout"}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:selectJumpTwoHeading", body = "xp2_tutorial3:selectJumpTwo", completion = "xp2_tutorial3:selectJumpTwoCompleted", completiontextposition = nil, image = "trick_icon_jump", ring = l_0_2, ringsize = l_0_2, ringtracker = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:makeGestureTwoHeading", body = "xp2_tutorial3:makeGestureTwo", completion = "xp2_tutorial3:makeGestureTwoCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:rewardDolphinTwoHeading", body = "xp2_tutorial3:rewardDolphinTwo", completion = "xp2_tutorial3:rewardDolphinTwoCompleted", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"close training panel"}
l_0_2 = {w = 50, h = 50}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:closePanelHeading", body = "xp2_tutorial3:closePanel", completion = "xp2_tutorial3:closePanelCompleted", completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"staff"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:openStaffPanelHeading", body = "xp2_tutorial3:openStaffPanel", completion = "xp2_tutorial3:openStaffPanelCompleted", completiontextposition = nil, image = "staff", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Buy Area", "Trainer_Adult_M_01"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:placeTrainerHeading", body = "xp2_tutorial3:placeTrainer", completion = "xp2_tutorial3:placeTrainerCompleted", completiontextposition = nil, image = "trainer", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:selectTrainerHeading", body = "xp2_tutorial3:selectTrainer", completion = "xp2_tutorial3:selectTrainerCompleted", completiontextposition = nil, image = "trainer", ring = nil, ringsize = nil}
l_0_2 = {"Keeper Training Tab"}
l_0_2 = {w = 70, h = 60}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:selectTrainingTabHeading", body = "xp2_tutorial3:selectTrainingTab", completion = "xp2_tutorial3:selectTrainingTabCompleted", completiontextposition = nil, image = nil, ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"Training Panel", "Add Animal Assignment"}
l_0_2 = {w = 70, h = 60}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:clickAddAssignmentHeading", body = "xp2_tutorial3:clickAddAssignment", completion = "xp2_tutorial3:clickAddAssignmentCompleted", completiontextposition = nil, image = "Add_Animal_Assignment", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:clickDolphinHeading", body = "xp2_tutorial3:clickDolphin", completion = "xp2_tutorial3:clickDolphinCompleted", completiontextposition = nil, image = "dolphin", ring = nil, ringsize = nil}
l_0_2 = {"assignment description"}
l_0_2 = {w = 150, h = 45}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:clickAnimalButtonHeading", body = "xp2_tutorial3:clickAnimalButton", completion = "xp2_tutorial3:clickAnimalButtonCompleted", completiontextposition = nil, image = "assignmentbutton", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "xp2_tutorial3:trainingMultipleAnimalsHeading", body = "xp2_tutorial3:trainingMultipleAnimals", completion = "xp2_tutorial3:trainingMultipleAnimalsCompleted", completiontextposition = nil, image = nil, ring = nil}
ruledata, l_0_0 = l_0_0, {welcome = l_0_1, showIntro = l_0_1, selectDolphin = l_0_1, openTraining = l_0_1, placeTrainingArea = l_0_1, selectJump = l_0_1, gestureIntro = l_0_1, makeGestureOne = l_0_1, checkRewardText = l_0_1, rewardDolphinOne = l_0_1, selectJumpTwo = l_0_1, makeGestureTwo = l_0_1, rewardDolphinTwo = l_0_1, closePanel = l_0_1, openStaffPanel = l_0_1, placeTrainer = l_0_1, selectTrainer = l_0_1, selectTrainingTab = l_0_1, clickAddAssignment = l_0_1, clickDolphin = l_0_1, clickAnimalButton = l_0_1, trainingMultipleAnimals = l_0_1}
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
   l_1_2:BFS_ADD_SCENARIO_OBJECT("Trainer")
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
   l_1_2:UI_HIDE("Swim with")
   l_1_2:UI_DISABLE("close training panel")
   l_1_2:UI_DISABLE("Trainer Info Tab Button")
   l_1_2:UI_DISABLE("Trainer Thoughts Tab")
   l_1_2:UI_DISABLE("Trainer Info Status Tab")
   l_1_2:UI_DISABLE("photo")
   l_1_2:UI_DISABLE("TextButton Save")
   l_1_2:UI_DISABLE("TextButton Save Hover")
   l_1_2:UI_DISABLE("TextButton Load")
   l_1_2:UI_DISABLE("TextButton Load Hover")
   l_1_2:UI_DISABLE("put up for adoption")
   l_1_2:UI_HIDE("exit with save option")
   l_1_2:UI_SHOW("exit no save option")
   l_1_2:UI_HIDE("release to wild")
   l_1_2:UI_HIDE("crate")
   l_1_2:UI_HIDE("put up for adoption")
   l_1_2:UI_HIDE("Swim with")
   disablexp2_tutorial1UIelements = 1
   local l_1_3 = getComponent
   local l_1_4 = {"Main Game Buttons", "animals"}
   l_1_3 = l_1_3(l_1_4)
   if l_1_3 ~= nil then
      l_1_4(l_1_3)
      l_1_4 = l_1_3:UI_ACTIVATE_ON
      l_1_4(l_1_3)
      l_1_4 = l_1_3:UI_ACTIVATE_OFF
   end
   l_1_4 = queryObject
   l_1_4 = l_1_4("UIRoot")
   if l_1_4 ~= nil then
      local l_1_5 = l_1_4:UI_GET_CHILD("staff")
      if l_1_5 then
         l_1_5:UI_ACTIVATE_OFF()
      end
   end
   local l_1_5 = queryObject("ZTMode")
   if l_1_5 then
      l_1_5:sendMessage("ZT_SET_OVERRIDE_UI_FLAG", true)
      l_1_5:sendMessage("ZT_SETMODE", "mode_selection")
   end
   local l_1_6 = findType("DolphinBottlenose_Adult")
   local l_1_7 = resolveTable(l_1_6[1].value)
   BFLOG("Setting name")
   local l_1_8 = getLocID("xp2_tutorial2:dolphinName")
   l_1_7:BFG_SET_ATTR_STRING("s_name", l_1_8)
   disableAllPanelButtons("Sell")
   disableAllPanelButtons("PickUp")
   coverUndoButton()
   disableAllAdoptButtons()
   disableEyedropper()
   disableSaveGameButton()
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
      initTutorialRuleInfo(ruledata.selectDolphin)
      if ruledata.selectDolphin.rulename then
         showRule(ruledata.selectDolphin.rulename)
      end
      local l_6_0 = findType("DolphinBottlenose")
      if resolveTable(l_6_0[1].value) ~= nil then
         setNeed(resolveTable(l_6_0[1].value), "hunger", 0)
         setNeed(resolveTable(l_6_0[1].value), "thirst", 0)
         setNeed(resolveTable(l_6_0[1].value), "rest", 0)
         setNeed(resolveTable(l_6_0[1].value), "privacy", 0)
         setNeed(resolveTable(l_6_0[1].value), "hygiene", 0)
         setNeed(resolveTable(l_6_0[1].value), "social", 0)
         setNeed(resolveTable(l_6_0[1].value), "stimulation", 0)
         resolveTable(l_6_0[1].value):BFG_SET_ATTR_BOOLEAN("b_showAdopt", false)
      else
         BFLOG("failed to find dolphin")
      end
      if getComponent({"Swim with back"}) ~= nil then
         getComponent({"Swim with back"}):UI_SHOW()
      end
   end
   local l_6_0 = getComponent
   local l_6_1 = {"crate"}
   l_6_0 = l_6_0(l_6_1)
   if l_6_0 ~= nil then
      l_6_1(l_6_0)
      l_6_1 = l_6_0:UI_HIDE
   end
   l_6_1 = getComponent
   local l_6_2 = {"release to wild"}
   l_6_1 = l_6_1(l_6_2)
   if l_6_1 ~= nil then
      l_6_2(l_6_1)
      l_6_2 = l_6_1:UI_HIDE
   end
   l_6_2 = getComponent
   local l_6_3 = {"zoopedia link"}
   l_6_2 = l_6_2(l_6_3)
   if l_6_2 ~= nil then
      l_6_3(l_6_2)
      l_6_3 = l_6_2:UI_DISABLE
   end
   l_6_3 = getSelectedEntity
   l_6_3 = l_6_3()
   if l_6_3 ~= nil and isEntityKindOf(l_6_3, "DolphinBottlenose_Adult") then
      return 1
   end
   return 0
end

selectDolphin = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectDolphinSuccess = l_0_0
l_0_0 = function(l_8_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openTraining)
   end
   if not isVisibleByName("Animal Info") and isVisibleByName("Buy Object Panel") then
      return 1
   end
   local l_8_1 = getComponent
   local l_8_2 = {"crate"}
   l_8_1 = l_8_1(l_8_2)
   if l_8_1 ~= nil then
      l_8_2(l_8_1)
      l_8_2 = l_8_1:UI_HIDE
   end
   l_8_2 = getComponent
   local l_8_3 = {"release to wild"}
   l_8_2 = l_8_2(l_8_3)
   if l_8_2 ~= nil then
      l_8_3(l_8_2)
      l_8_3 = l_8_2:UI_HIDE
   end
   l_8_3 = getComponent
   local l_8_4 = {"zoopedia link"}
   l_8_3 = l_8_3(l_8_4)
   if l_8_3 ~= nil then
      l_8_4(l_8_3)
      l_8_4 = l_8_3:UI_DISABLE
   end
   l_8_4 = getComponent
   local l_8_5 = {"Swim with"}
   l_8_4 = l_8_4(l_8_5)
   if l_8_4 ~= nil then
      l_8_5(l_8_4)
      l_8_5 = l_8_4:UI_HIDE
   end
   l_8_5 = verifyEntitySelected
   l_8_5("DolphinBottlenose_Adult", "Animal Info")
   l_8_5 = 0
   return l_8_5
end

openTraining = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

openTrainingSuccess = l_0_0
l_0_0 = function(l_10_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeTrainingArea)
      l_10_arg0.countTrainingArea = countType("TrainingArea")
      local l_10_1 = queryObject("BFScenarioMgr")
      if l_10_1 ~= nil then
         l_10_1:UI_ENABLE("Camera Set")
      end
      showUI("firstperson", true)
      l_10_arg0.TankWallHeightList = getTankWaterHeightList()
      for l_10_2 = 1, table.getn(l_10_arg0.TankWallHeightList) do
         if l_10_arg0.TankWallHeightList[l_10_2].value < 18 then
            BFLOG("raising tank")
            setTankWallHeight("20")
            return 0
         end
      end
   end
   local l_10_1 = countType("TrainingArea")
   if l_10_1 == l_10_arg0.countTrainingArea + 1 then
      return 1
   end
   local l_10_2 = queryObject("ZTMode")
   if l_10_2 ~= nil then
      l_10_2:sendMessage("ZT_SETMODE", "mode_placement")
      if l_10_2:sendMessage("ZT_IS_TYPE_ON_CURSOR", "TrainingArea") == false then
         verifyEntitySelected("DolphinBottlenose_Adult", "Animal Info")
         l_10_2:sendMessage("ZT_FP_TRAIN_ANIMAL")
      end
   end
   return 0
end

placeTrainingArea = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

placeTrainingAreaSuccess = l_0_0
l_0_0 = function(l_12_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectJump)
      local l_12_1 = queryObject("BFScenarioMgr")
      if l_12_1 ~= nil then
         l_12_1:UI_SHOW("Dummy Jump Suspension Bar")
         l_12_1:UI_SHOW("Dummy Jump Suspension Bar Lock")
         l_12_1:UI_SHOW("Dummy Jump Hoop")
         l_12_1:UI_SHOW("Dummy Jump Hoop Lock")
         l_12_1:UI_SHOW("Dummy Ram Ball")
         l_12_1:UI_SHOW("Dummy Ram Ball Lock")
         l_12_1:UI_SHOW("Dummy Beach")
         l_12_1:UI_SHOW("Dummy Beach Lock")
         l_12_1:UI_SHOW("Dummy Teather Ball")
         l_12_1:UI_SHOW("Dummy Teather Ball Lock")
         l_12_1:UI_SHOW("Dummy WaterWalk")
         l_12_1:UI_SHOW("Dummy WaterWalk Lock")
         l_12_1:UI_DISABLE("Camera Set")
      end
      if getComponent({"Player Training Components", "player training drag"}) ~= nil then
         getComponent({"Player Training Components", "player training drag"}):UI_HIDE()
      end
   end
   local l_12_1 = getComponent
   local l_12_2 = {"close training panel"}
   l_12_1 = l_12_1(l_12_2)
   if l_12_1 ~= nil then
      l_12_2(l_12_1)
      l_12_2 = l_12_1:UI_DISABLE
   end
   l_12_2 = countType
   l_12_2 = l_12_2("gesture_tracer")
   if l_12_2 >= 1 then
      return 1
   end
   if isVisibleByName("wait message layout") == true or isVisibleByName("start message layout") == true then
      return 1
   end
   if not isCurrentMode("mode_fp_training") then
      local l_12_3 = queryObject("BFScenarioMgr")
      if l_12_3 ~= nil then
         l_12_3:UI_ENABLE("Camera Set")
      end
      local l_12_4 = queryObject("ZTMode")
      if l_12_4 ~= nil then
         BFLOG("here i am")
         l_12_4:sendMessage("ZT_SETMODE", "mode_first_person")
         l_12_4:sendMessage("ZT_SETMODE", "mode_fp_training")
         local l_12_5 = findType("TrainingArea")
         local l_12_6 = resolveTable(l_12_5[1].value)
         l_12_4:sendMessage("ZT_FP_SETTRAININGAREA", l_12_6)
         local l_12_7 = findType("DolphinBottlenose")
         local l_12_8 = resolveTable(l_12_7[1].value)
         l_12_4:sendMessage("ZT_FP_SETANIMALTOTRAIN", l_12_8)
         l_12_4:sendMessage("ZT_SET_SPLINETOTRACE", nil)
         initTutorialRuleInfo(ruledata.selectJump)
         local l_12_9 = queryObject("BFScenarioMgr")
         if l_12_9 ~= nil then
            l_12_9:UI_SHOW("Dummy Jump Suspension Bar")
            l_12_9:UI_SHOW("Dummy Jump Suspension Bar Lock")
            l_12_9:UI_SHOW("Dummy Jump Hoop")
            l_12_9:UI_SHOW("Dummy Jump Hoop Lock")
            l_12_9:UI_SHOW("Dummy Ram Ball")
            l_12_9:UI_SHOW("Dummy Ram Ball Lock")
            l_12_9:UI_SHOW("Dummy Beach")
            l_12_9:UI_SHOW("Dummy Beach Lock")
            l_12_9:UI_SHOW("Dummy Teather Ball")
            l_12_9:UI_SHOW("Dummy Teather Ball Lock")
            l_12_9:UI_SHOW("Dummy WaterWalk")
            l_12_9:UI_SHOW("Dummy WaterWalk Lock")
            l_12_9:UI_DISABLE("Camera Set")
         end
      end
   end
   return 0
end

selectJump = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectJumpSuccess = l_0_0
l_0_0 = function()
   BFLOG("init gesture intro")
   initTutorialRuleInfo(ruledata.gestureIntro)
   return 1
end

gestureIntro = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   BFLOG("complete gesture intro")
   return 1
end

gestureIntroSuccess = l_0_0
l_0_0 = function()
   BFLOG("init gesture one")
   initTutorialRuleInfo(ruledata.makeGestureOne)
   return 1
end

makeGestureOne = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   BFLOG("complete gesture one")
   return 1
end

makeGestureOneSuccess = l_0_0
l_0_0 = function(l_18_arg0)
   if ruleinitialized == 0 then
      local l_18_1 = queryObject("ZTMode")
      if l_18_1 ~= nil then
         l_18_1:sendMessage("ZT_SETMODE", "mode_fp_training")
      end
      local l_18_2 = queryObject("UIRoot")
      if l_18_2 then
         local l_18_3 = l_18_2:UI_GET_CHILD("tutorial layout")
         if l_18_3 ~= nil then
            l_18_3:UI_SET_MODAL(false)
         end
         l_18_3 = l_18_2:UI_GET_CHILD("First Person")
         if l_18_3 ~= nil then
            l_18_3:UI_HIDE()
         end
      end
      local l_18_3 = findType("DolphinBottlenose")
      local l_18_4 = resolveTable(l_18_3[1].value)
      l_18_arg0.trickLevel = getTrickSkillLevel(l_18_4, "DolphinJump")
      BFLOG("Trick Level for Beaky " .. l_18_arg0.trickLevel)
      ruleinitialized = 1
   end
   if isVisibleByName("training failed layout") then
      setglobalvar("failedGestureOne", "true")
      return 1
   end
   if isVisibleByName("Reward Message") or hasSpeciesWithTrickOfLevelX("DolphinBottlenose", "DolphinJump", l_18_arg0.trickLevel + 1) then
      BFLOG("gesture one done")
      return 1
   end
   if not isCurrentMode("mode_fp_training") then
      local l_18_1 = queryObject("BFScenarioMgr")
      if l_18_1 ~= nil then
         l_18_1:UI_ENABLE("Camera Set")
      end
      local l_18_2 = queryObject("ZTMode")
      if l_18_2 ~= nil then
         BFLOG("here i am")
         l_18_2:sendMessage("ZT_SETMODE", "mode_first_person")
         l_18_2:sendMessage("ZT_SETMODE", "mode_fp_training")
         local l_18_3 = findType("TrainingArea")
         local l_18_4 = resolveTable(l_18_3[1].value)
         l_18_2:sendMessage("ZT_FP_SETTRAININGAREA", l_18_4)
         local l_18_5 = findType("DolphinBottlenose")
         local l_18_6 = resolveTable(l_18_5[1].value)
         l_18_2:sendMessage("ZT_FP_SETANIMALTOTRAIN", l_18_6)
         l_18_2:sendMessage("ZT_FP_SETGESTUREBYTRICK", "DolphinJump")
      end
   end
   return 0
end

checkRewardText = l_0_0
l_0_0 = function()
   BFLOG("complete gesture one")
   tutorialgoalcompleted()
   return 1
end

checkRewardTextSuccess = l_0_0
l_0_0 = function(l_20_arg0)
   BFLOG("reward dolphin")
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.rewardDolphinOne)
   end
   local l_20_1 = getglobalvar("failedGestureOne")
   if l_20_1 ~= nil then
      return 1
   end
   if not isVisibleByName("Reward Message") then
      BFLOG("rewarded dolphin")
      return 1
   end
   return 0
end

rewardDolphinOne = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   BFLOG("complete reward dolphin")
   return 1
end

rewardDolphinOneSuccess = l_0_0
l_0_0 = function(l_22_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectJumpTwo)
      local l_22_1 = queryObject("BFScenarioMgr")
      if l_22_1 ~= nil then
         l_22_1:UI_SHOW("Dummy Jump Suspension Bar")
         l_22_1:UI_SHOW("Dummy Jump Suspension Bar Lock")
         l_22_1:UI_SHOW("Dummy Jump Hoop")
         l_22_1:UI_SHOW("Dummy Jump Hoop Lock")
         l_22_1:UI_SHOW("Dummy Ram Ball")
         l_22_1:UI_SHOW("Dummy Ram Ball Lock")
         l_22_1:UI_SHOW("Dummy Beach")
         l_22_1:UI_SHOW("Dummy Beach Lock")
         l_22_1:UI_SHOW("Dummy Teather Ball")
         l_22_1:UI_SHOW("Dummy Teather Ball Lock")
         l_22_1:UI_SHOW("Dummy WaterWalk")
         l_22_1:UI_SHOW("Dummy WaterWalk Lock")
         l_22_1:UI_DISABLE("Camera Set")
      end
      if getComponent({"Player Training Components", "player training drag"}) ~= nil then
         getComponent({"Player Training Components", "player training drag"}):UI_HIDE()
      end
   end
   local l_22_1 = getComponent
   local l_22_2 = {"close training panel"}
   l_22_1 = l_22_1(l_22_2)
   if l_22_1 ~= nil then
      l_22_2(l_22_1)
      l_22_2 = l_22_1:UI_DISABLE
   end
   l_22_2 = countType
   l_22_2 = l_22_2("gesture_tracer")
   if l_22_2 >= 1 then
      return 1
   end
   if isVisibleByName("wait message layout") == true or isVisibleByName("start message layout") == true then
      return 1
   end
   if not isCurrentMode("mode_fp_training") then
      local l_22_3 = queryObject("BFScenarioMgr")
      if l_22_3 ~= nil then
         l_22_3:UI_ENABLE("Camera Set")
      end
      local l_22_4 = queryObject("ZTMode")
      if l_22_4 ~= nil then
         BFLOG("here i am")
         l_22_4:sendMessage("ZT_SETMODE", "mode_first_person")
         l_22_4:sendMessage("ZT_SETMODE", "mode_fp_training")
         local l_22_5 = findType("TrainingArea")
         local l_22_6 = resolveTable(l_22_5[1].value)
         l_22_4:sendMessage("ZT_FP_SETTRAININGAREA", l_22_6)
         local l_22_7 = findType("DolphinBottlenose")
         local l_22_8 = resolveTable(l_22_7[1].value)
         l_22_4:sendMessage("ZT_FP_SETANIMALTOTRAIN", l_22_8)
         l_22_4:sendMessage("ZT_SET_SPLINETOTRACE", nil)
         initTutorialRuleInfo(ruledata.selectJumpTwo)
         local l_22_9 = queryObject("BFScenarioMgr")
         if l_22_9 ~= nil then
            l_22_9:UI_SHOW("Dummy Jump Suspension Bar")
            l_22_9:UI_SHOW("Dummy Jump Suspension Bar Lock")
            l_22_9:UI_SHOW("Dummy Jump Hoop")
            l_22_9:UI_SHOW("Dummy Jump Hoop Lock")
            l_22_9:UI_SHOW("Dummy Ram Ball")
            l_22_9:UI_SHOW("Dummy Ram Ball Lock")
            l_22_9:UI_SHOW("Dummy Beach")
            l_22_9:UI_SHOW("Dummy Beach Lock")
            l_22_9:UI_SHOW("Dummy Teather Ball")
            l_22_9:UI_SHOW("Dummy Teather Ball Lock")
            l_22_9:UI_SHOW("Dummy WaterWalk")
            l_22_9:UI_SHOW("Dummy WaterWalk Lock")
            l_22_9:UI_DISABLE("Camera Set")
         end
      end
   end
   return 0
end

selectJumpTwo = l_0_0
l_0_0 = function()
   BFLOG("complete select JumpTwo")
   tutorialgoalcompleted()
   return 1
end

selectJumpTwoSuccess = l_0_0
l_0_0 = function()
   BFLOG("init gesture one")
   initTutorialRuleInfo(ruledata.makeGestureTwo)
   return 1
end

makeGestureTwo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   BFLOG("complete gesture one")
   return 1
end

makeGestureTwoSuccess = l_0_0
l_0_0 = function(l_26_arg0)
   if ruleinitialized == 0 then
      local l_26_1 = queryObject("ZTMode")
      if l_26_1 ~= nil then
         l_26_1:sendMessage("ZT_SETMODE", "mode_fp_training")
      end
      local l_26_2 = queryObject("UIRoot")
      if l_26_2 then
         local l_26_3 = l_26_2:UI_GET_CHILD("tutorial layout")
         if l_26_3 ~= nil then
            l_26_3:UI_SET_MODAL(false)
         end
         l_26_3 = l_26_2:UI_GET_CHILD("First Person")
         if l_26_3 ~= nil then
            l_26_3:UI_HIDE()
         end
      end
      local l_26_3 = findType("DolphinBottlenose")
      local l_26_4 = resolveTable(l_26_3[1].value)
      if l_26_4 ~= nil then
         l_26_arg0.trickLevel = getTrickSkillLevel(l_26_4, "DolphinJump")
         BFLOG("tirck level" .. l_26_arg0.trickLevel)
      else
         BFLOG("dolphin is nil")
      end
      ruleinitialized = 1
   end
   if isVisibleByName("training failed layout") then
      setglobalvar("failedGestureTwo", "true")
      return 1
   end
   if isVisibleByName("Reward Message") or hasSpeciesWithTrickOfLevelX("DolphinBottlenose", "DolphinJump", l_26_arg0.trickLevel + 1) then
      BFLOG("gesture two done")
      return 1
   end
   if not isCurrentMode("mode_fp_training") then
      local l_26_1 = queryObject("BFScenarioMgr")
      if l_26_1 ~= nil then
         l_26_1:UI_ENABLE("Camera Set")
      end
      local l_26_2 = queryObject("ZTMode")
      if l_26_2 ~= nil then
         BFLOG("here i am")
         l_26_2:sendMessage("ZT_SETMODE", "mode_first_person")
         l_26_2:sendMessage("ZT_SETMODE", "mode_fp_training")
         local l_26_3 = findType("TrainingArea")
         local l_26_4 = resolveTable(l_26_3[1].value)
         l_26_2:sendMessage("ZT_FP_SETTRAININGAREA", l_26_4)
         local l_26_5 = findType("DolphinBottlenose")
         local l_26_6 = resolveTable(l_26_5[1].value)
         l_26_2:sendMessage("ZT_FP_SETANIMALTOTRAIN", l_26_6)
         l_26_2:sendMessage("ZT_FP_SETGESTUREBYTRICK", "DolphinJump")
      end
   end
   return 0
end

checkRewardText2 = l_0_0
l_0_0 = function()
   BFLOG("complete gesture two")
   tutorialgoalcompleted()
   return 1
end

checkRewardText2Success = l_0_0
l_0_0 = function(l_28_arg0)
   BFLOG("reward dolphin")
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.rewardDolphinTwo)
   end
   local l_28_1 = getglobalvar("failedGestureTwo")
   if l_28_1 ~= nil then
      return 1
   end
   if not isVisibleByName("Reward Message") then
      BFLOG("rewarded dolphin")
      return 1
   end
   return 0
end

rewardDolphinTwo = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   BFLOG("complete reward dolphin")
   return 1
end

rewardDolphinTwoSuccess = l_0_0
l_0_0 = function(l_30_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.closePanel)
      local l_30_1 = getComponent
      local l_30_2 = {"close training panel"}
      l_30_1 = l_30_1(l_30_2)
      if l_30_1 ~= nil then
         l_30_2(l_30_1)
         l_30_2 = l_30_1:UI_ENABLE
      end
      l_30_2 = queryObject
      l_30_2 = l_30_2("BFScenarioMgr")
      if l_30_2 ~= nil then
         l_30_2:UI_SHOW("Dummy Jump")
         l_30_2:UI_SHOW("Dummy Jump Lock")
      end
   end
   if isVisibleByName("player training layout") == true then
      l_30_arg0.panelshown = 1
      return 0
   end
   if l_30_arg0.panelshown ~= nil and isVisibleByName("player training layout") == false then
      return 1
   end
   return 0
end

closePanel = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_31_0 = queryObject("BFScenarioMgr")
   if l_31_0 ~= nil then
      l_31_0:UI_HIDE("Dummy Jump")
      l_31_0:UI_HIDE("Dummy Jump Lock")
      l_31_0:UI_HIDE("Dummy Jump Suspension Bar")
      l_31_0:UI_HIDE("Dummy Jump Suspension Bar Lock")
      l_31_0:UI_HIDE("Dummy Jump Hoop")
      l_31_0:UI_HIDE("Dummy Jump Hoop Lock")
      l_31_0:UI_HIDE("Dummy Ram Ball")
      l_31_0:UI_HIDE("Dummy Ram Ball Lock")
      l_31_0:UI_HIDE("Dummy Beach")
      l_31_0:UI_HIDE("Dummy Beach Lock")
      l_31_0:UI_HIDE("Dummy Teather Ball")
      l_31_0:UI_HIDE("Dummy Teather Ball Lock")
      l_31_0:UI_HIDE("Dummy WaterWalk")
      l_31_0:UI_HIDE("Dummy WaterWalk Lock")
   end
   return 1
end

closePanelSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openStaffPanel)
      UIenable("staff")
      showUI("firstperson", false)
   end
   if isAlternateByName("staff") == true then
      return 1
   end
   return 0
end

openStaffPanel = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

openStaffPanelSuccess = l_0_0
l_0_0 = function(l_34_arg0)
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.placeTrainer)
      UIenable("Staff Tab")
      l_34_arg0.Trainercount = countType("Trainer")
      local l_34_1 = queryObject("ZTMode")
      if l_34_1 then
         l_34_1:sendMessage("ZT_SETMODE", "mode_placement")
         l_34_1:sendMessage("ZT_SETSINGLEOBJECTPLACEMENT", true)
      end
   end
   if l_34_arg0.Trainercount < countType("Trainer") then
      return 1
   end
   return 0
end

placeTrainer = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_35_0 = queryObject("ZTMode")
   if l_35_0 then
      l_35_0:sendMessage("ZT_SETMODE", "mode_selection")
   end
   local l_35_1 = getComponent
   local l_35_2 = {"Fire Staff"}
   l_35_1 = l_35_1(l_35_2)
   if l_35_1 ~= nil then
      l_35_2(l_35_1)
      l_35_2 = l_35_1:UI_DISABLE
   end
   l_35_2 = 1
   return l_35_2
end

placeTrainerSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectTrainer)
      if ruledata.selectDolphin.rulename then
         showRule(ruledata.selectDolphin.rulename)
      end
      local l_36_0 = getComponent
      local l_36_1 = {"staff"}
      l_36_0 = l_36_0(l_36_1)
      if l_36_0 ~= nil then
         l_36_1(l_36_0)
         l_36_1 = l_36_0:UI_ACTIVATE_OFF
         l_36_1(l_36_0)
         l_36_1 = l_36_0:UI_DISABLE
      end
   end
   local l_36_0 = getSelectedEntity()
   if l_36_0 ~= nil and isEntityKindOf(l_36_0, "Trainer") then
      return 1
   end
   local l_36_1 = getComponent
   local l_36_2 = {"Trainer Info", "Fire Staff"}
   l_36_1 = l_36_1(l_36_2)
   if l_36_1 ~= nil then
      l_36_2(l_36_1)
      l_36_2 = l_36_1:UI_DISABLE
   end
   l_36_2 = getComponent
   local l_36_3 = {"Trainer Info", "PickUp"}
   l_36_2 = l_36_2(l_36_3)
   if l_36_2 ~= nil then
      l_36_3(l_36_2)
      l_36_3 = l_36_2:UI_DISABLE
   end
   l_36_3 = getComponent
   local l_36_4 = {"Trainer Info", "zoopedia link"}
   l_36_3 = l_36_3(l_36_4)
   if l_36_3 ~= nil then
      l_36_4(l_36_3)
      l_36_4 = l_36_3:UI_DISABLE
   end
   l_36_4 = 0
   return l_36_4
end

selectTrainer = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectTrainerSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.selectTrainingTab)
   end
   if isAlternateByName("Keeper Training Tab") == true then
      return 1
   end
   local l_38_0 = getComponent
   local l_38_1 = {"Trainer Info", "Fire Staff"}
   l_38_0 = l_38_0(l_38_1)
   if l_38_0 ~= nil then
      l_38_1(l_38_0)
      l_38_1 = l_38_0:UI_DISABLE
   end
   l_38_1 = getComponent
   local l_38_2 = {"Trainer Info", "PickUp"}
   l_38_1 = l_38_1(l_38_2)
   if l_38_1 ~= nil then
      l_38_2(l_38_1)
      l_38_2 = l_38_1:UI_DISABLE
   end
   l_38_2 = getComponent
   local l_38_3 = {"Trainer Info", "zoopedia link"}
   l_38_2 = l_38_2(l_38_3)
   if l_38_2 ~= nil then
      l_38_3(l_38_2)
      l_38_3 = l_38_2:UI_DISABLE
   end
   l_38_3 = verifyEntitySelected
   l_38_3("Trainer", "Trainer Info")
   l_38_3 = 0
   return l_38_3
end

selectTrainingTab = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

selectTrainingTabSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.clickAddAssignment)
   end
   if isAlternateByName("Add Animal Assignment") == true then
      return 1
   end
   local l_40_0 = getComponent
   local l_40_1 = {"Trainer Info", "Fire Staff"}
   l_40_0 = l_40_0(l_40_1)
   if l_40_0 ~= nil then
      l_40_1(l_40_0)
      l_40_1 = l_40_0:UI_DISABLE
   end
   l_40_1 = getComponent
   local l_40_2 = {"Trainer Info", "PickUp"}
   l_40_1 = l_40_1(l_40_2)
   if l_40_1 ~= nil then
      l_40_2(l_40_1)
      l_40_2 = l_40_1:UI_DISABLE
   end
   l_40_2 = getComponent
   local l_40_3 = {"Trainer Info", "zoopedia link"}
   l_40_2 = l_40_2(l_40_3)
   if l_40_2 ~= nil then
      l_40_3(l_40_2)
      l_40_3 = l_40_2:UI_DISABLE
   end
   l_40_3 = verifyEntitySelected
   l_40_3("Trainer", "Trainer Info")
   l_40_3 = 0
   return l_40_3
end

clickAddAssignment = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

clickAddAssignmentSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.clickDolphin)
   end
   local l_42_0 = findType("Trainer")
   for l_42_1 = 1, table.getn(l_42_0) do
      if resolveTable(l_42_0[l_42_1].value):BFG_GET_COMPONENT("ZTAIStaffAssignmentComponent") ~= nil then
         BFLOG("num assignments: " .. resolveTable(l_42_0[l_42_1].value):BFG_GET_COMPONENT("ZTAIStaffAssignmentComponent"):ZT_GET_NUM_ASSIGNMENTS())
         if resolveTable(l_42_0[l_42_1].value):BFG_GET_COMPONENT("ZTAIStaffAssignmentComponent"):ZT_GET_NUM_ASSIGNMENTS() >= 1 then
            return 1
         else
            BFLOG("Failed to get ZTAIStaffAssignmentComponent")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
      local l_42_1 = getComponent
      l_42_2 = {"Trainer Info", "Fire Staff"}
      l_42_1 = l_42_1(l_42_2)
      if l_42_1 ~= nil then
         l_42_2(l_42_1)
         l_42_2 = l_42_1:UI_DISABLE
      end
      l_42_2 = getComponent
      l_42_3 = {"Trainer Info", "PickUp"}
      l_42_2 = l_42_2(l_42_3)
      if l_42_2 ~= nil then
         l_42_3(l_42_2)
         l_42_3 = l_42_2:UI_DISABLE
      end
      l_42_3 = getComponent
      local l_42_4 = {"Trainer Info", "zoopedia link"}
      l_42_3 = l_42_3(l_42_4)
      if l_42_3 ~= nil then
         l_42_4(l_42_3)
         l_42_4 = l_42_3:UI_DISABLE
      end
      l_42_4 = verifyEntitySelected
      l_42_4("Trainer", "Trainer Info")
      l_42_4 = verifyButton
      local l_42_5 = {"Add Animal Assignment"}
      l_42_4(l_42_5)
      l_42_4 = 0
      return l_42_4
end

clickDolphin = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   local l_43_0 = queryObject("ZTMode")
   if l_43_0 then
      l_43_0:sendMessage("ZT_SETMODE", "mode_staff_assign")
      l_43_0:sendMessage("ZT_ASSIGN_KEEPER", "off")
   end
   return 1
end

clickDolphinSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.clickAnimalButton)
   end
   if isAlternateByName("assignment button") == true then
      return 1
   end
   local l_44_0 = getComponent
   local l_44_1 = {"Fire Staff"}
   l_44_0 = l_44_0(l_44_1)
   if l_44_0 ~= nil then
      l_44_1(l_44_0)
      l_44_1 = l_44_0:UI_DISABLE
   end
   l_44_1 = getComponent
   local l_44_2 = {"Add Animal Assignment"}
   l_44_1 = l_44_1(l_44_2)
   if l_44_1 ~= nil then
      l_44_2(l_44_1)
      l_44_2 = l_44_1:UI_DISABLE
   end
   l_44_2 = verifyEntitySelected
   l_44_2("Trainer", "Trainer Info")
   l_44_2 = 0
   return l_44_2
end

clickAnimalButton = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

clickAnimalButtonSuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.trainingMultipleAnimals)
   end
   return 1
end

trainingMultipleAnimals = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

trainingMultipleAnimalsSuccess = l_0_0
l_0_0 = function()
   local l_48_0 = queryObject("ZTMode")
   if l_48_0 then
      l_48_0:sendMessage("ZT_SET_OVERRIDE_UI_FLAG", false)
   end
   return 1
end

endscenario = l_0_0
l_0_0 = function()
   setuservar("xp2_Tutorial3", "completed")
   showtutorialwin("xp2_tutorial3:tutorial_complete", "xp2_Tutorial4")
   return 1
end

endscenariosuccess = l_0_0

