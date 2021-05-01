include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
SCENARIO_REWARD = 15000
BIOME_TYPE1 = "pelagic"
BIOME_TYPE2 = "coastal"
BIOME_TYPE3 = "reef"
BIOME_TYPE4 = "tundra"
BIOME_TYPE5 = "benthic"
PIRATE_TYPE = "Guest_Adult_M_Pirate"
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

evalOverallGoal = function(l_2_arg0)
   BFLOG("Eval Overall")
   if l_2_arg0.pelagicDone == nil and testMarineAnimalBiome(BIOME_TYPE1) == 1 then
      l_2_arg0.pelagicDone = 1
      giveCash(SCENARIO_REWARD)
      setRuleState("Pelagic", "success")
      showprimarygoals()
   end
   if l_2_arg0.coastalDone == nil and testMarineAnimalBiome(BIOME_TYPE2) == 1 then
      l_2_arg0.coastalDone = 1
      giveCash(SCENARIO_REWARD)
      setRuleState("Coastal", "success")
      showprimarygoals()
   end
   if l_2_arg0.reefDone == nil and testMarineAnimalBiome(BIOME_TYPE3) == 1 then
      l_2_arg0.reefDone = 1
      giveCash(SCENARIO_REWARD)
      setRuleState("Reef", "success")
      showprimarygoals()
   end
   if l_2_arg0.tundraDone == nil and testMarineAnimalBiome(BIOME_TYPE4) == 1 then
      l_2_arg0.tundraDone = 1
      giveCash(SCENARIO_REWARD)
      setRuleState("Tundra", "success")
      showprimarygoals()
   end
   if l_2_arg0.benthicDone == nil and testMarineAnimalBiome(BIOME_TYPE5) == 1 then
      l_2_arg0.benthicDone = 1
      giveCash(SCENARIO_REWARD)
      setRuleState("Benthic", "success")
      showprimarygoals()
   end
   if l_2_arg0.pelagicDone ~= nil and l_2_arg0.coastalDone ~= nil and l_2_arg0.reefDone ~= nil and l_2_arg0.tundraDone ~= nil and l_2_arg0.benthicDone ~= nil then
      return 1
   end
   if l_2_arg0.viewGoalGiven == nil and checkTimeLimit(l_2_arg0, 0, 9) == -1 then
      l_2_arg0.viewGoalGiven = 1
      setRuleState("OptionalViewGoals", "neutral")
      showRule("OptionalViewGoals")
      completeshowoverview()
      return 0
   end
   if l_2_arg0.viewGoalGiven == 1 and countType(PIRATE_TYPE) == 0 and l_2_arg0.showGoalGiven == nil and checkTimeLimit(l_2_arg0, 2, 14) == -1 then
      l_2_arg0.showGoalGiven = 1
      setRuleState("OptionalShowGoals", "neutral")
      showRule("OptionalShowGoals")
      completeshowoverview()
   end
   return 0
end

completeOverallGoal = function()
   BFLOG(SYSTRACE, "WIN")
   if isVisibleByName("goals layout") then
      showUI("goals layout", false)
      showUI("Grant Layout", false)
   end
   local l_3_0 = getuservar("MarineAnimalsCampaignscenario2")
   if l_3_0 ~= "completed" then
      setuservar("MarineAnimalsCampaignscenario4", "unlocked")
   end
   setuservar("MarineAnimalsCampaignscenario2", "completed")
   showscenariowin("MarineAnimals:OceansBiomesSuccess", "MarineAnimalsCampaignscenario4")
end

testMarineAnimalBiome = function(l_4_arg0)
   BFLOG("testMarineAnimalBiome")
   local l_4_1 = getAnimalsFromLocation(l_4_arg0, true)
   if l_4_1 == nil then
      BFLOG("marine table nil")
      return 0
   end
   BFLOG("Size of marine table: " .. table.getn(l_4_1))
   for l_4_2 = 1, table.getn(l_4_1) do
      local l_4_5 = resolveTable(l_4_1[l_4_2].value)
      if l_4_5 then
         if isMarineAnimal(l_4_5) then
            BFLOG("Found Marine animal from biome " .. l_4_arg0)
            if isEntityOnBiome(l_4_5, l_4_arg0) and needMet(l_4_5, "environment") then
               BFLOG("Animal's enviroment need is met")
               return 1
            else
               BFLOG("Animal's enviroment need is NOT met")
            end
         else
            BFLOG("not a marine animal")
         end
      else
         BFLOG("single is nil")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return 0
end

