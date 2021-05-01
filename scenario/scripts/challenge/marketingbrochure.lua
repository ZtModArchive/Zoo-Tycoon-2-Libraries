include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
marketingbrochureCHALLENGE_NAME = "marketingbrochure"
validate = function()
   if isChalDeclinedForever(marketingbrochureCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", marketingbrochureCHALLENGE_NAME)
   local l_1_0 = getglobalvar(marketingbrochureCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Guest") >= 20 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, marketingbrochureCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/marketingbrochure.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(marketingbrochureCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalmarketingbrochure = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(marketingbrochureCHALLENGE_NAME)
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("Marketing_brochure")
      end
      logDebugChallengeInfo(marketingbrochureCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(marketingbrochureCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(marketingbrochureCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(marketingbrochureCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHMarketingBrochure")
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

completemarketingbrochure = function(l_3_arg0)
   incrementAwardPoints(2)
   showchallengewin("PhotoChallengetext:PHMarketingBrochureSuccess")
   resetchallengeoverandcomplete(marketingbrochureCHALLENGE_NAME)
   incrementphotochallenges()
end

failmarketingbrochure = function(l_4_arg0)
   resetchallengeover(marketingbrochureCHALLENGE_NAME)
   clearphotochallenge(marketingbrochureCHALLENGE_NAME)
end

takepicofguest = function(l_5_arg0)
   return scoreT1ContainsT2(l_5_arg0, "bench", "Guest")
end

guestwithsoda = function(l_6_arg0)
   return scoreT1ContainsT2(l_6_arg0, "Guest", "Soda")
end


