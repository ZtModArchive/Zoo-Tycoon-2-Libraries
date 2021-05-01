include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/fossil.lua")
validate = function()
   if isChalDeclinedForever("fossilfinding") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "fossilfinding")
   local l_1_0 = getglobalvar("fossilfinding_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = 0
         local l_1_2 = queryObject("ZTPuzzleMgr")
         if l_1_2 ~= nil then
            l_1_1 = l_1_2:ZT_GET_SONAR_LEVEL()
         end
         if l_1_1 > 0 and l_1_1 < 5 and countType("CloningCenter") >= 1 and getHalfStars() <= 4 then
            local l_1_3 = 0
            local l_1_4 = 0
            local l_1_5 = queryObject("ZTPuzzleMgr")
            if l_1_5 then
               l_1_3 = l_1_5:ZT_GET_NUM_PUZZLES("0")
               l_1_4 = l_1_5:ZT_GET_NUM_PUZZLES_READY("0")
            end
            if l_1_4 < l_1_3 then
               local l_1_6 = queryObject("BFScenarioMgr")
               if l_1_6 then
                  if getPrereqGather() == true then
                     BFLOG(SYSTRACE, "fossilfinding")
                     -- Tried to add an 'end' here but it's incorrect
                     incChallengesOffered()
                     if getAddScenarioSuppression() == false then
                        l_1_6:BFS_ADDSCENARIO("scenario/goals/challenge/fossilfinding.xml")
                     elseif getPrereqGather() == false then
                        logDebugChallengeInfo("fossilfinding", "skipped")
                     end
                     return 1
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  return 0
end

evalFossilFinding = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("fossilfinding")
      end
      logDebugChallengeInfo("fossilfinding", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
      local l_2_2 = queryObject("ZTPuzzleMgr")
      if l_2_2 then
         l_2_arg0.numPuzzlesReady = l_2_2:ZT_GET_NUM_PUZZLES_READY()
      elseif challenge == "decline" then
         if getDeclineForever() == true then
            setglobalvar("fossilfinding" .. "_decline_forever", "true")
            logDebugChallengeInfo("fossilfinding", "declinedforever")
            setDeclineForever(false)
         elseif getChallengeDebugMode() == true then
            logDebugChallengeInfo("fossilfinding", "declined")
         end
         declinenotfail = 1
         return -1
      end
      -- Tried to add an 'end' here but it's incorrect
      if l_2_arg0.accept == nil and challenge == nil then
         showchallengepanel("Challengetext:CHFossilFinding")
         setglobalvar("challenge", "waiting")
      end
      if l_2_arg0.accept == 1 then
         local l_2_1, l_2_1 = queryObject("ZTPuzzleMgr")
         --[[ DECOMPILER ERROR 676: overwrote pending register! ]]
end

completeFossilFinding = function(l_3_arg0)
   local l_3_1 = nil
   local l_3_2 = queryObject("ZTPuzzleMgr")
   if l_3_2 then
      l_3_1 = l_3_2:ZT_UNLOCK_RANDOM_PUZZLE("1")
   end
   local l_3_3 = getLocID("Challengetext:CHFossilFindingSuccessShort")
   local l_3_4 = string.format(l_3_3, getlocidfromspecies(l_3_1))
   setalttext("fossilfinding", "success", l_3_4)
   l_3_3 = getLocID("Challengetext:CHFossilFindingSuccess")
   l_3_4 = string.format(l_3_3, getlocidfromspecies(l_3_1))
   setaltoverviewtext("fossilfinding", "success", l_3_4)
   showchallengewintext(l_3_4)
   resetchallengeoverandcomplete("fossilfinding")
   incrementglobalchallenges()
end

failFossilFinding = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHFossilFindingFailure")
   end
   resetchallengeover("fossilfinding")
   declinenotfail = nil
end


