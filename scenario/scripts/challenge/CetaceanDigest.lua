include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/Shows.lua")
cetaceandigestCHALLENGE_NAME = "cetaceandigest"
CHALLENGE_REWARD = 2000
validate = function()
   if isChalDeclinedForever(cetaceandigestCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(cetaceandigestCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and hasSpeciesInShow("Cetacea") then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, cetaceandigestCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/CetaceanDigest.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(cetaceandigestCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalcetaceandigest = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(cetaceandigestCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(cetaceandigestCHALLENGE_NAME)
      end
      logDebugChallengeInfo(cetaceandigestCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(cetaceandigestCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(cetaceandigestCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(cetaceandigestCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHCetaceanDigest")
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

scoreSpyhop = function(l_3_arg0)
   local l_3_1 = {"Spyhop"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_3_arg0, "animal", l_3_1) >= 1 then
      local l_3_2 = maxStarRatingOfAnimalInPhoto(l_3_arg0)
      if l_3_2 then
         BFLOG("Spyhop:star rating of animal " .. l_3_2 / 20)
         setglobalvar("SpyhopStars", tostring(l_3_2 / 20))
      end
      return 1
   end
   return 0
end

scoreTailSplash = function(l_4_arg0)
   local l_4_1 = {"FlipperSplash"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_4_arg0, "animal", l_4_1) >= 1 then
      local l_4_2 = maxStarRatingOfAnimalInPhoto(l_4_arg0)
      if l_4_2 then
         BFLOG("TailSplash:star rating of animal " .. l_4_2 / 20)
         setglobalvar("TailSplashStars", tostring(l_4_2 / 20))
      end
      return 1
   end
   return 0
end

scoreJump = function(l_5_arg0)
   local l_5_1 = {"JumpSuccess", "JumpFailure", "JumpSuperSuccess"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_5_arg0, "animal", l_5_1) >= 1 then
      local l_5_2 = maxStarRatingOfAnimalInPhoto(l_5_arg0)
      if l_5_2 then
         BFLOG("Jump:star rating of animal " .. l_5_2 / 20)
         setglobalvar("JumpStars", tostring(l_5_2 / 20))
      end
      return 1
   end
   return 0
end

completecetaceandigest = function(l_6_arg0)
   local l_6_1 = tonumber(getglobalvar("SpyhopStars"))
   local l_6_2 = tonumber(getglobalvar("TailSplashStars"))
   local l_6_3 = tonumber(getglobalvar("JumpStars"))
   local l_6_4 = l_6_1 * l_6_1 * 100
   local l_6_5 = l_6_2 * l_6_2 * 100
   local l_6_6 = l_6_3 * l_6_3 * 100
   giveCash(CHALLENGE_REWARD + l_6_4 + l_6_5 + l_6_6)
   showchallengewin("PhotoChallengetext:PHCetaceanDigestSuccess")
   resetchallengeoverandcomplete(cetaceandigestCHALLENGE_NAME)
   incrementmarineshowchallenges()
end

failcetaceandigest = function(l_7_arg0)
   resetchallengeover(cetaceandigestCHALLENGE_NAME)
   clearphotochallenge(cetaceandigestCHALLENGE_NAME .. "photo")
end


