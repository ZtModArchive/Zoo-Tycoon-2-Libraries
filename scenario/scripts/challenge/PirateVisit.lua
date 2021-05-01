include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
piratevisitCHALLENGE_NAME = "piratevisit"
CHALLENGE_REWARD = 2000
PIRATE_TYPE = "Guest_Adult_M_Pirate"
CHALLENGE_ITEM = "TreasureChest"
validate = function()
   if isChalDeclinedForever(piratevisitCHALLENGE_NAME) == true then
      return 0
   end
   local l_1_0 = getglobalvar(piratevisitCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 8 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, piratevisitCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/PirateVisit.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(piratevisitCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalpiratevisit = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(piratevisitCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("piratevisit")
      end
      logDebugChallengeInfo(piratevisitCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(piratevisitCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(piratevisitCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(piratevisitCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHPirateVisit")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.pirateInZoo == nil then
         BFLOG("Place the Pirate")
         do
            local l_2_1 = getZooEntrancePos()
            placeObject(PIRATE_TYPE, l_2_1.x, l_2_1.y, l_2_1.z)
            local l_2_2 = findType(PIRATE_TYPE)
            BFLOG("Number of Photographers in zoo: " .. table.getn(l_2_2))
            if table.getn(l_2_2) ~= 1 then
               BFLOG("Found NOT one photographer (" .. table.getn(l_2_2) .. "), possible error")
            end
            for l_2_3 = 1, table.getn(l_2_2) do
               local l_2_6 = resolveTable(l_2_2[l_2_3].value)
               if l_2_6 then
                  BFLOG("Setting name")
                  local l_2_7 = getLocID("PhotoChallengetext:PHPirateVisitPirateName")
                  l_2_6:BFG_SET_ATTR_STRING("s_name", l_2_7)
                  local l_2_8 = getAllSpeciesList()
                  favAnimal = l_2_8[math.random(table.getn(l_2_8))]
                  l_2_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
                  displayZooMessageWithZoom("PhotoChallengetext:stt_PirateVisitArrival", 1, 30, l_2_6)
               end
            end
            l_2_arg0.pirateInZoo = true
            -- Tried to add an 'end' here but it's incorrect
         end
         if countType(PIRATE_TYPE) == 0 then
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

scorePirateUsingFountain = function(l_3_arg0)
   local l_3_1 = {"ReactFountainSplash"}
   if scoreAnyDoingTaskInList(l_3_arg0, PIRATE_TYPE, l_3_1) >= 1 then
      giveCashNoPopup(CHALLENGE_REWARD)
      return 1
   end
   return 0
end

scorePirateInGazebo = function(l_4_arg0)
   if scoreT1ContainsT2(l_4_arg0, "Gazebo_mm", PIRATE_TYPE) >= 1 then
      giveCashNoPopup(CHALLENGE_REWARD)
      return 1
   end
   return 0
end

scorePirateUsingAquarium = function(l_5_arg0)
   if scoreT1ContainsT2(l_5_arg0, "Aquarium", PIRATE_TYPE) >= 1 then
      giveCashNoPopup(CHALLENGE_REWARD)
      return 1
   end
   return 0
end

completepiratevisit = function(l_6_arg0)
   placeCratedObjectAtGate(CHALLENGE_ITEM)
   showchallengewin("PhotoChallengetext:PHPirateVisitSuccess")
   resetchallengeoverandcomplete(piratevisitCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failpiratevisit = function(l_7_arg0)
   if declinenotfail == nil then
      placeCratedObjectAtGate(CHALLENGE_ITEM)
      showchallengefail("PhotoChallengetext:PHPirateVisitFailure")
   end
   resetchallengeover(piratevisitCHALLENGE_NAME)
   clearphotochallenge(piratevisitCHALLENGE_NAME .. "photo")
   declinenotfail = nil
end


