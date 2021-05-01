include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
RAND_SKEW = 30
animalawarenessdayCHALLENGE_NAME = "animalawarenessday"
validate = function()
   if isChalDeclinedForever(animalawarenessdayCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalawarenessdayCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalawarenessdayCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = math.random(RAND_SKEW)
         if l_1_1 == 1 then
            setglobalvar(animalawarenessdayCHALLENGE_NAME .. "_canrepeat", "true")
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, animalawarenessdayCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/animalawarenessday.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(animalawarenessdayCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalanimalawarenessday = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      declinenotfail = nil
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(animalawarenessdayCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animalawarenessdayCHALLENGE_NAME, "accepted")
      setchallengeactive()
      local l_2_2 = getLocID("Challengetext:CHAnimalAwarenessDay")
      local l_2_3 = queryObject("BFScenarioMgr")
      local l_2_4 = ""
      if l_2_3 then
         l_2_4 = l_2_3:BFS_LOCALIZEFLOAT(l_2_arg0.cashreward)
      end
      local l_2_5 = string.format(l_2_2, getlocidfromspecies(l_2_arg0.whatanimal), l_2_4)
      setaltoverviewtext("animalawarenessday", "neutral", l_2_5)
      l_2_2 = getLocID("Challengetext:CHAnimalAwarenessDayShort")
      l_2_5 = string.format(l_2_2, getlocidfromspecies(l_2_arg0.whatanimal), getlocidfromspecies(l_2_arg0.whatanimal))
      setalttext("animalawarenessday", "neutral", l_2_5)
      l_2_arg0.accept = 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalawarenessdayCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalawarenessdayCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalawarenessdayCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = getAnimalsAvailableByStars(getHalfStars() + 3)
      local l_2_2 = animalsNotInTable(l_2_1)
      local l_2_3 = table.getn(l_2_2)
      l_2_arg0.whatanimal = l_2_2[math.random(l_2_3)]
      local l_2_4 = math.random(40)
      l_2_arg0.cashreward = (80 + l_2_4) / 100 * getCostByBinder(l_2_arg0.whatanimal .. "_Adult_F")
      local l_2_5 = queryObject("BFScenarioMgr")
      local l_2_6 = ""
      if l_2_5 then
         l_2_6 = l_2_5:BFS_LOCALIZEFLOAT(l_2_arg0.cashreward)
      end
      local l_2_7 = getLocID("Challengetext:CHAnimalAwarenessDay")
      local l_2_8 = string.format(l_2_7, getlocidfromspecies(l_2_arg0.whatanimal), l_2_6)
      showchallengepaneltext(l_2_8)
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept ~= nil then
      if l_2_arg0.awarenesstimer == nil then
         l_2_arg0.awarenesstimer = getCurrentMonth()
         l_2_arg0.awarenesstimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1 = getCurrentMonth()
         local l_2_2 = getCurrentTimeOfDay()
         if (l_2_arg0.awarenesstimer + 2 <= l_2_1 and l_2_arg0.awarenesstimerday <= l_2_2) or l_2_arg0.awarenesstimer + 3 <= l_2_1 then
            if countType(l_2_arg0.whatanimal) >= 1 then
               giveCash(l_2_arg0.cashreward - l_2_arg0.cashreward / 5)
               whatanimal = l_2_arg0.whatanimal
               return 1
            else
               whatanimal = l_2_arg0.whatanimal
               return -1
            end
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completeanimalawarenessday = function(l_3_arg0)
   local l_3_1 = math.random(10)
   giveGuest(10 + l_3_1)
   local l_3_2 = getLocID("Challengetext:CHAnimalAwarenessDaySuccessShort")
   local l_3_3 = string.format(l_3_2, getlocidfromspecies(whatanimal))
   setalttext("animalawarenessday", "success", l_3_3)
   l_3_2 = getLocID("Challengetext:CHAnimalAwarenessDaySuccess")
   l_3_3 = string.format(l_3_2, getlocidfromspecies(whatanimal))
   setaltoverviewtext("animalawarenessday", "success", l_3_3)
   showchallengewintext(l_3_3)
   resetchallengeoverandcomplete(animalawarenessdayCHALLENGE_NAME)
   incrementglobalchallenges()
end

failanimalawarenessday = function(l_4_arg0)
   if declinenotfail == nil then
      local l_4_1 = math.random(5)
      giveGuest(l_4_1)
      local l_4_2 = getLocID("Challengetext:CHAnimalAwarenessDayFailureShort")
      local l_4_3 = string.format(l_4_2, getlocidfromspecies(whatanimal))
      setalttext("animalawarenessday", "failure", l_4_3)
      l_4_2 = getLocID("Challengetext:CHAnimalAwarenessDayFailure")
      l_4_3 = string.format(l_4_2, getlocidfromspecies(whatanimal))
      setaltoverviewtext("animalawarenessday", "failure", l_4_3)
      showchallengefailtext(l_4_3)
   end
   declinenotfail = nil
   resetchallengeover(animalawarenessdayCHALLENGE_NAME)
end


