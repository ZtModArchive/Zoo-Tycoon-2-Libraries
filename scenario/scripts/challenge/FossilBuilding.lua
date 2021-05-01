include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/fossil.lua")
validate = function()
   if isChalDeclinedForever("fossilbuilding") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "fossilbuilding")
   local l_1_0 = getglobalvar("fossilbuilding_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = 0
         local l_1_2 = queryObject("ZTPuzzleMgr")
         if l_1_2 ~= nil then
            l_1_1 = l_1_2:ZT_GET_SONAR_LEVEL()
         end
         if l_1_1 > 0 and l_1_1 < 5 and countType("CloningCenter") >= 1 and howMuchCash() >= 3000 then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, "fossilbuilding")
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/fossilbuilding.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo("fossilbuilding", "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalFossilBuilding = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("fossilbuilding")
      end
      logDebugChallengeInfo("fossilbuilding", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
      local l_2_2 = queryObject("ZTPuzzleMgr")
      if l_2_2 then
         local l_2_3 = getglobalvar("fossilbuildingScenarioAnimal")
         l_2_2:ZT_UNLOCK_PUZZLE(l_2_3)
      end
      takeCash(2000)
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("fossilbuilding" .. "_decline_forever", "true")
         logDebugChallengeInfo("fossilbuilding", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("fossilbuilding", "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = queryObject("ZTPuzzleMgr")
      if l_2_1 then
         fossilbuildingScenarioAnimal = l_2_1:ZT_CHOOSE_RANDOM_PUZZLE("1")
         setglobalvar("fossilbuildingScenarioAnimal", fossilbuildingScenarioAnimal)
      end
      local l_2_2 = getlocidfromspecies(fossilbuildingScenarioAnimal)
      local l_2_3 = getLocID("Challengetext:CHFossilBuildingShort")
      local l_2_4 = string.format(l_2_3, l_2_2)
      setAltText("fossilbuilding", "neutral", l_2_4)
      l_2_3 = getLocID("Challengetext:CHFossilBuilding")
      l_2_4 = string.format(l_2_3, l_2_2)
      setAltOverviewText("fossilbuilding", "neutral", l_2_4)
      showchallengepaneltext(l_2_4)
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      local l_2_1, l_2_1 = queryObject("ZTPuzzleMgr")
      if l_2_1 then
         l_2_1 = getglobalvar
         l_2_1 = l_2_1("fossilbuildingScenarioAnimal")
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

completeFossilBuilding = function(l_3_arg0)
   local l_3_1 = getglobalvar("fossilbuildingScenarioAnimal")
   local l_3_2 = getlocidfromspecies(l_3_1)
   local l_3_3 = getLocID("Challengetext:CHFossilBuildingSuccessShort")
   local l_3_4 = string.format(l_3_3, l_3_2)
   setalttext("fossilbuilding", "success", l_3_4)
   l_3_3 = getLocID("Challengetext:CHFossilBuildingSuccess")
   l_3_4 = string.format(l_3_3, l_3_2)
   setaltoverviewtext("fossilbuilding", "success", l_3_4)
   showchallengewintext(l_3_4)
   giveCash(2000)
   resetchallengeoverandcomplete("fossilbuilding")
   incrementglobalchallenges()
end

failFossilBuilding = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHFossilBuildingFailure")
   end
   resetchallengeover("fossilbuilding")
   declinenotfail = nil
end


