include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/Shows.lua")
peerlesspostersCHALLENGE_NAME = "peerlessposters"
CHALLENGE_REWARD = 4500
CHALLENGE_ANIMAL_1 = "DolphinBottlenose_Adult"
validate = function()
   if isChalDeclinedForever(peerlesspostersCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(peerlesspostersCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and findSpeciesKnowsTrick("DolphinBottlenose", "DolphinWaterWalk") ~= nil then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, peerlesspostersCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/PeerlessPosters.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(peerlesspostersCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalpeerlessposters = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(peerlesspostersCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(peerlesspostersCHALLENGE_NAME)
      end
      logDebugChallengeInfo(peerlesspostersCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(peerlesspostersCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(peerlesspostersCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(peerlesspostersCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHPeerlessPosters")
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

scoreDolphinsWaterWalk = function(l_3_arg0)
   local l_3_1 = {"WaterWalk"}
   if scoreHowManyEntityTypeDoingMatchingAnimInList(l_3_arg0, CHALLENGE_ANIMAL_1, l_3_1) >= 2 then
      return 1
   end
   return 0
end

completepeerlessposters = function(l_4_arg0)
   giveCash(CHALLENGE_REWARD)
   showchallengewin("PhotoChallengetext:PHPeerlessPostersSuccess")
   resetchallengeoverandcomplete(peerlesspostersCHALLENGE_NAME)
   incrementmarineshowchallenges()
end

failpeerlessposters = function(l_5_arg0)
   resetchallengeover(peerlesspostersCHALLENGE_NAME)
   clearphotochallenge(peerlesspostersCHALLENGE_NAME .. "photo")
end


