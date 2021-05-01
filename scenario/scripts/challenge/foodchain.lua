include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
foodchainCHALLENGE_NAME = "foodchain"
validate = function()
   if isChalDeclinedForever(foodchainCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", foodchainCHALLENGE_NAME)
   local l_1_0 = getglobalvar(foodchainCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and thisManyExist("Carnivora", 1) == true then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, foodchainCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/foodchain.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(foodchainCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalfoodchain = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(foodchainCHALLENGE_NAME .. "photos")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("FoodChain")
      end
      logDebugChallengeInfo(foodchainCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(foodchainCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(foodchainCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(foodchainCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("FoodChaintext:PHFoodChain")
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

scoreCarnivoreStalking = function(l_3_arg0)
   local l_3_1 = {"ChasePrey", "StalkMissPrey", "StalkMissPreyAngry", "StalkMissPrey_Night", "StalkMissPrey_Morning", "AmbushPrey", "LeadPackHuntPrey", "YoungStalk", "KillPredatorPrey", "ChasePrey_Snack"}
   if scoreAnyDoingTaskInList(l_3_arg0, "animal", l_3_1) >= 1 then
      return 1
   end
   return 0
end

scoreCarnivoreCatching = function(l_4_arg0)
   local l_4_1 = {"AttackPrey", "MarineAttackPrey", "AttackWeakPrey", "AttackPrey_Snack"}
   if scoreAnyDoingTaskInList(l_4_arg0, "animal", l_4_1) >= 1 then
      return 1
   end
   return 0
end

completefoodchain = function(l_5_arg0)
   giveGuest(20)
   showchallengewin("FoodChaintext:PHFoodChainSuccess")
   resetchallengeoverandcomplete(foodchainCHALLENGE_NAME)
   incrementphotochallenges()
end

failfoodchain = function(l_6_arg0)
   resetchallengeover(foodchainCHALLENGE_NAME)
   clearphotochallenge(foodchainCHALLENGE_NAME .. "photo")
end


