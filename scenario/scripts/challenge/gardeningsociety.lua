include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
gardeningsocietyCHALLENGE_NAME = "gardeningsociety"
validate = function()
   if isChalDeclinedForever(gardeningsocietyCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", gardeningsocietyCHALLENGE_NAME)
   local l_1_0 = getglobalvar(gardeningsocietyCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      if ((countCenterBiome("tropicalrainforest") >= 64 and countCenterBiome("savannah") < 64) or countCenterBiome("alpine") >= 64 and countCenterBiome("borealforest") >= 64) then
         local l_1_1 = 0 + 1 + 1 + 1 + 1
         -- Tried to add an 'end' here but it's incorrect
         --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

evalgardeningsociety = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(gardeningsocietyCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("GardeningSociety")
      end
      logDebugChallengeInfo(gardeningsocietyCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(gardeningsocietyCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(gardeningsocietyCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(gardeningsocietyCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("GardeningSocietytext:PHGardeningSociety")
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

scoreBaobob = function(l_3_arg0)
   return scoreT1(l_3_arg0, "Baobob_Savannah")
end

scoreKapok = function(l_4_arg0)
   return scoreT1(l_4_arg0, "Kapok_Rainforest")
end

scoreTamarack = function(l_5_arg0)
   return scoreT1(l_5_arg0, "Tamarack_Boreal")
end

scoreHimalayanPine = function(l_6_arg0)
   return scoreT1(l_6_arg0, "HimalayanPine_Alpine")
end

completegardeningsociety = function(l_7_arg0)
   giveCash(4000)
   giveGuest(6)
   showchallengewin("GardeningSocietytext:PHGardeningSocietySuccess")
   resetchallengeoverandcomplete(gardeningsocietyCHALLENGE_NAME)
   incrementphotochallenges()
end

failgardeningsociety = function(l_8_arg0)
   resetchallengeover(gardeningsocietyCHALLENGE_NAME)
   clearphotochallenge(gardeningsocietyCHALLENGE_NAME .. "photo")
end


