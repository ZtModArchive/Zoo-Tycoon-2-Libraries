include("scenario/scripts/ui.lua")
include("scenario/scripts/Shows.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
dolphintrainingCHALLENGE_NAME = "dolphintraining"
CHALLENGE_REWARD_CASH = 20000
CHALLENGE_REWARD_GUEST = 10
CHALLENGE_REWARD_FAME = 1.875
validate = function()
   if isChalDeclinedForever(dolphintrainingCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", dolphintrainingCHALLENGE_NAME)
   local l_1_0 = getglobalvar(dolphintrainingCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      BFLOG("Not done already")
      if getHalfStars() >= 7 and countType(DolphinBottlenose_Adult) == 0 then
         BFLOG("Passed Prereqs")
         do
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, dolphintrainingCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/dolphintraining.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(dolphintrainingCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evaldolphintraining = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(dolphintrainingCHALLENGE_NAME)
      end
      logDebugChallengeInfo(dolphintrainingCHALLENGE_NAME, "accepted")
      setchallengeactive()
      showprimarygoals()
      l_2_arg0.accept = 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(dolphintrainingCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(dolphintrainingCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(dolphintrainingCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHDolphinTraining")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if hasSpeciesWithTrickOfLevelX("DolphinBottlenose_Adult", "DolphinFlipForward", 60) then
         return 1
         -- Tried to add an 'end' here but it's incorrect
         return checkTimeLimit(l_2_arg0, 2, 0)
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completeTrickOne = function(l_3_arg0)
   giveGuest(CHALLENGE_REWARD_GUEST)
   setMaxFame(getZooFame() + CHALLENGE_REWARD_FAME * 2)
   showchallengewin("Challengetext:CHDolphinTrainingSuccessTrickTwo")
   resetchallengeoverandcomplete(dolphintrainingCHALLENGE_NAME)
   incrementglobalchallenges()
end

failTrickOne = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHDolphinTrainingFailureTrickTwo")
   end
   resetchallengeover(dolphintrainingCHALLENGE_NAME)
   declinenotfail = nil
end


