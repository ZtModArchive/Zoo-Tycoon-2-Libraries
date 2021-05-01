include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("FamilyPhotos") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "FamilyPhotos")
   local l_1_0 = getglobalvar("FamilyPhotos_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, "FamilyPhotos")
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/FamilyPhotos.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo("FamilyPhotos", "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalFamilyPhotos = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("FamilyPhotos")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("FamilyPhoto")
      end
      logDebugChallengeInfo("FamilyPhotos", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("FamilyPhotos" .. "_decline_forever", "true")
         logDebugChallengeInfo("FamilyPhotos", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("FamilyPhotos", "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHFamilyPhotos")
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

scoreTwoDodo = function(l_3_arg0)
   BFLOG(SYSTRACE, "score 3 Dodos")
   if numberOfT1(l_3_arg0, "Dodo") >= 3 then
      return 1
   end
   return 0
end

scoreThreeSivatherium = function(l_4_arg0)
   BFLOG(SYSTRACE, "score 3 Sivatherium")
   if numberOfT1(l_4_arg0, "Sivatherium") >= 3 then
      return 1
   end
   return 0
end

scoreTwoBushAntlered = function(l_5_arg0)
   BFLOG(SYSTRACE, "score 3 bush antlered deer")
   if numberOfT1(l_5_arg0, "DeerBushAntlered") >= 3 then
      return 1
   end
   return 0
end

completeFamilyPhotos = function(l_6_arg0)
   BFLOG("Current Fame level: " .. getZooFame())
   setMaxFame(getZooFame() + 1.875)
   BFLOG("New Fame level(one tick higher): " .. getZooFame())
   giveGuest(5)
   incrementAwardPoints(1)
   giveCash(5000)
   showchallengewin("PhotoChallengetext:PHFamilyPhotosSuccess")
   resetchallengeoverandcomplete("FamilyPhotos")
   incrementphotochallenges()
end

failFamilyPhotos = function(l_7_arg0)
   resetchallengeover("FamilyPhotos")
   clearphotochallenge("FamilyPhotos")
end


