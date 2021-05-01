include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
explorervisitCHALLENGE_NAME = "explorervisit"
CHALLENGE_REWARD = 7000
CHALLENGE_ANIMAL_1 = "SharkGoblin"
CHALLENGE_ANIMAL_2 = "SharkHammerheadScalloped"
EXPLORER_TYPE = "Guest_Adult_M_Oceanographer"
validate = function()
   if isChalDeclinedForever(explorervisitCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(explorervisitCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 8 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, explorervisitCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/ExplorerVisit.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(explorervisitCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalexplorervisit = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(explorervisitCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("explorervisit")
      end
      logDebugChallengeInfo(explorervisitCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(explorervisitCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(explorervisitCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(explorervisitCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHExplorerVisit")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.explorerInZoo == nil then
         BFLOG("Place the Explorer")
         do
            local l_2_1 = getZooEntrancePos()
            placeObject(EXPLORER_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            local l_2_2 = findType(EXPLORER_TYPE)
            BFLOG("Number of Photographers in zoo: " .. table.getn(l_2_2))
            if table.getn(l_2_2) ~= 1 then
               BFLOG("Found NOT one photographer (" .. table.getn(l_2_2) .. "), possible error")
            end
            for l_2_3 = 1, table.getn(l_2_2) do
               local l_2_6 = resolveTable(l_2_2[l_2_3].value)
               if l_2_6 then
                  BFLOG("Setting name")
                  local l_2_7 = getLocID("PhotoChallengetext:PHExplorerVisitExplorerName")
                  l_2_6:BFG_SET_ATTR_STRING("s_name", l_2_7)
                  local l_2_8 = getAllSpeciesList()
                  favAnimal = l_2_8[math.random(table.getn(l_2_8))]
                  l_2_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
                  displayZooMessageWithZoom("PhotoChallengetext:stt_ExplorerVisitArrival", 1, 30, l_2_6)
               end
            end
            l_2_arg0.explorerInZoo = true
            -- Tried to add an 'end' here but it's incorrect
         end
         if countType(EXPLORER_TYPE) == 0 then
            return -1
         end
         if numPhotoRequirements() == 0 then
            return 1
         end
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

scoreExplorerGoblinShark = function(l_3_arg0)
   local l_3_1 = {"GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench"}
   if scoreAnyDoingTaskInList(l_3_arg0, EXPLORER_TYPE, l_3_1) >= 1 and numberOfT1(l_3_arg0, CHALLENGE_ANIMAL_1) >= 1 then
      return 1
   end
   return 0
end

scoreExplorerHammerheadShark = function(l_4_arg0)
   local l_4_1 = {"GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench"}
   if scoreAnyDoingTaskInList(l_4_arg0, EXPLORER_TYPE, l_4_1) >= 1 and numberOfT1(l_4_arg0, CHALLENGE_ANIMAL_2) >= 1 then
      return 1
   end
   return 0
end

completeexplorervisit = function(l_5_arg0)
   giveCash(CHALLENGE_REWARD)
   local l_5_1 = findType("Guest")
   for l_5_2 = 1, table.getn(l_5_1) do
      local l_5_5 = resolveTable(l_5_1[l_5_2].value)
      if l_5_5 ~= nil then
         local l_5_6 = l_5_5:BFG_GET_ATTR_FLOAT("happiness")
         if l_5_6 > 20 then
            setNeed(l_5_5, "happiness", 20)
         end
      end
   end
   showchallengewin("PhotoChallengetext:PHExplorerVisitSuccess")
   resetchallengeoverandcomplete(explorervisitCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failexplorervisit = function(l_6_arg0)
   if declinenotfail == nil then
      showchallengefail("PhotoChallengetext:PHExplorerVisitFailure")
   end
   resetchallengeover(explorervisitCHALLENGE_NAME)
   clearphotochallenge(explorervisitCHALLENGE_NAME .. "photo")
   declinenotfail = nil
end


