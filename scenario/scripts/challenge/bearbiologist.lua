include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
SPECIES_TYPE = "Ursidae"
bearbiologistCHALLENGE_NAME = "bearbiologist"
validate = function()
   if isChalDeclinedForever(bearbiologistCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", bearbiologistCHALLENGE_NAME)
   local l_1_0 = getglobalvar(bearbiologistCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Ursidae") == 1 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, bearbiologistCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/bearbiologistschallenge.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(bearbiologistCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

bearbiologistschallenge = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(bearbiologistCHALLENGE_NAME)
      end
      logDebugChallengeInfo(bearbiologistCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.origbeartable = getUniqueSpeciesTable(SPECIES_TYPE)
      l_2_arg0.origbeartablesize = table.getn(l_2_arg0.origbeartable)
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(bearbiologistCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(bearbiologistCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(bearbiologistCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("Challengetext:CHBearConference")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.beartimer == nil then
         l_2_arg0.beartimer = getCurrentMonth()
         l_2_arg0.beartimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         if l_2_arg0.bearover == nil then
            local l_2_1 = getCurrentMonth()
            local l_2_2 = getCurrentTimeOfDay()
            local l_2_3 = l_2_arg0.beartimer + 4
            if (l_2_3 <= l_2_1 and l_2_arg0.beartimerday <= l_2_2) or l_2_3 + 1 <= l_2_1 then
               l_2_arg0.bearover = 1
               takecash = takeCash(3000)
               return -1
            end
            local l_2_4 = getUniqueSpeciesTable(SPECIES_TYPE)
            local l_2_5 = table.getn(l_2_4)
            if l_2_arg0.origbeartablesize < l_2_5 then
               for l_2_6 = 1, table.getn(l_2_arg0.origbeartable) do
                  local l_2_9 = l_2_arg0.origbeartable[l_2_6]
                  local l_2_10 = false
                  for l_2_11 = 1, table.getn(l_2_4) do
                     if l_2_9 == l_2_4[l_2_11] then
                        l_2_10 = true
                     end
                  end
                  if l_2_10 == false then
                     return 0
                  end
               end
               return 1
            end
            return 0
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completebearchallenge = function(l_3_arg0)
   giveCash(2000)
   showchallengewin("Challengetext:CHBearSuccess")
   resetchallengeoverandcomplete(bearbiologistCHALLENGE_NAME)
   incrementglobalchallenges()
end

failbearchallenge = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHBearFailure")
   end
   resetchallengeover(bearbiologistCHALLENGE_NAME)
   declinenotfail = nil
end


