include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
animaltradeCHALLENGE_NAME = "animaltrade"
validate = function()
   if isChalDeclinedForever(animaltradeCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animaltradeCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animaltradeCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(animaltradeCHALLENGE_NAME .. "_canrepeat", "true")
      do
         if howManyAnimalsInZoo() >= 6 then
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, animaltradeCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/animaltrade.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(animaltradeCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalanimaltrade = function(l_2_arg0)
end

evalanimaltradefirst = function(l_3_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_3_1 = queryObject("BFScenarioMgr")
      if l_3_1 then
         l_3_1:BFS_SHOWRULE(animaltradeCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animaltradeCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_3_arg0.accept = 1
      local l_3_2 = getLocID("Challengetext:CHAnimalTradeRevealed")
      local l_3_3 = string.format(l_3_2, getlocidfromspecies(l_3_arg0.animalToTrade), getlocidfromspecies(l_3_arg0.animalToGet))
      genericokpaneltext(nil, l_3_3)
      l_3_2 = getLocID("Challengetext:CHAnimalTradeFirstShort")
      l_3_3 = string.format(l_3_2, getlocidfromspecies(l_3_arg0.animalToGet))
      setalttext("animaltrade", "neutral", l_3_3)
      l_3_arg0.oldanimalnames = {}
      l_3_arg0.oldanimalgender = {}
      local l_3_4 = findType(l_3_arg0.animalToTrade)
      local l_3_5 = table.getn(l_3_4)
      for l_3_6 = 1, l_3_5 do
         local l_3_9 = resolveTable(l_3_4[l_3_6].value)
         if l_3_9 ~= nil then
            l_3_arg0.oldanimalnames[l_3_6] = l_3_9:BFG_GET_ATTR_STRING("s_name")
            if isMale(l_3_9) then
               l_3_arg0.oldanimalgender[l_3_6] = "M"
            else
               l_3_arg0.oldanimalgender[l_3_6] = "F"
            end
            deleteEntity(l_3_9)
         end
      end
      for l_3_6 = 1, l_3_5 do
         local l_3_9 = ""
         local l_3_10 = math.random(2)
         if l_3_10 == 1 then
            l_3_9 = l_3_arg0.animalToGet .. "_Adult_M"
         else
            l_3_9 = l_3_arg0.animalToGet .. "_Adult_F"
         end
         local l_3_11 = getZooEntrancePos()
         placeObject(l_3_9, l_3_11.x + 10, l_3_11.y + 10, l_3_11.z)
      end
      l_3_arg0.loananimals = {}
      local l_3_6 = findType(l_3_arg0.animalToGet)
      local l_3_7 = table.getn(l_3_6)
      for l_3_8 = 1, l_3_7 do
         l_3_arg0.loananimals[l_3_8] = l_3_6[l_3_8]
         local l_3_11 = resolveTable(l_3_6[l_3_8].value)
         crateEntity(l_3_11)
      end
      l_3_arg0.prevdonation = getDonations(l_3_arg0.animalToGet)
      if l_3_arg0.prevdonation == nil then
         l_3_arg0.prevdonation = 0
      elseif challenge == "decline" then
         if getDeclineForever() == true then
            setglobalvar(animaltradeCHALLENGE_NAME .. "_decline_forever", "true")
            logDebugChallengeInfo(animaltradeCHALLENGE_NAME, "declinedforever")
            setDeclineForever(false)
         elseif getChallengeDebugMode() == true then
            logDebugChallengeInfo(animaltradeCHALLENGE_NAME, "declined")
         end
         declinenotfail = 1
         return -1
      end
      -- Tried to add an 'end' here but it's incorrect
      if l_3_arg0.accept == nil and challenge == nil then
         local l_3_1 = animalsInZoo()
         local l_3_2 = animalsNotInZoo()
         local l_3_3 = getShowSpeciesList()
         BFLOG("size before filter: " .. table.getn(l_3_1))
         BFLOG("filter: " .. table.getn(l_3_3))
         l_3_1 = filterTable(l_3_1, l_3_3)
         BFLOG("size after filter: " .. table.getn(l_3_1))
         l_3_arg0.animalToTrade = l_3_1[math.random(table.getn(l_3_1))]
         l_3_arg0.animalToGet = l_3_2[math.random(table.getn(l_3_2))]
         l_3_arg0.trademag = countType(l_3_arg0.animalToTrade)
         showchallengepanel("Challengetext:CHAnimalTrade")
         setglobalvar("challenge", "waiting")
      end
      if l_3_arg0.accept ~= nil then
         if l_3_arg0.tradetimer == nil then
            l_3_arg0.tradetimer = getCurrentMonth()
            l_3_arg0.tradetimerday = getCurrentTimeOfDay()
            -- Tried to add an 'end' here but it's incorrect
            local l_3_1 = getDonations(l_3_arg0.animalToGet)
            if l_3_arg0.prevdonation ~= nil then
               local l_3_2, l_3_2, l_3_2 = l_3_1 - l_3_arg0.prevdonation
            end
            --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

completeanimaltradefirst = function(l_4_arg0)
   showchallengewin("Challengetext:CHAnimalTradeFirstSuccess")
   resetchallengeoverandcomplete(animaltradeCHALLENGE_NAME)
   incrementglobalchallenges()
end

failanimaltrade = function(l_5_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHAnimalTradeFailure")
   end
   resetchallengeover(animaltradeCHALLENGE_NAME)
   declinenotfail = nil
end


