include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
animalinstinctsCHALLENGE_NAME = "animalinstincts"
validate = function()
   if isChalDeclinedForever(animalinstinctsCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalinstinctsCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalinstinctsCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and (thisManyExist("LemurRingtailed", 2) == true or thisManyExist("Lion", 2) == true or thisManyExist("Giraffe", 2) == true) then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, animalinstinctsCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/animalinstincts.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(animalinstinctsCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalanimalinstincts = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("animalinstinctsphoto")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("AnimalInstincts")
      end
      logDebugChallengeInfo(animalinstinctsCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalinstinctsCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalinstinctsCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalinstinctsCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("AnimalInstinctstext:PHAnimalInstincts")
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

scoreLemursGrooming = function(l_3_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_3_arg0, "LemurRingtailed", "GroomOther_Idle") >= 1 then
      return 1
   end
   return 0
end

scoreLionsSleepinShade = function(l_4_arg0)
   if numberOfT1(l_4_arg0, "Lion_Adult_M") >= 1 and numberOfT1(l_4_arg0, "Lion_Adult_F") >= 3 and numberOfT1(l_4_arg0, "Lion_Young") >= 1 then
      return 1
   end
   return 0
end

scoreOstrichMatingDance = function(l_5_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Ostrich", "Stand_MateDance") >= 1 then
      return 1
   end
   return 0
end

scoreYoungGiraffeCalling = function(l_6_arg0)
   local l_6_1 = scoreAnyDoingTaskInList
   local l_6_2 = l_6_arg0
   local l_6_3 = "Giraffe_Young"
   local l_6_4 = {"CallMother"}
   l_6_1 = l_6_1(l_6_2, l_6_3, l_6_4)
   if l_6_1 >= 1 then
      l_6_1 = 1
      return l_6_1
   end
   l_6_1 = 0
   return l_6_1
end

completeanimalinstincts = function(l_7_arg0)
   BFLOG(SYSTRACE, "complete animalinstincts")
   incrementAwardPoints(2)
   local l_7_1 = findType("Guest")
   for l_7_2 = 1, table.getn(l_7_1) do
      local l_7_5 = resolveTable(l_7_1[l_7_2].value)
      if l_7_5 ~= nil then
         l_7_5:BFG_SET_ATTR_FLOAT("bathroom", 0)
         l_7_5:BFG_SET_ATTR_FLOAT("rest", 0)
         l_7_5:BFG_SET_ATTR_FLOAT("social", 0)
         l_7_5:BFG_SET_ATTR_FLOAT("happiness", 0)
         local l_7_6 = math.random(30)
         local l_7_7 = math.random(30)
         l_7_5:BFG_SET_ATTR_FLOAT("hunger", l_7_7)
         l_7_5:BFG_SET_ATTR_FLOAT("thirst", l_7_6)
      end
   end
   showchallengewin("AnimalInstinctstext:PHAnimalInstinctsSuccess")
   resetchallengeoverandcomplete(animalinstinctsCHALLENGE_NAME)
   incrementphotochallenges()
end

failanimalinstincts = function(l_8_arg0)
   BFLOG(SYSTRACE, "fail animalinstincts")
   resetchallengeover(animalinstinctsCHALLENGE_NAME)
   clearphotochallenge(animalinstinctsCHALLENGE_NAME .. "photo")
end


