include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
animalstressCHALLENGE_NAME = "animalstress"
validate = function()
   if isChalDeclinedForever(animalstressCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalstressCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalstressCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and howManyAnimalsInZoo() >= 7 and getTotalBadCumPoints() / getTotalGoodCumPoints() >= 0.2 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, animalstressCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/animalstress.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(animalstressCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalanimalstress = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(animalstressCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animalstressCHALLENGE_NAME, "accepted")
      setchallengeactive()
      local l_2_2 = getLocID("Challengetext:CHAnimalStressArgueShort")
      setalttext("animalstress", "neutral", l_2_2)
      local l_2_3 = queryObject("BFScenarioMgr")
      if l_2_3 then
         l_2_3:UI_DISABLE("open zoo toggle button")
         local l_2_4 = queryObject("UIRoot")
         if l_2_4 then
            local l_2_5 = l_2_4:UI_GET_CHILD("close zoo toggle button")
            if l_2_5 then
               l_2_5:UI_ACTIVATE_ON()
            end
         end
      end
      UIdisable = true
      l_2_arg0.argue = 1
      showprimarygoals()
      local l_2_4 = queryObject("BFScenarioMgr")
      if l_2_4 then
         l_2_4:UI_DISABLE("put up for adoption")
      elseif challenge == "decline" then
         local l_2_1 = queryObject("BFScenarioMgr")
         if l_2_1 then
            l_2_1:BFS_SHOWRULE("animalstress")
         end
         if getDeclineForever() == true then
            setglobalvar(animalstressCHALLENGE_NAME .. "_decline_forever", "true")
            logDebugChallengeInfo(animalstressCHALLENGE_NAME, "declinedforever")
            setDeclineForever(false)
         elseif getChallengeDebugMode() == true then
            logDebugChallengeInfo(animalstressCHALLENGE_NAME, "declined")
         end
         setchallengeactive()
         l_2_arg0.argue = 0
         showprimarygoals()
         local l_2_2 = queryObject("BFScenarioMgr")
         if l_2_2 then
            l_2_2:UI_DISABLE("Buy Animal Tab")
            l_2_2:UI_DISABLE("Adopt Animal Tab")
            l_2_2:UI_DISABLE("put up for adoption")
            local l_2_3 = queryObject("UIRoot")
            if l_2_3 then
               local l_2_4 = l_2_3:UI_GET_CHILD("Animal Food Tab")
               if l_2_4 then
                  l_2_4:UI_ACTIVATE_ON()
               end
            end
         end
         UIdisable = true
      end
      -- Tried to add an 'end' here but it's incorrect
      if l_2_arg0.argue == nil and challenge == nil then
         showchallengepanel("Challengetext:CHAnimalStress")
         setglobalvar("challenge", "waiting")
      end
      if l_2_arg0.argue ~= nil then
         if l_2_arg0.stresstimer == nil then
            l_2_arg0.stresstimer = getCurrentMonth()
            l_2_arg0.stresstimerday = getCurrentTimeOfDay()
            -- Tried to add an 'end' here but it's incorrect
            do
               if l_2_arg0.argue == 1 then
                  if UIdisable == nil or UIdisable ~= true then
                     local l_2_1 = queryObject("BFScenarioMgr")
                     if l_2_1 then
                        l_2_1:UI_DISABLE("open zoo toggle button")
                        local l_2_2 = queryObject("UIRoot")
                        if l_2_2 then
                           local l_2_3 = l_2_2:UI_GET_CHILD("close zoo toggle button")
                           if l_2_3 then
                              l_2_3:UI_ACTIVATE_ON()
                           end
                        end
                     end
                     UIdisable = true
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  if l_2_arg0.startevalanimals == nil then
                     l_2_arg0.startevalanimals = 1
                     l_2_arg0.startbad = {}
                     l_2_arg0.startgood = {}
                     l_2_arg0.releasedAtStart = getAnimalsReleased()
                     local l_2_1 = findType("animal")
                     local l_2_2 = 0
                     l_2_2 = table.getn(l_2_1)
                     l_2_arg0.animalsave = {}
                     for l_2_3 = 1, l_2_2 do
                        l_2_arg0.animalsave[l_2_3] = l_2_1[l_2_3]
                        l_2_arg0.animalsave[l_2_3].id = l_2_3
                        local l_2_6 = resolveTable(l_2_arg0.animalsave[l_2_3].value)
                        l_2_arg0.startbad[l_2_3] = getNeedPointsBadCum(l_2_6)
                        l_2_arg0.startgood[l_2_3] = getNeedPointsGoodCum(l_2_6)
                     end
                  elseif UIdisable == nil or UIdisable ~= true then
                     local l_2_1 = queryObject("BFScenarioMgr")
                     if l_2_1 then
                        l_2_1:UI_DISABLE("Buy Animal Tab")
                        l_2_1:UI_DISABLE("Adopt Animal Tab")
                        l_2_1:UI_DISABLE("put up for adoption")
                        local l_2_2 = queryObject("UIRoot")
                        if l_2_2 then
                           local l_2_3 = l_2_2:UI_GET_CHILD("Animal Food Tab")
                           if l_2_3 then
                              l_2_3:UI_ACTIVATE_ON()
                           end
                        end
                     end
                     UIdisable = true
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  local l_2_1 = getCurrentMonth()
                  local l_2_2 = getCurrentTimeOfDay()
                  do
                     if (l_2_arg0.stresstimer + 1 <= l_2_1 and l_2_arg0.stresstimerday + 0.1 <= l_2_2) or l_2_arg0.stresstimer + 2 <= l_2_1 then
                        if l_2_arg0.argue == 0 then
                           local l_2_3 = queryObject("BFScenarioMgr")
                           if l_2_3 then
                              l_2_3:UI_ENABLE("Buy Animal Tab")
                              l_2_3:UI_ENABLE("Adopt Animal Tab")
                           end
                           return 1
                           -- Tried to add an 'end' here but it's incorrect
                        end
                        if l_2_arg0.argue == 1 then
                           local l_2_3 = queryObject("BFScenarioMgr")
                           if l_2_3 then
                              l_2_3:UI_ENABLE("open zoo toggle button")
                              local l_2_4 = queryObject("UIRoot")
                              if l_2_4 then
                                 l_2_4:UI_ENABLE("open zoo toggle button")
                                 local l_2_5 = l_2_4:UI_GET_CHILD("open zoo toggle button")
                                 if l_2_5 then
                                    l_2_5:UI_REPRESS()
                                 end
                              end
                           end
                           l_2_arg0.endbad = {}
                           l_2_arg0.endgood = {}
                           local l_2_4 = table.getn(l_2_arg0.animalsave)
                           local l_2_5 = 0
                           for l_2_6 = 1, l_2_4 do
                              local l_2_9 = resolveTable(l_2_arg0.animalsave[l_2_6].value)
                              if l_2_9 == nil then
                                 l_2_5 = l_2_5 + 1
                                 local l_2_10 = getAnimalsReleased() - l_2_arg0.releasedAtStart
                                 if l_2_10 < l_2_5 then
                                    return -1
                                 end
                                 l_2_arg0.endbad[l_2_arg0.animalsave[l_2_6].id] = 0
                                 l_2_arg0.endgood[l_2_arg0.animalsave[l_2_6].id] = 100
                              else
                                 local l_2_10 = l_2_arg0.endbad
                                 local l_2_11 = l_2_arg0.animalsave[l_2_6].id
                                 l_2_10[l_2_11] = getNeedPointsBadCum(l_2_9)
                                 l_2_10 = l_2_arg0.endgood
                                 l_2_11 = l_2_arg0.animalsave
                                 l_2_11 = l_2_11[l_2_6]
                                 l_2_11 = l_2_11.id
                                 l_2_10[l_2_11] = getNeedPointsGoodCum(l_2_9)
                              end
                           end
                           for l_2_6 = 1, l_2_4 do
                              if l_2_arg0.endgood[l_2_arg0.animalsave[l_2_6].id] - l_2_arg0.startgood[l_2_arg0.animalsave[l_2_6].id] - (l_2_arg0.endbad[l_2_arg0.animalsave[l_2_6].id] - l_2_arg0.startbad[l_2_arg0.animalsave[l_2_6].id]) < 0 then
                                 return -1
                              end
                           end
                           giveCash(5000)
                           bigwin = 1
                           return 1
                        end
                        -- Tried to add an 'end' here but it's incorrect
                        -- Tried to add an 'end' here but it's incorrect
end

completeanimalstress = function(l_3_arg0)
   local l_3_1 = queryObject("BFScenarioMgr")
   if l_3_1 then
      l_3_1:UI_ENABLE("Buy Animal Tab")
      l_3_1:UI_ENABLE("Adopt Animal Tab")
      l_3_1:UI_ENABLE("put up for adoption")
   end
   if bigwin ~= nil then
      showchallengewin("Challengetext:CHAnimalStressSuccess")
   else
      showchallengewin("Challengetext:CHAnimalStressEnd")
   end
   resetchallengeoverandcomplete(animalstressCHALLENGE_NAME)
   incrementglobalchallenges()
end

failanimalstress = function(l_4_arg0)
   takeCash(2500)
   local l_4_1 = queryObject("BFScenarioMgr")
   if l_4_1 then
      l_4_1:UI_ENABLE("Buy Animal Tab")
      l_4_1:UI_ENABLE("Adopt Animal Tab")
      l_4_1:UI_ENABLE("put up for adoption")
   end
   showchallengefail("Challengetext:CHAnimalStressArgueFailure")
   resetchallengeover(animalstressCHALLENGE_NAME)
end


