include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
renovationCHALLENGE_NAME = "renovation"
validate = function()
   if isChalDeclinedForever(renovationCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", renovationCHALLENGE_NAME)
   local l_1_0 = getglobalvar(renovationCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = 0
         l_1_1 = countType("chainlink") + countType("chainlink_broken") + countType("chainlink_gate") + countType("lowchainlink") + countType("lowchainlink_broken") + countType("lowchainlink_gate")
         if countType("Guest") < 100 and l_1_1 > 20 and getHalfStars() >= 4 then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, renovationCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/renovation.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(renovationCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalrenovation = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(renovationCHALLENGE_NAME)
      end
      logDebugChallengeInfo(renovationCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(renovationCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(renovationCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(renovationCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHRenovationInitiative")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.renovationtimer == nil then
         l_2_arg0.renovationtimer = getCurrentMonth()
         l_2_arg0.renovationtimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1 = getCurrentMonth()
         local l_2_2 = getCurrentTimeOfDay()
         local l_2_3 = 0
         l_2_3 = countType("chainlink") + countType("chainlink_broken") + countType("chainlinkgate") + countType("lowchainlink") + countType("lowchainlink_broken") + countType("lowchainlinkgate")
         if l_2_3 <= 0 then
            return 1
         end
         if (l_2_arg0.renovationtimer + 2 <= l_2_1 and l_2_arg0.renovationtimerday <= l_2_2) or l_2_arg0.renovationtimer + 3 <= l_2_1 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completerenovation = function(l_3_arg0)
   giveGuest(10)
   incrementAwardPoints(2)
   showchallengewin("Challengetext:CHRenovationInitiativeSuccess")
   resetchallengeoverandcomplete(renovationCHALLENGE_NAME)
   incrementglobalchallenges()
end

failrenovation = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHRenovationInitiativeFailure")
   end
   resetchallengeover(renovationCHALLENGE_NAME)
   declinenotfail = nil
end


