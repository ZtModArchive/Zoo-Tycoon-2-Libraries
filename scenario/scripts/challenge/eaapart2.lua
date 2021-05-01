include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
eaapart2CHALLENGE_NAME = "eaapart2"
validate = function()
   if isChalDeclinedForever(eaapart2CHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(eaapart2CHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 7 and (countType("AntelopeSableGiant") >= 1 or countType("WolfGray") >= 1 or countType("KomodoDragon_Young") >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, eaapart2CHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. eaapart2CHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(eaapart2CHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evaleaapart2 = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(eaapart2CHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(eaapart2CHALLENGE_NAME)
      end
      logDebugChallengeInfo(eaapart2CHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(eaapart2CHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(eaapart2CHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(eaapart2CHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHEAAPart2")
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

doThreeEndangeredAnimalsPhoto = function(l_3_arg0)
end

scoreFirstEndangeredAnimal = function(l_4_arg0)
   if scoreAnyEntityTypeDoingTarget(l_4_arg0, "AntelopeSableGiant", "SaltLick_df") >= 1 then
      return 1
   end
   return 0
end

scoreSecondEndangeredAnimal = function(l_5_arg0)
   if scoreAnyEntityTypeDoingTarget(l_5_arg0, "KomodoDragon", "LookoutPost") >= 1 then
      return 1
   end
   return 0
end

scoreThirdEndangeredAnimal = function(l_6_arg0)
   if scoreAnyEntityTypeDoingTarget(l_6_arg0, "WolfGray", "BeefShank") >= 1 then
      return 1
   end
   return 0
end

completeeaapart2 = function(l_7_arg0)
   placeCratedObjectAtGate("TireSwing_df")
   setglobalvar("award_eaapart2", "true")
   incrementendangeredchallenges()
   showchallengewin("PhotoChallengetext:PHEAAPart2Success")
   resetchallengeoverandcomplete(eaapart2CHALLENGE_NAME)
   incrementphotochallenges()
end

faileaapart2 = function(l_8_arg0)
   resetchallengeover(eaapart2CHALLENGE_NAME)
   clearphotochallenge(eaapart2CHALLENGE_NAME .. "photo")
end


