include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/Shows.lua")
pinnipedtrainersquarterlyCHALLENGE_NAME = "pinnipedtrainersquarterly"
CHALLENGE_REWARD = 2000
validate = function()
   if isChalDeclinedForever(pinnipedtrainersquarterlyCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(pinnipedtrainersquarterlyCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 3 and (hasSpeciesInShow("Otariidae") or hasSpeciesInShow("Odobenidae") or hasSpeciesInShow("Phocidae")) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, pinnipedtrainersquarterlyCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/PinnipedTrainersQuarterly.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(pinnipedtrainersquarterlyCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalpinnipedtrainersquarterly = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(pinnipedtrainersquarterlyCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(pinnipedtrainersquarterlyCHALLENGE_NAME)
      end
      logDebugChallengeInfo(pinnipedtrainersquarterlyCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(pinnipedtrainersquarterlyCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(pinnipedtrainersquarterlyCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(pinnipedtrainersquarterlyCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHPinnipedTrainersQuarterly")
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

scoreBalenceBall = function(l_3_arg0)
   local l_3_1 = {"HoldBallNose", "_2HoldBallNose"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_3_arg0, "animal", l_3_1) >= 1 then
      local l_3_2 = maxStarRatingOfAnimalInPhoto(l_3_arg0)
      if l_3_2 ~= nil then
         BFLOG("BalenceBall:star rating of animal " .. l_3_2 / 20)
         setglobalvar("BalenceBallStars", tostring(l_3_2 / 20))
      end
      return 1
   end
   return 0
end

scoreUsingSlide = function(l_4_arg0)
   local l_4_1 = {"UseSlide", "_2UseSlide"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_4_arg0, "animal", l_4_1) >= 1 then
      local l_4_2 = maxStarRatingOfAnimalInPhoto(l_4_arg0)
      if l_4_2 ~= nil then
         BFLOG("Slide:star rating of animal " .. l_4_2 / 20)
         setglobalvar("SlideStars", tostring(l_4_2 / 20))
      end
      return 1
   end
   return 0
end

scoreUsingHorn = function(l_5_arg0)
   local l_5_1 = {"UseHorn_", "_2UseHorn"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_5_arg0, "animal", l_5_1) >= 1 then
      local l_5_2 = maxStarRatingOfAnimalInPhoto(l_5_arg0)
      if l_5_2 ~= nil then
         BFLOG("Horn:star rating of animal " .. l_5_2 / 20)
         setglobalvar("HornStars", tostring(l_5_2 / 20))
      end
      return 1
   end
   return 0
end

completepinnipedtrainersquarterly = function(l_6_arg0)
   local l_6_1 = tonumber(getglobalvar("BalenceBallStars"))
   local l_6_2 = tonumber(getglobalvar("SlideStars"))
   local l_6_3 = tonumber(getglobalvar("HornStars"))
   local l_6_4 = l_6_1 * l_6_1 * 100
   local l_6_5 = l_6_2 * l_6_2 * 100
   local l_6_6 = l_6_3 * l_6_3 * 100
   giveCash(CHALLENGE_REWARD + l_6_4 + l_6_5 + l_6_6)
   showchallengewin("PhotoChallengetext:PHPinnipedTrainersQuarterlySuccess")
   resetchallengeoverandcomplete(pinnipedtrainersquarterlyCHALLENGE_NAME)
   incrementmarineshowchallenges()
end

failpinnipedtrainersquarterly = function(l_7_arg0)
   resetchallengeover(pinnipedtrainersquarterlyCHALLENGE_NAME)
   clearphotochallenge(pinnipedtrainersquarterlyCHALLENGE_NAME .. "photo")
end


