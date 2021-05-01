include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/Shows.lua")
animalstarCHALLENGE_NAME = "animalstar"
CHALLENGE_REWARD = 5
CHALLENGE_ANIMAL = "DolphinBottlenose_Adult_F"
CHALLENGE_FEE = 3000
DELIA_ID = 0
validate = function()
   if isChalDeclinedForever(animalstarCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalstarCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalstarCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and getHalfStars() >= 3 and getHalfStars() < 8 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, animalstarCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  BFLOG("giving out challenge")
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/animalstar.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(animalstarCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalAnimalStar = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(animalstarCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animalstarCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalstarCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalstarCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalstarCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHAnimalStar")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.deliaId == nil and l_2_arg0.takeCash == nil then
         takeCashNoPopup(CHALLENGE_FEE)
         l_2_arg0.deliaId = placeCratedWaterObjectAtGate(CHALLENGE_ANIMAL)
         l_2_arg0.takeCash = 1
         setglobalvar("deliaId", tostring(l_2_arg0.deliaId))
         -- Tried to add an 'end' here but it's incorrect
         do
            local l_2_1 = findEntityByID(l_2_arg0.deliaId)
            if l_2_1 and l_2_arg0.setName == nil then
               BFLOG("Setting name")
               local l_2_2 = getLocID("Challengetext:CHAnimalStarAnimalName")
               l_2_1:BFG_SET_ATTR_STRING("s_name", l_2_2)
               l_2_1:BFG_SET_ATTR_BOOLEAN("b_showRelease", false)
               l_2_1:BFG_SET_ATTR_BOOLEAN("b_showAdopt", false)
               setTrickSkillLevel(l_2_1, "DolphinWaterWalk", "100")
               setTrickSkillLevel(l_2_1, "DolphinFlipForward", "100")
               setTrickSkillLevel(l_2_1, "DolphinFlipBack", "60")
               setTrickSkillLevel(l_2_1, "DolphinCorkscrewTwist", "60")
               setTrickSkillLevel(l_2_1, "DolphinSpyhop", "60")
               setTrickSkillLevel(l_2_1, "DolphinFlipperSplash", "100")
               setTrickSkillLevel(l_2_1, "DolphinJumpBar", "100")
               setTrickSkillLevel(l_2_1, "DolphinJump", "100")
               setNeed(l_2_1, "social", 0)
               l_2_arg0.setName = 1
            end
            if l_2_1 and (not basicNeedsNotCritical(l_2_1) or not advancedNeedsNotCritical(l_2_1)) then
               return -1
            end
            if checkTimeLimit(l_2_arg0, 2, 0) == -1 then
               return 1
            end
            if l_2_1 then
               setNeed(l_2_1, "social", 0)
            end
            return 0
            -- Tried to add an 'end' here but it's incorrect
         end
         return 0
end

completeAnimalStar = function(l_3_arg0)
   giveGuest(CHALLENGE_REWARD)
   local l_3_1 = tonumber(getglobalvar("deliaId"))
   local l_3_2 = findEntityByID(l_3_1)
   deleteEntity(l_3_2)
   showchallengewin("Challengetext:CHAnimalStarSuccess")
   resetchallengeoverandcomplete(animalstarCHALLENGE_NAME)
   incrementmarineshowchallenges()
end

failAnimalStar = function(l_4_arg0)
   if declinenotfail == nil then
      local l_4_1 = tonumber(getglobalvar("deliaId"))
      local l_4_2 = findEntityByID(l_4_1)
      deleteEntity(l_4_2)
      local l_4_3 = findType("Guest")
      for l_4_4 = 1, table.getn(l_4_3) do
         local l_4_7 = resolveTable(l_4_3[l_4_4].value)
         if l_4_7 ~= nil then
            local l_4_8 = l_4_7:BFG_GET_ATTR_FLOAT("happiness")
            l_4_7:BFG_SET_ATTR_FLOAT("happiness", l_4_8 + 5)
         end
      end
      showchallengefail("Challengetext:CHAnimalStarFailure")
   end
   resetchallengeover(animalstarCHALLENGE_NAME)
   declinenotfail = nil
end


