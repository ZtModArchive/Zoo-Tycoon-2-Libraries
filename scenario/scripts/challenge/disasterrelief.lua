include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
disasterreliefCHALLENGE_NAME = "disasterrelief"
validate = function()
   if isChalDeclinedForever(disasterreliefCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", disasterreliefCHALLENGE_NAME)
   local l_1_0 = getglobalvar(disasterreliefCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = 0
         local l_1_2 = findType("fence")
         for l_1_3 = 1, table.getn(l_1_2) do
            local l_1_6 = resolveTable(l_1_2[l_1_3].value)
            if l_1_6 and l_1_6:BFG_GET_ATTR_STRING("s_Broken") and l_1_6:BFG_GET_IS_PROTECTED() == false then
               l_1_1 = l_1_1 + 1
            end
         end
         if getHalfStars() >= 3 and l_1_1 > 20 and countType("Guest") <= 100 then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, disasterreliefCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/" .. disasterreliefCHALLENGE_NAME .. ".xml")
                     local l_1_4 = queryObject("UIRoot")
                     if l_1_4 ~= nil then
                        local l_1_5 = l_1_4:UI_GET_CHILD("EarthQuake")
                        if l_1_5 ~= nil then
                           l_1_5:UI_ACTIVATE_ON()
                        elseif getPrereqGather() == false then
                           logDebugChallengeInfo(disasterreliefCHALLENGE_NAME, "skipped")
                        end
                        -- Tried to add an 'end' here but it's incorrect
                     end
                     return 1
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  return 0
end

evaldisasterrelief = function(l_2_arg0)
   if l_2_arg0.popupTimer == nil then
      l_2_arg0.popupTimer = 0
   end
   if l_2_arg0.popupTimer < 1 then
      l_2_arg0.popupTimer = l_2_arg0.popupTimer + 1
      return 
   end
   challenge = getglobalvar("challenge")
   if l_2_arg0.accept == nil and challenge == nil then
      setglobalvar("challenge", "accept")
      BFLOG("BREAK 1/8th OF ALL FENCES")
      local l_2_1 = findType("fence")
      local l_2_2 = 1
      local l_2_3 = 0
      for l_2_4 = 1, table.getn(l_2_1) do
         local l_2_7 = resolveTable(l_2_1[l_2_4].value)
         if l_2_7 then
            local l_2_8 = l_2_7:BFG_GET_ATTR_STRING("s_Broken")
            local l_2_9 = l_2_7:BFG_GET_IS_PROTECTED()
            if l_2_8 and l_2_9 == false then
               l_2_2 = l_2_2 + 1
               if l_2_2 >= 5 then
                  local l_2_10
                  l_2_7:BFG_ENTITY_MORPH_TO_NEW_ENTITY(l_2_10)
                  l_2_10 = {_type = BFGEntityMorphData, morphTarget = l_2_8, fade = false}
                  l_2_3 = l_2_3 + 1
                  l_2_2 = 1
               end
            end
         end
      end
      l_2_arg0.reward = 1000 + (l_2_3) * 250
      BFLOG("ANNOY THE ANIMALS")
      local l_2_4 = findType("animal")
      local l_2_5 = 1
      for l_2_6 = 1, table.getn(l_2_4) do
         local l_2_9 = resolveTable(l_2_4[l_2_6].value)
         if l_2_9 then
            l_2_5 = l_2_5 + 1
            if l_2_5 >= 5 then
               l_2_9:BFG_SET_ATTR_FLOAT("bathroom", 80)
               l_2_9:BFG_SET_ATTR_FLOAT("rest", 80)
               l_2_9:BFG_SET_ATTR_FLOAT("social", 80)
               l_2_9:BFG_SET_ATTR_FLOAT("hunger", 80)
               l_2_9:BFG_SET_ATTR_FLOAT("thirst", 80)
               l_2_5 = 1
            end
         end
      end
      local l_2_6 = queryObject("BFScenarioMgr")
      if l_2_6 then
         l_2_6:BFS_SHOWRULE(disasterreliefCHALLENGE_NAME)
      end
      logDebugChallengeInfo(disasterreliefCHALLENGE_NAME, "accepted")
      setchallengeactive()
      local l_2_7 = getLocID("Challengetext:CHDisasterRelief")
      local l_2_8 = ""
      local l_2_9 = queryObject("BFScenarioMgr")
      if l_2_9 then
         l_2_8 = l_2_9:BFS_LOCALIZEFLOAT(l_2_arg0.reward)
      end
      local l_2_10 = string.format(l_2_7, l_2_8)
      setaltoverviewtext(disasterreliefCHALLENGE_NAME, "neutral", l_2_10)
      showprimarygoals()
      genericokpaneltext(nil, l_2_10)
      l_2_arg0.accept = 1
   end
   if l_2_arg0.accept == 1 then
      BFLOG(SYSTRACE, "eval")
      if l_2_arg0.quaketimer == nil then
         l_2_arg0.quaketimer = getCurrentMonth()
         l_2_arg0.quaketimerday = getCurrentTimeOfDay()
         return 0
      end
      if countBrokenFences() <= 0 then
         cashReward = l_2_arg0.reward
         return 1
      end
      local l_2_1 = getCurrentMonth()
      if (l_2_arg0.quaketimer + 2 <= l_2_1 and l_2_arg0.quaketimerday <= getCurrentTimeOfDay()) or l_2_arg0.quaketimer + 3 <= l_2_1 then
         return -1
      end
   end
   return 0
end

completedisasterrelief = function(l_3_arg0)
   giveCash(cashReward)
   local l_3_1 = getLocID("Challengetext:CHDisasterReliefSuccess")
   local l_3_2 = ""
   local l_3_3 = queryObject("BFScenarioMgr")
   if l_3_3 then
      l_3_2 = l_3_3:BFS_LOCALIZEFLOAT(cashReward)
   end
   local l_3_4 = string.format(l_3_1, l_3_2)
   setAltOverviewText(disasterreliefCHALLENGE_NAME, "success", l_3_4)
   showchallengewintext(l_3_4)
   resetchallengeoverandcomplete(disasterreliefCHALLENGE_NAME)
   incrementglobalchallenges()
end

faildisasterrelief = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHDisasterReliefFailure")
   end
   resetchallengeover(disasterreliefCHALLENGE_NAME)
   declinenotfail = nil
end


