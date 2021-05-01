include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
eaapart1CHALLENGE_NAME = "eaapart1"
validate = function()
   if isChalDeclinedForever(eaapart1CHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(eaapart1CHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 3 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, eaapart1CHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. eaapart1CHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(eaapart1CHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evaleaapart1 = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(eaapart1CHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(eaapart1CHALLENGE_NAME)
      end
      logDebugChallengeInfo(eaapart1CHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(eaapart1CHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(eaapart1CHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(eaapart1CHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHEAAPart1")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if numPhotoRequirements() == 0 then
         return 1
         -- Tried to add an 'end' here but it's incorrect
         if firstSpecies ~= nil and l_2_arg0.firstSpecies == nil then
            l_2_arg0.firstSpecies = firstSpecies
         end
         if secondSpecies ~= nil and l_2_arg0.secondSpecies == nil then
            l_2_arg0.secondSpecies = secondSpecies
         end
         if thirdSpecies ~= nil and l_2_arg0.thirdSpecies == nil then
            l_2_arg0.thirdSpecies = thirdSpecies
         end
         if l_2_arg0.firstSpecies ~= nil then
            firstSpecies = l_2_arg0.firstSpecies
         end
         if l_2_arg0.secondSpecies ~= nil then
            secondSpecies = l_2_arg0.secondSpecies
         end
         if l_2_arg0.thirdSpecies ~= nil then
            thirdSpecies = l_2_arg0.thirdSpecies
         end
         numPhotoRequirementsMet()
         local l_2_1 = queryObject("ZTPhotoChallengesComponent")
         if l_2_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
            return 1
         else
            return 0
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

doThreeEndangeredAnimalsPhoto = function(l_3_arg0)
end

scoreFirstEndangeredAnimal = function(l_4_arg0)
   local l_4_1 = 0
   local l_4_2 = getEndangeredSpeciesList()
   for l_4_3 = 1, table.getn(l_4_2) do
      if numberOfT1(l_4_arg0, l_4_2[l_4_3]) >= 1 then
         if firstSpecies == nil then
            firstSpecies = l_4_2[l_4_3]
            l_4_1 = 1
         --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

scoreSecondEndangeredAnimal = function(l_5_arg0)
   if secondSpecies ~= nil then
      return 1
   end
   local l_5_1 = 0
   if firstSpecies ~= nil then
      local l_5_2 = getEndangeredSpeciesList()
      for l_5_3 = 1, table.getn(l_5_2) do
         --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

scoreThirdEndangeredAnimal = function(l_6_arg0)
   if thirdSpecies ~= nil then
      return 1
   end
   local l_6_1 = 0
   if firstSpecies ~= nil and secondSpecies ~= nil then
      local l_6_2 = getEndangeredSpeciesList()
      for l_6_3 = 1, table.getn(l_6_2) do
         if numberOfT1(l_6_arg0, l_6_2[l_6_3]) >= 1 and isKindOf(l_6_2[l_6_3], firstSpecies) == false and isKindOf(l_6_2[l_6_3], secondSpecies) == false then
            thirdSpecies = l_6_2[l_6_3]
            l_6_1 = 1
         end
      end
   end
   return l_6_1
end

completeeaapart1 = function(l_7_arg0)
   local l_7_1 = getAllEndangeredSpeciesList()
   local l_7_2 = animalsInZoo()
   local l_7_3 = {}
   local l_7_4 = ""
   local l_7_5 = getHalfStars() * 10
   for l_7_6 = 1, table.getn(l_7_1) do
      local l_7_9 = false
      for l_7_10 = 1, table.getn(l_7_2) do
         if l_7_1[l_7_6] == l_7_2[l_7_10] then
            l_7_9 = true
         end
      end
      if l_7_9 == false then
         local l_7_10 = queryObject("ZTWorldMgr")
         if l_7_10 then
            local l_7_11, l_7_12 = l_7_10:BFG_GET_ATTR_FLOAT, l_7_10
            local l_7_13
            l_7_11, l_7_13 = l_7_11(l_7_12, l_7_13), {key = l_7_1[l_7_6], val = "f_adoptRarity"}
            if l_7_11 <= l_7_5 then
               l_7_12 = table
               l_7_12 = l_7_12.getn
               l_7_13 = l_7_3
               l_7_12 = l_7_12(l_7_13)
               l_7_12 = l_7_12 + 1
               l_7_13 = l_7_1[l_7_6]
               l_7_3[l_7_12] = l_7_13
            end
         end
      end
   end
   local l_7_6 = ""
   local l_7_7 = ""
   if table.getn(l_7_3) >= 1 then
      l_7_4 = l_7_3[math.random(table.getn(l_7_3))]
      local l_7_8 = l_7_4
      l_7_4 = l_7_4 .. "_Adult_"
      if math.random(2) == 0 then
         l_7_4 = l_7_4 .. "M"
      else
         l_7_4 = l_7_4 .. "F"
      end
      placeCratedObjectAtGate(l_7_4)
      l_7_6 = getLocID("PhotoChallengetext:PHEAAPart1Success")
      l_7_7 = string.format(l_7_6, getlocidfromspecies(l_7_8))
      showtextshort = getLocID("PhotoChallengetext:PHEAAPart1SuccessShort")
      showmeshort = string.format(showtextshort, getlocidfromspecies(l_7_8))
   else
      local l_7_8 = "TortoiseGalapagos"
      l_7_4 = l_7_8 .. "_Adult_F"
      placeCratedObjectAtGate(l_7_4)
      l_7_6 = getLocID("PhotoChallengetext:PHEAAPart1Success")
      l_7_7 = string.format(l_7_6, getlocidfromspecies(l_7_8))
      showtextshort = getLocID("PhotoChallengetext:PHEAAPart1SuccessShort")
      showmeshort = string.format(showtextshort, getlocidfromspecies(l_7_8))
   end
   setglobalvar("award_eaapart1", "true")
   incrementendangeredchallenges()
   showchallengewintext(l_7_7)
   setalttext(eaapart1CHALLENGE_NAME .. "photo", "success", l_7_7)
   setaltoverviewtext(eaapart1CHALLENGE_NAME .. "photo", "success", showmeshort)
   resetchallengeoverandcomplete(eaapart1CHALLENGE_NAME)
   incrementphotochallenges()
end

faileaapart1 = function(l_8_arg0)
   resetchallengeover(eaapart1CHALLENGE_NAME)
   clearphotochallenge(eaapart1CHALLENGE_NAME .. "photo")
end


