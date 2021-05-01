include("scenario/scripts/entity.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/misc.lua")
FameGlobals = {}
NUM_ANIMAL_WEIGHT = 10
MAX_NUM_ANIMAL = 35
MAX_NUM_ANIMAL_DELTA = 30
NUM_SPECIES_WEIGHT = 40
MAX_NUM_SPECIES = 20
MAX_NUM_SPECIES_DELTA = 40
MAX_ANIMAL_HAPPINESS = 70
MAX_ANIMAL_HAPPINESS_DELTA = 6
MAX_GUEST_HAPPINESS = 80
MAX_GUEST_HAPPINESS_DELTA = 6
MAX_EDUCATION = 6
EDUCATION_WEIGHT = 15
MAX_EDUCATION_DELTA = 0.5
MAX_ENTERTAINMENT = 50
ENTERTAINMENT_WEIGHT = 20
MAX_ENTERTAINMENT_DELTA = 2
MAX_GOAL_POINTS = 8
GOAL_POINTS_WEIGHT = 15
MAX_RELEASE_WILD = 10
RELEASE_WILD_WEIGHT = 15
LOGGING = false
FAME_OVERRIDE_ENABLED = false
SPECIAL_GATE_BINDER = "frontgate_fame05"
adjustZooFame = function(l_1_arg0)
   if l_1_arg0 == nil then
      l_1_arg0 = queryObject("ZTStatus")
   end
   if FameGlobals.status == nil or FameGlobals.status ~= l_1_arg0 then
      FameGlobals.status = l_1_arg0
      if l_1_arg0.awardPoints == nil then
         l_1_arg0.awardPoints = 0
      end
      if l_1_arg0.scenarioPoints == nil then
         l_1_arg0.scenarioPoints = 0
      end
      if l_1_arg0.currentNumAnimalFame == nil then
         l_1_arg0.currentNumAnimalFame = 0
      end
      if l_1_arg0.currentNumSpeciesFame == nil then
         l_1_arg0.currentNumSpeciesFame = 0
      end
      if l_1_arg0.averageAnimalHappiness == nil then
         l_1_arg0.averageAnimalHappiness = 0
      end
      if l_1_arg0.currentEducationFame == nil then
         l_1_arg0.currentEducationFame = 0
      end
      if l_1_arg0.currentEntertainmentFame == nil then
         l_1_arg0.currentEntertainmentFame = 0
      end
      if l_1_arg0.averageGuestHappiness == nil then
         l_1_arg0.averageGuestHappiness = 0
      end
      if l_1_arg0.currentHalfStars == nil then
         l_1_arg0.currentHalfStars = 1
      end
   end
   if FAME_OVERRIDE_ENABLED then
      LUALOG("***** ZOO FAME OVERRIDDEN *****")
      return 
   end
   local l_1_1 = findType("animal")
   local l_1_2 = getSpeciesList(l_1_1)
   local l_1_3 = table.getn(l_1_1)
   l_1_3 = clamp(l_1_3, 0, MAX_NUM_ANIMAL)
   local l_1_4 = table.getn(l_1_2)
   l_1_4 = clamp(l_1_4, 0, MAX_NUM_SPECIES)
   local l_1_5 = getAverageAttribute(l_1_1, "f_needPointsGood")
   local l_1_6 = l_1_3 * NUM_ANIMAL_WEIGHT / MAX_NUM_ANIMAL
   l_1_6 = clamp(l_1_6, FameGlobals.status.currentNumAnimalFame - MAX_NUM_ANIMAL_DELTA, FameGlobals.status.currentNumAnimalFame + MAX_NUM_ANIMAL_DELTA)
   FameGlobals.status.currentNumAnimalFame = l_1_6
   setFameBarValue("animal quantity", l_1_6, 0, NUM_ANIMAL_WEIGHT)
   local l_1_7 = l_1_4 * NUM_SPECIES_WEIGHT / MAX_NUM_SPECIES
   l_1_7 = clamp(l_1_7, FameGlobals.status.currentNumSpeciesFame - MAX_NUM_SPECIES_DELTA, FameGlobals.status.currentNumSpeciesFame + MAX_NUM_SPECIES_DELTA)
   FameGlobals.status.currentNumSpeciesFame = l_1_7
   setFameBarValue("animal variety", l_1_7, 0, NUM_SPECIES_WEIGHT)
   l_1_5 = clamp(l_1_5, FameGlobals.status.averageAnimalHappiness - MAX_ANIMAL_HAPPINESS_DELTA, FameGlobals.status.averageAnimalHappiness + MAX_ANIMAL_HAPPINESS_DELTA)
   FameGlobals.status.averageAnimalHappiness = l_1_5
   setFameBarValue("animal happiness", l_1_5, 0, MAX_ANIMAL_HAPPINESS)
   local l_1_8 = (l_1_6 + l_1_7) * l_1_5 / MAX_ANIMAL_HAPPINESS
   local l_1_9 = findType("Guest")
   local l_1_10 = getSpeciesSeenData(l_1_9)
   local l_1_11 = 0
   local l_1_12 = table.getn(l_1_9)
   if l_1_12 ~= 0 then
      l_1_11 = 100 - getAverageAttribute(l_1_9, "happiness")
   end
   local l_1_14 = 0
   local l_1_15 = 0
   local l_1_16, l_1_17, l_1_18, l_1_19 = 0, pairs(l_1_10)
   for l_1_2 in l_1_17 do
      l_1_14 = l_1_14 + l_1_10[l_1_19].viewEvents
      --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

