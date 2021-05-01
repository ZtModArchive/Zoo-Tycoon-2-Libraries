include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
animalreleaseCHALLENGE_NAME = "animalrelease"
validate = function()
   if isChalDeclinedForever(animalreleaseCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalreleaseCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalreleaseCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(animalreleaseCHALLENGE_NAME .. "_canrepeat", "true")
      do
         local l_1_1 = {}
         l_1_1[1] = "PandaRed"
         l_1_1[2] = "RhinocerosBlack"
         l_1_1[3] = "TigerBengal"
         l_1_1[4] = "ElephantAfrican"
         l_1_1[5] = "Chimpanzee"
         l_1_1[6] = "GorillaMountain"
         l_1_1[7] = "LeopardSnow"
         l_1_1[8] = "PandaGiant"
         if howManyInTableExist(l_1_1) >= 1 then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, animalreleaseCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/" .. animalreleaseCHALLENGE_NAME .. ".xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(animalreleaseCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

countAnimalsReleased = function(l_2_arg0)
   local l_2_1 = queryObject("ZTStatus")
   local l_2_2 = 0
   if l_2_1 then
      l_2_2 = l_2_1:ZT_GET_ANIMALS_RELEASED(l_2_arg0 .. "_Adult_M") + l_2_1:ZT_GET_ANIMALS_RELEASED(l_2_arg0 .. "_Adult_F") + l_2_1:ZT_GET_ANIMALS_RELEASED(l_2_arg0 .. "_Young_M") + l_2_1:ZT_GET_ANIMALS_RELEASED(l_2_arg0 .. "_Young_F")
      return l_2_2
   else
      BFLOG(SYSTRACE, "Error getting ZTStatus")
      return nil
   end
end

evalanimalrelease = function(l_3_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_3_1 = queryObject("BFScenarioMgr")
      if l_3_1 then
         l_3_1:BFS_SHOWRULE(animalreleaseCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animalreleaseCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_3_arg0.accept = 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalreleaseCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalreleaseCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalreleaseCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_3_arg0.accept == nil and challenge == nil then
      local l_3_1 = {}
      l_3_1[1] = "PandaRed"
      l_3_1[2] = "RhinocerosBlack"
      l_3_1[3] = "TigerBengal"
      l_3_1[4] = "ElephantAfrican"
      l_3_1[5] = "Chimpanzee"
      l_3_1[6] = "GorillaMountain"
      l_3_1[7] = "LeopardSnow"
      l_3_1[8] = "PandaGiant"
      local l_3_2 = getTableFromTableEntityExist(l_3_1)
      local l_3_3 = table.getn(l_3_2)
      l_3_arg0.whatanimal = l_3_2[math.random(l_3_3)]
      local l_3_4 = queryObject("BFGManager")
      if l_3_4 ~= nil then
         local l_3_5 = l_3_4:BFG_GET_ENTITIES(l_3_arg0.whatanimal)
         local l_3_6 = (resolveTable(l_3_5[1].value))
         local l_3_7 = nil
         if l_3_6 ~= nil then
            l_3_7 = getCostByBinder(l_3_6:BFG_GET_BINDER_TYPE())
         end
         if l_3_7 == nil then
            return -1
         end
         l_3_arg0.cashrewardadvance = 3 * l_3_7 * 0.2
         l_3_arg0.cashreward = 3 * l_3_7
         l_3_arg0.prevreleases = countAnimalsReleased(l_3_arg0.whatanimal)
      else
         BFLOG(SYSERROR, "Cannot find the game manager!")
         return -1
      end
      local l_3_5 = getlocidfromspecies(l_3_arg0.whatanimal)
      local l_3_6 = getLocID("Challengetext:CHAnimalReleaseShort")
      local l_3_7 = string.format(l_3_6, l_3_5)
      setAltText("animalrelease", "neutral", l_3_7)
      local l_3_8 = queryObject("BFScenarioMgr")
      local l_3_9 = ""
      local l_3_10 = ""
      if l_3_8 then
         l_3_9 = l_3_8:BFS_LOCALIZEFLOAT(l_3_arg0.cashreward)
         l_3_10 = l_3_8:BFS_LOCALIZEFLOAT(l_3_arg0.cashrewardadvance)
      end
      l_3_6 = getLocID("Challengetext:CHAnimalRelease")
      l_3_7 = string.format(l_3_6, l_3_5, l_3_9, l_3_5, l_3_10)
      setAltOverviewText("animalrelease", "neutral", l_3_7)
      showchallengepaneltext(l_3_7)
      setglobalvar("challenge", "waiting")
   end
   if l_3_arg0.accept ~= nil then
      local l_3_1 = countAnimalsReleased(l_3_arg0.whatanimal)
      local l_3_2 = countType(l_3_arg0.whatanimal)
      if l_3_arg0.paidadvance == nil then
         l_3_arg0.paidadvance = 1
         giveCash(l_3_arg0.cashrewardadvance)
      end
      if l_3_arg0.prevreleases ~= nil and l_3_arg0.prevreleases < l_3_1 then
         g_cashRemaining = l_3_arg0.cashreward - l_3_arg0.cashrewardadvance
         giveCash(g_cashRemaining)
         l_3_arg0.paidadvance = nil
         whatanimal = l_3_arg0.whatanimal
         return 1
      elseif l_3_2 == 0 then
         whatanimal = l_3_arg0.whatanimal
         l_3_arg0.paidadvance = nil
         return -1
      end
      l_3_arg0.prevreleases = l_3_1
   end
   return 0
end

completeanimalrelease = function(l_4_arg0)
   local l_4_1 = queryObject("BFScenarioMgr")
   local l_4_2 = ""
   if l_4_1 then
      l_4_2 = l_4_1:BFS_LOCALIZEFLOAT(g_cashRemaining)
   end
   local l_4_3 = getLocID("Challengetext:CHAnimalReleaseSuccess")
   local l_4_4 = string.format(l_4_3, getlocidfromspecies(whatanimal), l_4_2)
   setaltoverviewtext("animalrelease", "success", l_4_4)
   l_4_3 = getLocID("Challengetext:CHAnimalReleaseSuccessShort")
   l_4_4 = string.format(l_4_3, getlocidfromspecies(whatanimal))
   setalttext("animalrelease", "success", l_4_4)
   showchallengewintext(l_4_4)
   resetchallengeoverandcomplete(animalreleaseCHALLENGE_NAME)
   incrementglobalchallenges()
end

failanimalrelease = function(l_5_arg0)
   if declinenotfail == nil then
      local l_5_1 = getLocID("Challengetext:CHAnimalReleaseFailure")
      local l_5_2 = string.format(l_5_1, getlocidfromspecies(whatanimal))
      setaltoverviewtext("animalrelease", "failure", l_5_2)
      showchallengefailtext(l_5_2)
      l_5_1 = getLocID("Challengetext:CHAnimalReleaseFailureShort")
      l_5_2 = string.format(l_5_1, getlocidfromspecies(whatanimal))
      setalttext("animalrelease", "failure", l_5_2)
   end
   resetchallengeover(animalreleaseCHALLENGE_NAME)
   declinenotfail = nil
end


