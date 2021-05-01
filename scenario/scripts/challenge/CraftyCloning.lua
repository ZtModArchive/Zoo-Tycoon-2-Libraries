include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/fossil.lua")
validate = function()
   if isChalDeclinedForever("craftycloning") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "craftycloning")
   local l_1_0 = getglobalvar("craftycloning_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("CloningCenter") >= 1 and getNumAnimalsUnlockedAtResearchLab() >= 1 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, "craftycloning")
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/craftycloning.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo("craftycloning", "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalCraftyCloning = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE("craftycloning")
      end
      logDebugChallengeInfo("craftycloning", "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showprimarygoals()
      l_2_arg0.clonedSuperSpecies = {}
      local l_2_2 = queryObject("ZTStatus")
      if l_2_2 then
         l_2_arg0.numSuperClones = l_2_2:ZT_NUM_SUPER_CLONES()
         local l_2_3 = getAllExtinctSpeciesList()
         for l_2_4 = 1, table.getn(l_2_3) do
            local l_2_7 = l_2_3[l_2_4]
            local l_2_8 = l_2_2:ZT_NUM_SUPER_SPECIES_INSTANCES(l_2_7)
            BFLOG("Found " .. l_2_8 .. " super clones for " .. l_2_7)
            local l_2_9 = l_2_arg0.clonedSuperSpecies
            local l_2_10
            l_2_9[l_2_4], l_2_10 = l_2_10, {name = l_2_7, num = l_2_8}
         end
      elseif challenge == "decline" then
         if getDeclineForever() == true then
            setglobalvar("craftycloning" .. "_decline_forever", "true")
            logDebugChallengeInfo("craftycloning", "declinedforever")
            setDeclineForever(false)
         elseif getChallengeDebugMode() == true then
            logDebugChallengeInfo("craftycloning", "declined")
         end
         declinenotfail = 1
         return -1
      end
      -- Tried to add an 'end' here but it's incorrect
      if l_2_arg0.accept == nil and challenge == nil then
         showchallengepanel("Challengetext:CHCraftyCloning")
         setglobalvar("challenge", "waiting")
      end
      if l_2_arg0.accept == 1 then
         local l_2_1, l_2_1 = 0
         l_2_1 = queryObject
         l_2_1 = l_2_1("ZTStatus")
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

completeCraftyCloning = function(l_3_arg0)
   giveGuest(5)
   giveCash(7500)
   showchallengewin("Challengetext:CHCraftyCloningSuccess")
   resetchallengeoverandcomplete("craftycloning")
   incrementglobalchallenges()
end

failCraftyCloning = function(l_4_arg0)
   if declinenotfail == nil then
      showchallengefail("Challengetext:CHCraftyCloningFailure")
   end
   resetchallengeover("craftycloning")
   declinenotfail = nil
end


