include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
ungulatesCHALLENGE_NAME = "ungulates"
validate = function()
   if isChalDeclinedForever(ungulatesCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", ungulatesCHALLENGE_NAME)
   local l_1_0 = getglobalvar(ungulatesCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and (countType("GazelleThomsons") >= 1 or countType("CamelDromedary") >= 1 or countType("Gemsbok") >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, ungulatesCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/ungulates.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(ungulatesCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalungulates = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(ungulatesCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("Ungulates")
      end
      logDebugChallengeInfo(ungulatesCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(ungulatesCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(ungulatesCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(ungulatesCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHUngulate")
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
end

scoreCamel = function(l_3_arg0)
   return scoreT1(l_3_arg0, "CamelDromedary")
end

scoreGemsbok = function(l_4_arg0)
   return scoreT1(l_4_arg0, "Gemsbok")
end

scoreGazelle = function(l_5_arg0)
   return scoreT1(l_5_arg0, "GazelleThomsons")
end

completeungulates = function(l_6_arg0)
   incrementAwardPoints(2)
   giveCash(2250)
   showchallengewin("PhotoChallengetext:PHUngulateSuccess")
   resetchallengeoverandcomplete(ungulatesCHALLENGE_NAME)
   incrementphotochallenges()
end

failungulates = function(l_7_arg0)
   resetchallengeover(ungulatesCHALLENGE_NAME)
   clearphotochallenge(ungulatesCHALLENGE_NAME .. "photo")
end


