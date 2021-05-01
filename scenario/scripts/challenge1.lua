include("scenario/scripts/misc.lua")
include("photo/testscoring.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/awards.lua")
randomskew = 30
getAllChallenges = function()
   local l_1_0 = {}
   local l_1_1 = queryObject("BFScenarioMgr")
   if l_1_1 then
      local l_1_2 = l_1_1:BFS_GETALLCHALLENGES("scenario/scripts/challenge/")
      for l_1_3 = 1, table.getn(l_1_2) do
         local l_1_6 = table.getn(l_1_0) + 1
         l_1_0[l_1_6] = l_1_2[l_1_3].value
      end
      local l_1_3 = l_1_1:BFS_GETALLCHALLENGES("scenario/scripts/challenge/money/")
      for l_1_4 = 1, table.getn(l_1_3) do
         local l_1_7 = table.getn(l_1_0) + 1
         l_1_0[l_1_7] = l_1_3[l_1_4].value
      end
   end
   return l_1_0
end

getRepeatableChallenges = function()
   local l_2_0 = {}
   local l_2_1 = getAllChallenges()
   for l_2_2 = 1, table.getn(l_2_1) do
      local l_2_5 = l_2_1[l_2_2]
      local l_2_6 = getglobalvar(l_2_5 .. "_canrepeat")
      if l_2_6 ~= nil and l_2_6 == "true" then
         l_2_0[table.getn(l_2_0) + 1] = l_2_5
      end
   end
   return l_2_0
end

decidechallengeset = function(l_3_arg0)
   checkawards(l_3_arg0, true)
   BFLOG(SYSTRACE, "start decide challenege set")
   local l_3_1 = getglobalvar("challengeactive")
   local l_3_2 = getglobalvar("challenge")
   if l_3_1 == "true" then
      BFLOG(SYSTRACE, "We have an active challenge")
      l_3_arg0.timer = nil
      return 0
   elseif l_3_2 ~= nil and checkTimeLimit(l_3_arg0, 2, 0) == -1 then
      setglobalvar("challenge", nil)
      l_3_arg0.timer = nil
      l_3_2 = nil
      BFLOG("Waited 2 month, and no challenge give. Must be in a bad state, so force a challenge")
   end
   if l_3_2 ~= nil then
      BFLOG(SYSTRACE, "global var challenge not nil: " .. l_3_2)
      return 0
   end
   if l_3_arg0.startchal == nil then
      BFLOG(SYSTRACE, "Start challenege set: 1")
      l_3_arg0.startchal = 1
   end
   local l_3_3 = getglobalvar("delaychallenges")
   if l_3_3 == "true" then
      l_3_arg0.startchal = 0
      l_3_arg0.starttimer = getCurrentTimeOfDay()
      BFLOG(SYSTRACE, "delay challenge is nil")
      setglobalvar("delaychallenges", nil)
   end
   if l_3_arg0.startchal == 0 then
      local l_3_4 = getCurrentTimeOfDay()
      local l_3_5 = 0
      if l_3_arg0.starttimer <= l_3_4 then
         l_3_5 = l_3_4 - l_3_arg0.starttimer
      else
         l_3_5 = 1 - l_3_arg0.starttimer + l_3_4
      end
      local l_3_6 = 0.2
      local l_3_7 = queryObject("BFScenarioMgr")
      if l_3_7 then
         l_3_6 = l_3_7:BFS_GET_CHALLENGE_DELAY()
      end
      if l_3_6 <= l_3_5 then
         BFLOG(SYSTRACE, "Start challenege(dif) set: 1")
         l_3_arg0.startchal = 1
      end
      return 0
   end
   l_3_arg0.timenow = getRealTime()
   BFLOG(SYSTRACE, "TIME NOW =" .. l_3_arg0.timenow)
   if l_3_arg0.resetchal == nil then
      l_3_arg0.resetchal = getCurrentMonth()
      l_3_arg0.resetchalday = getCurrentTimeOfDay()
   end
   local l_3_4 = getAllChallenges()
   local l_3_5 = getRepeatableChallenges()
   local l_3_6 = getCurrentMonth()
   local l_3_7 = getCurrentTimeOfDay()
   if l_3_arg0.resetchal + 2 <= l_3_6 and l_3_arg0.resetchalday <= l_3_7 then
      BFLOG(SYSTRACE, "reset challenge after 2 months")
      local l_3_8 = ""
      local l_3_9 = ""
      for l_3_10 = 1, table.getn(l_3_4) do
         local l_3_13 = l_3_4[l_3_10]
         l_3_8 = getglobalvar(l_3_13 .. "_over")
         l_3_9 = getglobalvar(l_3_13 .. "_complete")
         if l_3_8 == "true" and (l_3_9 == nil or l_3_9 == "false") then
            setglobalvar(l_3_13 .. "_over", "false")
            setglobalvar(l_3_13 .. "_complete", "false")
            BFLOG(SYSTRACE, "reset challenge: " .. l_3_13)
         end
      end
      for l_3_10 = 1, table.getn(l_3_5) do
         local l_3_13 = l_3_5[l_3_10]
         l_3_8 = getglobalvar(l_3_13 .. "_over")
         l_3_9 = getglobalvar(l_3_13 .. "_complete")
         if l_3_8 == "true" then
            setglobalvar(l_3_13 .. "_over", "false")
            setglobalvar(l_3_13 .. "_complete", "false")
            BFLOG(SYSTRACE, "RESET challenge: " .. l_3_13)
         end
      end
      l_3_arg0.resetchal = getCurrentMonth()
      l_3_arg0.resetchalday = getCurrentTimeOfDay()
   end
   if l_3_arg0.startchal == 1 then
      BFLOG(SYSTRACE, "Call check challenges")
      checkchallenges(l_3_arg0)
   end
   return 0
end

checkchallenges = function(l_4_arg0)
   BFLOG(SYSTRACE, "Check challenges")
   if l_4_arg0.firstTick == nil then
      BFLOG(SYSTRACE, "first tick is true")
      l_4_arg0.firstTick = true
      return 0
   end
   local l_4_1 = getglobalvar("instant_challenge_given")
   if l_4_1 == nil or l_4_1 ~= "true" then
      if getNumGuests(-1) > 0 or getCurrentMonth() > 0 or getCurrentTimeOfDay() > 0.1 then
         setglobalvar("instant_challenge_given", "true")
         return 0
      else
         setglobalvar("instant_challenge_given", "true")
         BFLOG(SYSTRACE, "---------------------> GIVING OUT INSTANT CHALLENGE")
         local l_4_2 = queryObject("BFScenarioMgr")
         if l_4_2 then
            l_4_2:BFS_PICKCHALLENGE("scenario/scripts/challenge/instant/")
         end
         return 0
      end
   end
   if howMuchCash() <= 200 then
      local l_4_2 = math.random(3)
      BFLOG(SYSTRACE, "outofcashnum: " .. l_4_2)
      if l_4_2 == 1 then
         local l_4_3 = queryObject("BFScenarioMgr")
         if l_4_3 then
            l_4_3:BFS_PICKCHALLENGE("scenario/scripts/challenge/money/")
         else
            local l_4_2 = queryObject("BFScenarioMgr")
            if l_4_2 then
               l_4_2:BFS_PICKCHALLENGE("scenario/scripts/challenge/")
            end
         end
         -- Tried to add an 'end' here but it's incorrect
      end
end


