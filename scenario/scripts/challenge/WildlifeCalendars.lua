include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
wildlifecalendarsCHALLENGE_NAME = "wildlifecalendars"
CHALLENGE_REWARD = 7000
CHALLENGE_ANIMAL_1 = "Hippopotamus_Adult"
CHALLENGE_ANIMAL_2 = "PenguinEmperor_Adult"
CHALLENGE_ANIMAL_3 = "BearPolar_Adult"
validate = function()
   if isChalDeclinedForever(wildlifecalendarsCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(wildlifecalendarsCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 6 and (countType(CHALLENGE_ANIMAL_1) >= 1 or countType(CHALLENGE_ANIMAL_2) >= 1 or countType(CHALLENGE_ANIMAL_3) >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, wildlifecalendarsCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/WildlifeCalendars.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(wildlifecalendarsCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalwildlifecalendars = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(wildlifecalendarsCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(wildlifecalendarsCHALLENGE_NAME)
      end
      logDebugChallengeInfo(wildlifecalendarsCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(wildlifecalendarsCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(wildlifecalendarsCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(wildlifecalendarsCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHWildlifeCalendars")
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

scoreHippoUnderwaterWalk = function(l_3_arg0)
   local l_3_1 = {"WanderWaterFloor", "WanderWaterFloor_Midday"}
   if scoreAnyDoingTaskInList(l_3_arg0, CHALLENGE_ANIMAL_1, l_3_1) >= 1 then
      return 1
   end
   return 0
end

scorePenguinDive = function(l_4_arg0)
   local l_4_1 = {"Walk_2Swim"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_4_arg0, CHALLENGE_ANIMAL_2, l_4_1) >= 1 then
      return 1
   end
   return 0
end

scorePolarBearFlipOrRoll = function(l_5_arg0)
   local l_5_1 = {"_BarrelRoll", "Swim_Roll"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_5_arg0, CHALLENGE_ANIMAL_3, l_5_1) >= 1 then
      return 1
   end
   return 0
end

completewildlifecalendars = function(l_6_arg0)
   giveCash(CHALLENGE_REWARD)
   showchallengewin("PhotoChallengetext:PHWildlifeCalendarsSuccess")
   resetchallengeoverandcomplete(wildlifecalendarsCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failwildlifecalendars = function(l_7_arg0)
   resetchallengeover(wildlifecalendarsCHALLENGE_NAME)
   clearphotochallenge(wildlifecalendarsCHALLENGE_NAME .. "photo")
end


