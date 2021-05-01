include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
eaapart3CHALLENGE_NAME = "eaapart3"
validate = function()
   if isChalDeclinedForever(eaapart3CHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(eaapart3CHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 7 and (countType("Wolverine") >= 1 or countType("GibbonCrested") >= 1 or countType("BearSpectacled") >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, eaapart3CHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. eaapart3CHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(eaapart3CHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evaleaapart3 = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(eaapart3CHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(eaapart3CHALLENGE_NAME)
      end
      logDebugChallengeInfo(eaapart3CHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(eaapart3CHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(eaapart3CHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(eaapart3CHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHEAAPart3")
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
   if scoreAnyEntityTypeDoingTarget(l_4_arg0, "Wolverine", "FoodDish") >= 1 then
      return 1
   end
   return 0
end

scoreSecondEndangeredAnimal = function(l_5_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_5_arg0, "GibbonCrested", "GroomBaby_GroomBelly") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "GibbonCrested", "GroomBaby_GroomHead") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "GibbonCrested", "GroomOther_GroomArms") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "GibbonCrested", "GroomOther_GroomBack") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "GibbonCrested", "GroomOther_GroomHead") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "GibbonCrested", "GroomOther_Idle") >= 1 then
      return 1
   end
   return 0
end

scoreThirdEndangeredAnimal = function(l_6_arg0)
   if scoreAnyEntityTypeDoingTarget(l_6_arg0, "BearSpectacled", "PuyaPlant_Temperate") >= 1 then
      return 1
   end
   return 0
end

completeeaapart3 = function(l_7_arg0)
   placeCratedObjectAtGate("PantherFlorida_Adult_F")
   setglobalvar("award_eaapart3", "true")
   incrementendangeredchallenges()
   showchallengewin("PhotoChallengetext:PHEAAPart3Success")
   resetchallengeoverandcomplete(eaapart3CHALLENGE_NAME)
   incrementphotochallenges()
end

faileaapart3 = function(l_8_arg0)
   resetchallengeover(eaapart3CHALLENGE_NAME)
   clearphotochallenge(eaapart3CHALLENGE_NAME .. "photo")
end


