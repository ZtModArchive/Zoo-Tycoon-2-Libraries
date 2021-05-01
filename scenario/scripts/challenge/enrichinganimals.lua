include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
enrichinganimalsCHALLENGE_NAME = "enrichinganimals"
validate = function()
   if isChalDeclinedForever(enrichinganimalsCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", enrichinganimalsCHALLENGE_NAME)
   local l_1_0 = getglobalvar(enrichinganimalsCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and howManyAnimalsInZoo() >= 10 and howManyEnrichResearched() < 10 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, enrichinganimalsCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/enrichinganimals.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(enrichinganimalsCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalenrichinganimals = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(enrichinganimalsCHALLENGE_NAME)
      end
      logDebugChallengeInfo(enrichinganimalsCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.alreadyresearched = howManyEnrichResearched()
      l_2_arg0.howmanyexist = howManyEnrichExist()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(enrichinganimalsCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(enrichinganimalsCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(enrichinganimalsCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHEnrichingAnimals")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept ~= nil then
      if l_2_arg0.enrichtimer == nil then
         l_2_arg0.enrichtimer = getCurrentMonth()
         l_2_arg0.enrichtimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1 = howManyEnrichResearched()
         local l_2_2 = howManyEnrichExist()
         if l_2_arg0.alreadyresearched + 5 < l_2_1 and l_2_arg0.howmanyexist + 5 < l_2_2 then
            return 1
         end
         local l_2_3 = getCurrentMonth()
         if (l_2_arg0.enrichtimer + 1 <= l_2_3 and l_2_arg0.enrichtimerday <= getCurrentTimeOfDay()) or l_2_arg0.enrichtimer + 2 <= l_2_3 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completeenrichinganimals = function(l_3_arg0)
   giveGuest(20)
   showchallengewin("Challengetext:CHEnrichingAnimalsSuccess")
   resetchallengeoverandcomplete(enrichinganimalsCHALLENGE_NAME)
   incrementglobalchallenges()
end

failenrichinganimals = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHEnrichingAnimalsFailure")
   end
   resetchallengeover(enrichinganimalsCHALLENGE_NAME)
   declinenotfail = nil
end