setFameBarValue = function(l_2_arg0, l_2_arg1, l_2_arg2, l_2_arg3)
   local l_2_4 = queryObject("UIRoot")
   if l_2_4 == nil then
      return 
   end
   local l_2_5 = l_2_4:UI_GET_CHILD("zoo fame tab layout")
   if l_2_5 == nil then
      return 
   end
   local l_2_6 = l_2_5:UI_GET_CHILD(l_2_arg0)
   if l_2_6 == nil then
      return 
   end
   l_2_6 = l_2_6:UI_GET_CHILD("bar")
   if l_2_6 == nil then
      return 
   end
   local l_2_7 = 100 * (l_2_arg1 - l_2_arg2) / (l_2_arg3 - l_2_arg2)
   local l_2_8, l_2_9 = l_2_6:UI_SET_SIZE, l_2_6
   local l_2_10
   l_2_8(l_2_9, l_2_10)
   l_2_10 = {x = l_2_7, y = 0}
end

setFamePointsFromConsole = function(l_3_arg0)
   if l_3_arg0 ~= nil and table.getn(l_3_arg0) >= 1 then
      if FameGlobals.status == nil then
         FameGlobals.status = queryObject("ZTStatus")
         if FameGlobals.status == nil then
            return 
         end
         -- Tried to add an 'end' here but it's incorrect
         if FameGlobals.status.currentHalfStars == nil then
            FameGlobals.status.currentHalfStars = 1
         end
         fame = tonumber(l_3_arg0[1].value)
         LUALOG("***** setFamePointsFromConsole - Fame is now: " .. fame .. " *****")
         setFamePoints(fame)
         FAME_OVERRIDE_ENABLED = true
         -- Tried to add an 'end' here but it's incorrect
end

