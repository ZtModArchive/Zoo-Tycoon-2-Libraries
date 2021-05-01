include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/photoutil.lua")
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "*********I'm here so show overview panel!********")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

setinitialzoostatedisable = function(l_2_arg0)
   local l_2_1 = queryObject("BFScenarioMgr")
   if l_2_1 then
      l_2_1:UI_DISABLE("release to wild")
      l_2_1:UI_DISABLE("put up for adoption")
   end
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalbiomeplacement = function()
   if howManyAnimalsInZooDirect() == 3 and allNeedMeetsThreshold("animal", "environment", 20) == true then
      return 1
   end
   return 0
end

completebiomeplacement = function()
   showprimarygoals()
end

evalstayopen = function(l_5_arg0)
   BFLOG(SYSTRACE, "evalstayopen")
   if l_5_arg0.stayopentimer == nil then
      l_5_arg0.stayopentimer = getCurrentMonth()
      l_5_arg0.stayopentimerday = getCurrentTimeOfDay()
   end
   if countType("BearPolar_Adult_F") < 1 or countType("Lion_Adult_M") < 1 or countType("Hippopotamus_Adult_F") < 1 then
      return -1
   end
   local l_5_1 = getCurrentMonth()
   if (l_5_arg0.stayopentimer + 1 <= l_5_1 and l_5_arg0.stayopentimerday <= getCurrentTimeOfDay()) or l_5_arg0.stayopentimer + 2 <= l_5_1 then
      if countTypeDirect("animal") < 3 then
         return -1
         -- Tried to add an 'end' here but it's incorrect
         return 1
         -- Tried to add an 'end' here but it's incorrect
end

failstayopen = function()
   showscenariofail("ZookeeperTraining:ZookeeperTraininggoalFailed", "ZookeeperTrainingscenario1")
end

completestayopen = function()
   local l_7_0 = getuservar("ZookeeperTrainingscenario2")
   if l_7_0 ~= "completed" then
      setuservar("ZookeeperTrainingscenario2", "unlocked")
   end
   setuservar("ZookeeperTrainingscenario1", "completed")
   showscenariowin("ZookeeperTraining:ZookeeperTrainingSuccessoverview", "ZookeeperTrainingscenario2")
end

evalzebrabiome = function()
   if countType("ZebraCommon") == 2 and allNeedMeetsThreshold("ZebraCommon", "environment", 10) == true then
      return 1
   end
   return 0
end

completezebrabiome = function()
   showprimarygoals()
end

evalzebrafoodwater = function()
   if thisManyExist("ZebraCommon", 2) == true and allNeedSatisfied("ZebraCommon", "thirst") == true and allNeedSatisfied("ZebraCommon", "hunger") == true then
      return 1
   end
end

completezebrafoodwater = function()
end

completezebragoals = function()
   BFLOG(SYSTRACE, "completezebragoals")
   showRule("goaltwo")
   completeshowoverview()
end

evalresearchstands = function()
   BFLOG(SYSTRACE, "evalresearchstands")
   if thisManyExist("foodstand_hotdog", 1) == true and thisManyExist("foodstand_soda", 1) == true then
      return 1
   end
   return 0
end

completeresearchstands = function()
   showRule("goalthree")
   local l_14_0 = queryObject("UIRoot")
   if l_14_0 then
      local l_14_1 = l_14_0:UI_GET_CHILD("photo challenges layout")
      if l_14_1 then
         local l_14_2 = l_14_1:UI_GET_CHILD("decline")
         if l_14_2 then
            l_14_2:UI_HIDE()
         else
            BFLOG(SYSTRACE, "error getting decline button.")
         end
      else
         BFLOG(SYSTRACE, "Couldn't get photo challenge layout")
      end
      -- Tried to add an 'end' here but it's incorrect
   end
   completeshowoverview()
end

evalzebrapictures = function(l_15_arg0)
   if l_15_arg0.initphoto == nil then
      local l_15_1 = queryObject("ZTPhotoChallengesComponent")
      if l_15_1 then
         l_15_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("ZookeeperCampaignPhotos")
      end
      l_15_arg0.initphoto = 1
   end
   local l_15_1 = queryObject("ZTPhotoChallengesComponent")
   if l_15_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completezebrapictures = function()
   showRule("goalfour")
   completeshowoverview()
   letjaguarsloose = 1
end

scoreZebraScratchingPost = function(l_17_arg0)
   if scoreAnyEntityTypeDoingTarget(l_17_arg0, "ZebraCommon", "enrichment") >= 1 then
      return 1
   end
   return 0
end

scoreZebraRunning = function(l_18_arg0)
   BFLOG(SYSTRACE, "scoreZebraRunning")
   if numEntitiesDoingAnim(l_18_arg0, "ZebraCommon", "Run_Ahead") >= 1 then
      return 1
   elseif numEntitiesDoingAnim(l_18_arg0, "ZebraCommon", "Run_TurnLeftA") >= 1 then
      return 1
   elseif numEntitiesDoingAnim(l_18_arg0, "ZebraCommon", "Run_TurnLeftB") >= 1 then
      return 1
   elseif numEntitiesDoingAnim(l_18_arg0, "ZebraCommon", "Run_TurnRightA") >= 1 then
      return 1
   elseif numEntitiesDoingAnim(l_18_arg0, "ZebraCommon", "Run_TurnRightB") >= 1 then
      return 1
   end
   return 0
