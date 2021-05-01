include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
animalassistanceCHALLENGE_NAME = "animalassistance"
validate = function()
   if isChalDeclinedForever(animalassistanceCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalassistanceCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalassistanceCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = getEndangeredSpeciesList()
         if getHalfStars() >= 5 and table.getn(l_1_1) >= 2 then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, animalassistanceCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/animalassistance.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(animalassistanceCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalanimalassistance = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(animalassistanceCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animalassistanceCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalassistanceCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalassistanceCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalassistanceCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHAnimalAssistance")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.oldtable == nil then
         l_2_arg0.oldtable = {}
         l_2_arg0.speciesused = {}
         do
            local l_2_1 = findType("animal")
            for l_2_2 = 1, table.getn(l_2_1) do
               local l_2_5 = resolveTable(l_2_1[l_2_2].value)
               if l_2_5 then
                  local l_2_6 = getEndangerment(l_2_5)
                  if isChild(l_2_5) and (l_2_6 == "Endangered" or l_2_6 == "Critical") then
                     BFLOG("adding child to oldtable")
                     local l_2_7 = l_2_arg0.oldtable
                     local l_2_8 = table.getn(l_2_arg0.oldtable) + 1
                     l_2_7[l_2_8] = l_2_1[l_2_2]
                  end
               end
            end
            l_2_arg0.breedcount = 0
            l_2_arg0.totalreward = 0
            -- Tried to add an 'end' here but it's incorrect
         end
         local l_2_1 = findType("animal")
         for l_2_2 = 1, table.getn(l_2_1) do
            local l_2_5 = resolveTable(l_2_1[l_2_2].value)
            if l_2_5 then
               local l_2_6 = getEndangerment(l_2_5)
               if isChild(l_2_5) and (l_2_6 == "Critical" or l_2_6 == "Endangered") then
                  local l_2_7 = false
                  for l_2_8 = 1, table.getn(l_2_arg0.oldtable) do
                     local l_2_11 = resolveTable(l_2_arg0.oldtable[l_2_8].value)
                     if areCompsEqual(l_2_5, l_2_11) == true then
                        l_2_7 = true
                     end
                  end
                  local l_2_8 = getSpeciesName(l_2_5)
                  for l_2_9 = 1, table.getn(l_2_arg0.speciesused) do
                     if l_2_8 == l_2_arg0.speciesused[l_2_9] then
                        l_2_7 = true
                     end
                  end
                  if l_2_7 == false then
                     l_2_arg0.breedcount = l_2_arg0.breedcount + 1
                     BFLOG("incrementing breed count")
                     local l_2_9 = l_2_arg0.oldtable
                     local l_2_10 = table.getn(l_2_arg0.oldtable) + 1
                     l_2_9[l_2_10] = l_2_1[l_2_2]
                     l_2_9 = l_2_arg0.totalreward
                     l_2_10 = getCostByBinder
                     l_2_10 = l_2_10(getSpeciesName(l_2_5) .. "_Adult_F")
                     l_2_9 = l_2_9 + l_2_10
                     l_2_arg0.totalreward = l_2_9
                     l_2_9 = l_2_arg0.speciesused
                     l_2_10 = table
                     l_2_10 = l_2_10.getn
                     l_2_10 = l_2_10(l_2_arg0.speciesused)
                     l_2_10 = l_2_10 + 1
                     l_2_9[l_2_10] = l_2_8
                     l_2_9 = BFLOG
                     l_2_10 = "Incrementing reward by: "
                     l_2_10 = l_2_10 .. getCostByBinder(getSpeciesName(l_2_5) .. "_Adult_F")
                     l_2_9(l_2_10)
                  else
                     BFLOG("Strange entity problem")
                  end
                  -- Tried to add an 'end' here but it's incorrect
               end
            end
            BFLOG("breedcount: " .. l_2_arg0.breedcount)
            if l_2_arg0.breedcount >= 3 then
               totalreward = l_2_arg0.totalreward
               return 1
            end
            if l_2_arg0.aatimer == nil then
               l_2_arg0.aatimer = getCurrentMonth()
               l_2_arg0.aatimerday = getCurrentTimeOfDay()
            end
            local l_2_2 = getCurrentMonth()
            if (l_2_arg0.aatimer < l_2_2 and l_2_arg0.aatimerday <= getCurrentTimeOfDay()) or l_2_arg0.aatimer + 1 < l_2_2 then
               return -1
            end
            -- Tried to add an 'end' here but it's incorrect
            return 0
end

completeanimalassistance = function(l_3_arg0)
   giveCash(totalreward)
   showchallengewin("Challengetext:CHAnimalAssistanceSuccess")
   incrementendangeredchallenges()
   resetchallengeoverandcomplete(animalassistanceCHALLENGE_NAME)
   incrementglobalchallenges()
end

failanimalassistance = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHAnimalAssistanceFailure")
   end
   resetchallengeover(animalassistanceCHALLENGE_NAME)
   declinenotfail = nil
end


