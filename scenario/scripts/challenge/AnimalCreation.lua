include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/fossil.lua")
validate = function()
   if isChalDeclinedForever("animalcreation") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "animalcreation")
   local l_1_0 = getglobalvar("animalcreation_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = 0
         local l_1_2 = queryObject("ZTPuzzleMgr")
         if l_1_2 ~= nil then
            l_1_1 = l_1_2:ZT_GET_SONAR_LEVEL()
         end
         if l_1_1 > 0 and l_1_1 < 5 and countType("CloningCenter") >= 1 and howMuchCash() >= 10000 then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, "animalcreation")
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/animalcreation.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo("animalcreation", "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalAnimalCreation = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("animalcreation")
      end
      logDebugChallengeInfo("animalcreation", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
      local l_2_2 = queryObject("ZTStatus")
      if l_2_2 then
         local l_2_3 = getglobalvar("animalcreationScenarioAnimal")
         l_2_2:ZT_ADD_ANIMAL_FOR_CREATION(l_2_3)
      end
      takeCash(5000)
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("animalcreation" .. "_decline_forever", "true")
         setglobalvar("animalcreationScenarioAnimal", nil)
         logDebugChallengeInfo("animalcreation", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("animalcreation", "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = nil
      local l_2_2 = queryObject("ZTPuzzleMgr")
      if l_2_2 then
         l_2_1 = l_2_2:ZT_CHOOSE_RANDOM_PUZZLE("1")
      end
      setglobalvar("animalcreationScenarioAnimal", l_2_1)
      local l_2_3 = getlocidfromspecies(l_2_1)
      local l_2_4 = getLocID("Challengetext:CHAnimalCreationShort")
      local l_2_5 = string.format(l_2_4, l_2_3)
      setAltText("animalcreation", "neutral", l_2_5)
      l_2_4 = getLocID("Challengetext:CHAnimalCreation")
      l_2_5 = string.format(l_2_4, l_2_3, l_2_3)
      setAltOverviewText("animalcreation", "neutral", l_2_5)
      showchallengepaneltext(l_2_5)
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      local l_2_1, l_2_1 = queryObject("ZTStatus")
      if l_2_1 then
         l_2_1 = getglobalvar
         l_2_1 = l_2_1("animalcreationScenarioAnimal")
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

completeAnimalCreation = function(l_3_arg0)
   showchallengewin("Challengetext:CHAnimalCreationSuccess")
   giveCash(5000)
   resetchallengeoverandcomplete("animalcreation")
   incrementglobalchallenges()
end

failAnimalCreation = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHAnimalCreationFailure")
   end
   resetchallengeover("animalcreation")
   declinenotfail = nil
end


