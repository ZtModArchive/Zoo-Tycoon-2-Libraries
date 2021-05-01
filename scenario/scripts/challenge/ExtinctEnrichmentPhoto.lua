include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("extinctenrichmentphoto") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "extinctenrichmentphoto")
   local l_1_0 = getglobalvar("extinctenrichmentphoto_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 8 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, "extinctenrichmentphoto")
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/extinctenrichmentphoto.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo("extinctenrichmentphoto", "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalExtinctEnrichment = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("extinctenrichment")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("ExtinctEnrichment")
      end
      logDebugChallengeInfo("extinctenrichmentphoto", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("extinctenrichmentphoto" .. "_decline_forever", "true")
         logDebugChallengeInfo("extinctenrichmentphoto", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("extinctenrichmentphoto", "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHExtinctEnrichmentPhoto")
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

scoreRhinoGlacier = function(l_3_arg0)
   BFLOG(SYSTRACE, "score Wooly Rhinoceros and Glacier")
   if numberOfT1(l_3_arg0, "RhinocerosWooly") >= 1 and numberOfT1(l_3_arg0, "Glacier") >= 1 then
      return 1
   end
   return 0
end

scoreWarthogTarPit = function(l_4_arg0)
   BFLOG(SYSTRACE, "score Giant Warthog and Tar pit")
   if numberOfT1(l_4_arg0, "WarthogGiant") >= 1 and numberOfT1(l_4_arg0, "TarPit") >= 1 then
      return 1
   end
   return 0
end

scoreGigantopithecusBamboo = function(l_5_arg0)
   BFLOG(SYSTRACE, "score Gigantopithecus eating bamboo")
   local l_5_1 = scoreAnyEntityTypeDoingTaskWithTarget
   local l_5_2 = l_5_arg0
   local l_5_3 = "Gigantopithecus"
   local l_5_4 = {"Eat"}
   l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4, "FoodDish_Bamboo")
   if l_5_1 < 1 then
      l_5_1 = scoreAnyEntityTypeDoingTaskWithTarget
      l_5_2 = l_5_arg0
      l_5_3 = "Gigantopithecus"
      l_5_4 = {"Eat"}
      l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4, "SubstratePile_Bamboo")
      if l_5_1 < 1 then
         l_5_1 = scoreAnyEntityTypeDoingTaskWithTarget
         l_5_2 = l_5_arg0
         l_5_3 = "Gigantopithecus"
         l_5_4 = {"Eat"}
         l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4, "Terrain_Bamboo")
         if l_5_1 < 1 then
            l_5_1 = scoreAnyEntityTypeDoingTaskWithTarget
            l_5_2 = l_5_arg0
            l_5_3 = "Gigantopithecus"
            l_5_4 = {"Eat"}
            l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4, "Trough_Bamboo")
         if l_5_1 >= 1 then
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            l_5_1 = 1
            return l_5_1
            -- Tried to add an 'end' here but it's incorrect
            l_5_1 = 0
            return l_5_1
end

completeExtinctEnrichment = function(l_6_arg0)
   giveCash(8000)
   showchallengewin("PhotoChallengetext:PHExtinctEnrichmentPhotoSuccess")
   resetchallengeoverandcomplete("extinctenrichmentphoto")
   incrementphotochallenges()
end

failExtinctEnrichment = function(l_7_arg0)
   resetchallengeover("extinctenrichmentphoto")
   clearphotochallenge("extinctenrichmentphoto")
end


