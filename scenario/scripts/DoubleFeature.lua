include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
include("scenario/scripts/photoutil.lua")
SCENARIO_REWARD = 15000
GUEST_GOAL = 150
GUEST_REWARD = 20000
PHOTOGRAPHER_TYPE = "Guest_Adult_F_Photographer"
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

evalCetaceanSetup = function(l_2_arg0)
   BFLOG("Eval Cetacean Setup")
   local l_2_1 = getOpenShows()
   if l_2_1 ~= nil then
      for l_2_2 = 1, table.getn(l_2_1) do
         local l_2_5 = resolveTable(l_2_1[l_2_2].value)
         if l_2_5 ~= nil then
            local l_2_6 = getAnimalsInShow(l_2_5)
            if l_2_6 ~= nil then
               local l_2_7 = false
               for l_2_8 = 1, table.getn(l_2_6) do
                  local l_2_11 = resolveTable(l_2_6[l_2_8].value)
                  if l_2_11 ~= nil then
                     if isEntityKindOf(l_2_11, "Otariidae") or isEntityKindOf(l_2_11, "Odobenidae") or isEntityKindOf(l_2_11, "Phocidae") then
                        l_2_7 = false
                        -- Tried to add an 'end' here but it's incorrect
                        if isEntityKindOf(l_2_11, "Cetacea") then
                           l_2_7 = true
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     if l_2_7 then
                        return 1
                     end
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  return 0
end

completeCetaceanSetup = function(l_3_arg0)
   BFLOG("Completed Cetacean Setup")
   giveCash(SCENARIO_REWARD)
   turnRuleOn("CetaceanGuestGoal")
   showRule("CetaceanGuestGoal")
   showprimarygoals()
end

evalCetaceanGuest = function(l_4_arg0)
   BFLOG("Eval Cetacean Guest")
   local l_4_1 = getOpenShows()
   if l_4_1 ~= nil then
      for l_4_2 = 1, table.getn(l_4_1) do
         local l_4_5 = resolveTable(l_4_1[l_4_2].value)
         if l_4_5 ~= nil then
            local l_4_6 = getAnimalsInShow(l_4_5)
            if l_4_6 ~= nil then
               local l_4_7 = false
               for l_4_8 = 1, table.getn(l_4_6) do
                  local l_4_11 = resolveTable(l_4_6[l_4_8].value)
                  if l_4_11 ~= nil then
                     if isEntityKindOf(l_4_11, "Otariidae") or isEntityKindOf(l_4_11, "Odobenidae") or isEntityKindOf(l_4_11, "Phocidae") then
                        l_4_7 = false
                        -- Tried to add an 'end' here but it's incorrect
                        if isEntityKindOf(l_4_11, "Cetacea") then
                           l_4_7 = true
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     if l_4_7 and GUEST_GOAL <= getShowAttendace(l_4_5) then
                        return 1
                     end
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  return 0
end

completeCetaceanGuest = function(l_5_arg0)
   BFLOG("Completed Cetacean Guest")
   giveCash(GUEST_REWARD)
   if getRuleState("PinnipedGuestGoal") == "success" then
      setRuleState("OverallCetaceanGoal", "success")
      setRuleState("OverallPinnipedGoal", "success")
      return 1
   end
   showprimarygoals()
end

evalCetaceanGoals = function()
   BFLOG("Eval Cetacean Goals")
   if getRuleState("CetaceanSetupGoal") == "success" then
      BFLOG("Check for cetacean show")
      if not checkForCetaceanShow() then
         return -1
      end
   end
   return 0
end

failCetaceanGoals = function()
   showscenariofail("MarineShowsCampaign:DoubleFeatureCetaceanFailure", "MarineShowsCampaignscenario3")
end

evalPinnipedSetup = function(l_8_arg0)
   BFLOG("Eval Pinniped Setup")
   local l_8_1 = getOpenShows()
   if l_8_1 ~= nil then
      for l_8_2 = 1, table.getn(l_8_1) do
         local l_8_5 = resolveTable(l_8_1[l_8_2].value)
         if l_8_5 ~= nil then
            local l_8_6 = getAnimalsInShow(l_8_5)
            if l_8_6 ~= nil then
               local l_8_7 = false
               for l_8_8 = 1, table.getn(l_8_6) do
                  local l_8_11 = resolveTable(l_8_6[l_8_8].value)
                  if l_8_11 ~= nil then
                     if isEntityKindOf(l_8_11, "Otariidae") or isEntityKindOf(l_8_11, "Odobenidae") or isEntityKindOf(l_8_11, "Phocidae") then
                        l_8_7 = true
                        -- Tried to add an 'end' here but it's incorrect
                        if isEntityKindOf(l_8_11, "Cetacea") then
                           l_8_7 = false
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     if l_8_7 then
                        return 1
                     end
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  return 0
end

