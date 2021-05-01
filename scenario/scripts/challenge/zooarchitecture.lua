include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
zooarchitectureCHALLENGE_NAME = "zooarchitecture"
validate = function()
   if isChalDeclinedForever(zooarchitectureCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(zooarchitectureCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 3 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, zooarchitectureCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. zooarchitectureCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(zooarchitectureCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalzooarchitecture = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(zooarchitectureCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(zooarchitectureCHALLENGE_NAME)
      end
      logDebugChallengeInfo(zooarchitectureCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(zooarchitectureCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(zooarchitectureCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(zooarchitectureCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHZooArchitecture")
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

scoreElevatedPathWithGuests = function(l_3_arg0)
   BFLOG("Checking for guests on elevated tiles...")
   if numberOfT1OnElevatedTile(l_3_arg0, "Guest") >= 4 then
      return 1
   end
   return 0
end

completezooarchitecture = function(l_4_arg0)
   giveCash(1500)
   showchallengewin("PhotoChallengetext:PHZooArchitectureSuccess")
   resetchallengeoverandcomplete(zooarchitectureCHALLENGE_NAME)
   incrementphotochallenges()
end

failzooarchitecture = function(l_5_arg0)
   resetchallengeover(zooarchitectureCHALLENGE_NAME)
   clearphotochallenge(zooarchitectureCHALLENGE_NAME .. "photo")
end


