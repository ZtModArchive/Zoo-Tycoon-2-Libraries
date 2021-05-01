include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("freepenguin") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "freepenguin")
   local l_1_0 = getglobalvar("freepenguin_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = false
         local l_1_2 = countType("PenguinKiller")
         if l_1_2 <= 0 then
            local l_1_3 = queryObject("ZTStatus")
            if l_1_3 then
               local l_1_4 = l_1_3:ZT_GET_ANIMALS_RELEASED("PenguinKiller_Adult_M")
               local l_1_5 = l_1_3:ZT_GET_ANIMALS_RELEASED("PenguinKiller_Adult_F")
               if l_1_4 > 0 then
                  l_1_1 = true
                  setglobalvar("malekillerpenguinreleased", "true")
               end
               if l_1_5 > 0 then
                  l_1_1 = true
                  setglobalvar("femalekillerpenguinreleased", "true")
               end
            end
         end
         if l_1_1 then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, "freepenguin")
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/freepenguin.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo("freepenguin", "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalFreePenguin = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("freepenguin")
      end
      logDebugChallengeInfo("freepenguin", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("freepenguin" .. "_decline_forever", "true")
         logDebugChallengeInfo("freepenguin", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("freepenguin", "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHKillerPenguin")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      return 1
   end
   return 0
end

completeFreePenguin = function(l_3_arg0)
   local l_3_1 = "PenguinKiller_Adult_"
   local l_3_2 = "M"
   local l_3_3 = getglobalvar("malekillerpenguinreleased")
   local l_3_4 = getglobalvar("femalekillerpenguinreleased")
   if l_3_3 == nil then
      l_3_2 = "F"
   elseif l_3_4 == nil then
      l_3_2 = "M"
   elseif math.random(2) == 0 then
      l_3_2 = "M"
   else
      l_3_2 = "F"
   end
   placeCratedObjectAtGate(l_3_1 .. l_3_2)
   showchallengewin("Challengetext:CHKillerPenguinSuccess")
   resetchallengeoverandcomplete("freepenguin")
   incrementglobalchallenges()
end


