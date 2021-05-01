include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
zoonewsmonthlyCHALLENGE_NAME = "zoonewsmonthly"
validate = function()
   if isChalDeclinedForever(zoonewsmonthlyCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", zoonewsmonthlyCHALLENGE_NAME)
   local l_1_0 = getglobalvar(zoonewsmonthlyCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 3 and (countType("Jaguar") >= 1 or countType("PenguinEmperor") >= 1 or countType("Moose") >= 1) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, zoonewsmonthlyCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/zoonewsmonthly.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(zoonewsmonthlyCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalzoonewsmonthly = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(zoonewsmonthlyCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("ZooNewsMonthly")
      end
      logDebugChallengeInfo(zoonewsmonthlyCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(zoonewsmonthlyCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(zoonewsmonthlyCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(zoonewsmonthlyCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("ZooNewstext:PHZooNews")
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

scoreJaguarSwimming = function(l_3_arg0)
   local l_3_1 = {"SwimObject_", "Swim_", "TreadWaterObject_", "TreadWater_"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_3_arg0, "Jaguar", l_3_1) >= 1 then
      return 1
   end
   return 0
end

scoreIbexRestStable = function(l_4_arg0)
   if scoreT1ContainsT2(l_4_arg0, "SmallStable_Shelter", "Ibex") >= 1 or scoreT1ContainsT2(l_4_arg0, "LargeStable_Shelter", "Ibex") >= 1 then
      return 1
   end
   return 0
end

scoreMooseRubAntlers = function(l_5_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Moose", "Stand_RubAntlersOnTree") >= 1 then
      return 1
   end
   return 0
end

completezoonewsmonthly = function(l_6_arg0)
   if countType("Guest") >= 105 then
      giveGuest(20)
   else
      giveGuest(45)
   end
   showchallengewin("ZooNewstext:PHZooNewsSuccess")
   resetchallengeoverandcomplete(zoonewsmonthlyCHALLENGE_NAME)
   incrementphotochallenges()
end

failzoonewsmonthly = function(l_7_arg0)
   resetchallengeover(zoonewsmonthlyCHALLENGE_NAME)
   clearphotochallenge(zoonewsmonthlyCHALLENGE_NAME .. "photo")
end


