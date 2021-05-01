include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
manateerescueCHALLENGE_NAME = "manateerescue"
CHALLENGE_REWARD = "WhalePilotShortFinned_Adult_M"
CHALLENGE_ANIMAL = "ManateeWestIndian_Adult_F"
MANATEE_DEATH = nil
validate = function()
   if isChalDeclinedForever(manateerescueCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", manateerescueCHALLENGE_NAME)
   local l_1_0 = getglobalvar(manateerescueCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 3 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, manateerescueCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  BFLOG("giving out challenge")
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/manateerescue.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(manateerescueCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalManateeRescue = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(manateerescueCHALLENGE_NAME)
      end
      logDebugChallengeInfo(manateerescueCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(manateerescueCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(manateerescueCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(manateerescueCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHManateeRescue")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.manateeId == nil then
         l_2_arg0.manateeId = placeCratedWaterObjectAtGate(CHALLENGE_ANIMAL)
         -- Tried to add an 'end' here but it's incorrect
         local l_2_1, l_2_1 = findEntityByID(l_2_arg0.manateeId)
         if l_2_1 then
            l_2_1 = l_2_arg0.setNeeds
            if l_2_1 == nil then
               l_2_1 = BFLOG
               l_2_1("Set Manatee needs")
               l_2_1 = setNeed
               l_2_1(l_2_1, "hunger", 60)
               l_2_1 = setNeed
               l_2_1(l_2_1, "thirst", 60)
               l_2_1 = setNeed
               l_2_1(l_2_1, "rest", 80)
               l_2_1 = setNeed
               l_2_1(l_2_1, "privacy", 70)
               l_2_1 = setNeed
               l_2_1(l_2_1, "hygiene", 80)
               l_2_1 = setNeed
               l_2_1(l_2_1, "social", 30)
               l_2_1 = setNeed
               l_2_1(l_2_1, "stimulation", 70)
               l_2_1 = setNeed
               l_2_1(l_2_1, "health", 50)
               l_2_1(l_2_1, "b_showAdopt", false)
               l_2_1 = l_2_1:BFG_SET_ATTR_BOOLEAN
               l_2_arg0.setNeeds = 1
            end
         end
         if l_2_1 == nil then
            l_2_1 = queryObject
            l_2_1 = l_2_1("ZTStatus")
            --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

completeManateeRescue = function(l_3_arg0)
   placeCratedWaterObjectAtGate(CHALLENGE_REWARD)
   showchallengewin("Challengetext:CHManateeRescueSuccess")
   resetchallengeoverandcomplete(manateerescueCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failManateeRescue = function(l_4_arg0)
   if declinenotfail == nil then
      local l_4_1 = getglobalvar("MANATEE_DEATH")
      if l_4_1 ~= nil then
         showchallengefail("Challengetext:CHManateeRescueFailureDeath")
      else
         showchallengefail("Challengetext:CHManateeRescueFailureDeadline")
      end
   end
   resetchallengeover(manateerescueCHALLENGE_NAME)
   declinenotfail = nil
end


