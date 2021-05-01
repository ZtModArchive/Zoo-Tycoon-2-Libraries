include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
randomanimalchance2CHALLENGE_NAME = "randomanimalchance2"
validate = function()
   if isChalDeclinedForever(randomanimalchance2CHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", randomanimalchance2CHALLENGE_NAME)
   local l_1_0 = getglobalvar(randomanimalchance2CHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(randomanimalchance2CHALLENGE_NAME .. "_canrepeat", "true")
      do
         if getHalfStars() >= 6 and getHalfStars() <= 10 and howMuchCash() >= 16000 then
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, randomanimalchance2CHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/randomanimalchance2.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(randomanimalchance2CHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalrandomanimalchance2 = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      logDebugChallengeInfo(randomanimalchance2CHALLENGE_NAME, "accepted")
      setchallengeactive()
      return 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(randomanimalchance2CHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(randomanimalchance2CHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(randomanimalchance2CHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = queryObject("BFScenarioMgr")
      local l_2_2 = ""
      if l_2_1 then
         l_2_2 = l_2_1:BFS_LOCALIZEFLOAT(16000)
      end
      local l_2_3 = getLocID("Challengetext:CHRandomAnimalChance2")
      local l_2_4 = string.format(l_2_3, l_2_2)
      showchallengepaneltext(l_2_4)
      setglobalvar("challenge", "waiting")
   end
end

completerandomanimalchance2 = function(l_3_arg0)
   local l_3_1 = {}
   l_3_1[1] = "LemurRingtailed"
   l_3_1[2] = "RhinocerosBlack"
   l_3_1[3] = "BearPolar"
   l_3_1[4] = "BeaverAmerican"
   l_3_1[5] = "TigerBengal"
   l_3_1[6] = "Chimpanzee"
   l_3_1[7] = "BearGrizzly"
   l_3_1[8] = "ElephantAfrican"
   l_3_1[9] = "GorillaMountain"
   l_3_1[10] = "LeopardSnow"
   l_3_1[11] = "PandaRed"
   l_3_1[12] = "PandaGiant"
   local l_3_2 = l_3_1[math.random(table.getn(l_3_1))]
   randomanimal_type = l_3_2 .. "_Adult_M"
   takeCash(16000)
   local l_3_3 = findType(randomanimal_type)
   local l_3_4 = getZooEntrancePos()
   placeObject(randomanimal_type, l_3_4.x, l_3_4.y, l_3_4.z)
   local l_3_5 = findType(randomanimal_type)
   crateNewEntity(l_3_3, l_3_5)
   local l_3_6 = getCostByBinder(randomanimal_type)
   if l_3_6 >= 16000 then
      showchallengewin("Challengetext:CHRandomAnimalChance2GreatSuccess")
   else
      showchallengewin("Challengetext:CHRandomAnimalChance2Success")
   end
   resetchallengeoverandcomplete(randomanimalchance2CHALLENGE_NAME)
   incrementglobalchallenges()
end

failrandomanimalchance2 = function(l_4_arg0)
   resetchallengeover(randomanimalchance2CHALLENGE_NAME)
end


