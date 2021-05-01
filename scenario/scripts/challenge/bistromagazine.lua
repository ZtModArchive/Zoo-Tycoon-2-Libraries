include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
bistromagazineCHALLENGE_NAME = "bistromagazine"
validate = function()
   if isChalDeclinedForever(bistromagazineCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", bistromagazineCHALLENGE_NAME)
   local l_1_0 = getglobalvar("bistromagazine_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and (countType("Cheetah") >= 1 or countType("Giraffe") >= 1 or countType("LemurRingtailed") >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, bistromagazineCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/bistromagazine.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(bistromagazineCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalbistromagazine = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(bistromagazineCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("BistroMagazine")
      end
      logDebugChallengeInfo(bistromagazineCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(bistromagazineCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(bistromagazineCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(bistromagazineCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("BistroMagazinetext:PHBistroMagazine")
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

scoreCheetahEatMeatCarcass = function(l_3_arg0)
   local l_3_1 = scoreAnyEntityTypeDoingTaskWithTarget
   local l_3_2 = l_3_arg0
   local l_3_3 = "Cheetah"
   local l_3_4 = {"Eat"}
   l_3_1 = l_3_1(l_3_2, l_3_3, l_3_4, "Carcass_Meat")
   if l_3_1 >= 1 then
      l_3_1 = 1
      return l_3_1
   end
   l_3_1 = 0
   return l_3_1
end

scoreGiraffeEatBranchesBrowseHolder = function(l_4_arg0)
   if scoreT1ContainsT2(l_4_arg0, "BrowseHolder", "Giraffe") >= 1 then
      return 1
   end
   return 0
end

scoreLemurEatElevatedDish = function(l_5_arg0)
   if scoreT1ContainsT2(l_5_arg0, "ElevatedDish", "LemurRingtailed") >= 1 then
      return 1
   end
   return 0
end

completebistromagazine = function(l_6_arg0)
   giveCash(6000)
   showchallengewin("BistroMagazinetext:PHBistroMagazineSuccess")
   resetchallengeoverandcomplete(bistromagazineCHALLENGE_NAME)
   incrementphotochallenges()
end

failbistromagazine = function(l_7_arg0)
   resetchallengeover(bistromagazineCHALLENGE_NAME)
   clearphotochallenge(bistromagazineCHALLENGE_NAME .. "photo")
end


