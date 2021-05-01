include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
randomdinoCHALLENGE_NAME = "randomdino"
FEE_AMOUNT = 12000
validate = function()
   if isChalDeclinedForever(randomdinoCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", randomdinoCHALLENGE_NAME)
   local l_1_0 = getglobalvar(randomdinoCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(randomdinoCHALLENGE_NAME .. "_canrepeat", "true")
      do
         if getHalfStars() >= 4 and FEE_AMOUNT <= howMuchCash() then
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, randomdinoCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. randomdinoCHALLENGE_NAME .. ".xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(randomdinoCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalrandomdino = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      logDebugChallengeInfo(randomdinoCHALLENGE_NAME, "accepted")
      setchallengeactive()
      return 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(randomdinoCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(randomdinoCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(randomdinoCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = queryObject("BFScenarioMgr")
      local l_2_2 = ""
      if l_2_1 then
         l_2_2 = l_2_1:BFS_LOCALIZEFLOAT(FEE_AMOUNT)
      end
      local l_2_3 = getLocID("Challengetext:CHRandomDino")
      local l_2_4 = string.format(l_2_3, l_2_2)
      showchallengepaneltext(l_2_4)
      setglobalvar("challenge", "waiting")
   end
end

completerandomdino = function(l_3_arg0)
   local l_3_1 = {}
   l_3_1[1] = "TyrannosaurusRex"
   l_3_1[2] = "Triceratops"
   l_3_1[3] = "Carnotaurus"
   l_3_1[4] = "Styracosaurus"
   local l_3_2 = l_3_1[math.random(table.getn(l_3_1))]
   randomanimal_type = l_3_2 .. "_Adult_M"
   takeCash(FEE_AMOUNT)
   local l_3_3 = findType(randomanimal_type)
   local l_3_4 = getZooEntrancePos()
   placeObject(randomanimal_type, l_3_4.x, l_3_4.y, l_3_4.z)
   local l_3_5 = findType(randomanimal_type)
   crateNewEntity(l_3_3, l_3_5)
   local l_3_6 = getCostByBinder(randomanimal_type)
   if FEE_AMOUNT <= l_3_6 then
      showchallengewin("Challengetext:CHRandomDinoGreatSuccess")
   else
      showchallengewin("Challengetext:CHRandomDinoSuccess")
   end
   resetchallengeoverandcomplete(randomdinoCHALLENGE_NAME)
   incrementglobalchallenges()
end

failrandomdino = function(l_4_arg0)
   resetchallengeover(randomdinoCHALLENGE_NAME)
end