end

evaljaguarbasicneeds = function(l_19_arg0)
   if letjaguarsloose ~= nil then
      placeObject("Jaguar_Adult_M", 50, 25, 0)
      placeObject("Jaguar_Adult_F", 50, 25, 0)
      local l_19_1 = findType("Jaguar")
      local l_19_2 = 0
      l_19_2 = table.getn(l_19_1)
      for l_19_3 = 1, l_19_2 do
         local l_19_6 = resolveTable(l_19_1[l_19_3].value)
         if l_19_6 ~= nil then
            local l_19_7 = math.random(3)
            local l_19_8 = {}
            if l_19_7 == 1 then
               local l_19_9
               l_19_8, l_19_9 = l_19_9, {_type = "BFGFloatAttribute", name = "hygiene", value = 80}
            elseif l_19_7 == 2 then
               local l_19_9
               l_19_8, l_19_9 = l_19_9, {_type = "BFGFloatAttribute", name = "privacy", value = 80}
            else
               local l_19_9
               l_19_8, l_19_9 = l_19_9, {_type = "BFGFloatAttribute", name = "stimulation", value = 80}
            end
            l_19_6:BFG_SET_ATTR_FLOAT(l_19_8)
            crateEntity(l_19_6)
         end
      end
      l_19_arg0.jaguartimer = getCurrentMonth()
      l_19_arg0.jaguartimerday = getCurrentTimeOfDay()
      letjaguarsloose = nil
   end
   local l_19_1 = getCurrentMonth()
   local l_19_2 = getCurrentTimeOfDay()
   if l_19_arg0.jaguartimer + 2 <= l_19_1 and l_19_arg0.jaguartimerday <= l_19_2 then
      return -1
   end
   local l_19_3 = findTypeDirect("Jaguar")
   local l_19_4 = 0
   l_19_4 = table.getn(l_19_3)
   if l_19_4 == 2 then
      for l_19_5 = 1, l_19_4 do
         local l_19_8 = resolveTable(l_19_3[l_19_5].value)
         if basicNeedsSatisfied(l_19_8) == false then
            return 0
         end
      end
      return 1
   end
   return 0
end

completejaguarbasicneeds = function()
   showRule("goalfive")
   showprimarygoals()
end

failjaguarbasicneeds = function()
   showscenariofail("ZookeeperTraining:StartUpGoalFourFailed", "ZookeeperTrainingscenario2")
end

evaljaguaradvancedneeds = function(l_22_arg0)
   if l_22_arg0.initjaguar == nil then
      l_22_arg0.jaguartimer = getCurrentMonth()
      l_22_arg0.jaguartimerday = getCurrentTimeOfDay()
      l_22_arg0.initjaguar = 1
   end
   local l_22_1 = getCurrentMonth()
   local l_22_2 = getCurrentTimeOfDay()
   if l_22_arg0.jaguartimer + 2 <= l_22_1 and l_22_arg0.jaguartimerday <= l_22_2 then
      return -1
   end
   local l_22_3 = findType("Jaguar")
   local l_22_4 = 0
   l_22_4 = table.getn(l_22_3)
   if l_22_4 == 2 then
      for l_22_5 = 1, l_22_4 do
         local l_22_8 = resolveTable(l_22_3[l_22_5].value)
         if advancedNeedsSatisfied(l_22_8) == false then
            return 0
         end
      end
      return 1
   end
   return 0
end

completejaguaradvancedneeds = function()
   local l_23_0 = getuservar("ZookeeperTrainingscenario3")
   if l_23_0 ~= "completed" then
      setuservar("ZookeeperTrainingscenario3", "unlocked")
   end
   setuservar("ZookeeperTrainingscenario2", "completed")
   showscenariowin("ZookeeperTraining:StartUpSuccessFiveoverview", "ZookeeperTrainingscenario3")
end

failjaguaradvancedneeds = function()
   showscenariofail("ZookeeperTraining:StartUpGoalFiveFailed", "ZookeeperTrainingscenario2")
end

completestartup = function()
end

failedstartup = function()
end

evaldonations = function()
   local l_27_0 = animalsInZoo()
   local l_27_1 = 0
   if l_27_0 ~= nil then
      local l_27_2 = table.getn(l_27_0)
      for l_27_3 = 1, l_27_2 do
         l_27_1 = l_27_1 + getDonations(l_27_0[l_27_3])
      end
   end
   l_27_1 = l_27_1 + getDonations("Education")
   BFLOG(SYSTRACE, "current donation total: " .. l_27_1 .. ".")
   if l_27_1 >= 5000 then
      return 1
   end
   return 0
end

completedonations = function()
   BFLOG(SYSTRACE, "completed zookeepertrainingscenario3")
   setuservar("flowerpostlock", "true")
   local l_28_0 = getlocidfromspecies("flowerpost_df")
   local l_28_1 = getLocID("itemunlock:newitemgeneral") .. l_28_0
   genericokpaneltext(nil, l_28_1)
   setuservar("ZookeeperTrainingscenario3", "completed")
   showscenariowin("ZookeeperTraining:BeyondStartUpSuccessoverview", nil)
end


