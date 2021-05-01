include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
divavisitCHALLENGE_NAME = "divavisit"
DIVA_TYPE = "Guest_Adult_F_Rockstar"
validate = function()
   if isChalDeclinedForever(divavisitCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(divavisitCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 5 and countType("Guest") <= 100 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, divavisitCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. divavisitCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(divavisitCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evaldivavisit = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(divavisitCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(divavisitCHALLENGE_NAME)
      end
      logDebugChallengeInfo(divavisitCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(divavisitCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(divavisitCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(divavisitCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHDivaVisit")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if numPhotoRequirements() == 0 then
         return 1
         -- Tried to add an 'end' here but it's incorrect
         numPhotoRequirementsMet()
         if l_2_arg0.divaInZoo == nil then
            local l_2_1 = getZooEntrancePos()
            placeObject(DIVA_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            local l_2_2 = findType(DIVA_TYPE)
            BFLOG(table.getn(l_2_2))
            if table.getn(l_2_2) ~= 1 then
               BFLOG("Found more than one diva, possible error")
            end
            local l_2_3 = resolveTable(l_2_2[1].value)
            if l_2_3 then
               BFLOG("Setting diva name")
               local l_2_4 = getLocID("PhotoChallengetext:PHDivaVisitDivaName")
               l_2_3:BFG_SET_ATTR_STRING("s_name", l_2_4)
               local l_2_5, l_2_6 = l_2_3:BFG_SET_ATTR_FLOAT, l_2_3
               local l_2_7 = {"tour", 80}
               l_2_5(l_2_6, l_2_7)
               l_2_5 = displayZooMessageWithZoom
               l_2_6 = "PhotoChallengetext:stt_DivaVisitArrival"
               l_2_7 = 1
               l_2_5(l_2_6, l_2_7, 30, l_2_3)
            end
            l_2_arg0.divaInZoo = true
         end
         if l_2_arg0.divaInZoo ~= nil and countType(DIVA_TYPE) == 0 then
            realFail = 1
            return -1
         end
         local l_2_1 = queryObject("ZTPhotoChallengesComponent")
         if l_2_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
            return 1
         else
            return 0
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

scoreDivaEatOrDrink = function(l_3_arg0)
   BFLOG("scoreDivaEatOrDrink")
   if scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "StandItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "StandItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "StandItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "StandItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "StandItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitPicnicTableItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitPicnicTableItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitPicnicTableItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitPicnicTableItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitPicnicTableItem_EatFork") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitPicnicTableItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitTableItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitTableItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitTableItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitTableItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitTableItem_EatFork") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitTableItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitBenchItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitBenchItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitBenchItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_3_arg0, DIVA_TYPE, "SitBenchItem_Lick") >= 1 then
      return 1
   end
   return 0
end

scoreDivaViewingAnimal = function(l_4_arg0)
   local l_4_1 = {"GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench"}
   if scoreAnyDoingTaskInList(l_4_arg0, DIVA_TYPE, l_4_1) >= 1 then
      return 1
   end
   return 0
end

scoreDivaRidingSkyTram = function(l_5_arg0)
   if scoreT1ContainsT2(l_5_arg0, "skytram", DIVA_TYPE) >= 1 then
      return 1
   end
   return 0
end

completedivavisit = function(l_6_arg0)
   incrementAwardPoints(1)
   local l_6_1 = findType("Guest")
   for l_6_2 = 1, table.getn(l_6_1) do
      local l_6_5 = resolveTable(l_6_1[l_6_2].value)
      if l_6_5 ~= nil then
         local l_6_6 = l_6_5:BFG_GET_ATTR_FLOAT("happiness")
         if l_6_6 >= 20 then
            l_6_5:BFG_SET_ATTR_FLOAT("happiness", 20)
         end
      end
   end
   showchallengewin("PhotoChallengetext:PHDivaVisitSuccess")
   resetchallengeoverandcomplete(divavisitCHALLENGE_NAME)
   incrementphotochallenges()
end

faildivavisit = function(l_7_arg0)
   if realFail ~= nil then
      showchallengefail("PhotoChallengetext:PHDivaVisitFailure")
   end
   resetchallengeover(divavisitCHALLENGE_NAME)
   clearphotochallenge(divavisitCHALLENGE_NAME .. "photo")
end


