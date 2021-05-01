include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
trex_stalkCHALLENGE_NAME = "trex_stalk"
STALK_TYPE = "TyrannosaurusRex"
validate = function()
   if isChalDeclinedForever(trex_stalkCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", trex_stalkCHALLENGE_NAME)
   local l_1_0 = getglobalvar(trex_stalkCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() == 10 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, trex_stalkCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. trex_stalkCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(trex_stalkCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evaltrexphoto = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(trex_stalkCHALLENGE_NAME .. "photos")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(trex_stalkCHALLENGE_NAME)
      end
      logDebugChallengeInfo(trex_stalkCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(trex_stalkCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(trex_stalkCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(trex_stalkCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHTRex")
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

scoreTrexStalking = function(l_3_arg0)
   local l_3_1 = {"ChasePrey"}
   local l_3_2 = {"Stalk", "StalkPause", "2Stalk", "2StalkPause"}
   if scoreAnyDoingTaskInList(l_3_arg0, STALK_TYPE, l_3_1) >= 1 or scoreAnyEntityTypeDoingMatchingAnimInList(l_3_arg0, STALK_TYPE, l_3_2) >= 1 then
      return 1
   end
   return 0
end

scoreTrexCatching = function(l_4_arg0)
   local l_4_1 = {"AttackPrey"}
   local l_4_2 = {"Bite", "2Bite", "Kick", "2Kick"}
   if scoreAnyDoingTaskInList(l_4_arg0, STALK_TYPE, l_4_1) >= 1 or scoreAnyEntityTypeDoingMatchingAnimInList(l_4_arg0, STALK_TYPE, l_4_2) >= 1 then
      return 1
   end
   return 0
end

completetrex = function(l_5_arg0)
   giveGuest(20)
   showchallengewin("PhotoChallengetext:PHTRexSuccess")
   resetchallengeoverandcomplete(trex_stalkCHALLENGE_NAME)
   incrementphotochallenges()
end

failtrex = function(l_6_arg0)
   resetchallengeover(trex_stalkCHALLENGE_NAME)
   clearphotochallenge(trex_stalkCHALLENGE_NAME .. "photo")
end


