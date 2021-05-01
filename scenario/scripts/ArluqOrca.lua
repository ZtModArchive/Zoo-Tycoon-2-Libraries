include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
DONATION_GOAL = 5000
RELEASE_DONATION_GOAL = 20000
OBJECT_GOAL2 = "PursuitBall"
OBJECT_GOAL3 = "BubbleEmitter"
CASH_REWARD = 25000
ARLUQ = "WhaleOrca_Adult_F"
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

getDonationsMarineSpecies = function()
   local l_2_0 = getAllMarineSpeciesList()
   local l_2_1 = 0
   for l_2_2 = 1, table.getn(l_2_0) do
      l_2_1 = l_2_1 + getDonations(l_2_0[l_2_2])
   end
   return l_2_1
end

evalDonations = function(l_3_arg0)
   BFLOG("Eval Donations")
   local l_3_1 = getDonationsMarineSpecies()
   BFLOG("Current Donations: " .. l_3_1)
   BFLOG("Needed Donations: " .. DONATION_GOAL)
   if DONATION_GOAL <= l_3_1 then
      return 1
   end
   return 0
end

completeDonations = function(l_4_arg0)
   BFLOG("Complete Donations")
   l_4_arg0.ArluqId = placeCratedWaterObjectAtGate(ARLUQ)
   setglobalvar("ArluqID", tostring(l_4_arg0.ArluqId))
   local l_4_1 = findEntityByID(l_4_arg0.ArluqId)
   BFLOG("Setting name")
   local l_4_2 = getLocID("MarineAnimals:OrcaAnimalName")
   l_4_1:BFG_SET_ATTR_STRING("s_name", l_4_2)
   BFLOG("Set Arluq's needs")
   setNeed(l_4_1, "hunger", 70)
   setNeed(l_4_1, "enviroment", 50)
   setNeed(l_4_1, "rest", 50)
   setNeed(l_4_1, "privacy", 50)
   setNeed(l_4_1, "hygiene", 60)
   setNeed(l_4_1, "social", 40)
   setNeed(l_4_1, "exercise", 80)
   setNeed(l_4_1, "stimulation", 70)
   l_4_1:BFG_SET_ATTR_BOOLEAN("b_showRelease", false)
   l_4_1:BFG_SET_ATTR_BOOLEAN("b_showAdopt", false)
   setRuleState("MeetBasicNeeds", "neutral")
   showRule("MeetBasicNeeds")
   completeshowoverview()
end

evalBasicNeeds = function()
   BFLOG(SYSTRACE, "Checking the basic needs")
   local l_5_0 = findArluq()
   if l_5_0 and not isCratedEntity(l_5_0) and basicNeedsMet(l_5_0) then
      return 1
      do break end
      BFLOG("Not out of crate yet")
      do break end
      BFLOG("Can't find Arluq")
      return -1
   end
end

completeBasicNeeds = function()
   giveCash(CASH_REWARD)
   setRuleState("2EnrichmentItems", "neutral")
   showRule("2EnrichmentItems")
   completeshowoverview()
end

evalLargeBall = function()
   local l_7_0 = findArluq()
   if l_7_0 == nil then
      BFLOG("Can't find Arluq")
      return -1
   end
   local l_7_1 = findType(OBJECT_GOAL2)
   for l_7_2 = 1, table.getn(l_7_1) do
      local l_7_5 = resolveTable(l_7_1[l_7_2].value)
      if l_7_5 and inSameHabitat(l_7_0, l_7_5) then
         return 1
      end
   end
   return 0
end

completeLargeBall = function()
   showprimarygoals()
   return 1
end

evalBubbleEmitter = function()
   local l_9_0 = findArluq()
   if l_9_0 == nil then
      BFLOG("Can't find Arluq")
      return -1
   end
   local l_9_1 = findType(OBJECT_GOAL3)
   for l_9_2 = 1, table.getn(l_9_1) do
      local l_9_5 = resolveTable(l_9_1[l_9_2].value)
      if l_9_5 and inSameHabitat(l_9_0, l_9_5) then
         return 1
      end
   end
   return 0
end

completeBubbleEmitter = function()
   showprimarygoals()
   return 1
end

evalStimulation = function()
   if needMet(findArluq(), "stimulation") then
      return 1
   end
   return 0
