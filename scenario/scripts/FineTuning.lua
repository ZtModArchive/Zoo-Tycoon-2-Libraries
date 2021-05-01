include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
include("scenario/scripts/photoutil.lua")
DONATION_GOAL = 7500
DONATION_REWARD = "WhalePilotShortFinned_Adult_M"
STAR_GOAL1 = 1
STAR_GOAL2 = 2
STAR_GOAL3 = 3
SCENARIO_REWARD1 = 20000
SCENARIO_REWARD2 = 40000
EXPLORER_TYPE = "Guest_Adult_M_Oceanographer"
setinitialzoostate = function(l_1_arg0)
   local l_1_1 = findType("WalrusPacific_Adult_M")
   local l_1_2 = resolveTable(l_1_1[1].value)
   BFLOG("Setting name")
   local l_1_3 = getLocID("MarineShowsCampaign:RevampShowWalrusName")
   l_1_2:BFG_SET_ATTR_STRING("s_name", l_1_3)
   completeshowoverview()
   return 1
end

evalOneStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL1) == 1 then
      return 1
   end
   return 0
end

completeOneStarShow = function()
   giveCash(SCENARIO_REWARD1)
   showRule("TwoStarGoal")
   completeshowoverview()
end

evalTwoStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL2) == 1 then
      return 1
   end
   return 0
end

completeTwoStarShow = function()
   giveCash(SCENARIO_REWARD2)
   showRule("ThreeStarGoal")
   completeshowoverview()
end

evalThreeStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL3) == 1 then
      return 1
   end
   return 0
end

completeThreeStarShow = function()
   BFLOG(SYSTRACE, "WIN")
   local l_7_0 = getuservar("MarineShowsCampaignscenario2")
   if l_7_0 ~= "completed" then
      setuservar("MarineShowsCampaignscenario5", "unlocked")
   end
   setuservar("MarineShowsCampaignscenario2", "completed")
   showscenariowin("MarineShowsCampaign:RevampShowSuccessOverview", "MarineShowsCampaignscenario5")
end

evalCriticalNeeds = function(l_8_arg0)
   local l_8_1 = getOpenShows()
   if l_8_1 ~= nil then
      for l_8_2 = 1, table.getn(l_8_1) do
         local l_8_5 = resolveTable(l_8_1[l_8_2].value)
         if l_8_5 ~= nil then
            local l_8_6 = getAnimalsInShow(l_8_5)
            if l_8_6 ~= nil then
               for l_8_7 = 1, table.getn(l_8_6) do
                  local l_8_10 = resolveTable(l_8_6[l_8_7].value)
                  if l_8_10 ~= nil and not allNeedsMeetThreshold(l_8_10, 90) then
                     if l_8_arg0.WarningGiven == nil then
                        genericokpanel(nil, "MarineShowsCampaign:RevampShowCriticalNeeds")
                        l_8_arg0.WarningGiven = 1
                     else
                        return -1
                     end
                  end
               end
            end
         end
      end
   end
   return 0
end

failCriticalNeeds = function(l_9_arg0)
   showscenariofail("MarineShowsCampaign:RevampShowCriticalNeedsFailure", "MarineShowsCampaignscenario2")
end

evalShowDonation = function(l_10_arg0)
   BFLOG(SYSTRACE, "**************** eval donation goal ****************")
   if DONATION_GOAL <= getDonations("Show") then
      return 1
   end
   return 0
end

completeShowDonation = function(l_11_arg0)
   BFLOG(SYSTRACE, "**************** complete donation goal ****************")
   placeCratedWaterObjectAtGate(DONATION_REWARD)
   completeshowoverview()
end

evalExplorerWatchShow = function(l_12_arg0)
   BFLOG("eval explorer")
   if l_12_arg0.explorerInZoo == nil and checkTimeLimit(l_12_arg0, 1, 0) == -1 then
      showRule("ExplorerGoal")
      completeshowoverview()
      BFLOG("Place the Explorer")
      local l_12_1 = getZooEntrancePos()
      placeObject(EXPLORER_TYPE, l_12_1.x, l_12_1.y, l_12_1.z)
      local l_12_2 = findType(EXPLORER_TYPE)
      BFLOG("Number of Explorers in zoo: " .. table.getn(l_12_2))
      if table.getn(l_12_2) ~= 1 then
         BFLOG("Found NOT one explorer (" .. table.getn(l_12_2) .. "), possible error")
      end
      for l_12_3 = 1, table.getn(l_12_2) do
         local l_12_6 = resolveTable(l_12_2[l_12_3].value)
         if l_12_6 then
            BFLOG("Setting name")
            local l_12_7 = getLocID("MarineShowsCampaign:RevampShowExplorerName")
            l_12_6:BFG_SET_ATTR_STRING("s_name", l_12_7)
            local l_12_8 = getAllSpeciesList()
            favAnimal = l_12_8[math.random(table.getn(l_12_8))]
            l_12_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
            displayZooMessageWithZoom("MarineShowsCampaign:RevampShowExplorerEntered", 1, 30, l_12_6)
         end
      end
      l_12_arg0.explorerInZoo = true
   end
   if l_12_arg0.explorerInZoo then
      local l_12_1 = findType(EXPLORER_TYPE)
      BFLOG("Number of Explorers in zoo: " .. table.getn(l_12_1))
      if table.getn(l_12_1) ~= 1 then
         BFLOG("Found NOT one explorer (" .. table.getn(l_12_1) .. "), possible error")
         return -1
      end
      if l_12_arg0.FineTuningPhotoStarted == nil then
         local l_12_2 = queryObject("ZTPhotoChallengesComponent")
         if l_12_2 then
            l_12_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("FineTuningExplorer")
         end
         local l_12_3 = queryObject("BFScenarioMgr")
         if l_12_3 then
            l_12_3:UI_DISABLE("photo challenges")
         end
         l_12_arg0.FineTuningPhotoStarted = true
      end
      local l_12_2 = queryObject("ZTPhotoChallengesComponent")
      if l_12_2:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         return 1
      end
   end
   return 0
end

scoreExplorerWatchShow = function(l_13_arg0)
   BFLOG("Score Explore Watching Show")
   local l_13_1 = {"GuestWatchShow_Path", "GuestWatchShow_Bench", "GuestWatchShow_Canopy", "GuestWatchShow_Grandstands"}
   if scoreAnyDoingTaskInList(l_13_arg0, EXPLORER_TYPE, l_13_1) >= 1 then
      return 1
   end
   return 0
end

completeExplorerWatchShow = function(l_14_arg0)
   giveCash(10000)
   completeshowoverview()
end

failExplorerWatchShow = function(l_15_arg0)
   completeshowoverview()
end


