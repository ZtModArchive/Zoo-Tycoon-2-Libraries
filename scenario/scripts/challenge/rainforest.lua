include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
rainforestCHALLENGE_NAME = "rainforest"
validate = function()
   if isChalDeclinedForever(rainforestCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", rainforestCHALLENGE_NAME)
   local l_1_0 = getglobalvar(rainforestCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = getuservar("junglelock")
         local l_1_2 = 0
         local l_1_3 = findType("building")
         for l_1_4 = 1, table.getn(l_1_3) do
            local l_1_7 = resolveTable(l_1_3[l_1_4].value)
            if l_1_7 then
               local l_1_8 = l_1_7:BFG_GET_ATTR_STRING("s_Theme")
               if l_1_8 and l_1_8 == "jungle" then
                  l_1_2 = l_1_2 + 1
               end
            end
         end
         if l_1_1 ~= nil and l_1_1 == "true" and l_1_2 == 0 and getHalfStars() >= 2 and getHalfStars() <= 8 then
            BFLOG("here")
            local l_1_4 = queryObject("BFScenarioMgr")
            if l_1_4 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, rainforestCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_4:BFS_ADDSCENARIO("scenario/goals/challenge/" .. rainforestCHALLENGE_NAME .. ".xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(rainforestCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalrainforest = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(rainforestCHALLENGE_NAME)
      end
      logDebugChallengeInfo(rainforestCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(rainforestCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(rainforestCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(rainforestCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHRainforestPreservation")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.rainforesttimer == nil then
         l_2_arg0.rainforesttimer = getCurrentMonth()
         l_2_arg0.rainforesttimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1 = 0
         local l_2_2 = findType("building")
         for l_2_3 = 1, table.getn(l_2_2) do
            local l_2_6 = resolveTable(l_2_2[l_2_3].value)
            if l_2_6 then
               local l_2_7 = l_2_6:BFG_GET_ATTR_STRING("s_Theme")
               if l_2_7 and l_2_7 == "jungle" then
                  l_2_1 = l_2_1 + 1
               end
            end
         end
         if l_2_1 >= 6 then
            return 1
         end
         local l_2_3 = getCurrentMonth()
         if (l_2_arg0.rainforesttimer + 2 <= l_2_3 and l_2_arg0.rainforesttimerday <= getCurrentTimeOfDay()) or l_2_arg0.rainforesttimer + 3 <= l_2_3 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completerainforest = function(l_3_arg0)
   local l_3_1 = getHalfStars() * 10
   local l_3_2 = getAllSpeciesList()
   local l_3_3 = {}
   for l_3_4 = 1, table.getn(l_3_2) do
      local l_3_7 = queryObject("ZTWorldMgr")
      if l_3_7 then
         local l_3_8, l_3_9 = l_3_7:BFG_GET_ATTR_FLOAT, l_3_7
         local l_3_10
         l_3_8, l_3_10 = l_3_8(l_3_9, l_3_10), {key = l_3_2[l_3_4], val = "f_adoptRarity"}
         if l_3_8 <= l_3_1 then
            l_3_9 = table
            l_3_9 = l_3_9.getn
            l_3_10 = l_3_3
            l_3_9 = l_3_9(l_3_10)
            l_3_9 = l_3_9 + 1
            l_3_10 = l_3_2[l_3_4]
            l_3_3[l_3_9] = l_3_10
         end
      end
   end
   if table.getn(l_3_3) >= 1 then
      local l_3_4 = l_3_3[math.random(table.getn(l_3_3))]
      local l_3_5 = l_3_4
      l_3_4 = l_3_4 .. "_Adult_"
      if math.random(2) == 0 then
         l_3_4 = l_3_4 .. "M"
      else
         l_3_4 = l_3_4 .. "F"
      end
      placeCratedObjectAtGate(l_3_4)
      local l_3_6 = getLocID("Challengetext:CHRainforestPreservationSuccess")
      local l_3_7 = string.format(l_3_6, getlocidfromspecies(l_3_5), getlocidfromspecies(l_3_5))
      setaltoverviewtext(rainforestCHALLENGE_NAME, "success", l_3_7)
      showchallengewintext(l_3_7)
   else
      local l_3_4 = "TortoiseGalapagos"
      local l_3_5 = l_3_4 .. "_Adult_F"
      placeCratedObjectAtGate(l_3_5)
      local l_3_6 = getLocID("Challengetext:CHRainforestPreservationSuccess")
      local l_3_7 = string.format(l_3_6, getlocidfromspecies(l_3_4), getlocidfromspecies(l_3_4))
      setaltoverviewtext(rainforestCHALLENGE_NAME, "success", l_3_7)
      showchallengewintext(l_3_7)
   end
   resetchallengeoverandcomplete(rainforestCHALLENGE_NAME)
   incrementglobalchallenges()
end

failrainforest = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHRainforestPreservationFailure")
   end
   resetchallengeover(rainforestCHALLENGE_NAME)
   declinenotfail = nil
end