end

completeStimulation = function()
   showprimarygoals()
   return 1
end

complete2Enrichment = function()
   setRuleState("Branch", "neutral")
   showRule("Branch")
   completeshowoverview()
end

evalHappyArluq = function(l_14_arg0)
   BFLOG(SYSTRACE, "eval happy Arluq")
   local l_14_1 = findArluq()
   --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

completeHappyArluq = function()
   completeshowoverview()
end

findArluq = function()
   BFLOG("Looking for arluq")
   local l_16_0 = tonumber(getglobalvar("ArluqID"))
   if l_16_0 ~= nil then
      local l_16_1 = findType("WhaleOrca")
      BFLOG("animalTable size = " .. table.getn(l_16_1))
      for l_16_2 = 1, table.getn(l_16_1) do
         local l_16_5 = resolveTable(l_16_1[l_16_2].value)
         if l_16_5 ~= nil then
            local l_16_6 = getID(l_16_5)
            if l_16_6 == l_16_0 then
               return l_16_5
            else
               BFLOG("Found orca but not arluq")
            end
         else
            BFLOG("animal was nil")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
   else
      BFLOG("Global id is nil")
   end
   return nil
end

failOverall = function()
   showscenariofail("MarineAnimals:OrcaDeathFailure", "MarineAnimalsCampaignscenario4")
end

evalReleaseToWildDonations = function(l_18_arg0)
   BFLOG("Eval Release Donations Arluq")
   if l_18_arg0.GoalGiven == nil then
      l_18_arg0.previousDonations = getDonationsAllAnimals() + getDonations("Education") + getDonations("Show")
      l_18_arg0.GoalGiven = 1
   end
   local l_18_1 = getDonationsAllAnimals() + getDonations("Education") + getDonations("Show")
   BFLOG("Current Donations: " .. l_18_1)
   BFLOG("Needed Donations: " .. l_18_arg0.previousDonations + RELEASE_DONATION_GOAL)
   if l_18_arg0.PanelShown == nil and l_18_arg0.previousDonations + RELEASE_DONATION_GOAL <= l_18_1 then
      l_18_arg0.PanelShown = 1
      return 1
   end
   local l_18_2 = findArluq()
   if l_18_2 == nil then
      BFLOG("Can't find Arluq")
      return -1
   end
   return 0
end

completeReleaseToWildDonations = function()
   BFLOG("completeReleaseToWildDonations")
   local l_19_0 = findArluq()
   if l_19_0 then
      setNeed(l_19_0, "social", 20)
      l_19_0:BFG_SET_ATTR_BOOLEAN("b_showRelease", true)
   else
      BFLOG("Can't find Arluq")
   end
   setRuleState("ReleaseToWild", "neutral")
   showRule("ReleaseToWild")
   local l_19_1 = findArluq()
   if l_19_1 then
      local l_19_2 = getID(l_19_1)
      BFLOG("Setting Arluq ID = " .. l_19_2)
      setglobalvar("arluqID", tostring(l_19_2))
   else
      BFLOG("Can't find Arluq")
   end
   completeshowoverview()
end

evalReleaseToWild = function(l_20_arg0)
   BFLOG("Eval Release Arluq")
   BFLOG("Check Last Release ID")
   local l_20_1 = tonumber(getglobalvar("arluqID"))
   BFLOG("Arluq ID = " .. l_20_1)
   local l_20_2 = getLastAnimalReleasedID()
   if l_20_2 ~= nil and l_20_2 == l_20_1 then
      return 1
   end
   return 0
end

completeReleaseToWild = function()
   setuservar("whalehalllock", "true")
   setuservar("MarineAnimalsCampaignscenario4", "completed")
   showscenariowin("MarineAnimals:OrcaReleaseToWildSuccess", nil)
end

evalBreedArluq = function()
   BFLOG("Eval Breed Arluq")
   local l_22_0 = findArluq()
   if l_22_0 and entityHasRelative(l_22_0, "child") then
      return 1
      do break end
      BFLOG("Can't find Arluq")
      return -1
   end
   return 0
end

completeBreedArluq = function()
   setuservar("MarineAnimalsCampaignscenario4", "completed")
   showscenariowin("MarineAnimals:OrcaBreedSuccess", nil)
   setuservar("whalehalllock", "true")
end


