include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
alternatetransportCHALLENGE_NAME = "alternatetransport"
NUM_TO_TRANSPORT = 50
CASH_REWARD = 5000
validate = function()
   if isChalDeclinedForever(alternatetransportCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", alternatetransportCHALLENGE_NAME)
   local l_1_0 = getglobalvar(alternatetransportCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = -1
         local l_1_2 = queryObject("ZTTransportationMgr")
         if l_1_2 then
            l_1_1 = l_1_2:ZT_MAX_STATIONS_ON_SKYTRACK()
         end
         if getHalfStars() >= 4 and (l_1_1 >= 1 or howMuchCash() >= 5000) then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, alternatetransportCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/" .. alternatetransportCHALLENGE_NAME .. ".xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(alternatetransportCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalalternatetransport = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(alternatetransportCHALLENGE_NAME)
      end
      giveCash(CASH_REWARD)
      logDebugChallengeInfo(alternatetransportCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(alternatetransportCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(alternatetransportCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(alternatetransportCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHAlternateTransport")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.transporttimer == nil then
         l_2_arg0.transporttimer = getCurrentMonth()
         l_2_arg0.transporttimerday = getCurrentTimeOfDay()
         do
            local l_2_1 = totalUsersOfStation("skystation")
            BFLOG("alreadyTransported " .. l_2_1 .. " guests via skytram")
            l_2_arg0.alreadyTransported = l_2_1
            -- Tried to add an 'end' here but it's incorrect
         end
         local l_2_1 = totalUsersOfStation("skystation")
         BFLOG(l_2_1 .. " guests total transported via skytram")
         l_2_1 = l_2_1 - l_2_arg0.alreadyTransported
         BFLOG(l_2_1 .. " guests transported via skytram are counted")
         if NUM_TO_TRANSPORT <= l_2_1 then
            return 1
         end
         local l_2_2 = getCurrentMonth()
         if (l_2_arg0.transporttimer + 2 <= l_2_2 and l_2_arg0.transporttimerday <= getCurrentTimeOfDay()) or l_2_arg0.transporttimer + 3 <= l_2_2 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completealternatetransport = function(l_3_arg0)
   giveCash(CASH_REWARD)
   showchallengewin("Challengetext:CHAlternateTransportSuccess")
   resetchallengeoverandcomplete(alternatetransportCHALLENGE_NAME)
   incrementglobalchallenges()
end

failalternatetransport = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHAlternateTransportFailure")
   end
   resetchallengeover(alternatetransportCHALLENGE_NAME)
   declinenotfail = nil
end


