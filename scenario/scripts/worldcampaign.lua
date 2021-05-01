include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
evalamericananimals = function()
   BFLOG(SYSTRACE, "evalamericananimals")
   local l_1_0 = getAnimalsFromLocation("northamerica", false)
   local l_1_1 = getUniqueSpecies(l_1_0)
   local l_1_2 = howManyInTableExist(l_1_1)
   local l_1_3 = getAnimalsFromLocation("arctic", false)
   local l_1_4 = getUniqueSpecies(l_1_3)
   local l_1_5 = howManyInTableExist(l_1_4)
   local l_1_6 = getAnimalsFromLocation("florida", false)
   local l_1_7 = getUniqueSpecies(l_1_6)
   local l_1_8 = howManyInTableExist(l_1_7)
   l_1_2 = l_1_2 + l_1_5 + l_1_8
   BFLOG(SYSTRACE, "howmanyna = " .. l_1_2)
   if l_1_2 >= 3 then
      local l_1_9 = howManyAnimalsInZoo()
      BFLOG(SYSTRACE, "howmanyna: " .. l_1_2 .. "   totalanimals: " .. l_1_9 .. ".")
      BFLOG(SYSTRACE, "diff: " .. (l_1_2) / l_1_9 .. ".")
      if (l_1_2) / l_1_9 < 0.3 then
         return 1
      end
   end
   return 0
end

completeamericananimals = function()
end

completeworldcampaignscen1 = function()
   BFLOG(SYSTRACE, "completeworldcampaignscen1")
   local l_3_0 = getuservar("worldcampaignscenario2")
   if l_3_0 ~= "completed" then
      setuservar("worldcampaignscenario2", "unlocked")
   end
   setuservar("worldcampaignscenario1", "completed")
   showscenariowin("TheWorld:AmericanAnimalsSuccessoverview", "worldcampaignscenario2")
end

evalasiananimals = function()
   local l_4_0 = getAnimalsFromLocation("china", true)
   local l_4_1 = getUniqueSpecies(l_4_0)
   local l_4_2 = howManyInTableExist(l_4_1)
   local l_4_3 = getAnimalsFromLocation("asia", true)
   local l_4_4 = getUniqueSpecies(l_4_3)
   local l_4_5 = howManyInTableExist(l_4_4) + l_4_2
   BFLOG(SYSTRACE, "Asia animals: " .. l_4_5 .. ".")
   if l_4_5 >= 4 then
      return 1
   end
   if getCurrentMonth() >= 12 then
      return -1
   end
   return 0
end

completeasiananimals = function()
end

completeworldcampaignscen2 = function()
   BFLOG(SYSTRACE, "completeworldcampaignscen2")
   setuservar("worldcampaignscenario2", "completed")
   setuservar("globelock", "true")
   local l_6_0 = getlocidfromspecies("Statue_Globe_df")
   local l_6_1 = getLocID("itemunlock:newitemgeneral") .. l_6_0
   genericokpaneltext(nil, l_6_1)
   showscenariowin("TheWorld:AsianAnimalsSuccessoverview", nil)
end

failworldcampaignscen2 = function()
   showscenariofail("TheWorld:AsianAnimalsFailureoverview", "worldcampaignscenario2")
end

setinitialzoostatescen3 = function(l_8_arg0)
   completeshowoverview()
   local l_8_1 = queryObject("BFScenarioMgr")
   if l_8_1 then
      l_8_1:UI_DISABLE("put up for adoption")
   end
   return 1
end

evalafricananimalsoverall = function(l_9_arg0)
   BFLOG(SYSTRACE, "evalafricananimalsoverall")
   if l_9_arg0.grantsgiven == nil then
      l_9_arg0.grantsgiven = 0
   end
   if l_9_arg0.animalcount == nil then
      l_9_arg0.animalcount = 0
   end
   local l_9_1 = getAnimalsFromLocation("africa", true)
   local l_9_2 = getUniqueSpecies(l_9_1)
   local l_9_3 = 0
   local l_9_4 = 0
   l_9_3, l_9_4 = howManyInTableExist(l_9_2)
   local l_9_5 = getAnimalsFromLocation("madagascar", true)
   local l_9_6 = getUniqueSpecies(l_9_5)
   local l_9_7 = 0
   local l_9_8 = 0
   l_9_7, l_9_8 = howManyInTableExist(l_9_6)
   local l_9_9 = l_9_3 + l_9_7
   local l_9_10 = l_9_4 + l_9_8
   BFLOG("african species: " .. l_9_9)
   if l_9_arg0.animalcount < l_9_9 then
      l_9_arg0.animalcount = l_9_9
      if l_9_arg0.grantsgiven < 12 then
         BFLOG(SYSTRACE, "Showing rule: animal" .. l_9_arg0.animalcount)
         showRule("animal" .. l_9_arg0.animalcount)
         showprimarygoals()
         giveCash(1500)
         l_9_arg0.grantsgiven = l_9_arg0.grantsgiven + 1
      end
   end
   if l_9_9 >= 12 then
      local l_9_11 = countType("animal")
      BFLOG(SYSTRACE, "---------Total Number of Animals: " .. l_9_11)
      BFLOG(SYSTRACE, "-------------------------NumAfricanAnimals: " .. l_9_10)
      if l_9_11 <= l_9_10 then
         return 1
      else
         showRule("getridofothers")
      end
   end
   return 0
end

completeafricananimalsoverall = function()
end

completeworldcampaignscen3 = function()
   BFLOG(SYSTRACE, "completeworldcampaignscen3")
   local l_11_0 = getuservar("worldcampaignscenario1")
   if l_11_0 ~= "completed" then
      setuservar("worldcampaignscenario1", "unlocked")
   end
   setuservar("worldcampaignscenario3", "completed")
   showscenariowin("TheWorld:AfricanAnimalsSuccessoverview", "worldcampaignscenario1")
