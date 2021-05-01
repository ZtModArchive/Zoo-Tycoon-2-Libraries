include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
scientistvisitCHALLENGE_NAME = "scientistvisit"
SCIENTIST_TYPE = "Guest_Adult_M_Scientist"
SPECIESGROUP = "Archosauria"
validate = function()
   if isChalDeclinedForever(scientistvisitCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(scientistvisitCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 6 and countType(SPECIESGROUP) >= 1 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, scientistvisitCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. scientistvisitCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(scientistvisitCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalscientistvisit = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(scientistvisitCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(scientistvisitCHALLENGE_NAME)
      end
      logDebugChallengeInfo(scientistvisitCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(scientistvisitCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(scientistvisitCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(scientistvisitCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("PhotoChallengetext:PHDinoScientistVisit")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if numPhotoRequirements() == 0 then
         return 1
         -- Tried to add an 'end' here but it's incorrect
         numPhotoRequirementsMet()
         if l_2_arg0.scientistInZoo == nil then
            local l_2_1 = getZooEntrancePos()
            placeObject(SCIENTIST_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            local l_2_2 = findType(SCIENTIST_TYPE)
            BFLOG(table.getn(l_2_2))
            if table.getn(l_2_2) ~= 1 then
               BFLOG("Found more than one scientist, possible error")
            end
            local l_2_3 = resolveTable(l_2_2[1].value)
            if l_2_3 then
               BFLOG("Setting scientist name")
               local l_2_4 = getLocID("PhotoChallengetext:PHDinoScientistVisitScientistName")
               l_2_3:BFG_SET_ATTR_STRING("s_name", l_2_4)
               displayZooMessageWithZoom("PhotoChallengetext:stt_DinoScientistVisitArrival", 1, 30, l_2_3)
            end
            l_2_arg0.scientistInZoo = true
         end
         if l_2_arg0.scientistInZoo ~= nil and countType(SCIENTIST_TYPE) == 0 then
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

scoreScientistViewingDino = function(l_3_arg0)
   local l_3_1 = {"GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench"}
   if scoreAnyDoingTaskInList(l_3_arg0, SCIENTIST_TYPE, l_3_1) >= 1 and numberOfT1(l_3_arg0, SPECIESGROUP) >= 1 then
      return 1
   end
   return 0
end

completescientistvisit = function(l_4_arg0)
   incrementAwardPoints(1)
   local l_4_1 = findType("Guest")
   for l_4_2 = 1, table.getn(l_4_1) do
      local l_4_5 = resolveTable(l_4_1[l_4_2].value)
      if l_4_5 ~= nil then
         local l_4_6 = l_4_5:BFG_GET_ATTR_FLOAT("happiness")
         if l_4_6 >= 20 then
            l_4_5:BFG_SET_ATTR_FLOAT("happiness", 20)
         end
      end
   end
   showchallengewin("PhotoChallengetext:PHDinoScientistVisitSuccess")
   resetchallengeoverandcomplete(scientistvisitCHALLENGE_NAME)
   incrementphotochallenges()
end

failscientistvisit = function(l_5_arg0)
   if realFail ~= nil then
      showchallengefail("PhotoChallengetext:PHDinoScientistVisitFailure")
   end
   resetchallengeover(scientistvisitCHALLENGE_NAME)
   clearphotochallenge(scientistvisitCHALLENGE_NAME .. "photo")
end


