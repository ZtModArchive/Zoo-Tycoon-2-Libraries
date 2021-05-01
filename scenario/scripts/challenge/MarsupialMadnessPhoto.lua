include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("marsupialmadness") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "marsupialmadness")
   local l_1_0 = getglobalvar("marsupialmadness_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 5 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, "marsupialmadness")
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/marsupialmadnessphoto.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo("marsupialmadness", "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalMarsupialMadness = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("marsupialmadness")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("MarsupialMadness")
      end
      logDebugChallengeInfo("marsupialmadness", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("marsupialmadness" .. "_decline_forever", "true")
         logDebugChallengeInfo("marsupialmadness", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("marsupialmadness", "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHMarsupialMadnessPhoto")
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

scoreDiprotodonWaterfall = function(l_3_arg0)
   BFLOG(SYSTRACE, "score Diprotodon and Waterfall")
   if numberOfT1(l_3_arg0, "Diprotodon") >= 1 and numberOfT1(l_3_arg0, "MistyWaterfall") >= 1 then
      return 1
   end
   return 0
end

scoreThylacineGape = function(l_4_arg0)
   BFLOG(SYSTRACE, "score Thylacine doing Gape")
   local l_4_1 = {"_Gape", "_2Gape"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_4_arg0, "Thylacine", l_4_1) >= 1 then
      return 1
   end
   return 0
end

completeMarsupialMadness = function(l_5_arg0)
   giveCash(6000)
   showchallengewin("PhotoChallengetext:PHMarsupialMadnessPhotoSuccess")
   resetchallengeoverandcomplete("marsupialmadness")
   incrementphotochallenges()
end

failMarsupialMadness = function(l_6_arg0)
   resetchallengeover("marsupialmadness")
   clearphotochallenge("marsupialmadness")
end