evalViewAnimal = function(l_5_arg0)
   BFLOG("Eval View Animals")
   if l_5_arg0.pirateGiven == nil then
      local l_5_1 = getZooEntrancePos()
      placeObject(PIRATE_TYPE, l_5_1.x, l_5_1.y, l_5_1.z)
      local l_5_2 = findType(PIRATE_TYPE)
      BFLOG("Number of Pirates in zoo " .. table.getn(l_5_2))
      if table.getn(l_5_2) ~= 1 then
         BFLOG("Found more than one pirate dude, possible error")
      end
      local l_5_3 = resolveTable(l_5_2[1].value)
      if l_5_3 then
         BFLOG("Setting pirate guy name")
         local l_5_4 = getLocID("MarineAnimals:OceansBiomesPirateName")
         l_5_3:BFG_SET_ATTR_STRING("s_name", l_5_4)
         local l_5_5 = getAllSpeciesList()
         favAnimal = l_5_5[math.random(table.getn(l_5_5))]
         l_5_3:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
         displayZooMessageWithZoom("MarineAnimals:OceansBiomesPirateViewEntered", 1, 30, l_5_3)
      end
      l_5_arg0.pirateGiven = true
   end
   local l_5_1 = 0
   local l_5_2 = findType(PIRATE_TYPE)
   for l_5_3 = 1, table.getn(l_5_2) do
      local l_5_6 = resolveTable(l_5_2[l_5_3].value)
      if l_5_6 then
         local l_5_7 = l_5_6:sendMessage("ZTAI_GET_SEEN")
         local l_5_8 = 0
         for l_5_9 = 1, table.getn(l_5_7) do
            local l_5_12 = l_5_7[l_5_9].value
            if isMarineAnimalByType(l_5_12) == true then
               l_5_8 = l_5_8 + 1
            end
         end
         BFLOG("Size of seen table: " .. table.getn(l_5_7))
         BFLOG("Size of pass table: " .. l_5_8)
         l_5_1 = l_5_8
      end
   end
   BFLOG("Number of Marine animals seen " .. l_5_1)
   if l_5_arg0.SeenOneAnimal == nil and l_5_1 == 1 then
      l_5_arg0.SeenOneAnimal = 1
      showRule("OneAnimalSeen")
      showprimarygoals()
   end
   if l_5_arg0.SeenTwoAnimal == nil and l_5_1 == 2 then
      l_5_arg0.SeenTwoAnimal = 1
      showRule("TwoAnimalsSeen")
      showprimarygoals()
   end
   if l_5_1 >= 3 then
      hideRule("OneAnimalSeen")
      hideRule("TwoAnimalsSeen")
      return 1
   end
   if countType(PIRATE_TYPE) == 0 then
      hideRule("OneAnimalSeen")
      hideRule("TwoAnimalsSeen")
      return -1
   end
end

completeViewAnimal = function()
   local l_6_0 = {"Jaguar_Adult_M", "Jaguar_Adult_M", "Jaguar_Adult_F", "Jaguar_Adult_F", "Kangaroo_Adult_M", "Kangaroo_Adult_M", "Kangaroo_Adult_F", "Kangaroo_Adult_F", "Okapi_Adult_M", "Okapi_Adult_F"}
   local l_6_1 = math.random(10)
   BFLOG("Placing animal of type: " .. l_6_0[l_6_1])
   placeCratedObjectAtGate(l_6_0[l_6_1])
   completeshowoverview()
end

failViewAnimal = function()
   BFLOG("Failed pirate view animals")
   setRuleState("OptionalViewGoals", "failure")
   completeshowoverview()
end

setMaxShow = function()
   local l_8_0 = findType(PIRATE_TYPE)
   if l_8_0 ~= nil then
      local l_8_1 = resolveTable(l_8_0[1].value)
      if l_8_1 then
         l_8_1:BFG_SET_ATTR_FLOAT("f_MaxShowSeen", 2)
      end
   end
end

evalSeeShow = function(l_9_arg0)
   BFLOG("Eval View Shows")
   if l_9_arg0.pirateGiven == nil then
      local l_9_1 = getZooEntrancePos()
      placeObject(PIRATE_TYPE, l_9_1.x, l_9_1.y, l_9_1.z)
      local l_9_2 = findType(PIRATE_TYPE)
      BFLOG("Number of Pirates in zoo " .. table.getn(l_9_2))
      if table.getn(l_9_2) ~= 1 then
         BFLOG("Found more than one pirate dude, possible error")
      end
      local l_9_3 = resolveTable(l_9_2[1].value)
      if l_9_3 then
         BFLOG("Setting pirate guy name")
         local l_9_4 = getLocID("MarineAnimals:OceansBiomesPirateName")
         l_9_3:BFG_SET_ATTR_STRING("s_name", l_9_4)
         local l_9_5 = getAllSpeciesList()
         favAnimal = l_9_5[math.random(table.getn(l_9_5))]
         l_9_3:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
         displayZooMessageWithZoom("MarineAnimals:OceansBiomesPirateShowEntered", 1, 30, l_9_3)
      end
      l_9_arg0.maxShow = 0
      l_9_arg0.pirateGiven = true
   end
   local l_9_1 = findType(PIRATE_TYPE)
   if l_9_1 ~= nil and table.getn(l_9_1) > 0 then
      BFLOG("Size of pirateTable: " .. table.getn(l_9_1))
      local l_9_2 = resolveTable(l_9_1[1].value)
      if l_9_2 then
         BFLOG("Found single")
         local l_9_3 = getMaxShowSeen(l_9_2)
         BFLOG("tempMax = " .. l_9_3)
         BFLOG("comp.maxShow = " .. l_9_arg0.maxShow)
         if l_9_arg0.maxShow < l_9_3 then
            l_9_arg0.maxShow = l_9_3
            setglobalvar("piratemaxshowseen", tostring(l_9_3))
            BFLOG("Max Show Seen " .. l_9_arg0.maxShow)
         else
            l_9_arg0.pirateGiven = nil
            return 1
         end
         -- Tried to add an 'end' here but it's incorrect
      end
      return 0
end

completeSeeShow = function(l_10_arg0)
   maxShow = tonumber(getglobalvar("piratemaxshowseen"))
   BFLOG("Max Show Seen " .. maxShow)
   if maxShow >= 2 then
      BFLOG("Completed Show")
      giveCash(10000 * maxShow)
   else
      BFLOG("Failed pirate view shows")
      setRuleState("OptionalShowGoals", "failure")
   end
   completeshowoverview()
end


