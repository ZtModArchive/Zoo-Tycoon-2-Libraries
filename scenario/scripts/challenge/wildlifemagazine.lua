include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
wildlifemagazineCHALLENGE_NAME = "wildlifemagazine"
validate = function()
   if isChalDeclinedForever(wildlifemagazineCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", wildlifemagazineCHALLENGE_NAME)
   local l_1_0 = getglobalvar(wildlifemagazineCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = {}
         l_1_1[1] = "ZebraCommon"
         l_1_1[2] = "FlamingoGreater"
         l_1_1[3] = "Hippopotamus"
         l_1_1[4] = "CrocodileNile"
         l_1_1[5] = "Kangaroo"
         if howManyInTableExist(l_1_1) >= 1 and getHalfStars() >= 4 then
            setglobalvar("challengeactive", "true")
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, wildlifemagazineCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/wildlifemagazinephotochallengegoals.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(wildlifemagazineCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalwildlifemagazinephoto = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(wildlifemagazineCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("WildlifeMagazine")
      end
      l_2_arg0.targetMonth = getCurrentMonth() + 2
      l_2_arg0.targetTimeOfDay = getCurrentTimeOfDay()
      logDebugChallengeInfo(wildlifemagazineCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(wildlifemagazineCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(wildlifemagazineCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(wildlifemagazineCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("WildlifeMagChallengetext:PHWildlifeMag")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      local l_2_1 = queryObject("ZTPhotoChallengesComponent")
      if numPhotoRequirements() == 0 then
         return 1
      end
      gComplete = true
      if l_2_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         gComplete = true
         return 1
      elseif (l_2_arg0.targetMonth <= getCurrentMonth() and l_2_arg0.targetTimeOfDay <= getCurrentTimeOfDay()) or l_2_arg0.targetMonth + 1 <= getCurrentMonth() then
         if numPhotoRequirementsMet() > 0 then
            return 1
         else
            return -1
         end
      end
      return 0
   end
   return 0
end

scoreThreeZebras = function(l_3_arg0)
   if numberOfT1(l_3_arg0, "ZebraCommon") >= 3 then
      return 1
   end
   return 0
end

scoreFlamingoesandHippo = function(l_4_arg0)
   if numberOfT1(l_4_arg0, "FlamingoGreater") >= 2 and numberOfT1(l_4_arg0, "Hippopotamus") >= 1 then
      return 1
   end
   return 0
end

scoreCrocinWater = function(l_5_arg0)
   if numEntityExistsInWater(l_5_arg0, "CrocodileNile") >= 1 then
      return 1
   end
   return 0
end

scoreKangarooTailThumping = function(l_6_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_6_arg0, "Kangaroo", "Stand_ThumpTail") >= 1 then
      return 1
   end
   return 0
end

completewildlifemagazinephoto = function(l_7_arg0)
   if gComplete then
      numFinished = 4
   else
      numFinished = numPhotoRequirementsMet()
   end
   giveCash(2000 * numFinished)
   if numFinished == 4 then
      showchallengewin("WildlifeMagChallengetext:PHWildlifeMagFullSuccess")
   else
      showchallengewin("WildlifeMagChallengetext:PHWildlifeMagPartialSuccess")
      local l_7_1 = getLocID("WildlifeMagChallengetext:PHWildlifeMagPartialSuccess")
      setAltOverviewText("wildlifemagazinephoto", "success", l_7_1)
   end
   resetchallengeoverandcomplete(wildlifemagazineCHALLENGE_NAME)
   incrementphotochallenges()
end

failwildlifemagazinephoto = function(l_8_arg0)
   if declinenotfail == nil then
      showchallengefail("WildlifeMagChallengetext:PHWildlifeMagFailure")
   end
   resetchallengeover(wildlifemagazineCHALLENGE_NAME)
   clearphotochallenge(wildlifemagazineCHALLENGE_NAME .. "photo")
   declinenotfail = nil
   return 1
end


