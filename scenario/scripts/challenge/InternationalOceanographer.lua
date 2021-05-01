include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
internationaloceanographerCHALLENGE_NAME = "internationaloceanographer"
CHALLENGE_REWARD_GUEST = 5
CHALLENGE_REWARD_FAME = 1
CHALLENGE_ANIMAL_1 = "MarlinBlue"
CHALLENGE_ANIMAL_2 = "TurtleLeatherback"
CHALLENGE_ANIMAL_3 = "WhalePilotShortFinned"
validate = function()
   if isChalDeclinedForever(internationaloceanographerCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(internationaloceanographerCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 5 and (countType(CHALLENGE_ANIMAL_1) >= 1 or countType(CHALLENGE_ANIMAL_2) >= 1 or countType(CHALLENGE_ANIMAL_3) >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, internationaloceanographerCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/InternationalOceanographer.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(internationaloceanographerCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalinternationaloceanographer = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(internationaloceanographerCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(internationaloceanographerCHALLENGE_NAME)
      end
      logDebugChallengeInfo(internationaloceanographerCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(internationaloceanographerCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(internationaloceanographerCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(internationaloceanographerCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHInternationalOceanographer")
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

scoreMarlinsUnderwater = function(l_3_arg0)
   if scoreContainsTwoT1Underwater(l_3_arg0, CHALLENGE_ANIMAL_1) >= 1 then
      return 1
   end
   return 0
end

scoreLeatherbackTurtleAndJellyfish = function(l_4_arg0)
   if scoreT1ContainsT2(l_4_arg0, "BuoyLure_Jellyfish", CHALLENGE_ANIMAL_2) >= 1 or scoreT1ContainsT2(l_4_arg0, "ArtificialReef_Jellyfish", CHALLENGE_ANIMAL_2) >= 1 then
      return 1
   end
   return 0
end

scorePilotWhaleUnderwater = function(l_5_arg0)
   if findMatchingEntityInWater(l_5_arg0, CHALLENGE_ANIMAL_3) ~= nil then
      return 1
   end
   return 0
end

completeinternationaloceanographer = function(l_6_arg0)
   BFLOG("Current Fame level: " .. getZooFame())
   setMaxFame(getZooFame() + CHALLENGE_REWARD_FAME)
   BFLOG("New Fame level(one tick higher): " .. getZooFame())
   giveGuest(CHALLENGE_REWARD_GUEST)
   showchallengewin("PhotoChallengetext:PHInternationalOceanographerSuccess")
   resetchallengeoverandcomplete(internationaloceanographerCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failinternationaloceanographer = function(l_7_arg0)
   resetchallengeover(internationaloceanographerCHALLENGE_NAME)
   clearphotochallenge(internationaloceanographerCHALLENGE_NAME .. "photo")
end


