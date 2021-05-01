include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
ungulatespart2CHALLENGE_NAME = "ungulatespart2"
validate = function()
   if isChalDeclinedForever(ungulatespart2CHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", ungulatespart2CHALLENGE_NAME)
   local l_1_0 = getglobalvar(ungulatespart2CHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = getglobalvar("ungulates_over")
         if l_1_1 ~= nil and l_1_1 == "true" then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, ungulatespart2CHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/ungulatespart2.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(ungulatespart2CHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalungulatespart2 = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(ungulatespart2CHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("UngulatesPart2")
      end
      logDebugChallengeInfo(ungulatespart2CHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(ungulatespart2CHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(ungulatespart2CHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(ungulatespart2CHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("UngulatesPart2text:PHUngulatesPart2")
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

scoreCamelsGrooming = function(l_3_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_3_arg0, "CamelDromedary", "Stand_Lean") >= 1 then
      return 1
   end
   return 0
end

scoreGemsbokSleepingShade = function(l_4_arg0)
   local l_4_1 = scoreAnyEntityTypeDoingTaskAndAnim
   local l_4_2 = l_4_arg0
   local l_4_3 = "Gemsbok"
   local l_4_4 = {"SleepShade", "ShadeStructureBasic_Rest", "SleepGrass"}
   local l_4_5 = {"Sleep_Idle", "Rest_Idle"}
   l_4_1 = l_4_1(l_4_2, l_4_3, l_4_4, l_4_5)
   if l_4_1 >= 1 then
      l_4_1 = 1
      return l_4_1
   end
   l_4_1 = 0
   return l_4_1
end

scoreGazelleGreeting = function(l_5_arg0)
   local l_5_1 = scoreAnyDoingTaskInList
   local l_5_2 = l_5_arg0
   local l_5_3 = "GazelleThomsons"
   local l_5_4 = {"InviteGreet"}
   l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4)
   if l_5_1 >= 1 then
      l_5_1 = 1
      return l_5_1
   end
   l_5_1 = 0
   return l_5_1
end

completeungulatespart2 = function(l_6_arg0)
   giveCash(4500)
   showchallengewin("UngulatesPart2text:PHUngulatesPart2Success")
   resetchallengeoverandcomplete(ungulatespart2CHALLENGE_NAME)
   incrementphotochallenges()
end

failungulatespart2 = function(l_7_arg0)
   resetchallengeover(ungulatespart2CHALLENGE_NAME)
   clearphotochallenge(ungulatespart2CHALLENGE_NAME .. "photo")
end


