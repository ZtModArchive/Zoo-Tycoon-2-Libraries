include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
antipodalCHALLENGE_NAME = "antipodal"
validate = function()
   if isChalDeclinedForever(antipodalCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(antipodalCHALLENGE_NAME .. "_over")
   do
      if ((l_1_0 ~= nil and l_1_0 == "true") or (countType("KomodoDragon") < 1 and countType("WildDogAfrican") < 1) or countType("Koala") == 0) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, antipodalCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. antipodalCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(antipodalCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalantipodal = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(antipodalCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(antipodalCHALLENGE_NAME)
      end
      logDebugChallengeInfo(antipodalCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(antipodalCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(antipodalCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(antipodalCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHAntipodalWildlife")
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

scoreTortoiseGalapagosEgg = function(l_3_arg0)
   if numberOfT1(l_3_arg0, "TortoiseGalapagos_Egg") >= 1 then
      return 1
   end
   return 0
end

scoreAfricanWildDogsSleeping = function(l_4_arg0)
   if 0 + scoreHowManyEntitiesOfTypeDoingAnim(l_4_arg0, "WildDogAfrican", "SleepHeap_Idle") >= 1 then
      return 1
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

scoreKomodoDragonsTouchingTongues = function(l_5_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_5_arg0, "KomodoDragon", "Stand_TongueTouch") >= 1 then
      return 1
   end
   return 0
end

completeantipodal = function(l_6_arg0)
   placeCratedObjectAtGate("Koala_Adult_F")
   showchallengewin("PhotoChallengetext:PHAntipodalWildlifeSuccess")
   resetchallengeoverandcomplete(antipodalCHALLENGE_NAME)
   incrementphotochallenges()
end

failantipodal = function(l_7_arg0)
   resetchallengeover(antipodalCHALLENGE_NAME)
   clearphotochallenge(antipodalCHALLENGE_NAME .. "photo")
end


