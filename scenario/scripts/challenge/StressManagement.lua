include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/needs.lua")
CHALLENGE_REWARD = 5000
validate = function()
   BFLOG(SYSTRACE, "stressmanagement validate")
   setglobalvar("stressmanagement_canrepeat", "true")
   local l_1_0 = getglobalvar("stressmanagement_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      local l_1_1 = countType("Guest")
      local l_1_2 = 0
      local l_1_3 = findType("Guest")
      for l_1_4 = 1, table.getn(l_1_3) do
         local l_1_7 = resolveTable(l_1_3[l_1_4].value)
         if l_1_7 ~= nil and l_1_7:BFG_GET_ATTR_FLOAT("rest") >= 90 then
            l_1_2 = l_1_2 + 1
         end
      end
      if l_1_1 >= 20 then
         local l_1_4 = queryObject("BFScenarioMgr")
         if l_1_4 then
            BFLOG(SYSTRACE, "giving stressmanagement")
            l_1_4:BFS_ADDSCENARIO("scenario/goals/challenge/stressmanagement.xml")
            return 1
         end
      end
   end
   return 0
end

evalStressManagement = function(l_2_arg0)
   BFLOG(SYSTRACE, "evalstressmanagement")
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      declinenotfail = nil
      BFLOG(SYSTRACE, "*******You accepted!")
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("stressmanagement")
      end
      setchallengeactive()
      l_2_arg0.guestsUsed = {}
      local l_2_2 = findType("Guest")
      for l_2_3 = 1, table.getn(l_2_2) do
         local l_2_6 = resolveTable(l_2_2[l_2_3].value)
         if l_2_6 ~= nil then
            local l_2_7 = l_2_6:BFG_GET_ATTR_FLOAT("rest")
            if l_2_7 >= 90 then
               local l_2_8 = false
               for l_2_9 = 1, table.getn(l_2_arg0.guestsUsed) do
                  if l_2_arg0.guestsUsed[l_2_9].value == l_2_2[l_2_3].value then
                     l_2_8 = true
                  end
               end
               if l_2_8 == false then
                  BFLOG(SYSTRACE, "Adding guest to used table")
                  local l_2_9 = l_2_arg0.guestsUsed
                  local l_2_10 = table.getn(l_2_arg0.guestsUsed) + 1
                  l_2_9[l_2_10] = l_2_2[l_2_3]
               end
            end
         end
      end
      l_2_arg0.ruleShow = 0
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      BFLOG(SYSTRACE, "You declined!")
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHStressManagement")
      BFLOG(SYSTRACE, "I'm waiting for you to click accept or decline!")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept ~= nil then
      local l_2_1 = findType("Guest")
      for l_2_2 = 1, table.getn(l_2_1) do
         local l_2_5 = resolveTable(l_2_1[l_2_2].value)
         if l_2_5 ~= nil then
            local l_2_6 = l_2_5:BFG_GET_ATTR_FLOAT("rest")
            if l_2_6 >= 90 then
               local l_2_7 = false
               for l_2_8 = 1, table.getn(l_2_arg0.guestsUsed) do
                  if l_2_arg0.guestsUsed[l_2_8].value == l_2_1[l_2_2].value then
                     l_2_7 = true
                  end
               end
               if l_2_7 == false then
                  BFLOG(SYSTRACE, "Adding guest to used table")
                  local l_2_8 = l_2_arg0.guestsUsed
                  local l_2_9 = table.getn(l_2_arg0.guestsUsed) + 1
                  l_2_8[l_2_9] = l_2_1[l_2_2]
               end
            end
         end
      end
      if checkTimeLimit(l_2_arg0, 2, 0) == -1 then
         if table.getn(l_2_arg0.guestsUsed) < 5 then
            return 1
            -- Tried to add an 'end' here but it's incorrect
            return -1
            -- Tried to add an 'end' here but it's incorrect
            local l_2_2 = table.getn(l_2_arg0.guestsUsed)
            if l_2_2 == 1 and l_2_arg0.ruleShow < 1 then
               showRule("critical1")
               showprimarygoals()
               l_2_arg0.ruleShow = 1
            elseif l_2_2 == 2 and l_2_arg0.ruleShow < 2 then
               hideRule("critical1")
               showRule("critical2")
               showprimarygoals()
               l_2_arg0.ruleShow = 2
            elseif l_2_2 == 3 and l_2_arg0.ruleShow < 3 then
               hideRule("critical1")
               hideRule("critical2")
               showRule("critical3")
               showprimarygoals()
               l_2_arg0.ruleShow = 3
            elseif l_2_2 == 4 and l_2_arg0.ruleShow < 4 then
               hideRule("critical1")
               hideRule("critical2")
               hideRule("critical3")
               showRule("critical4")
               showprimarygoals()
               l_2_arg0.ruleShow = 4
            elseif l_2_2 >= 5 then
               return -1
            end
            -- Tried to add an 'end' here but it's incorrect
            return 0
end

completeStressManagement = function(l_3_arg0)
   hideRule("critical1")
   hideRule("critical2")
   hideRule("critical3")
   hideRule("critical4")
   giveCash(CHALLENGE_REWARD)
   local l_3_1 = findType("Guest")
   for l_3_2 = 1, table.getn(l_3_1) do
      local l_3_5 = resolveTable(l_3_1[l_3_2].value)
      if l_3_5 ~= nil then
         local l_3_6 = l_3_5:BFG_GET_ATTR_FLOAT("happiness")
         if l_3_6 > 50 then
            setNeed(l_3_5, "happiness", 50)
         end
      end
   end
   showchallengewin("Challengetext:CHStressManagementSuccess")
   resetchallengeoverandcomplete("stressmanagement")
   incrementglobalchallenges()
   BFLOG(SYSTRACE, "Complete stressmanagement")
end

failStressManagement = function(l_4_arg0)
   hideRule("critical1")
   hideRule("critical2")
   hideRule("critical3")
   hideRule("critical4")
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHStressManagementFailure")
   end
   declinenotfail = nil
   resetchallengeover("stressmanagement")
end