setFamePoints = function(l_4_arg0)
   if FameGlobals == nil then
      return 
   end
   if FameGlobals.status == nil then
      return 
   end
   local l_4_1 = clamp(l_4_arg0, 1, 100)
   local l_4_2 = clamp(l_4_1 / 10, 1, 10)
   l_4_2 = math.floor(l_4_2)
   BFLOG(SYSNOTE, "Halfstars = " .. l_4_2)
   if FameGlobals.status.currentHalfStars < l_4_2 then
      displayZooMessage("zoomessages:ZooFame", 1, 30)
   end
   local l_4_3, l_4_4 = FameGlobals.status:ZT_SET_FAME_HALFSTARS, FameGlobals.status
   local l_4_5 = {l_4_2, l_4_1}
   l_4_3(l_4_4, l_4_5)
   l_4_3 = nil
   if l_4_2 <= 3 then
      l_4_3 = "frontgate_df"
   elseif l_4_2 <= 5 then
      l_4_3 = "frontgate_fame02"
   elseif l_4_2 <= 7 then
      l_4_3 = "frontgate_fame03"
   elseif l_4_2 <= 9 then
      l_4_3 = "frontgate_fame04"
   else
      l_4_3 = "frontgate_fame05"
   end
   l_4_4 = getglobalvar
   l_4_5 = "specialgate"
   l_4_4 = l_4_4(l_4_5)
   if l_4_4 ~= nil then
      l_4_3 = l_4_4
   end
   if l_4_3 ~= nil then
      l_4_5 = queryObject
      l_4_5 = l_4_5("BFGManager")
      if l_4_5 ~= nil then
         local l_4_6 = l_4_5:BFG_GET_ENTITIES("entrance")
         if l_4_6 ~= nil and table.getn(l_4_6) > 0 then
            local l_4_7 = resolveTable(l_4_6[1].value)
            if l_4_7 ~= nil and l_4_7:BFG_GET_BINDER_TYPE() ~= l_4_3 then
               BFLOG(SYSNOTE, "Changing gate to " .. l_4_3)
               local l_4_8, l_4_9 = l_4_7:BFG_ENTITY_MORPH_TO_NEW_ENTITY, l_4_7
               local l_4_10 = {l_4_3}
               l_4_8(l_4_9, l_4_10)
            end
         end
      end
   end
   l_4_5 = nil
   if l_4_2 <= 1 then
      l_4_5 = "zoo00"
   elseif l_4_2 <= 2 then
      l_4_5 = "zoo01"
   elseif l_4_2 <= 3 then
      l_4_5 = "zoo01_5"
   elseif l_4_2 <= 4 then
      l_4_5 = "zoo02"
   elseif l_4_2 <= 5 then
      l_4_5 = "zoo02_5"
   elseif l_4_2 <= 6 then
      l_4_5 = "zoo03"
   elseif l_4_2 <= 7 then
      l_4_5 = "zoo03_5"
   elseif l_4_2 <= 8 then
      l_4_5 = "zoo04"
   elseif l_4_2 <= 9 then
      l_4_5 = "zoo04_5"
   else
      l_4_5 = "zoo05"
   end
   if l_4_5 ~= nil then
      local l_4_6 = queryObject("UIRoot")
      if l_4_6 ~= nil then
         local l_4_7 = l_4_6:UI_GET_CHILD("Zoo Gate")
         if l_4_7 ~= nil then
            BFLOG(SYSNOTE, "Setting icon to " .. l_4_5)
            l_4_7:UI_SET_VALUE(l_4_5)
         end
      end
   end
   FameGlobals.status.currentHalfStars = l_4_2
end

