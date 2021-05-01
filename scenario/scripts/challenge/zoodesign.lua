include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
zoodesignCHALLENGE_NAME = "zoodesign"
validate = function()
   if isChalDeclinedForever(zoodesignCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", zoodesignCHALLENGE_NAME)
   local l_1_0 = getglobalvar(zoodesignCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("building") >= 3 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, zoodesignCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/zoodesign.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(zoodesignCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalzoodesign = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(zoodesignCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("ZooDesignMonthly")
      end
      logDebugChallengeInfo(zoodesignCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(zoodesignCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(zoodesignCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(zoodesignCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("ZooDesigntext:PHZooDesign")
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

scoreSmallRestroom = function(l_3_arg0)
   return scoreT1(l_3_arg0, "bathroomsmall")
end

scoreGiftCart = function(l_4_arg0)
   if scoreT1(l_4_arg0, "giftcart_df") >= 1 or scoreT1(l_4_arg0, "giftcart_mm") >= 1 or scoreT1(l_4_arg0, "giftcart_xt") >= 1 then
      return 1
   end
end

scoreKangarooRide = function(l_5_arg0)
   return scoreT1(l_5_arg0, "Kangaroo_df")
end

scoreAnyFoodStand = function(l_6_arg0)
   return scoreT1(l_6_arg0, "Foodstand")
end

completezoodesign = function(l_7_arg0)
   incrementAwardPoints(2)
   showchallengewin("ZooDesigntext:PHZooDesignSuccess")
   resetchallengeoverandcomplete(zoodesignCHALLENGE_NAME)
   incrementphotochallenges()
end

failzoodesign = function(l_8_arg0)
   resetchallengeover(zoodesignCHALLENGE_NAME)
   clearphotochallenge(zoodesignCHALLENGE_NAME .. "photo")
end


