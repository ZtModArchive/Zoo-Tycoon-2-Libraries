include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
hireeducatorsCHALLENGE_NAME = "hireeducators"
CHALLENGE_REWARD = "SharkWhale_Adult_F"
validate = function()
   if isChalDeclinedForever(hireeducatorsCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", hireeducatorsCHALLENGE_NAME)
   local l_1_0 = getglobalvar(hireeducatorsCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 5 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, hireeducatorsCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  BFLOG("giving out challenge")
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/HireEducators.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(hireeducatorsCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalHireEducators = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(hireeducatorsCHALLENGE_NAME)
      end
      logDebugChallengeInfo(hireeducatorsCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(hireeducatorsCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(hireeducatorsCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(hireeducatorsCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHHireEducators")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.oldtable == nil then
         l_2_arg0.oldtable = {}
         do
            local l_2_1 = findType("Educator")
            l_2_arg0.oldtable = table.getn(l_2_1)
            BFLOG("num of old educators " .. l_2_arg0.oldtable)
            -- Tried to add an 'end' here but it's incorrect
         end
         if l_2_arg0.takeCash == nil then
            takeCash(500)
            giveTwoEducator()
            l_2_arg0.takeCash = 1
         end
         do
            local l_2_1 = findType("Educator")
            if table.getn(l_2_1) < l_2_arg0.oldtable + 2 then
               return -1
            end
            if checkTimeLimit(l_2_arg0, 2, 0) == -1 then
               return 1
            end
            return 0
            -- Tried to add an 'end' here but it's incorrect
         end
         return 0
end

completeHireEducators = function(l_3_arg0)
   placeCratedObjectAtGate(CHALLENGE_REWARD)
   showchallengewin("Challengetext:CHHireEducatorsSuccess")
   resetchallengeoverandcomplete(hireeducatorsCHALLENGE_NAME)
   incrementglobalchallenges()
end

failHireEducators = function(l_4_arg0)
   local l_4_1 = findType("Guest")
   for l_4_2 = 1, table.getn(l_4_1) do
      local l_4_5 = resolveTable(l_4_1[l_4_2].value)
      if l_4_5 ~= nil then
         local l_4_6 = l_4_5:BFG_GET_ATTR_FLOAT("happiness")
         l_4_5:BFG_SET_ATTR_FLOAT("happiness", l_4_6 + 5)
      end
   end
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHHireEducatorsFailure")
   end
   resetchallengeover(hireeducatorsCHALLENGE_NAME)
   declinenotfail = nil
end

giveTwoEducator = function()
   BFLOG(SYSTRACE, "Adding 2 Educators")
   local l_5_0 = getZooEntrancePos()
   placeObject("Educator_Adult_M_01", l_5_0.x + 10, l_5_0.y + 10, l_5_0.z)
   placeObject("Educator_Adult_F_01", l_5_0.x + 15, l_5_0.y + 10, l_5_0.z)
end


