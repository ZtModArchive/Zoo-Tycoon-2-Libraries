include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
compuglobalCHALLENGE_NAME = "compuglobal"
EXEC_TYPE = "Guest_Adult_M_Business"
validate = function()
   if isChalDeclinedForever(compuglobalCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", compuglobalCHALLENGE_NAME)
   local l_1_0 = getglobalvar(compuglobalCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = getEndangeredSpeciesList()
         if table.getn(l_1_1) >= 1 then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, compuglobalCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/compuglobal.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(compuglobalCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalcompuglobal = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(compuglobalCHALLENGE_NAME)
      end
      logDebugChallengeInfo(compuglobalCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(compuglobalCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(compuglobalCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(compuglobalCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHCompuglobal")
      setglobalvar("challenge", "waiting")
   end
   do
      if l_2_arg0.accept == 1 then
         if l_2_arg0.execsInZoo == nil then
            local l_2_1 = getZooEntrancePos()
            placeObject(EXEC_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            placeObject(EXEC_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            placeObject(EXEC_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            local l_2_2 = findType(EXEC_TYPE)
            BFLOG(table.getn(l_2_2))
            if table.getn(l_2_2) ~= 3 then
               BFLOG("Found NOT three execs (" .. table.getn(l_2_2) .. "), possible error")
            end
            for l_2_3 = 1, table.getn(l_2_2) do
               local l_2_6 = resolveTable(l_2_2[l_2_3].value)
               if l_2_6 then
                  BFLOG("Setting exec name")
                  local l_2_7 = getLocID("Challengetext:CHCompuglobalExecutiveName")
                  if l_2_3 == 2 then
                     l_2_7 = getLocID("Challengetext:CHCompuglobalExecutiveName2")
                  elseif l_2_3 == 3 then
                     l_2_7 = getLocID("Challengetext:CHCompuglobalExecutiveName3")
                  end
                  l_2_6:BFG_SET_ATTR_STRING("s_name", l_2_7)
               end
            end
            l_2_arg0.execsInZoo = true
            -- Tried to add an 'end' here but it's incorrect
         end
         local l_2_1 = {}
         local l_2_2 = findType(EXEC_TYPE)
         for l_2_3 = 1, table.getn(l_2_2) do
            local l_2_6 = resolveTable(l_2_2[l_2_3].value)
            if l_2_6 then
               local l_2_7 = l_2_6:sendMessage("ZTAI_GET_SEEN")
               local l_2_8 = {}
               for l_2_9 = 1, table.getn(l_2_7) do
                  l_2_8[l_2_9] = l_2_7[l_2_9].value
               end
               l_2_1 = unionOfTables(l_2_1, l_2_8)
            end
         end
         local l_2_3 = 0
         for l_2_4 = 1, table.getn(l_2_1) do
            local l_2_7 = getStringFromBinder(l_2_1[l_2_4], "s_Endangerment")
            if l_2_7 ~= "LowRisk" and l_2_7 ~= "Vulnerable" then
               l_2_3 = l_2_3 + 1
            end
         end
         BFLOG("totalEndangeredSeen: " .. l_2_3)
         if l_2_3 >= 3 then
            return 1
         end
         if countType(EXEC_TYPE) == 0 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completecompuglobal = function(l_3_arg0)
   giveCash(10000)
   showchallengewin("Challengetext:CHCompuglobalSuccess")
   incrementendangeredchallenges()
   resetchallengeoverandcomplete(compuglobalCHALLENGE_NAME)
   incrementglobalchallenges()
end

failcompuglobal = function(l_4_arg0)
   incrementAwardPoints(-1)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHCompuglobalFailure")
   end
   resetchallengeover(compuglobalCHALLENGE_NAME)
   declinenotfail = nil
end


