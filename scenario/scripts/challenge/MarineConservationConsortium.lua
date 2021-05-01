include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
marineconservationconsortiumCHALLENGE_NAME = "marineconservationconsortium"
CHALLENGE_REWARD = 20000
validate = function()
   if isChalDeclinedForever(marineconservationconsortiumCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", marineconservationconsortiumCHALLENGE_NAME)
   local l_1_0 = getglobalvar(marineconservationconsortiumCHALLENGE_NAME .. "_over")
   do
      if l_1_0 == nil or l_1_0 ~= "true" then
         local l_1_1 = getMarineSpeciesList()
         local l_1_2 = getMarineEntityList()
         if l_1_2 and table.getn(l_1_1) >= 3 and hasPregnantAnimal(l_1_2) then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, marineconservationconsortiumCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     BFLOG("giving out challenge")
                     l_1_3:BFS_ADDSCENARIO("scenario/goals/challenge/marineconservationconsortium.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(marineconservationconsortiumCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalMarineConservationConsortium = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(marineconservationconsortiumCHALLENGE_NAME)
      end
      logDebugChallengeInfo(marineconservationconsortiumCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(marineconservationconsortiumCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(marineconservationconsortiumCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(marineconservationconsortiumCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("Challengetext:CHMarineConservationConsortium")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if l_2_arg0.oldtable == nil then
         l_2_arg0.oldtable = {}
         do
            local l_2_1 = getMarineEntityList()
            for l_2_2 = 1, table.getn(l_2_1) do
               local l_2_5 = resolveTable(l_2_1[l_2_2].value)
               if l_2_5 and isChild(l_2_5) then
                  BFLOG("adding child to oldtable")
                  local l_2_6 = l_2_arg0.oldtable
                  local l_2_7 = table.getn(l_2_arg0.oldtable) + 1
                  l_2_6[l_2_7] = l_2_1[l_2_2]
               end
            end
            l_2_arg0.breedcount = 0
            -- Tried to add an 'end' here but it's incorrect
         end
         local l_2_1, l_2_1 = getMarineEntityList()
         l_2_1 = l_2_arg0.newChildTable
         if l_2_1 == nil then
            l_2_1 = {}
            l_2_arg0.newChildTable = l_2_1
         end
         l_2_1 = BFLOG
         l_2_1("num of marine anim: " .. table.getn(l_2_1))
         l_2_1 = 1
         for l_2_2 = l_2_1, table.getn(l_2_1) do
            l_2_1 = l_2_1 - 1
            --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

getUniqueSpeciesList = function(l_3_arg0)
   if l_3_arg0 == nil then
      return nil
   end
   local l_3_1 = {}
   local l_3_2 = {}
   local l_3_3 = table.getn(l_3_arg0)
   BFLOG("Number of animals: " .. l_3_3)
   local l_3_4 = 1
   for l_3_5 = 1, l_3_3 do
      local l_3_8 = resolveTable(l_3_arg0[l_3_5].value)
      if l_3_8 ~= nil then
         local l_3_9 = l_3_8:BFG_GET_BINDER_TYPE()
         l_3_9 = getSpeciesFromType(l_3_9)
         local l_3_10 = table.getn(l_3_1)
         local l_3_11 = false
         for l_3_12 = 1, l_3_10 do
            if l_3_9 == l_3_1[l_3_12] then
               l_3_11 = true
            end
         end
         if l_3_11 == false then
            l_3_1[l_3_10 + 1] = l_3_9
            BFLOG("table count: " .. l_3_4 - 1)
            l_3_2[l_3_4] = l_3_arg0[l_3_5]
            l_3_4 = l_3_4 + 1
         end
      end
   end
   return l_3_2
end

completeMarineConservationConsortium = function(l_4_arg0)
   giveCash(CHALLENGE_REWARD)
   showchallengewin("Challengetext:CHMarineConservationConsortiumSuccess")
   resetchallengeoverandcomplete(marineconservationconsortiumCHALLENGE_NAME)
   incrementmarineanimalchallenges()
end

failMarineConservationConsortium = function(l_5_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHMarineConservationConsortiumFailure")
   end
   resetchallengeover(marineconservationconsortiumCHALLENGE_NAME)
   declinenotfail = nil
end