rawDump = function()
   local l_5_0 = findType("animal")
   local l_5_1 = findType("Guest")
   local l_5_2 = getSpeciesList(l_5_0)
   local l_5_3 = getSpeciesSeenData(l_5_1)
   local l_5_4 = table.getn(l_5_0)
   local l_5_5 = table.getn(l_5_2)
   local l_5_6 = getAverageAttribute(l_5_0, "f_needPointsGood")
   local l_5_7 = table.getn(l_5_1)
   local l_5_8 = getAverageAttribute(l_5_1, "happiness")
   local l_5_9 = getAverageAttribute(l_5_1, "f_Education")
   local l_5_10 = getTotalFromMessage(l_5_1, "ZTAI_GET_NUMBER_SPECIES_SEEN")
   local l_5_11 = table.getn(l_5_3)
   local l_5_12 = 0
   if l_5_7 > 0 then
      l_5_12 = l_5_10 / l_5_7
   end
   local l_5_13 = 0
   local l_5_14 = queryObject("ZTStatus")
   if l_5_14 ~= nil then
      l_5_13 = l_5_14:ZT_GET_ANIMALS_RELEASED()
   end
   local l_5_15 = -1
   local l_5_16 = -1
   if FameGlobals ~= nil then
      l_5_16 = FameGlobals.status.awardPoints
      l_5_15 = FameGlobals.status.scenarioPoints
   end
   BFLOG(SYSNOTE, "ZF RAW FAME DATA DUMP ---------------------------------------------------------")
   BFLOG(SYSNOTE, "ZF   ANIMALS ------------------------------------")
   BFLOG(SYSNOTE, "ZF     Number of animals = " .. l_5_4)
   BFLOG(SYSNOTE, "ZF     Number of species = " .. l_5_5)
   BFLOG(SYSNOTE, "ZF     Average animal happiness = " .. l_5_6)
   BFLOG(SYSNOTE, "ZF   GUESTS -------------------------------------")
   BFLOG(SYSNOTE, "ZF     Number of guests = " .. l_5_7)
   BFLOG(SYSNOTE, "ZF     Average guest happiness = " .. l_5_8)
   BFLOG(SYSNOTE, "ZF     Average guest education = " .. l_5_9)
   BFLOG(SYSNOTE, "ZF     Species Seen ------------------------------")
   BFLOG(SYSNOTE, "ZF       Total (including duplicates) = " .. l_5_10)
   BFLOG(SYSNOTE, "ZF       Total (not including duplicates) = " .. l_5_11)
   BFLOG(SYSNOTE, "ZF       Average per guest = " .. l_5_12)
   BFLOG(SYSNOTE, "ZF     Species Data ------------------------------")
   local l_5_17 = string.format("ZF       %-20s%-16s%-16s%-16s%-16s", "SPECIES", "GUEST VIEWS", "VIEW EVENTS", "ENTERTAINMENT", "DONATIONS")
   BFLOG(SYSNOTE, l_5_17)
   local l_5_18, l_5_19, l_5_20, l_5_21 = pairs(l_5_3)
   for l_5_2 in l_5_18 do
      local l_5_22 = string.format("ZF %-20s%-16d%-16d%-16.2f%-16.2f", l_5_20, l_5_21.guestViews, l_5_21.viewEvents, l_5_21.entertain, l_5_21.donate)
      BFLOG(SYSNOTE, "      " .. l_5_22)
   end
   l_5_18 = BFLOG
   l_5_19 = SYSNOTE
   l_5_20 = "ZF   ZOO -----------------------------------------"
   l_5_18(l_5_19, l_5_20)
   l_5_18 = BFLOG
   l_5_19 = SYSNOTE
   l_5_20 = "ZF     Number Animals Released = "
   l_5_21 = l_5_13
   l_5_20 = l_5_20 .. l_5_21
   l_5_18(l_5_19, l_5_20)
   l_5_18 = BFLOG
   l_5_19 = SYSNOTE
   l_5_20 = "ZF     Number Awards Points = "
   l_5_21 = l_5_16
   l_5_20 = l_5_20 .. l_5_21
   l_5_18(l_5_19, l_5_20)
   l_5_18 = BFLOG
   l_5_19 = SYSNOTE
   l_5_20 = "ZF     Number Scenario Points = "
   l_5_21 = l_5_15
   l_5_20 = l_5_20 .. l_5_21
   l_5_18(l_5_19, l_5_20)
   l_5_18 = BFLOG
   l_5_19 = SYSNOTE
   l_5_20 = "ZF -------------------------------------------------------------------------------"
   l_5_18(l_5_19, l_5_20)
end

getAverageAttribute = function(l_6_arg0, l_6_arg1)
   local l_6_2 = 0
   local l_6_3 = table.getn(l_6_arg0)
   for l_6_4 = 1, l_6_3 do
      local l_6_7 = resolveTable(l_6_arg0[l_6_4].value)
      if l_6_7 ~= nil then
         l_6_2 = l_6_2 + l_6_7:BFG_GET_ATTR_FLOAT(l_6_arg1)
      end
   end
   if l_6_3 > 0 then
      return (l_6_2) / l_6_3
   end
   return 0
