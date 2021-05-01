include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/token.lua")
XTCS2_SCENARIO_ANIMAL = "Warrah"
XTCS2_SCENARIO_DISEASE_DELAY = 20
XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY = 90
XTCS2_REWARD1 = 2500
XTCS2_REWARD2 = 5000
XTCS2_REWARD3 = 5000
XTCS2_REWARD4 = 10000
XTCS2_REWARD5 = 20000
XTCS2_OPTIONAL_REWARD1 = 20000
XTCS2_OPTIONAL_REWARD2 = 20000
XTCS2_DONATION_GOAL1 = 1500
XTCS2_DONATION_GOAL2 = 2000
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   completeshowoverview()
   showUI("goal panel", true)
   setglobalvar("cp2scen2_numAnimals", tostring(0))
   return 1
end

failAnimalDeath = function()
   showscenariofail("ExtinctCampaign:DiseaseAnimalDeathFail", "cp2scen2")
end

evalExtinctAnimals = function(l_3_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 1 ****************")
   local l_3_1 = getExtinctSpeciesList()
   local l_3_2 = table.getn(l_3_1)
   if l_3_2 < 3 then
      return 0
   end
   local l_3_3 = getExtinctEntityList()
   local l_3_4 = table.getn(l_3_3)
   for l_3_5 = 1, l_3_4 do
      BFLOG(SYSTRACE, "**************** checking needs ****************")
      local l_3_8 = resolveTable(l_3_3[l_3_5].value)
      if not basicNeedsMeetThreshold(l_3_8, 60) then
         return 0
      end
   end
   return 1
end

completeExtinctAnimals = function()
   BFLOG(SYSTRACE, "**************** complete goal 1 ****************")
   giveCash(XTCS2_REWARD1)
   showRule("ExtinctDonations1Goal")
   completeshowoverview()
end

evalExtinctDonations1 = function(l_5_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 2 ****************")
   if l_5_arg0.startingExtinctDonations1 == nil then
      l_5_arg0.startingExtinctDonations1 = getDonationsByEndangerment("Extinct")
      l_5_arg0.endingExtinctDonations1 = l_5_arg0.startingExtinctDonations1 + XTCS2_DONATION_GOAL1
   end
   if l_5_arg0.endingExtinctDonations1 <= getDonationsByEndangerment("Extinct") then
      return 1
   end
   return 0
end

completeExtinctDonations1 = function(l_6_arg0)
   BFLOG(SYSTRACE, "**************** complete goal 2 ****************")
   local l_6_1 = XTCS2_SCENARIO_ANIMAL
   l_6_1 = l_6_1 .. "_Adult_"
   if math.random(2) == 0 then
      l_6_1 = l_6_1 .. "M"
   else
      l_6_1 = l_6_1 .. "F"
   end
   local l_6_2 = placeCratedObjectAtGate(l_6_1)
   setglobalvar("diseaseScenarioGiftAnimalType", l_6_1)
   BFLOG("setglobalvar diseaseScenarioGiftAnimalID = " .. l_6_1)
   setglobalvar("diseaseScenarioGiftAnimalID", tostring(l_6_2))
   BFLOG("setglobalvar diseaseScenarioGiftAnimalID = " .. l_6_2)
   completeshowoverview()
end

giveDisease = function(l_7_arg0)
   local l_7_1
   disease, l_7_1 = l_7_1, {key = "ExtinctFlu", val = l_7_arg0}
   l_7_1 = BFLOG
   l_7_1("Attempting to give disease")
   l_7_1 = queryObject
   l_7_1 = l_7_1("ZTDiseaseMgr")
   if l_7_1 ~= nil then
      return l_7_1:ZT_FORCE_DISEASE(disease)
   else
      BFLOG("Manager is nil")
   end
end

evalGiftAnimalGetsSick = function(l_8_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 3 ****************")
   local l_8_1 = nil
   local l_8_2 = tonumber(getglobalvar("diseaseScenarioGiftAnimalID"))
   if l_8_2 ~= nil then
      BFLOG(SYSTRACE, "========= Found gift animal =========")
      l_8_1 = findEntityByID(l_8_2)
      if l_8_1 == nil then
         BFLOG("Gift animal is no longer in the zoo!")
         return -1
      elseif isCratedEntity(l_8_1) and l_8_arg0.diseaseTimestamp == nil then
         BFLOG("Gift animal is still in its crate")
         return 0
      end
   end
   if l_8_arg0.diseaseTimestamp == nil or getCurrentSimTime() < l_8_arg0.diseaseTimestamp then
      BFLOG(SYSTRACE, "========= Disease timestamp is nil or in the future =========")
      l_8_arg0.diseaseTimestamp = getCurrentSimTime()
   else
      local l_8_3 = getCurrentSimTime() - l_8_arg0.diseaseTimestamp
      BFLOG(SYSTRACE, "========= timepassed is " .. l_8_3 .. " sec =========")
      if XTCS2_SCENARIO_DISEASE_DELAY <= l_8_3 then
         if l_8_1 ~= nil then
            local l_8_4 = getName(l_8_1)
            if giveDisease(l_8_4) then
               BFLOG("Disease given!!")
               return 1
            else
               BFLOG(SYSTRACE, "========= gift animal is nil =========")
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            return 0
end

completeGiftAnimalGetsSick = function(l_9_arg0)
   BFLOG(SYSTRACE, "**************** complete goal 3 ****************")
   local l_9_1 = getExtinctEntityList()
   local l_9_2 = table.getn(l_9_1)
   if l_9_2 > 2 then
      local l_9_3 = -1
      local l_9_4, l_9_5 = nil, nil
      local l_9_6 = tonumber(getglobalvar("diseaseScenarioGiftAnimalID"))
      while l_9_3 == l_9_6 do
         repeat
            animal = resolveTable(l_9_1[math.random(l_9_2)].value)
            l_9_3 = animal:BFG_GET_ENTITY_ID()
         until l_9_3 ~= -1
      end
      while l_9_4 == l_9_5 do
         repeat
            repeat
               l_9_5 = resolveTable(l_9_1[math.random(l_9_2)].value)
               l_9_3 = l_9_5:BFG_GET_ENTITY_ID()
            until l_9_3 ~= -1
         until l_9_3 ~= l_9_6
      end
      token = {}
      local l_9_7 = token
      local l_9_8 = {"value"}
      l_9_7[1] = l_9_8
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[2] = l_9_8
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[3] = l_9_8
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[4] = l_9_8
      l_9_7 = token
      l_9_7 = l_9_7[1]
      l_9_8 = getName
      l_9_8 = l_9_8(l_9_4)
      l_9_7.value = l_9_8
      l_9_7 = token
      l_9_7 = l_9_7[2]
      l_9_7.value = "t_Disease"
      l_9_7 = token
      l_9_7 = l_9_7[3]
      l_9_8 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_8 = l_9_8 + 30
      l_9_7.value = l_9_8
      l_9_7 = token
      l_9_7 = l_9_7[4]
      l_9_8 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_7.value = l_9_8
      l_9_7 = giveToken
      l_9_8 = token
      l_9_7(l_9_8, 0)
      l_9_7 = token
      l_9_7 = l_9_7[1]
      l_9_7 = l_9_7.value
      if l_9_7 ~= nil then
         l_9_7 = BFLOG
         l_9_8 = SYSTRACE
         l_9_7(l_9_8, "========= " .. token[1].value .. " seeded with Extinct Flu =========")
      end
      l_9_7 = {}
      token = l_9_7
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[1] = l_9_8
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[2] = l_9_8
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[3] = l_9_8
      l_9_7 = token
      l_9_8 = {"value"}
      l_9_7[4] = l_9_8
      l_9_7 = token
      l_9_7 = l_9_7[1]
      l_9_8 = getName
      l_9_8 = l_9_8(l_9_5)
      l_9_7.value = l_9_8
      l_9_7 = token
      l_9_7 = l_9_7[2]
      l_9_7.value = "t_Disease"
      l_9_7 = token
      l_9_7 = l_9_7[3]
      l_9_8 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_8 = l_9_8 + 30
      l_9_7.value = l_9_8
      l_9_7 = token
      l_9_7 = l_9_7[4]
      l_9_8 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_7.value = l_9_8
      l_9_7 = giveToken
      l_9_8 = token
      l_9_7(l_9_8, 0)
      l_9_7 = token
      l_9_7 = l_9_7[1]
      l_9_7 = l_9_7.value
      if l_9_7 ~= nil then
         l_9_7 = BFLOG
         l_9_8 = SYSTRACE
         l_9_7(l_9_8, "========= " .. token[1].value .. " seeded with Extinct Flu =========")
      end
   end
   local l_9_3 = findType("Guest")
   local l_9_4 = table.getn(l_9_3)
   if l_9_4 >= 2 then
      local l_9_5 = math.random(l_9_4)
      local l_9_6 = math.random(l_9_4)
      while l_9_6 == l_9_5 do
         l_9_6 = math.random(l_9_4)
      end
      local l_9_7 = resolveTable(l_9_3[l_9_5].value)
      token = {}
      local l_9_8 = token
      local l_9_9 = {"value"}
      l_9_8[1] = l_9_9
      l_9_8 = token
      l_9_9 = {"value"}
      l_9_8[2] = l_9_9
      l_9_8 = token
      l_9_9 = {"value"}
      l_9_8[3] = l_9_9
      l_9_8 = token
      l_9_9 = {"value"}
      l_9_8[4] = l_9_9
      l_9_8 = token
      l_9_8 = l_9_8[1]
      l_9_9 = getName
      l_9_9 = l_9_9(l_9_7)
      l_9_8.value = l_9_9
      l_9_8 = token
      l_9_8 = l_9_8[2]
      l_9_8.value = "t_Disease"
      l_9_8 = token
      l_9_8 = l_9_8[3]
      l_9_9 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_9 = l_9_9 + 30
      l_9_8.value = l_9_9
      l_9_8 = token
      l_9_8 = l_9_8[4]
      l_9_9 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_8.value = l_9_9
      l_9_8 = giveToken
      l_9_9 = token
      l_9_8(l_9_9, 0)
      l_9_8 = BFLOG
      l_9_9 = SYSTRACE
      l_9_8(l_9_9, "========= " .. getName(l_9_7) .. " seeded with Extinct Flu =========")
      l_9_8 = resolveTable
      l_9_9 = l_9_3[l_9_6]
      l_9_9 = l_9_9.value
      l_9_8 = l_9_8(l_9_9)
      l_9_9 = {}
      token = l_9_9
      l_9_9 = token
      local l_9_10 = {"value"}
      l_9_9[1] = l_9_10
      l_9_9 = token
      l_9_10 = {"value"}
      l_9_9[2] = l_9_10
      l_9_9 = token
      l_9_10 = {"value"}
      l_9_9[3] = l_9_10
      l_9_9 = token
      l_9_10 = {"value"}
      l_9_9[4] = l_9_10
      l_9_9 = token
      l_9_9 = l_9_9[1]
      l_9_10 = getName
      l_9_10 = l_9_10(l_9_8)
      l_9_9.value = l_9_10
      l_9_9 = token
      l_9_9 = l_9_9[2]
      l_9_9.value = "t_Disease"
      l_9_9 = token
      l_9_9 = l_9_9[3]
      l_9_10 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_10 = l_9_10 + 30
      l_9_9.value = l_9_10
      l_9_9 = token
      l_9_9 = l_9_9[4]
      l_9_10 = XTCS2_SCENARIO_SECONDARY_DISEASE_DELAY
      l_9_9.value = l_9_10
      l_9_9 = giveToken
      l_9_10 = token
      l_9_9(l_9_10, 0)
      l_9_9 = BFLOG
      l_9_10 = SYSTRACE
      l_9_9(l_9_10, "========= " .. getName(l_9_8) .. " seeded with Extinct Flu =========")
   end
   showRule("ExtinctDocumentGoal")
   setglobalvar("firstAnimalHealed", "false")
   completeshowoverview()
end

failGiftAnimalGetsSick = function(l_10_arg0)
   showscenariofail("ExtinctCampaign:DiseaseFailGiftAnimal", "cp2scen2")
end

evalDiseaseOutbreak = function(l_11_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 1 ****************")
   if checkTimeLimit(l_11_arg0, 0, 3) == -1 and hasDiseaseTimedOut() then
      return -1
   end
   if l_11_arg0.diseaseOutbreakPhotoChallengeStarted == nil then
      BFLOG(SYSTRACE, "========= Setting up disease outbreak photo challenge =========")
      local l_11_1 = queryObject("ZTPhotoChallengesComponent")
      if l_11_1 then
         l_11_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("DiseaseScenarioPhoto1")
      else
         BFLOG(SYSTRACE, "!!!!!!!!! ZTPhotoChallengesComponent is nil! !!!!!!!!!")
      end
      local l_11_2 = queryObject("BFScenarioMgr")
      if l_11_2 then
         l_11_2:UI_DISABLE("photo challenges")
      end
      l_11_arg0.diseaseOutbreakPhotoChallengeStarted = true
      setglobalvar("diseaseoutbreakgoal_complete", "false")
   end
   if l_11_arg0.diseaseOutbreakPhotoChallengeStarted == true then
      BFLOG(SYSTRACE, "========= Evaluating disease outbreak photo challenge =========")
      local l_11_1 = queryObject("ZTPhotoChallengesComponent")
      if l_11_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         return 1
      end
   end
   return 0
end

scoreAnyDiseasedAnimal = function(l_12_arg0)
   return scoreAnyDiseasedEntity(l_12_arg0)
end

completeDiseaseOutbreak = function()
   BFLOG(SYSTRACE, "**************** complete photo set 1 ****************")
   setglobalvar("diseaseoutbreakgoal_complete", "true")
   giveCash(XTCS2_REWARD2)
   showRule("ExtinctFindCureGoal")
   showRule("ExtinctNormalOperationGoal")
   completeshowoverview()
end

evalDiseaseFindCure = function(l_14_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 4 ****************")
   if isDiseaseCured("ExtinctFlu") then
      return 1
   end
   return 0
end

completeDiseaseFindCure = function()
   BFLOG(SYSTRACE, "**************** complete goal 4 ****************")
   setglobalvar("firstAnimalHealed", "true")
   local l_15_0 = getglobalvar("normalOperationComplete")
   if l_15_0 == "true" then
      showRule("ExtinctHealthyAnimalGoal")
   end
   showRule("ExtinctCureAllGoal")
   completeshowoverview()
end

isDiseaseCured = function(l_16_arg0)
   local l_16_1 = queryObject("ZTDiseaseMgr")
   if l_16_1 ~= nil then
      return l_16_1:ZT_DISEASE_CURE_QUERY(l_16_arg0)
   end
end

hasDiseaseTimedOut = function()
   BFLOG(SYSTRACE, "**************** hasDiseaseTimedOut ****************")
   local l_17_0 = findType("animal")
   for l_17_1 = 1, table.getn(l_17_0) do
      local l_17_4 = resolveTable(l_17_0[l_17_1].value)
      if l_17_4 ~= nil and l_17_4:BFG_GET_ATTR_BOOLEAN("b_Disease") == true then
         return false
      end
   end
   return true
end

failDiseasePhoto = function()
   showscenariofail("ExtinctCampaign:DiseasePhotoFail", "cp2scen2")
end

evalDiseaseHealAll = function(l_19_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 5 ****************")
   local l_19_1 = findType("animal")
   for l_19_2 = 1, table.getn(l_19_1) do
      local l_19_5 = resolveTable(l_19_1[l_19_2].value)
      if l_19_5:BFG_GET_ATTR_BOOLEAN("b_Disease") then
         return 0
      end
   end
   return 1
end

completeDiseaseHealAll = function()
   BFLOG(SYSTRACE, "**************** complete goal 5 ****************")
   giveCash(XTCS2_REWARD4)
   showRule("ExtinctDonations2Goal")
   completeshowoverview()
end

evalExtinctDonations2 = function(l_21_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 6 ****************")
   if l_21_arg0.startingExtinctDonations == nil then
      l_21_arg0.startingExtinctDonations = getDonationsByEndangerment("Extinct")
      l_21_arg0.endingExtinctDonations = l_21_arg0.startingExtinctDonations + XTCS2_DONATION_GOAL2
   end
   if l_21_arg0.endingExtinctDonations <= getDonationsByEndangerment("Extinct") then
      return 1
   end
   return 0
end

hasAnimalDied = function()
   local l_22_0 = getuservar("cp2scen2")
   if l_22_0 ~= "completed" then
      BFLOG(SYSTRACE, "**************** has animal died ****************")
      local l_22_1 = {}
      local l_22_2 = 0
      local l_22_3 = queryObject("ZTStatus")
      if l_22_3 then
         l_22_1 = l_22_3:ZT_GET_ALL_ANIMALS_RELEASED()
         if l_22_1 ~= nil then
            l_22_2 = table.getn(l_22_1)
         end
      end
      local l_22_4 = howManyAnimalsInZoo()
      local l_22_5 = tonumber(getglobalvar("cp2scen2_numAnimals"))
      if l_22_5 ~= nil and l_22_4 < l_22_5 - l_22_2 then
         failAnimalDeath()
      else
         setglobalvar("cp2scen2_numAnimals", tostring(l_22_4))
      end
   end
end

completeExtinctDonations2 = function()
   BFLOG(SYSTRACE, "**************** complete goal 6 ****************")
   setuservar("cp2scen2", "completed")
   local l_23_0 = getuservar("cp2scen3")
   if l_23_0 ~= "completed" then
      setuservar("cp2scen3", "unlocked")
   end
   giveCash(XTCS2_REWARD5)
   showscenariowin("ExtinctCampaign:DiseaseScenarioSuccessOverview", "cp2scen3")
end

scoreEntertainerJoking = function(l_24_arg0)
   local l_24_1 = {"Stand_TellJokeBad", "Stand_TellJokeGood"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_24_arg0, "Entertainer", l_24_1) >= 1 then
      return 1
   end
   return 0
end

scoreGuestDigging = function(l_25_arg0)
   local l_25_1 = scoreAnyEntityTypeDoingTaskAndAnim
   local l_25_2 = l_25_arg0
   local l_25_3 = "Guest"
   local l_25_4 = {"Use_FossilDigPit"}
   local l_25_5 = {"Dig_Idle"}
   l_25_1 = l_25_1(l_25_2, l_25_3, l_25_4, l_25_5)
   if l_25_1 >= 1 then
      l_25_1 = 1
      return l_25_1
   end
   l_25_1 = 0
   return l_25_1
end

scoreCompletedSkeleton = function(l_26_arg0)
   local l_26_1 = l_26_arg0:getFirstInterestingEntity()
   while l_26_1 do
      if l_26_1:isKindOf("FossilEducationCenter") then
         local l_26_2 = l_26_1:getEDI()
         if l_26_2 then
            local l_26_3 = l_26_2:getVar("f_BoneLevel")
            local l_26_4 = tonumber(l_26_3)
            if l_26_4 == 9 or l_26_4 == 19 or l_26_4 == 29 or l_26_4 == 39 then
               return 1
            end
         end
      end
      l_26_1 = l_26_arg0:getNextInterestingEntity()
   end
   return 0
end

evalNormalOperation = function(l_27_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 2 ****************")
   local l_27_1 = getglobalvar("diseaseoutbreakgoal_complete")
   if l_27_1 == "true" then
      setglobalvar("diseaseoutbreakgoal_complete", "done")
      if l_27_arg0.normalOperationPhotoChallengeStarted == nil then
         BFLOG(SYSTRACE, "========= Setting up normal operation photo challenge =========")
         local l_27_2 = queryObject("ZTPhotoChallengesComponent")
         if l_27_2 then
            l_27_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("DiseaseScenarioPhoto2")
         else
            BFLOG(SYSTRACE, "!!!!!!!!! ZTPhotoChallengesComponent is nil! !!!!!!!!!")
         end
         local l_27_3 = queryObject("BFScenarioMgr")
         if l_27_3 then
            l_27_3:UI_DISABLE("photo challenges")
         end
         l_27_arg0.normalOperationPhotoChallengeStarted = true
         setglobalvar("normalOperationComplete", "false")
      end
   end
   if l_27_arg0.normalOperationPhotoChallengeStarted == true then
      BFLOG(SYSTRACE, "========= Evaluating normal operation photo challenge =========")
      local l_27_2 = queryObject("ZTPhotoChallengesComponent")
      if l_27_2:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         return 1
      end
   end
   return 0
end

completeNormalOperation = function(l_28_arg0)
   BFLOG(SYSTRACE, "**************** complete photo set 2 ****************")
   setglobalvar("normalOperationComplete", "true")
   local l_28_1 = getglobalvar("firstAnimalHealed")
   if l_28_1 == "true" then
      BFLOG(SYSTRACE, "========= Preparing healthy animal photo challenge =========")
      showRule("ExtinctHealthyAnimalGoal")
   end
   giveCash(XTCS2_OPTIONAL_REWARD1)
   completeshowoverview()
   return 0
end

scoreHealthyAnimals = function(l_29_arg0)
   local l_29_1 = findMatchingEntity(l_29_arg0, "Diprotodon")
   local l_29_2 = findMatchingEntity(l_29_arg0, "BirdElephant")
   if l_29_1 and l_29_2 then
      local l_29_3 = l_29_1:getPAC()
      local l_29_4 = l_29_2:getPAC()
      if l_29_3 and l_29_4 and l_29_3:getIsDiseased() == false and l_29_4:getIsDiseased() == false then
         return 1
      end
   end
   return 0
end

evalHealthyAnimalPhoto = function(l_30_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 3 ****************")
   local l_30_1 = getglobalvar("firstAnimalHealed")
   local l_30_2 = getglobalvar("normalOperationComplete")
   if l_30_1 == "true" and l_30_2 == "true" then
      setglobalvar("normalOperationComplete", "done")
      setglobalvar("firstAnimalHealed", "done")
      if l_30_arg0.healthyAnimalPhotoChallengeStarted == nil then
         BFLOG(SYSTRACE, "========= Setting up healthy animal photo challenge =========")
         local l_30_3 = queryObject("ZTPhotoChallengesComponent")
         if l_30_3 then
            l_30_3:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("DiseaseScenarioPhoto3")
         else
            BFLOG(SYSTRACE, "!!!!!!!!! ZTPhotoChallengesComponent is nil! !!!!!!!!!")
         end
         local l_30_4 = queryObject("BFScenarioMgr")
         if l_30_4 then
            l_30_4:UI_DISABLE("photo challenges")
         end
         l_30_arg0.healthyAnimalPhotoChallengeStarted = true
      end
   end
   if l_30_arg0.healthyAnimalPhotoChallengeStarted == true then
      BFLOG(SYSTRACE, "========= Evaluating healthy animal photo challenge =========")
      local l_30_3 = queryObject("ZTPhotoChallengesComponent")
      if l_30_3:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         return 1
      end
   end
   return 0
end

completeHealthyAnimalPhoto = function()
   BFLOG(SYSTRACE, "**************** complete photo set 3 ****************")
   setglobalvar("healthyAnimalComplete", "true")
   giveCash(XTCS2_OPTIONAL_REWARD2)
   completeshowoverview()
   return 0
end