completePinnipedSetup = function(l_9_arg0)
   BFLOG("Completed Pinniped Setup")
   giveCash(SCENARIO_REWARD)
   showRule("PinnipedGuestGoal")
   showprimarygoals()
end

evalPinnipedGuest = function(l_10_arg0)
   BFLOG("Eval Pinniped Guest")
   local l_10_1 = getOpenShows()
   if l_10_1 ~= nil then
      for l_10_2 = 1, table.getn(l_10_1) do
         local l_10_5 = resolveTable(l_10_1[l_10_2].value)
         if l_10_5 ~= nil then
            local l_10_6 = getAnimalsInShow(l_10_5)
            if l_10_6 ~= nil then
               local l_10_7 = false
               for l_10_8 = 1, table.getn(l_10_6) do
                  local l_10_11 = resolveTable(l_10_6[l_10_8].value)
                  if l_10_11 ~= nil then
                     if isEntityKindOf(l_10_11, "Otariidae") or isEntityKindOf(l_10_11, "Odobenidae") or isEntityKindOf(l_10_11, "Phocidae") then
                        l_10_7 = true
                        -- Tried to add an 'end' here but it's incorrect
                        if isEntityKindOf(l_10_11, "Cetacea") then
                           l_10_7 = false
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     if l_10_7 and GUEST_GOAL <= getShowAttendace(l_10_5) then
                        return 1
                     end
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  return 0
end

completePinnipedGuest = function(l_11_arg0)
   BFLOG("Completed Piniped Guest")
   giveCash(GUEST_REWARD)
   if getRuleState("CetaceanGuestGoal") == "success" then
      setRuleState("OverallCetaceanGoal", "success")
      setRuleState("OverallPinnipedGoal", "success")
      return 1
   end
   showprimarygoals()
end

evalPinnipedGoals = function(l_12_arg0)
   BFLOG("Eval Cetacean Goals")
   if getRuleState("PinnipedSetupGoal") == "success" then
      BFLOG("Check for pinniped show")
      if not checkForPinnipedShow() then
         return -1
      end
   end
   return 0
end

evalEleanorAvus = function(l_13_arg0)
   BFLOG("eval photographer")
   if l_13_arg0.photographerInZoo == nil and checkTimeLimit(l_13_arg0, 2, 0) == -1 then
      showRule("PhotographerGoal")
      completeshowoverview()
      BFLOG("Place the Photographer")
      local l_13_1 = getZooEntrancePos()
      placeObject(PHOTOGRAPHER_TYPE, l_13_1.x, l_13_1.y, l_13_1.z)
      local l_13_2 = findType(PHOTOGRAPHER_TYPE)
      BFLOG("Number of Photographers in zoo: " .. table.getn(l_13_2))
      if table.getn(l_13_2) ~= 1 then
         BFLOG("Found NOT one photographer (" .. table.getn(l_13_2) .. "), possible error")
      end
      for l_13_3 = 1, table.getn(l_13_2) do
         local l_13_6 = resolveTable(l_13_2[l_13_3].value)
         if l_13_6 then
            BFLOG("Setting name")
            local l_13_7 = getLocID("MarineShowsCampaign:DoubleFeaturePhotographerName")
            l_13_6:BFG_SET_ATTR_STRING("s_name", l_13_7)
            local l_13_8 = getAllSpeciesList()
            favAnimal = l_13_8[math.random(table.getn(l_13_8))]
            l_13_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
            displayZooMessageWithZoom("MarineShowsCampaign:DoubleFeaturePhotographerEntered", 1, 30, l_13_6)
         end
      end
      l_13_arg0.photographerInZoo = true
   end
   if l_13_arg0.photographerInZoo then
      local l_13_1 = findType(PHOTOGRAPHER_TYPE)
      BFLOG("Number of Photographers in zoo: " .. table.getn(l_13_1))
      if table.getn(l_13_1) ~= 1 then
         BFLOG("Found NOT one photographer (" .. table.getn(l_13_1) .. "), possible error")
         return -1
      end
      if l_13_arg0.DoubleFeaturePhotoStarted == nil then
         local l_13_2 = queryObject("ZTPhotoChallengesComponent")
         if l_13_2 then
            l_13_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("DoubleFeaturePhotographer")
         end
         local l_13_3 = queryObject("BFScenarioMgr")
         if l_13_3 then
            l_13_3:UI_DISABLE("photo challenges")
         end
         l_13_arg0.DoubleFeaturePhotoStarted = true
      end
      local l_13_2 = queryObject("ZTPhotoChallengesComponent")
      if l_13_2:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         return 1
      end
   end
   return 0
