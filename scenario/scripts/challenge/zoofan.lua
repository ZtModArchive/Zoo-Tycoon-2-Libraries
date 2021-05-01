include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
zoofanCHALLENGE_NAME = "zoofan"
validate = function()
   if isChalDeclinedForever(zoofanCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", zoofanCHALLENGE_NAME)
   local l_1_0 = getglobalvar(zoofanCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, zoofanCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  BFLOG("giving out challenge")
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. zoofanCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(zoofanCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalzoofan = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(zoofanCHALLENGE_NAME)
      end
      logDebugChallengeInfo(zoofanCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(zoofanCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(zoofanCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(zoofanCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHZooFanQuarterly")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.transporttimer == nil then
         l_2_arg0.transporttimer = getCurrentMonth()
         l_2_arg0.transporttimerday = getCurrentTimeOfDay()
         l_2_arg0.prevDonations = totalIncomeOfStation("groundstation")
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1 = totalIncomeOfStation("groundstation")
         BFLOG("total jeep donations: " .. l_2_1)
         BFLOG("prev jeep donations: " .. l_2_arg0.prevDonations)
         l_2_1 = l_2_1 - l_2_arg0.prevDonations
         if l_2_1 >= 1000 then
            return 1
         end
         local l_2_2 = getCurrentMonth()
         if (l_2_arg0.transporttimer + 2 <= l_2_2 and l_2_arg0.transporttimerday <= getCurrentTimeOfDay()) or l_2_arg0.transporttimer + 3 <= l_2_2 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completezoofan = function(l_3_arg0)
   incrementAwardPoints(1)
   giveGuest(10)
   showchallengewin("Challengetext:CHZooFanQuarterlySuccess")
   resetchallengeoverandcomplete(zoofanCHALLENGE_NAME)
   incrementglobalchallenges()
end

failzoofan = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHZooFanQuarterlyFailure")
   end
   resetchallengeover(zoofanCHALLENGE_NAME)
   declinenotfail = nil
end


