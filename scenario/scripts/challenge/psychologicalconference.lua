include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
psychologicalconferenceCHALLENGE_NAME = "psychologicalconference"
validate = function()
   if isChalDeclinedForever(psychologicalconferenceCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", psychologicalconferenceCHALLENGE_NAME)
   local l_1_0 = getglobalvar(psychologicalconferenceCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and howManyEnrichResearched() >= 1 and (thisManyExist("BearPolar", 1) == true or thisManyExist("ElephantAfrican", 1) == true or thisManyExist("RhinocerosBlack", 1) == true or thisManyExist("TigerBengal", 1) == true) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, psychologicalconferenceCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/psychologicalconference.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(psychologicalconferenceCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalpsychologicalconference = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(psychologicalconferenceCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("PsychologicalConference")
      end
      logDebugChallengeInfo(psychologicalconferenceCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(psychologicalconferenceCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(psychologicalconferenceCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(psychologicalconferenceCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PsychologicalConferencetext:PHPsychologicalConference")
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

scoreBearPolarUseCarTire = function(l_3_arg0)
   if scoreAnyEntityTypeDoingTarget(l_3_arg0, "BearPolar", "CarTire") >= 1 then
      return 1
   end
   return 0
end

scoreElephantUseEasel = function(l_4_arg0)
   local l_4_1 = scoreAnyEntityTypeDoingTaskAndBehsetWithTarget
   local l_4_2 = l_4_arg0
   local l_4_3 = "ElephantAfrican"
   local l_4_4 = {"Paint"}
   l_4_1 = l_4_1(l_4_2, l_4_3, l_4_4, "PaintRegular", "Easel")
   if l_4_1 >= 1 then
      l_4_1 = 1
      return l_4_1
   else
      l_4_1 = scoreAnyEntityTypeDoingTaskAndBehsetWithTarget
      l_4_2 = l_4_arg0
      l_4_3 = "ElephantAfrican"
      l_4_4 = {"Paint"}
      l_4_1 = l_4_1(l_4_2, l_4_3, l_4_4, "PaintVariant", "Easel")
      if l_4_1 >= 1 then
         l_4_1 = 1
         return l_4_1
      end
   end
   l_4_1 = 0
   return l_4_1
end

scoreTigerBengalUseHeatedRock = function(l_5_arg0)
   local l_5_1 = scoreAnyEntityTypeDoingTaskAndBehsetWithTarget
   local l_5_2 = l_5_arg0
   local l_5_3 = "TigerBengal"
   local l_5_4 = {"HeatedRockMedium", "HeatedRockAdvanced", "HeatedRockElite"}
   l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4, "UseHeatedRock", "HeatedRock")
   if l_5_1 >= 1 then
      l_5_1 = 1
      return l_5_1
   end
   l_5_1 = 0
   return l_5_1
end

scoreRhinoUsePursuitBall = function(l_6_arg0)
   local l_6_1 = scoreAnyEntityTypeDoingTaskAndBehsetWithTarget
   local l_6_2 = l_6_arg0
   local l_6_3 = "RhinocerosBlack"
   local l_6_4 = {"PlayBasic", "PlayMedium", "PlayAdvanced", "PlayElite"}
   l_6_1 = l_6_1(l_6_2, l_6_3, l_6_4, "ChaseBall", "PursuitBall")
   if l_6_1 >= 1 then
      l_6_1 = 1
      return l_6_1
   end
   l_6_1 = 0
   return l_6_1
end

completepsychologicalconference = function(l_7_arg0)
   giveCash(20000)
   showchallengewin("PsychologicalConferencetext:PHPsychologicalConferenceSuccess")
   resetchallengeoverandcomplete(psychologicalconferenceCHALLENGE_NAME)
   incrementphotochallenges()
end

failpsychologicalconference = function(l_8_arg0)
   resetchallengeover(psychologicalconferenceCHALLENGE_NAME)
   clearphotochallenge(psychologicalconferenceCHALLENGE_NAME .. "photo")
end