end

getTotalFromMessage = function(l_7_arg0, l_7_arg1)
   local l_7_2 = 0
   local l_7_3 = table.getn(l_7_arg0)
   for l_7_4 = 1, l_7_3 do
      local l_7_7 = resolveTable(l_7_arg0[l_7_4].value)
      if l_7_7 ~= nil then
         l_7_2 = l_7_2 + l_7_7:sendMessage(l_7_arg1)
      end
   end
   return l_7_2
end

getSpeciesList = function(l_8_arg0)
   local l_8_1 = {}
   local l_8_2 = table.getn(l_8_arg0)
   for l_8_3 = 1, l_8_2 do
      local l_8_6 = resolveTable(l_8_arg0[l_8_3].value)
      if l_8_6 == nil then
         BFLOG(SYSERROR, "nil animal returned from findType")
      else
         local l_8_7 = l_8_6:BFG_GET_ATTR_STRING("s_Species")
         numSpecies = table.getn(l_8_1)
         local l_8_8 = false
         for l_8_9 = 1, numSpecies do
            if l_8_1[l_8_9] == l_8_7 then
               l_8_8 = true
         else
            end
         end
         if l_8_8 == false then
            l_8_1[numSpecies + 1] = l_8_7
         end
      end
   end
   return l_8_1
end

getSpeciesSeenData = function(l_9_arg0)
   local l_9_1 = {}
   local l_9_2 = 0
   local l_9_3 = table.getn(l_9_arg0)
   for l_9_4 = 1, l_9_3 do
      local l_9_7 = resolveTable(l_9_arg0[l_9_4].value)
      if l_9_7 ~= nil then
         local l_9_8 = l_9_7:sendMessage("ZTAI_GET_TYPES_SEEN")
         if l_9_8 ~= nil then
            local l_9_9 = table.getn(l_9_8)
            for l_9_10 = 1, l_9_9 do
               local l_9_13 = l_9_8[l_9_10].value
               local l_9_14 = l_9_7:sendMessage("ZTAI_GET_NUMBER_VIEW_EVENTS", l_9_13)
               local l_9_15 = l_9_7:sendMessage("ZTAI_GET_ENTERTAINMENT", l_9_13)
               local l_9_16 = l_9_7:sendMessage("ZTAI_GET_DONATION_POINTS", l_9_13)
               if l_9_1[l_9_13] == nil then
                  l_9_2 = l_9_2 + 1
                  l_9_1[l_9_13] = {}
                  l_9_1[l_9_13].guestViews = 0
                  l_9_1[l_9_13].viewEvents = 0
                  l_9_1[l_9_13].entertain = 0
                  l_9_1[l_9_13].donate = 0
               end
               l_9_1[l_9_13].guestViews = l_9_1[l_9_13].guestViews + 1
               l_9_1[l_9_13].viewEvents = l_9_1[l_9_13].viewEvents + l_9_14
               l_9_1[l_9_13].entertain = l_9_1[l_9_13].entertain + l_9_15
               l_9_1[l_9_13].donate = l_9_1[l_9_13].donate + l_9_16
            end
         end
      end
   end
   table.setn(l_9_1, l_9_2)
   return l_9_1
end

clamp = function(l_10_arg0, l_10_arg1, l_10_arg2)
   if l_10_arg0 < l_10_arg1 then
      l_10_arg0 = l_10_arg1
   end
   if l_10_arg2 < l_10_arg0 then
      l_10_arg0 = l_10_arg2
   end
   return l_10_arg0
end

incAwardPoints = function(l_11_arg0, l_11_arg1)
   if FameGlobals.status == nil or FameGlobals.status.awardPoints == nil then
      adjustZooFame(nil)
   end
   FameGlobals.status.awardPoints = FameGlobals.status.awardPoints + l_11_arg1
   BFLOG(SYSTRACE, "incAwardPoints set to: " .. FameGlobals.status.awardPoints)
end


