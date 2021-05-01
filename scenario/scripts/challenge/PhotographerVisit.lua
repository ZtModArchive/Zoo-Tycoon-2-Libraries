include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
photographervisitCHALLENGE_NAME = "photographervisit"
PHOTOGRAPHER_TYPE = "Guest_Adult_F_Photographer"
ANIMAL_TYPE_1 = "ManateeWestIndian"
ANIMAL_TYPE_2 = "OtterSea"
ANIMAL_TYPE_3 = "PenguinRockhopper"
GUEST_REWARD = 5
CHALLENGE_REWARD_FAME = 1.875
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

validate = function()
   if isChalDeclinedForever(photographervisitCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", photographervisitCHALLENGE_NAME)
   local l_2_0 = getglobalvar(photographervisitCHALLENGE_NAME .. "_over")
   do
      if (l_2_0 == nil or l_2_0 ~= "true") and getHalfStars() >= 5 then
         local l_2_1 = queryObject("BFScenarioMgr")
         if l_2_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, photographervisitCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  BFLOG("giving out challenge")
                  l_2_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. photographervisitCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(photographervisitCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalPhotographerVisit = function(l_3_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_3_1 = queryObject("BFScenarioMgr")
      if l_3_1 then
         l_3_1:BFS_SHOWRULE(photographervisitCHALLENGE_NAME)
      end
      logDebugChallengeInfo(photographervisitCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_3_arg0.accept = 1
      showRule("SeenManatee")
      showRule("SeenOtter")
      showRule("SeenRochhopper")
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(photographervisitCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(photographervisitCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(photographervisitCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_3_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHPhotographerVisit")
      setglobalvar("challenge", "waiting")
   end
   if l_3_arg0.accept == 1 then
      if l_3_arg0.popupTimer == nil then
         l_3_arg0.popupTimer = 0
         -- Tried to add an 'end' here but it's incorrect
         if l_3_arg0.popupTimer < 1 then
            l_3_arg0.popupTimer = l_3_arg0.popupTimer + 1
            return 0
         end
         if l_3_arg0.photographerInZoo == nil then
            BFLOG("Place the Photographer")
            local l_3_1 = getZooEntrancePos()
            placeObject(PHOTOGRAPHER_TYPE, l_3_1.x, l_3_1.y, l_3_1.z)
            local l_3_2 = findType(PHOTOGRAPHER_TYPE)
            BFLOG("Number of Photographers in zoo: " .. table.getn(l_3_2))
            if table.getn(l_3_2) ~= 1 then
               BFLOG("Found NOT one photographer (" .. table.getn(l_3_2) .. "), possible error")
            end
            for l_3_3 = 1, table.getn(l_3_2) do
               local l_3_6 = resolveTable(l_3_2[l_3_3].value)
               if l_3_6 then
                  BFLOG("Setting name")
                  local l_3_7 = getLocID("Challengetext:CHPhotographerVisitPhotographerName")
                  l_3_6:BFG_SET_ATTR_STRING("s_name", l_3_7)
                  local l_3_8 = getAllSpeciesList()
                  favAnimal = l_3_8[math.random(table.getn(l_3_8))]
                  l_3_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
                  displayZooMessageWithZoom("Challengetext:CHPhotographerVisitArrival", 1, 30, l_3_6)
               end
            end
            l_3_arg0.photographerInZoo = true
         end
         local l_3_1 = {}
         local l_3_2 = findType(PHOTOGRAPHER_TYPE)
         for l_3_3 = 1, table.getn(l_3_2) do
            local l_3_6 = resolveTable(l_3_2[l_3_3].value)
            if l_3_6 then
               local l_3_7 = l_3_6:sendMessage("ZTAI_GET_SEEN")
               for l_3_8 = 1, table.getn(l_3_7) do
                  BFLOG("Adding " .. l_3_7[l_3_8].value .. " to species seen list")
                  l_3_1[l_3_8] = l_3_7[l_3_8].value
               end
            end
         end
         BFLOG("Number of animals seen " .. table.getn(l_3_1))
         for l_3_3 = 1, table.getn(l_3_1) do
            if l_3_1[l_3_3] == ANIMAL_TYPE_1 and l_3_arg0.seenManatee == nil then
               BFLOG("Seen " .. ANIMAL_TYPE_1)
               l_3_arg0.seenManatee = 1
               setRuleState("SeenManatee", "success")
               showprimarygoals()
            end
            if l_3_1[l_3_3] == ANIMAL_TYPE_2 and l_3_arg0.seenOtter == nil then
               BFLOG("Seen " .. ANIMAL_TYPE_2)
               setRuleState("SeenOtter", "success")
               l_3_arg0.seenOtter = 1
               showprimarygoals()
            end
            if l_3_1[l_3_3] == ANIMAL_TYPE_3 and l_3_arg0.seenRockhopper == nil then
               BFLOG("Seen " .. ANIMAL_TYPE_3)
               setRuleState("SeenRochhopper", "success")
               l_3_arg0.seenRockhopper = 1
               showprimarygoals()
            end
         end
         if l_3_arg0.seenManatee and l_3_arg0.seenOtter and l_3_arg0.seenRockhopper then
            return 1
         end
         if countType(PHOTOGRAPHER_TYPE) == 0 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completePhotographerVisit = function()
   hideRule("SeenManatee")
   hideRule("SeenOtter")
   hideRule("SeenRochhopper")
   BFLOG("Current Fame level: " .. getZooFame())
   setMaxFame(getZooFame() + CHALLENGE_REWARD_FAME)
   BFLOG("New Fame level(one tick higher): " .. getZooFame())
   giveGuest(GUEST_REWARD)
   showchallengewin("Challengetext:CHPhotographerVisitSuccess")
   resetchallengeoverandcomplete(photographervisitCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failPhotographerVisit = function()
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHPhotographerVisitFailure")
      hideRule("SeenManatee")
      hideRule("SeenOtter")
      hideRule("SeenRochhopper")
   end
   resetchallengeover(photographervisitCHALLENGE_NAME)
   declinenotfail = nil
end


