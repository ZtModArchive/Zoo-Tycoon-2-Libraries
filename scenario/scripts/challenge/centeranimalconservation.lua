include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
centeranimalconservationCHALLENGE_NAME = "centeranimalconservation"
validate = function()
   if isChalDeclinedForever(centeranimalconservationCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", centeranimalconservationCHALLENGE_NAME)
   local l_1_0 = getglobalvar(centeranimalconservationCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and (countType("TigerBengal") >= 1 or countType("LeopardSnow") >= 1 or countType("BearGrizzly") >= 1 or countType("GorillaMountain") >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, centeranimalconservationCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/centeranimalconservation.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(centeranimalconservationCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalcenteranimalconservation = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(centeranimalconservationCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("CenterAnimalConservation")
      end
      logDebugChallengeInfo(centeranimalconservationCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(centeranimalconservationCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(centeranimalconservationCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(centeranimalconservationCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("CenterAnimalConservationtext:PHCenterAnimalConservation")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if numPhotoRequirements() == 0 then
         return 1
         -- Tried to add an 'end' here but it's incorrect
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

scoreBengalTiger = function(l_3_arg0)
   return scoreT1(l_3_arg0, "TigerBengal")
end

scoreSnowLeopard = function(l_4_arg0)
   return scoreT1(l_4_arg0, "LeopardSnow")
end

scoreMountainGorilla = function(l_5_arg0)
   return scoreT1(l_5_arg0, "GorillaMountain")
end

scoreGrizzlyBear = function(l_6_arg0)
   return scoreT1(l_6_arg0, "BearGrizzly")
end

completecenteranimalconservation = function(l_7_arg0)
   giveCash(15000)
   showchallengewin("CenterAnimalConservationtext:PHCenterAnimalConservationSuccess")
   resetchallengeoverandcomplete(centeranimalconservationCHALLENGE_NAME)
   incrementphotochallenges()
end

failcenteranimalconservation = function(l_8_arg0)
   resetchallengeover(centeranimalconservationCHALLENGE_NAME)
   clearphotochallenge(centeranimalconservationCHALLENGE_NAME .. "photo")
end


