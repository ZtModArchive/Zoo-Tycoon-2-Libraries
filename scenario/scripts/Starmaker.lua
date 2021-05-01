include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
SCENARIO_REWARD = 10000
TRICK_1 = "DolphinJump"
TRICK_2 = "DolphinFlukeSwipeBall"
TRICK_3 = "DolphinFlukeSwipeTetherBall"
DONATION_GOAL = 100
DONATION_REWARD = 20000
GUEST_GOAL = 100
GUEST_REWARD = 20000
setinitialzoostate = function(l_1_arg0)
   l_1_arg0.TupoupouId = placeCratedWaterObjectAtGate("DolphinBottlenose_Adult_M")
   BFLOG("Tupoupou the dolphin's ID: " .. l_1_arg0.TupoupouId)
   setglobalvar("TupoupouID", tostring(l_1_arg0.TupoupouId))
   local l_1_1 = findEntityByID(l_1_arg0.TupoupouId)
   BFLOG("Setting name")
   local l_1_2 = getLocID("MarineShowsCampaign:TrainTricksDolphinName")
   l_1_1:BFG_SET_ATTR_STRING("s_name", l_1_2)
   l_1_1:BFG_SET_ATTR_BOOLEAN("b_showRelease", false)
   l_1_1:BFG_SET_ATTR_BOOLEAN("b_showAdopt", false)
   completeshowoverview()
   return 1
end

findTupoupou = function()
   local l_2_0 = tonumber(getglobalvar("TupoupouID"))
   if l_2_0 ~= nil then
      local l_2_1 = findType("DolphinBottlenose_Adult_M")
      for l_2_2 = 1, table.getn(l_2_1) do
         local l_2_5 = resolveTable(l_2_1[l_2_2].value)
         if l_2_5 ~= nil and getID(l_2_5) == l_2_0 then
            return l_2_5
         end
      end
   else
      BFLOG("Global Id is nil")
   end
   return nil
end

completeTrainThree = function()
   setRuleState("MasterTrickGoal", "neutral")
   showRule("MasterTrickGoal")
   completeshowoverview()
end

evalTrickOne = function(l_4_arg0)
   local l_4_1 = findTupoupou()
   --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

completeTrickOne = function(l_5_arg0)
   BFLOG("Completed Trick One")
   giveCash(SCENARIO_REWARD)
   showprimarygoals()
end

evalTrickTwo = function(l_6_arg0)
   local l_6_1 = findTupoupou()
   --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

completeTrickTwo = function(l_7_arg0)
   BFLOG("Completed Trick Two")
   giveCash(SCENARIO_REWARD)
   showprimarygoals()
end

evalTrickThree = function(l_8_arg0)
   local l_8_1 = findTupoupou()
   --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

completeTrickThree = function(l_9_arg0)
   BFLOG("Completed Trick Three")
   giveCash(SCENARIO_REWARD)
   showprimarygoals()
end

evalMasterTrick = function(l_10_arg0)
   local l_10_1 = findTupoupou()
   if l_10_1 then
      local l_10_2 = getAllTricks(l_10_1)
      if l_10_2 then
         for l_10_3 = 1, table.getn(l_10_2) do
            local l_10_6 = l_10_2[l_10_3].value
            if l_10_6 ~= nil then
               BFLOG("Checking trick: " .. l_10_6)
               if getTrickSkillLevel(l_10_1, l_10_6) >= 99 then
                  return 1
               end
            end
         end
      else
         BFLOG("Can't find Tupoupou")
         return -1
      end
      -- Tried to add an 'end' here but it's incorrect
      return 0
end

completeMasterTrick = function(l_11_arg0)
   if isVisibleByName("goals layout") then
      showUI("goals layout", false)
      showUI("Grant Layout", false)
   end
   local l_11_1 = getuservar("MarineShowsCampaignscenario4")
   if l_11_1 ~= "completed" then
      setuservar("MarineShowsCampaignscenario3", "unlocked")
   end
   setuservar("MarineShowsCampaignscenario4", "completed")
   showscenariowin("MarineShowsCampaign:TrainTricksSuccessOverview", "MarineShowsCampaignscenario3")
end

failOverall = function(l_12_arg0)
   showscenariofail("MarineShowsCampaign:TrainTricksDolphinDeadFailure", "MarineShowsCampaignscenario4")
end

evalAttendence = function(l_13_arg0)
   BFLOG(SYSTRACE, "**************** eval guest goal ****************")
   if GUEST_GOAL <= getNumGuests(-1) then
      return 1
   end
   return 0
end

completeAttendence = function(l_14_arg0)
   BFLOG(SYSTRACE, "**************** complete guest goal ****************")
   giveCash(GUEST_REWARD)
   completeshowoverview()
end

evalShowDonation = function(l_15_arg0)
   BFLOG("Eval Donations")
   if l_15_arg0.guestGoalGiven == nil and checkTimeLimit(l_15_arg0, 1, 0) == -1 then
      l_15_arg0.guestGoalGiven = 1
      showRule("OptionalDonationGoal")
      completeshowoverview()
   end
   if l_15_arg0.guestGoalGiven == 1 then
      BFLOG(SYSTRACE, "**************** eval donation goal ****************")
      if DONATION_GOAL <= totalNumOfShowDonors() then
         return 1
      end
   end
   return 0
end

completeShowDonation = function(l_16_arg0)
   BFLOG(SYSTRACE, "**************** complete donation goal ****************")
   giveCash(DONATION_REWARD)
   completeshowoverview()
end


