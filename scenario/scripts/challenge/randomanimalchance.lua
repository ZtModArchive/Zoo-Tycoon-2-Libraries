include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
randomanimalchanceCHALLENGE_NAME = "randomanimalchance"
validate = function()
   if isChalDeclinedForever(randomanimalchanceCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", randomanimalchanceCHALLENGE_NAME)
   local l_1_0 = getglobalvar(randomanimalchanceCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(randomanimalchanceCHALLENGE_NAME .. "_canrepeat", "true")
      do
         if getHalfStars() >= 2 and getHalfStars() <= 5 and howMuchCash() >= 5400 then
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, randomanimalchanceCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/randomanimalchance.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(randomanimalchanceCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalrandomanimalchance = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      logDebugChallengeInfo(randomanimalchanceCHALLENGE_NAME, "accepted")
      setchallengeactive()
      return 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(randomanimalchanceCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(randomanimalchanceCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(randomanimalchanceCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = queryObject("BFScenarioMgr")
      local l_2_2 = ""
      if l_2_1 then
         l_2_2 = l_2_1:BFS_LOCALIZEFLOAT(3800)
      end
      local l_2_3 = getLocID("Challengetext:CHRandomAnimalChance")
      local l_2_4 = string.format(l_2_3, l_2_2)
      showchallengepaneltext(l_2_4)
      setglobalvar("challenge", "waiting")
   end
end

completerandomanimalchance = function(l_3_arg0)
   local l_3_1 = {}
   l_3_1[1] = "CamelDromedary"
   l_3_1[2] = "Moose"
   l_3_1[3] = "GazelleThomsons"
   l_3_1[4] = "PeafowlCommon"
   l_3_1[5] = "Gemsbok"
   l_3_1[6] = "FlamingoGreater"
   l_3_1[7] = "PenguinEmperor"
   l_3_1[8] = "ZebraCommon"
   l_3_1[9] = "CrocodileNile"
   l_3_1[10] = "Ibex"
   l_3_1[11] = "Ostrich"
   l_3_1[12] = "Kangaroo"
   l_3_1[13] = "Jaguar"
   l_3_1[14] = "Okapi"
   l_3_1[15] = "Giraffe"
   l_3_1[16] = "Cheetah"
   l_3_1[17] = "Lion"
   l_3_1[18] = "Hippopotamus"
   local l_3_2 = l_3_1[math.random(table.getn(l_3_1))]
   randomanimal_type = l_3_2 .. "_Adult_M"
   takeCash(3800)
   local l_3_3 = findType(randomanimal_type)
   local l_3_4 = getZooEntrancePos()
   placeObject(randomanimal_type, l_3_4.x, l_3_4.y, l_3_4.z)
   local l_3_5 = findType(randomanimal_type)
   crateNewEntity(l_3_3, l_3_5)
   local l_3_6 = getCostByBinder(randomanimal_type)
   if l_3_6 >= 3800 then
      showchallengewin("Challengetext:CHRandomAnimalChanceGreatSuccess")
   else
      showchallengewin("Challengetext:CHRandomAnimalChanceSuccess")
   end
   resetchallengeoverandcomplete(randomanimalchanceCHALLENGE_NAME)
   incrementglobalchallenges()
end

failrandomanimalchance = function(l_4_arg0)
   resetchallengeover(randomanimalchanceCHALLENGE_NAME)
end


