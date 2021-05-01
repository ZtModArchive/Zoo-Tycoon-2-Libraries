include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
posterCHALLENGE_NAME = "poster"
validate = function()
   if isChalDeclinedForever(posterCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(posterCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Guest") < 105 and getHalfStars() >= 2 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, posterCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/poster.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(posterCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalposter = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(posterCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("poster")
      end
      logDebugChallengeInfo(posterCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(posterCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(posterCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(posterCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHPosterCampaign")
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

scoreGuestDance = function(l_3_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_3_arg0, "Guest", "Dance_Idle") >= 1 then
      return 1
   end
   return 0
end

scoreGuestTalkPuppet = function(l_4_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest", "Stand_TalkPuppet") >= 1 then
      return 1
   end
   return 0
end

scoreGuestMimicAnimal = function(l_5_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest", "Stand_MimicCat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest", "Stand_MimicChimp") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest", "Stand_MimicFlamingo") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest", "Stand_MimicGorilla") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest", "Stand_MimicKangaroo") >= 1 or scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest", "Stand_MimicMoose") >= 1 then
      return 1
   end
   return 0
end

completeposter = function(l_6_arg0)
   giveGuest(5)
   local l_6_1 = findType("Guest")
   for l_6_2 = 1, table.getn(l_6_1) do
      local l_6_5 = resolveTable(l_6_1[l_6_2].value)
      if l_6_5 then
         local l_6_6 = l_6_5:BFG_GET_ATTR_FLOAT("happiness")
         if l_6_6 > 50 then
            l_6_5:BFG_SET_ATTR_FLOAT("happiness", 50)
         end
      end
   end
   showchallengewin("PhotoChallengetext:PHPosterCampaignSuccess")
   resetchallengeoverandcomplete(posterCHALLENGE_NAME)
   incrementphotochallenges()
end

failposter = function(l_7_arg0)
   resetchallengeover(posterCHALLENGE_NAME)
   clearphotochallenge(posterCHALLENGE_NAME .. "photo")
end


