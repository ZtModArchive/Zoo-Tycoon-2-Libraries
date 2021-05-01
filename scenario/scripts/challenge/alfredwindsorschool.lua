include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
alfredwindsorschoolCHALLENGE_NAME = "alfredwindsorschool"
validate = function()
   if isChalDeclinedForever(alfredwindsorschoolCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", alfredwindsorschoolCHALLENGE_NAME)
   local l_1_0 = getglobalvar(alfredwindsorschoolCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("animal") >= 2 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, alfredwindsorschoolCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/alfredwindsorschool.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(alfredwindsorschoolCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalalfredwindsorschool = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(alfredwindsorschoolCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("AlfredWindsorSchool")
      end
      logDebugChallengeInfo(alfredwindsorschoolCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(alfredwindsorschoolCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(alfredwindsorschoolCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(alfredwindsorschoolCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("AlfredWindsorSchooltext:PHAlfredWindsorSchool")
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

scoreTwoAnimalsUpClose = function(l_3_arg0)
   if numberOfT1(l_3_arg0, "animal") >= 2 then
      return 1
   end
   return 0
end

completealfredwindsorschool = function(l_4_arg0)
   giveCash(2000)
   showchallengewin("AlfredWindsorSchooltext:PHAlfredWindsorSchoolSuccess")
   resetchallengeoverandcomplete(alfredwindsorschoolCHALLENGE_NAME)
   incrementphotochallenges()
end

failalfredwindsorschool = function(l_5_arg0)
   resetchallengeover(alfredwindsorschoolCHALLENGE_NAME)
   clearphotochallenge(alfredwindsorschoolCHALLENGE_NAME .. "photo")
end