end

evalhugebiome = function()
end

completeworldcampaignscen4 = function()
end

failworldcampaignscen4 = function()
end

BIOME_THRESHOLD = 65
setinitialzoostate = function(l_15_arg0)
   BFLOG(SYSTRACE, "*********I'm here so show overview panel!********")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalalpine = function(l_16_arg0)
   BFLOG(SYSTRACE, "evalalpine")
   local l_16_1 = getAnimalsFromBiome("alpine")
   local l_16_2 = table.getn(l_16_1)
   for l_16_3 = 1, l_16_2 do
      local l_16_6 = resolveTable(l_16_1[l_16_3].value)
      if doesentityhaveenoughbiome(l_16_6, "alpine", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completealpine = function()
   if showalpine == nil then
      showprimarygoals()
      showalpine = 1
   end
end

evalborealforest = function(l_18_arg0)
   BFLOG(SYSTRACE, "evalborealforest")
   local l_18_1 = getAnimalsFromBiome("borealforest")
   local l_18_2 = table.getn(l_18_1)
   for l_18_3 = 1, l_18_2 do
      local l_18_6 = resolveTable(l_18_1[l_18_3].value)
      if doesentityhaveenoughbiome(l_18_6, "borealforest", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completeborealforest = function()
   if showboreal == nil then
      showprimarygoals()
      showboreal = 1
   end
end

evaldesert = function(l_20_arg0)
   BFLOG(SYSTRACE, "evaldesert")
   local l_20_1 = getAnimalsFromBiome("desert")
   local l_20_2 = table.getn(l_20_1)
   for l_20_3 = 1, l_20_2 do
      local l_20_6 = resolveTable(l_20_1[l_20_3].value)
      if doesentityhaveenoughbiome(l_20_6, "desert", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completedesert = function()
   if showdesert == nil then
      showprimarygoals()
      showdesert = 1
   end
end

evalsavannah = function(l_22_arg0)
   BFLOG(SYSTRACE, "evalsavannah")
   local l_22_1 = getAnimalsFromBiome("savannah")
   local l_22_2 = table.getn(l_22_1)
   for l_22_3 = 1, l_22_2 do
      local l_22_6 = resolveTable(l_22_1[l_22_3].value)
      if doesentityhaveenoughbiome(l_22_6, "savannah", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completesavannah = function()
   if showsavannah == nil then
      showprimarygoals()
      showsavannah = 1
   end
end

evalscrub = function(l_24_arg0)
   BFLOG(SYSTRACE, "evalscrub")
   local l_24_1 = getAnimalsFromBiome("scrub")
   local l_24_2 = table.getn(l_24_1)
   for l_24_3 = 1, l_24_2 do
      local l_24_6 = resolveTable(l_24_1[l_24_3].value)
      if doesentityhaveenoughbiome(l_24_6, "scrub", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completescrub = function()
   if showscrub == nil then
      showprimarygoals()
      showscrub = 1
   end
end

evaltemperateforest = function(l_26_arg0)
   BFLOG(SYSTRACE, "evaltemperateforest")
   local l_26_1 = getAnimalsFromBiome("temperateforest")
   local l_26_2 = table.getn(l_26_1)
   for l_26_3 = 1, l_26_2 do
      local l_26_6 = resolveTable(l_26_1[l_26_3].value)
      if doesentityhaveenoughbiome(l_26_6, "temperateforest", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completetemperateforest = function()
   if showtemperate == nil then
      showprimarygoals()
      showtemperate = 1
   end
end

evaltropicalrainforest = function(l_28_arg0)
   BFLOG(SYSTRACE, "evaltropicalrainforest")
   local l_28_1 = getAnimalsFromBiome("tropicalrainforest")
   local l_28_2 = table.getn(l_28_1)
   for l_28_3 = 1, l_28_2 do
      local l_28_6 = resolveTable(l_28_1[l_28_3].value)
      if doesentityhaveenoughbiome(l_28_6, "tropicalrainforest", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completetropicalrainforest = function()
   if showtropic == nil then
      showprimarygoals()
      showtropic = 1
   end
end

evaltundra = function(l_30_arg0)
   BFLOG(SYSTRACE, "evaltundra")
   local l_30_1 = getAnimalsFromBiome("tundra")
   local l_30_2 = table.getn(l_30_1)
   for l_30_3 = 1, l_30_2 do
      local l_30_6 = resolveTable(l_30_1[l_30_3].value)
      if doesentityhaveenoughbiome(l_30_6, "tundra", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completetundra = function()
   if showtundra == nil then
      showprimarygoals()
      showtundra = 1
   end
end

evalwetlands = function(l_32_arg0)
   BFLOG(SYSTRACE, "evalwetlands")
   local l_32_1 = getAnimalsFromBiome("wetlands")
   local l_32_2 = table.getn(l_32_1)
   for l_32_3 = 1, l_32_2 do
      local l_32_6 = resolveTable(l_32_1[l_32_3].value)
      if doesentityhaveenoughbiome(l_32_6, "wetlands", BIOME_THRESHOLD) then
         return 1
      end
   end
   return 0
end

completewetlands = function()
   if showwetland == nil then
      showprimarygoals()
      showwetland = 1
   end
end

completeworldcampaignscen5 = function()
   BFLOG(SYSTRACE, "completeworldcampaignscen5")
   local l_34_0 = getuservar("worldcampaignscenario3")
   if l_34_0 ~= "completed" then
      setuservar("worldcampaignscenario3", "unlocked")
   end
   setuservar("worldcampaignscenario5", "completed")
   showscenariowin("TheWorld:TheWorldsBiomesSuccessoverview", "worldcampaignscenario3")
end


