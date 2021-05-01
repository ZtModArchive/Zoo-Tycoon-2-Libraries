include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/token.lua")
DINOCS1_SCENARIO_ANIMAL = "Dodo"
DINOCS1_YOUNG_SCENARIO_ANIMAL = "Dodo_Young"
DINOCS1_REWARD1 = 5000
DINOCS1_REWARD2 = 5000
DINOCS1_REWARD3 = 5000
DINOCS1_REWARD4 = 5000
DINOCS1_REWARD5 = 10000
DINOCS1_OPTIONAL_REWARD1 = 10000
DINOCS1_CAVEMAN_TYPE = "Guest_Adult_M_Caveman"
DINOCS1_FAME_REWARD = 1.875
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalAcquire3Species = function()
   BFLOG(SYSTRACE, "**************** eval 3 species ****************")
   local l_2_0 = findType("animal")
   local l_2_1 = getUniqueSpecies(l_2_0)
   local l_2_2 = 0
   for l_2_3 = 1, table.getn(l_2_0) do
      local l_2_6 = resolveTable(l_2_0[l_2_3].value)
      if isCratedEntity(l_2_6) == false and basicNeedsMeetThreshold(l_2_6, 60) then
         l_2_2 = l_2_2 + 1
      end
   end
   if l_2_2 >= 3 and table.getn(l_2_1) >= 3 then
      return 1
   end
   return 0
end

completeAcquire3Species = function()
   BFLOG(SYSTRACE, "**************** complete 3 species ****************")
   giveCash(15000)
   showRule("Have8Species")
   showRule("Have4Biomes")
   setglobalvar("DINOCS1_GOAL1_DONE", "true")
   completeshowoverview()
   return 1
end

evalAcquire8Species = function()
   BFLOG(SYSTRACE, "**************** eval 6 species ****************")
   local l_4_0 = findType("animal")
   local l_4_1 = getUniqueSpecies(l_4_0)
   local l_4_2 = 0
   for l_4_3 = 1, table.getn(l_4_0) do
      local l_4_6 = resolveTable(l_4_0[l_4_3].value)
      if isCratedEntity(l_4_6) == false and basicNeedsMeetThreshold(l_4_6, 60) then
         l_4_2 = l_4_2 + 1
      end
   end
   if l_4_2 >= 6 and table.getn(l_4_1) >= 6 then
      return 1
   end
   return 0
end

completeAcquire8Species = function()
   BFLOG(SYSTRACE, "**************** complete 6 species ****************")
   giveCash(25000)
   showRule("Have10ExtinctSpecies")
   setglobalvar("DINOCS1_GOAL2_DONE", "true")
   local l_5_0 = getglobalvar("DINOCS1_OPTGOAL1_DONE")
   if l_5_0 ~= nil and l_5_0 == "true" then
      showRule("Have8Biomes")
   end
   completeshowoverview()
   return 1
end

evalAcquire10ExtinctSpecies = function()
   BFLOG(SYSTRACE, "**************** eval 8 extinct species ****************")
   local l_6_0 = findType("animal")
   local l_6_1 = getExtinctSpeciesList()
   local l_6_2 = 0
   for l_6_3 = 1, table.getn(l_6_0) do
      local l_6_6 = resolveTable(l_6_0[l_6_3].value)
      if isExtinctAnimal(l_6_6) == true and isCratedEntity(l_6_6) == false and basicNeedsMeetThreshold(l_6_6, 70) then
         l_6_2 = l_6_2 + 1
      end
   end
   if l_6_2 >= 8 and table.getn(l_6_1) >= 8 then
      return 1
   end
   return 0
end

completeAcquire10ExtinctSpecies = function()
   BFLOG(SYSTRACE, "**************** complete 10 extinct species ****************")
   giveCash(25000)
   showRule("Have25Species")
   completeshowoverview()
   return 1
end

evalAcquire25Species = function()
   BFLOG(SYSTRACE, "**************** eval 15 species ****************")
   local l_8_0 = getExtinctSpeciesList()
   local l_8_1 = table.getn(l_8_0)
   local l_8_2 = findType("animal")
   local l_8_3 = getUniqueSpecies(l_8_2)
   local l_8_4 = true
   local l_8_5 = table.getn(l_8_3)
   if l_8_4 and l_8_1 >= 8 and l_8_5 >= 15 and l_8_5 - l_8_1 >= 5 then
      return 1
   end
   return 0
end

completeAcquire25Species = function()
   BFLOG(SYSTRACE, "**************** complete scenario ****************")
   setuservar("cp2scen4", "completed")
   local l_9_0 = getuservar("cp2scen6")
   if l_9_0 ~= "completed" then
      setuservar("cp2scen6", "unlocked")
   end
   giveCash(50000)
   showscenariowin("DinoCampaign:HarmonyFinishFinalGoal", "cp2scen6")
   return 1
end

eval4Biomes = function()
   local l_10_0 = getglobalvar("DINOCS1_GOAL1_DONE")
   if l_10_0 ~= nil and l_10_0 == "true" then
      BFLOG(SYSTRACE, "********** eval 4 biomes **********")
      if numBiomesRepresented() >= 4 then
         return 1
      end
   end
   return 0
end

complete4Biomes = function()
   BFLOG(SYSTRACE, "**************** complete 4 biomes ****************")
   setglobalvar("DINOCS1_OPTGOAL1_DONE", "true")
   local l_11_0 = getglobalvar("DINOCS1_GOAL2_DONE")
   if l_11_0 ~= nil and l_11_0 == "true" then
      showRule("Have8Biomes")
   end
   giveCash(10000)
   completeshowoverview()
   return 1
end

eval8Biomes = function()
   local l_12_0 = getglobalvar("DINOCS1_GOAL2_DONE")
   local l_12_1 = getglobalvar("DINOCS1_OPTGOAL1_DONE")
   if l_12_0 ~= nil and l_12_1 ~= nil and l_12_0 == "true" and l_12_1 == "true" then
      BFLOG(SYSTRACE, "**************** eval 8 biomes ****************")
      if numBiomesRepresented() >= 8 then
         return 1
      end
   end
   return 0
end

complete8Biomes = function()
   BFLOG(SYSTRACE, "**************** complete 8 biomes ****************")
   giveCash(25000)
   completeshowoverview()
   return 1
end

numBiomesRepresented = function()
   local l_14_0 = getBiomes()
   local l_14_1 = {}
   for l_14_2 = 1, table.getn(l_14_0) do
      local l_14_5 = l_14_0[l_14_2].value
      BFLOG("***************************** test Biome =" .. l_14_5)
      local l_14_6 = getAnimalsFromLocation(l_14_5, true)
      if l_14_6 == nil then
         BFLOG("animal table nil")
         return 0
      end
      BFLOG("Size of animal table: " .. table.getn(l_14_6))
      for l_14_7 = 1, table.getn(l_14_6) do
         local l_14_10 = resolveTable(l_14_6[l_14_7].value)
         if l_14_10 then
            if isEntityOnBiome(l_14_10, l_14_5) then
               BFLOG("Animal is in biome")
               local l_14_11 = false
               for l_14_12 = 1, table.getn(l_14_1) do
                  if l_14_1[l_14_12] == l_14_5 then
                     l_14_11 = true
                  end
               end
               if l_14_11 == false then
                  l_14_1[table.getn(l_14_1) + 1] = l_14_5
               else
                  BFLOG("Animal is not in biome")
               end
            else
               BFLOG("single is nil")
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
         end
      end
      return table.getn(l_14_1)
end


