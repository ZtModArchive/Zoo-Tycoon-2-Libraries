include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
garbagestrikeCHALLENGE_NAME = "garbagestrike"
validate = function()
   if isChalDeclinedForever(garbagestrikeCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", garbagestrikeCHALLENGE_NAME)
   local l_1_0 = getglobalvar(garbagestrikeCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Worker") >= 2 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, garbagestrikeCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/garbagestrike.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(garbagestrikeCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

giveWorker = function(l_2_arg0, l_2_arg1)
   local l_2_2 = findType("Worker")
   local l_2_3 = getZooEntrancePos()
   placeObject("Worker_Adult_" .. l_2_arg1 .. "_01", l_2_3.x + 10, l_2_3.y + 10, l_2_3.z)
   local l_2_4 = findType("Worker")
   for l_2_5 = 1, table.getn(l_2_4) do
      local l_2_8 = false
      for l_2_9 = 1, table.getn(l_2_2) do
         local l_2_12 = resolveTable(l_2_4[l_2_5].value)
         local l_2_13 = resolveTable(l_2_2[l_2_9].value)
         if areCompsEqual(l_2_12, l_2_13) == true then
            l_2_8 = true
         end
      end
      if l_2_8 == false then
         local l_2_9 = resolveTable(l_2_4[l_2_5].value)
         if l_2_9 ~= nil then
            l_2_9:BFG_SET_ATTR_STRING("s_name", l_2_arg0)
         end
      end
   end
end

evalgarbagestrike = function(l_3_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_3_1 = queryObject("BFScenarioMgr")
      if l_3_1 then
         l_3_1:BFS_SHOWRULE(garbagestrikeCHALLENGE_NAME)
      end
      logDebugChallengeInfo(garbagestrikeCHALLENGE_NAME, "accepted")
      setchallengeactive()
      takeCash(4000)
      local l_3_2 = table.getn(l_3_arg0.workernames) / 2
      for l_3_3 = 1, l_3_2 do
         giveWorker(l_3_arg0.workernames[1], l_3_arg0.workergenders[1])
         table.remove(l_3_arg0.workernames, 1)
         table.remove(l_3_arg0.workergenders, 1)
      end
      l_3_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      local l_3_1 = queryObject("BFScenarioMgr")
      if l_3_1 then
         l_3_1:BFS_SHOWRULE("garbagestrike")
      end
      local l_3_2 = getLocID("Challengetext:CHGarbageStrikeShort")
      setalttext("garbagestrike", "neutral", l_3_2)
      if getDeclineForever() == true then
         setglobalvar(garbagestrikeCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(garbagestrikeCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(garbagestrikeCHALLENGE_NAME, "declined")
      end
      setchallengeactive()
      l_3_arg0.decline = 1
      showprimarygoals()
   end
   if l_3_arg0.accept == nil and l_3_arg0.decline == nil and challenge == nil then
      local l_3_1 = findType("Worker")
      if l_3_1 == 0 then
         return -1
      end
      local l_3_2 = table.getn(l_3_1)
      l_3_arg0.workernames = {}
      l_3_arg0.workergenders = {}
      for l_3_3 = 1, l_3_2 do
         local l_3_6 = resolveTable(l_3_1[l_3_3].value)
         if l_3_6 ~= nil then
            l_3_arg0.workernames[l_3_3] = l_3_6:BFG_GET_ATTR_STRING("s_name")
            if isMale(l_3_6) == true then
               l_3_arg0.workergenders[l_3_3] = "M"
            else
               l_3_arg0.workergenders[l_3_3] = "F"
            end
            deleteEntity(l_3_6)
         end
      end
      local l_3_3 = queryObject("BFScenarioMgr")
      if l_3_3 then
         l_3_3:UI_DISABLE("staff")
         local l_3_4 = queryObject("UIRoot")
         if l_3_4 then
            local l_3_5 = l_3_4:UI_GET_CHILD("Animal Food Tab")
            if l_3_5 then
               l_3_5:UI_ACTIVATE_ON()
               l_3_5:UI_ACTIVATE_OFF()
            end
         end
         local l_3_5 = queryObject("ZTMode")
         if l_3_5 then
            l_3_5:sendMessage("ZT_SETMODE", "mode_selection")
            l_3_5:sendMessage("UI_LBUTTONDOWN")
            l_3_5:sendMessage("UI_RBUTTONDOWN")
         end
      end
      showchallengepanel("Challengetext:CHGarbageStrike")
      setglobalvar("challenge", "waiting")
   end
   if l_3_arg0.accept ~= nil or l_3_arg0.decline ~= nil then
      if l_3_arg0.garbagetimer == nil then
         l_3_arg0.garbagetimer = getCurrentMonth()
         l_3_arg0.garbagetimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_3_1 = getCurrentMonth()
         local l_3_2 = getCurrentTimeOfDay()
         if (l_3_arg0.garbagetimer + 1 <= l_3_1 and l_3_arg0.garbagetimerday <= l_3_2) or l_3_arg0.garbagetimer + 2 <= l_3_1 then
            if l_3_arg0.workernames ~= nil then
               local l_3_3 = table.getn(l_3_arg0.workernames)
               for l_3_4 = 1, l_3_3 do
                  giveWorker(l_3_arg0.workernames[1], l_3_arg0.workergenders[1])
                  table.remove(l_3_arg0.workernames, 1)
                  table.remove(l_3_arg0.workergenders, 1)
               end
            else
            end
               local l_3_3 = queryObject("BFScenarioMgr")
               if l_3_3 then
                  l_3_3:UI_ENABLE("staff")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
end

completegarbagestrike = function(l_4_arg0)
   if l_4_arg0.accept ~= nil then
      showchallengewin("Challengetext:CHGarbageStrikePaySuccessShort")
   else
      showchallengewin("Challengetext:CHGarbageStrikeSuccessShort")
   end
   resetchallengeoverandcomplete(garbagestrikeCHALLENGE_NAME)
   incrementglobalchallenges()
end


