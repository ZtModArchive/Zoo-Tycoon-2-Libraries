include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("dinocapturephoto") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "dinocapturephoto")
   local l_1_0 = getglobalvar("dinocapturephoto_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 4 and countType("DinoRecoveryBuilding") >= 1 and countEntitiesMatchingAttribute("animal", "b_Rampager", true) >= 1 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, "dinocapturephoto")
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/dinocapturephoto.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo("dinocapturephoto", "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalDinoCapture = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("dinocapture")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("DinoCapture")
      end
      logDebugChallengeInfo("dinocapturephoto", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("dinocapturephoto" .. "_decline_forever", "true")
         logDebugChallengeInfo("dinocapturephoto", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("dinocapturephoto", "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHDinoCapture")
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

scoreDCTInAction = function(l_3_arg0)
   if scoreT1(l_3_arg0, "DinoRecoveryCrateTeam") == 1 and scoreT1(l_3_arg0, "DinoRecoveryRobot") == 1 and scoreT1(l_3_arg0, "DinoRecoveryTranqTeam") == 1 then
      return 1
   end
   return 0
end

scoreDCTBuilding = function(l_4_arg0)
   return scoreT1(l_4_arg0, "DinoRecoveryBuilding")
end

scoreDestroyedObject = function(l_5_arg0)
   if scoreT1(l_5_arg0, "Rubble") == 1 or scoreT1(l_5_arg0, "stump") == 1 then
      return 1
   end
   return 0
end

completeDinoCapture = function(l_6_arg0)
   giveCash(5000)
   showchallengewin("PhotoChallengetext:PHDinoCaptureSuccess")
   resetchallengeoverandcomplete("dinocapturephoto")
   incrementphotochallenges()
end

failDinoCapture = function(l_7_arg0)
   resetchallengeover("dinocapturephoto")
   clearphotochallenge("dinocapturephoto")
end


