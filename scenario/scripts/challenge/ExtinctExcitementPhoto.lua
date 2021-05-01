include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("extinctexcitementphoto") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "extinctexcitementphoto")
   local l_1_0 = getglobalvar("extinctexcitementphoto_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = getuservar("brachiosaurus_slide_lock")
         if l_1_1 == "true" and getHalfStars() >= 8 then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, "extinctexcitementphoto")
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/extinctexcitementphoto.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo("extinctexcitementphoto", "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalExtinctExcitement = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("extinctexcitement")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("ExtinctExcitement")
      end
      logDebugChallengeInfo("extinctexcitementphoto", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("extinctexcitementphoto" .. "_decline_forever", "true")
         logDebugChallengeInfo("extinctexcitementphoto", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("extinctexcitementphoto", "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHExtinctExcitementPhoto")
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

scoreSuperAnimal = function(l_3_arg0)
   return scoreAnySuperEntity(l_3_arg0)
end

scoreChildOnSlide = function(l_4_arg0)
   BFLOG(SYSTRACE, "score child on brachiosaurus slide")
   local l_4_1 = {"Use_Playground_BrachiosaurusSlide"}
   if scoreAnyDoingTaskInList(l_4_arg0, "Guest_Young", l_4_1) >= 1 then
      return 1
   end
   return 0
end

scoreEntertainerOnStage = function(l_5_arg0)
   BFLOG(SYSTRACE, "score entertainer on stage")
   local l_5_1 = {"PutOnShow"}
   if scoreAnyDoingTaskInList(l_5_arg0, "Entertainer", l_5_1) >= 1 then
      return 1
   end
   return 0
end

scoreChildCarryingBone = function(l_6_arg0)
   BFLOG(SYSTRACE, "score child carrying a bone")
   local l_6_1 = {"DeliverFossil"}
   if scoreAnyDoingTaskInList(l_6_arg0, "Guest_Young", l_6_1) >= 1 then
      return 1
   end
   return 0
end

completeExtinctExcitement = function(l_7_arg0)
   giveGuest(10)
   showchallengewin("PhotoChallengetext:PHExtinctExcitementPhotoSuccess")
   resetchallengeoverandcomplete("extinctexcitementphoto")
   incrementphotochallenges()
end

failExtinctExcitement = function(l_8_arg0)
   resetchallengeover("extinctexcitementphoto")
   clearphotochallenge("extinctexcitementphoto")
end


