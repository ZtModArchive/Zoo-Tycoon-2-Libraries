include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/token.lua")
include("scenario/scripts/fossil.lua")
XTCS1_SCENARIO_ANIMAL = "Bluebuck"
XTCS1_YOUNG_SCENARIO_ANIMAL = "Bluebuck_Young"
XTCS1_REWARD1 = 5000
XTCS1_REWARD2 = 5000
XTCS1_REWARD3 = 4000
XTCS1_REWARD4 = 5000
XTCS1_REWARD5 = 10000
XTCS1_OPTIONAL_REWARD1 = 10000
XTCS1_CAVEMAN_TYPE = "Guest_Adult_M_Caveman"
XTCS1_FAME_REWARD = 1.875
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   completeshowoverview()
   showUI("goal panel", true)
   setglobalvar("CloningCenter", "true")
   return 1
end

evalAcquireBluebuck = function(l_2_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 1 ****************")
   local l_2_1 = findType(XTCS1_SCENARIO_ANIMAL)
   local l_2_2 = table.getn(l_2_1)
   if l_2_2 < 1 then
      return 0
   end
   for l_2_3 = 1, l_2_2 do
      local l_2_6 = resolveTable(l_2_1[l_2_3].value)
      if basicNeedsMetAlternate(l_2_6) then
         return 1
      end
   end
   return 0
end

completeAcquireBluebuck = function()
   setglobalvar("CloningCenter", "false")
   BFLOG(SYSTRACE, "**************** complete goal 1 ****************")
   giveCash(XTCS1_REWARD1)
   showRule("BuildLab")
   completeshowoverview()
end

evalBuildLab = function()
   BFLOG(SYSTRACE, "**************** eval Build lab ****************")
   if countType("CloningCenter") >= 1 then
      return 1
   end
   return 0
end

completeBuildLab = function()
   BFLOG(SYSTRACE, "**************** complete Build lab ****************")
   giveCash(XTCS1_REWARD3)
   setglobalvar("buildLabComplete", "true")
   showRule("CollectFossils")
   showRule("ExtinctFamousActor")
   completeshowoverview()
   return 1
end

evalCollectFossils = function()
   BFLOG(SYSTRACE, "**************** eval collect fossils ****************")
   local l_6_0 = getNumPuzzlesReady()
   BFLOG(SYSTRACE, "**************** num Puzzles ready = " .. l_6_0)
   if l_6_0 >= 1 then
      return 1
   end
   return 0
end

completeCollectFossils = function()
   BFLOG(SYSTRACE, "**************** complete collect fossils ****************")
   giveCash(5000)
   showRule("BuildFossil")
   showRule("ExtinctBreed3Species")
   completeshowoverview()
   return 1
end

evalBuildFossil = function()
   BFLOG(SYSTRACE, "**************** eval build fossil ****************")
   local l_8_0 = getNumPuzzlesComplete()
   BFLOG(SYSTRACE, "**************** num puzzles complete = " .. l_8_0)
   if l_8_0 >= 1 then
      return 1
   end
   return 0
end

completeBuildFossil = function()
   BFLOG(SYSTRACE, "**************** complete build fossil ****************")
   giveCash(10000)
   showRule("CreateSuperFossil")
   completeshowoverview()
   return 1
end

evalCreateSuperFossil = function()
   BFLOG(SYSTRACE, "**************** eval super create fossil ****************")
   if getNumAnimalsUnlockedAtResearchLab() >= 1 then
      local l_10_0 = getExtinctEntityList()
      local l_10_1 = table.getn(l_10_0)
      if l_10_1 < 1 then
         return 0
      end
      for l_10_2 = 1, l_10_1 do
         local l_10_5 = resolveTable(l_10_0[l_10_2].value)
         local l_10_6 = l_10_5:BFG_GET_ATTR_BOOLEAN("b_Super")
         if l_10_6 ~= nil and l_10_6 == true then
            return 1
         end
      end
   end
   return 0
end

completeCreateSuperFossil = function()
   BFLOG(SYSTRACE, "**************** complete super create fossil ****************")
   giveCash(15000)
   showRule("Release5Extinct")
   completeshowoverview()
   return 1
end

evalRelease5Species = function(l_12_arg0)
   local l_12_1 = getAllExtinctSpeciesList()
   local l_12_2 = 0
   local l_12_3 = {}
   local l_12_4 = queryObject("ZTStatus")
   if l_12_4 then
      l_12_3 = l_12_4:ZT_GET_ALL_SPECIES_RELEASED()
   end
   if l_12_3 then
      local l_12_5 = {}
      for l_12_6 = 1, table.getn(l_12_3) do
         l_12_5[l_12_6] = l_12_3[l_12_6].value
      end
      for l_12_6 = 1, table.getn(l_12_1) do
         if howManySpeciesInTable(l_12_5, l_12_1[l_12_6]) >= 1 then
            l_12_2 = l_12_2 + 1
         end
      end
   end
   if l_12_2 >= 5 then
      return 1
   end
   return 0
end

completeRelease5Species = function()
   BFLOG(SYSTRACE, "**************** complete goal 2 ****************")
   setuservar("cp2scen1", "completed")
   local l_13_0 = getuservar("cp2scen2")
   if l_13_0 ~= "completed" then
      setuservar("cp2scen2", "unlocked")
   end
   giveCash(50000)
   showscenariowin("ExtinctCampaign:PaleoFinishReleaseAnimals", "cp2scen2")
end

evalBreed3Species = function(l_14_arg0)
   local l_14_1 = getExtinctEntityList()
   local l_14_2 = table.getn(l_14_1)
   local l_14_3 = {}
   for l_14_4 = 1, l_14_2 do
      local l_14_7 = resolveTable(l_14_1[l_14_4].value)
      if entityHasRelative(l_14_7, "mother") then
         local l_14_8 = getSpeciesName(l_14_7)
         if l_14_8 ~= XTCS1_SCENARIO_ANIMAL then
            local l_14_9 = false
            local l_14_10 = table.getn(l_14_3)
            if l_14_10 > 0 then
               for l_14_11 = 1, l_14_10 do
                  if l_14_8 == l_14_3[l_14_11] then
                     l_14_9 = true
               else
                  end
               end
            end
            if l_14_9 == false then
               l_14_3[l_14_10 + 1] = l_14_8
            end
         end
      end
      if table.getn(l_14_3) >= 3 then
         return 1
      end
   end
   return 0
end

completeBreed3Species = function(l_15_arg0)
   giveCash(XTCS1_OPTIONAL_REWARD1)
   completeshowoverview()
   return 0
end

evalFamousActor = function(l_16_arg0)
   local l_16_1 = getglobalvar("buildLabComplete")
   if l_16_1 == "true" then
      if l_16_arg0.cavemanGiven == nil then
         placeObjectAtGate(XTCS1_CAVEMAN_TYPE)
         do
            local l_16_2 = findType(XTCS1_CAVEMAN_TYPE)
            BFLOG("Number of Cavemen in zoo " .. table.getn(l_16_2))
            if table.getn(l_16_2) ~= 1 then
               BFLOG("Found more than one caveman dude, possible error")
            end
            local l_16_3 = resolveTable(l_16_2[1].value)
            if l_16_3 then
               BFLOG("Setting caveman guy name")
               local l_16_4 = getLocID("ExtinctCampaign:PaleoIslandCavemanName")
               l_16_3:BFG_SET_ATTR_STRING("s_name", l_16_4)
               local l_16_5 = getAllExtinctSpeciesList()
               favAnimal = l_16_5[math.random(table.getn(l_16_5))]
               l_16_3:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", favAnimal)
               displayZooMessageWithZoom("ExtinctCampaign:PaleoIslandCavemanViewEntered", 1, 30, l_16_3)
            end
            l_16_arg0.cavemanGiven = true
            -- Tried to add an 'end' here but it's incorrect
         end
         local l_16_2 = 0
         local l_16_3 = findType(XTCS1_CAVEMAN_TYPE)
         for l_16_4 = 1, table.getn(l_16_3) do
            local l_16_7 = resolveTable(l_16_3[l_16_4].value)
            if l_16_7 then
               local l_16_8 = l_16_7:sendMessage("ZTAI_GET_SEEN")
               local l_16_9 = 0
               for l_16_10 = 1, table.getn(l_16_8) do
                  local l_16_13 = l_16_8[l_16_10].value
                  if isExtinctAnimalByType(l_16_13) == true then
                     l_16_9 = l_16_9 + 1
                  end
               end
               BFLOG("Size of seen table: " .. table.getn(l_16_8))
               BFLOG("Size of pass table: " .. l_16_9)
               l_16_2 = l_16_9
            end
         end
         BFLOG("Number of Extinct animals seen " .. l_16_2)
         if l_16_arg0.SeenOneAnimal == nil and l_16_2 == 1 then
            l_16_arg0.SeenOneAnimal = 1
         end
         if l_16_arg0.SeenTwoAnimal == nil and l_16_2 == 2 then
            l_16_arg0.SeenTwoAnimal = 1
         end
         if l_16_2 >= 3 then
            return 1
         end
         if countType(XTCS1_CAVEMAN_TYPE) == 0 then
            return -1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

completeFamousActor = function()
   BFLOG("Current Fame level: " .. getZooFame())
   setMaxFame(getZooFame() + XTCS1_FAME_REWARD)
   BFLOG("New Fame level(one tick higher): " .. getZooFame())
   giveGuest(5)
   completeshowoverview()
   return 0
end


