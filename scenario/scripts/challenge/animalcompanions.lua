include("scenario/scripts/ui.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
animalcompanionsCHALLENGE_NAME = "animalcompanions"
validate = function()
   if isChalDeclinedForever(animalcompanionsCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalcompanionsCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalcompanionsCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(animalcompanionsCHALLENGE_NAME .. "_canrepeat", "true")
      do
         local l_1_1 = animalsInZoo()
         local l_1_2 = false
         for l_1_3 = 1, table.getn(l_1_1) do
            if unpairedAnimal(l_1_1[l_1_3]) == true then
               l_1_2 = true
            end
         end
         if l_1_2 == true then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, animalcompanionsCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/animalcompanions.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(animalcompanionsCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalanimalcompanions = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      declinenotfail = nil
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(animalcompanionsCHALLENGE_NAME)
      end
      local l_2_2 = findType(l_2_arg0.whatanimal)
      local l_2_3 = getZooEntrancePos()
      placeObject(l_2_arg0.whatanimal, l_2_3.x, l_2_3.y, l_2_3.z)
      local l_2_4 = findType(l_2_arg0.whatanimal)
      crateNewEntity(l_2_2, l_2_4)
      for l_2_5 = 1, table.getn(l_2_4) do
         local l_2_8 = false
         for l_2_9 = 1, table.getn(l_2_2) do
            local l_2_12 = resolveTable(l_2_4[l_2_5].value)
            local l_2_13 = resolveTable(l_2_2[l_2_9].value)
            if areCompsEqual(l_2_12, l_2_13) == true then
               l_2_8 = true
            end
         end
         if l_2_8 == false then
            l_2_arg0.animaltoremove = l_2_4[l_2_5]
         end
      end
      logDebugChallengeInfo(animalcompanionsCHALLENGE_NAME, "accepted")
      setchallengeactive()
      local l_2_5 = queryObject("BFScenarioMgr")
      local l_2_6 = ""
      local l_2_7 = ""
      if l_2_5 then
         l_2_6 = l_2_5:BFS_LOCALIZEFLOAT(l_2_arg0.halfcost)
         l_2_7 = l_2_5:BFS_LOCALIZEFLOAT(l_2_arg0.halfcost * 3)
      end
      local l_2_8 = getLocID("Challengetext:CHAnimalCompanions")
      showme = string.format(l_2_8, getlocidfromspecies(l_2_arg0.animalbase), l_2_6, l_2_7)
      setaltoverviewtext("animalcompanions", "neutral", showme)
      l_2_arg0.accept = 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalcompanionsCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalcompanionsCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalcompanionsCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = animalsInZoo()
      local l_2_2 = {}
      local l_2_3 = 1
      for l_2_4 = 1, table.getn(l_2_1) do
         if unpairedAnimal(l_2_1[l_2_4]) == true then
            l_2_2[l_2_3] = l_2_1[l_2_4]
            l_2_3 = l_2_3 + 1
         end
      end
      local l_2_4 = table.getn(l_2_2)
      l_2_arg0.animalbase = l_2_2[math.random(l_2_4)]
      if existMale(l_2_arg0.animalbase) == true then
         l_2_arg0.whatanimal = l_2_arg0.animalbase .. "_Adult_F"
      else
         l_2_arg0.whatanimal = l_2_arg0.animalbase .. "_Adult_M"
      end
      l_2_arg0.halfcost = getCostByBinder(l_2_arg0.whatanimal) / 2
      l_2_arg0.numchildstart = countType(l_2_arg0.animalbase .. "_Young")
      local l_2_5 = queryObject("BFScenarioMgr")
      local l_2_6 = ""
      local l_2_7 = ""
      if l_2_5 then
         l_2_6 = l_2_5:BFS_LOCALIZEFLOAT(l_2_arg0.halfcost)
         l_2_7 = l_2_5:BFS_LOCALIZEFLOAT(l_2_arg0.halfcost * 3)
      end
      local l_2_8 = getLocID("Challengetext:CHAnimalCompanions")
      showme = string.format(l_2_8, getlocidfromspecies(l_2_arg0.animalbase), l_2_6, l_2_7)
      showchallengepaneltext(showme)
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept ~= nil then
      if l_2_arg0.charged == nil then
         takeCash(l_2_arg0.halfcost)
         l_2_arg0.charged = 1
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1 = findType(l_2_arg0.animalbase .. "_Adult_F")
         for l_2_2 = 1, table.getn(l_2_1) do
            local l_2_5 = resolveTable(l_2_1[l_2_2].value)
            if l_2_5 ~= nil and l_2_5:BFG_GET_ATTR_BOOLEAN("b_Pregnant") == true then
               halfcost = l_2_arg0.halfcost
               return 1
            end
         end
         if l_2_arg0.companiontimer == nil then
            l_2_arg0.companiontimer = getCurrentMonth()
            l_2_arg0.companiontimerday = getCurrentTimeOfDay()
         end
         local l_2_2 = getCurrentMonth()
         if (l_2_arg0.companiontimer + 2 <= l_2_2 and l_2_arg0.companiontimerday <= getCurrentTimeOfDay()) or l_2_arg0.companiontimer + 3 <= l_2_2 then
            exactentity = l_2_arg0.exactentity
            halfcost = l_2_arg0.halfcost
            g_animaltoremove = l_2_arg0.animaltoremove
            return -1
         end
         if resolveTable(l_2_arg0.animaltoremove.value) == nil then
            halfcost = l_2_arg0.halfcost
            severe = 1
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completeanimalcompanions = function(l_3_arg0)
   giveCash(halfcost)
   showchallengewin("Challengetext:CHAnimalCompanionsSuccess")
   resetchallengeoverandcomplete(animalcompanionsCHALLENGE_NAME)
   incrementglobalchallenges()
end

failanimalcompanions = function(l_4_arg0)
   if declinenotfail == nil then
      if severe ~= nil then
         local l_4_1 = queryObject("BFScenarioMgr")
         local l_4_2 = ""
         if l_4_1 then
            l_4_2 = l_4_1:BFS_LOCALIZEFLOAT(halfcost * 3)
         end
         local l_4_3 = getLocID("Challengetext:CHAnimalCompanionsBadFailure")
         local l_4_4 = string.format(l_4_3, l_4_2)
         takeCash(halfcost * 3)
         setaltoverviewtext("animalcompanions", "failure", l_4_4)
         l_4_4 = getLocID("Challengetext:CHAnimalCompanionsBadFailureShort")
         setalttext("animalcompanions", "failure", l_4_4)
         showchallengefailtext(l_4_4)
      else
         local l_4_1 = resolveTable(g_animaltoremove.value)
         deleteEntity(l_4_1)
         showchallengefail("Challengetext:CHAnimalCompanionsFailure")
      end
   end
   resetchallengeover(animalcompanionsCHALLENGE_NAME)
   declinenotfail = nil
end


