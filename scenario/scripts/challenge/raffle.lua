include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
raffleCHALLENGE_NAME = "raffle"
validate = function()
   if isChalDeclinedForever(raffleCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", raffleCHALLENGE_NAME)
   local l_1_0 = getglobalvar(raffleCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(raffleCHALLENGE_NAME .. "_canrepeat", "true")
      do
         if countType("Guest") >= 50 then
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, raffleCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/raffle.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(raffleCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalraffle = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(raffleCHALLENGE_NAME)
      end
      takeCash(1000)
      local l_2_2 = countType("Guest") + 10
      local l_2_3 = math.random(4)
      if l_2_3 == 1 then
         rafflewinnings = l_2_2 * 50
         giveCash(rafflewinnings)
         return 1
      else
         rafflewinnings = l_2_2 * 50
         return -1
      end
      logDebugChallengeInfo(raffleCHALLENGE_NAME, "accepted")
      setchallengeactive()
      return 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(raffleCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(raffleCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(raffleCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = queryObject("BFScenarioMgr")
      local l_2_2 = ""
      if l_2_1 then
         l_2_2 = l_2_1:BFS_LOCALIZEFLOAT(1000)
      end
      local l_2_3 = getLocID("Challengetext:CHRaffle")
      local l_2_4 = string.format(l_2_3, l_2_2)
      showchallengepaneltext(l_2_4)
      setglobalvar("challenge", "waiting")
   end
   return 0
end

completeraffle = function(l_3_arg0)
   local l_3_1 = queryObject("BFScenarioMgr")
   local l_3_2 = ""
   if l_3_1 then
      l_3_2 = l_3_1:BFS_LOCALIZEFLOAT(rafflewinnings)
   end
   local l_3_3 = getLocID("Challengetext:CHRaffleSuccess")
   local l_3_4 = string.format(l_3_3, l_3_2)
   setaltoverviewtext("raffle", "success", l_3_4)
   showchallengewintext(l_3_4)
   resetchallengeoverandcomplete(raffleCHALLENGE_NAME)
   incrementglobalchallenges()
end

failraffle = function(l_4_arg0)
   if declinenotfail == nil then
      local l_4_1 = queryObject("BFScenarioMgr")
      local l_4_2 = ""
      if l_4_1 then
         l_4_2 = l_4_1:BFS_LOCALIZEFLOAT(rafflewinnings)
      end
      local l_4_3 = getLocID("Challengetext:CHRaffleFailure")
      local l_4_4 = string.format(l_4_3, l_4_2)
      setaltoverviewtext("raffle", "failure", l_4_4)
      showchallengefailtext(l_4_4)
   end
   resetchallengeover(raffleCHALLENGE_NAME)
   declinenotfail = nil
end


