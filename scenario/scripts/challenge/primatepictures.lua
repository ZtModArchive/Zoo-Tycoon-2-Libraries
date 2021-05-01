include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
primatepicturesCHALLENGE_NAME = "primatepictures"
validate = function()
   if isChalDeclinedForever(primatepicturesCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", primatepicturesCHALLENGE_NAME)
   local l_1_0 = getglobalvar(primatepicturesCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and (thisManyExist("GorillaMountain", 1) == true or thisManyExist("Chimpanzee", 1) == true) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, primatepicturesCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/primatepictures.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(primatepicturesCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalprimatepictures = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(primatepicturesCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("PrimatePictures")
      end
      logDebugChallengeInfo(primatepicturesCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(primatepicturesCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(primatepicturesCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(primatepicturesCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PrimatePicturestext:PHPrimatePictures")
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

scoreGorillaChuckling = function(l_3_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_3_arg0, "GorillaMountain", "Stand_Chuckle") >= 1 then
      return 1
   elseif scoreAnyEntityTypeDoingAnimX(l_3_arg0, "GorillaMountain", "Sit_Chuckle") >= 1 then
      return 1
   end
   return 0
end

scoreGorillaCalling = function(l_4_arg0)
   local l_4_1 = scoreAnyDoingTaskInList
   local l_4_2 = l_4_arg0
   local l_4_3 = "GorillaMountain_Adult_M"
   local l_4_4 = {"Call_Sleep"}
   l_4_1 = l_4_1(l_4_2, l_4_3, l_4_4)
   if l_4_1 >= 1 then
      l_4_1 = 1
      return l_4_1
   end
   l_4_1 = 0
   return l_4_1
end

scoreChimpUseMonkeyBars = function(l_5_arg0)
   local l_5_1 = scoreAnyEntityTypeDoingTaskWithTarget
   local l_5_2 = l_5_arg0
   local l_5_3 = "Chimpanzee"
   local l_5_4 = {"MonkeyBars"}
   l_5_1 = l_5_1(l_5_2, l_5_3, l_5_4, "MonkeyBars")
   if l_5_1 >= 1 then
      l_5_1 = 1
      return l_5_1
   end
   l_5_1 = 0
   return l_5_1
end

scoreChimpClimbTree = function(l_6_arg0)
   return scoreT1ContainsT2(l_6_arg0, "tree", "Chimpanzee")
end

completeprimatepictures = function(l_7_arg0)
   giveGuest(20)
   showchallengewin("PrimatePicturestext:PHPrimatePicturesSuccess")
   resetchallengeoverandcomplete(primatepicturesCHALLENGE_NAME)
   incrementphotochallenges()
end

failprimatepictures = function(l_8_arg0)
   resetchallengeover(primatepicturesCHALLENGE_NAME)
   clearphotochallenge(primatepicturesCHALLENGE_NAME .. "photo")
end