end

scoreEleanorAvusEating = function(l_14_arg0)
   BFLOG("Score Photographer eating")
   if scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "StandItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "StandItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "StandItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "StandItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "StandItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "Stand_DrinkFountain") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitPicnicTableItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitPicnicTableItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitPicnicTableItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitPicnicTableItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitPicnicTableItem_EatFork") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitPicnicTableItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitTableItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitTableItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitTableItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitTableItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitTableItem_EatFork") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitTableItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitBenchItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitBenchItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitBenchItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_14_arg0, PHOTOGRAPHER_TYPE, "SitBenchItem_Lick") >= 1 then
      return 1
   end
   return 0
end

scoreEleanorAvusTakingPhoto = function(l_15_arg0)
   BFLOG("Score Photographer taking photo")
   local l_15_1 = {"Camera", "2Camera"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_15_arg0, PHOTOGRAPHER_TYPE, l_15_1) >= 1 then
      return 1
   end
   return 0
end

completeEleanorAvus = function(l_16_arg0)
   giveCash(20000)
   completeshowoverview()
end

failEleanorAvus = function(l_17_arg0)
   completeshowoverview()
end

failPinnipedGoals = function(l_18_arg0)
   showscenariofail("MarineShowsCampaign:DoubleFeaturePinnipedFailure", "MarineShowsCampaignscenario3")
end

completeOverall = function(l_19_arg0)
   local l_19_1 = getuservar("MarineShowsCampaignscenario3")
   if l_19_1 ~= "completed" then
      setuservar("MarineShowsCampaignscenario2", "unlocked")
   end
   setuservar("MarineShowsCampaignscenario3", "completed")
   showscenariowin("MarineShowsCampaign:DoubleFeatureSuccessOverview", "MarineShowsCampaignscenario2")
end

checkForCetaceanShow = function()
   BFLOG("Check Cetacean")
   local l_20_0 = getShows()
   if l_20_0 ~= nil then
      for l_20_1 = 1, table.getn(l_20_0) do
         local l_20_4 = resolveTable(l_20_0[l_20_1].value)
         if l_20_4 ~= nil then
            local l_20_5 = getAnimalsInShow(l_20_4)
            if l_20_5 ~= nil then
               local l_20_6 = false
               for l_20_7 = 1, table.getn(l_20_5) do
                  local l_20_10 = resolveTable(l_20_5[l_20_7].value)
                  if l_20_10 ~= nil then
                     if isEntityKindOf(l_20_10, "Otariidae") or isEntityKindOf(l_20_10, "Odobenidae") or isEntityKindOf(l_20_10, "Phocidae") then
                        l_20_6 = false
                        -- Tried to add an 'end' here but it's incorrect
                        if isEntityKindOf(l_20_10, "Cetacea") then
                           l_20_6 = true
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     if l_20_6 then
                        return true
                     end
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  return false
end

checkForPinnipedShow = function()
   BFLOG("Check Pinniped")
   local l_21_0 = getShows()
   if l_21_0 ~= nil then
      for l_21_1 = 1, table.getn(l_21_0) do
         local l_21_4 = resolveTable(l_21_0[l_21_1].value)
         if l_21_4 ~= nil then
            local l_21_5 = getAnimalsInShow(l_21_4)
            if l_21_5 ~= nil then
               local l_21_6 = false
               for l_21_7 = 1, table.getn(l_21_5) do
                  local l_21_10 = resolveTable(l_21_5[l_21_7].value)
                  if l_21_10 ~= nil then
                     if isEntityKindOf(l_21_10, "Otariidae") or isEntityKindOf(l_21_10, "Odobenidae") or isEntityKindOf(l_21_10, "Phocidae") then
                        l_21_6 = true
                        -- Tried to add an 'end' here but it's incorrect
                        if isEntityKindOf(l_21_10, "Cetacea") then
                           l_21_6 = false
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     if l_21_6 then
                        return true
                     end
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  return false
end


