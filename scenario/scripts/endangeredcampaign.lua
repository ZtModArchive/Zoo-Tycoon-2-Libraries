include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
TAPIR_SPECIES = "TapirBairds"
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

completegoal = function()
   completeshowoverview()
   return 1
end

completeminigoal = function()
   showprimarygoals()
   return 1
end

evalbairdstapirneeds = function()
   if countType(TAPIR_SPECIES) >= 2 and typeBasicNeedsSatisfied(TAPIR_SPECIES) == true then
      return 1
   end
   return 0
end

completebairdstapirneeds = function()
   showRule("BairdsTapirDonations")
   completeshowoverview()
end

evalbairdstapirdonations = function()
   if getTotalDonations() >= 3000 then
      return 1
   end
   return 0
end

completebairdstapirdonations = function(l_7_arg0)
   showRule("BairdsTapirColony")
   completeshowoverview()
end

evalbairdstapircolony = function(l_8_arg0)
   if l_8_arg0.boostAdoptTapir == nil then
      boostSpeciesAdoptionProbabiltiy(TAPIR_SPECIES)
      l_8_arg0.boostAdoptTapir = 1
   end
   if countType(TAPIR_SPECIES) >= 5 then
      return 1
   end
   return 0
end

completebairdstapir = function(l_9_arg0)
   resetAdoptChance(TAPIR_SPECIES)
   setuservar("EndangeredAnimalsCampaignscenario1", "completed")
   local l_9_1 = getuservar("EndangeredAnimalsCampaignscenario2")
   if l_9_1 ~= "completed" then
      setuservar("EndangeredAnimalsCampaignscenario2", "unlocked")
   end
   showscenariowin("EndangeredAnimals:BairdsTapirSuccessOverview", "EndangeredAnimalsCampaignscenario2")
end

completebreedingprogramneeds = function()
   showRule("BreedingProgramBreed")
   giveCash(10000)
   completeshowoverview()
end

completebreedingprogrambreed = function()
   showRule("BreedingProgramRelease")
   completeshowoverview()
end

completebreedingprogramrelease = function()
end

evalbreedingprogramneedstortoise = function(l_13_arg0)
   if l_13_arg0.boostAdoptTortoise == nil then
      boostSpeciesAdoptionProbabiltiy("TortoiseGalapagos")
      l_13_arg0.boostAdoptTortoise = 1
   end
   if countType("TortoiseGalapagos_Young") >= 1 then
      l_13_arg0.tortoiseBorn = true
   end
   if l_13_arg0.tortoiseBorn ~= nil then
      tortoiseBorn = true
   end
   local l_13_1 = findType("TortoiseGalapagos")
   for l_13_2 = 1, table.getn(l_13_1) do
      local l_13_5 = resolveTable(l_13_1[l_13_2].value)
      if l_13_5 and basicNeedsSatisfied(l_13_5) == true then
         return 1
      end
   end
   return 0
end

evalbreedingprogramneedsoryx = function(l_14_arg0)
   if l_14_arg0.boostAdoptOryx == nil then
      boostSpeciesAdoptionProbabiltiy("OryxScimitarHorned")
      l_14_arg0.boostAdoptOryx = 1
   end
   if countType("OryxScimitarHorned_Young") >= 1 then
      l_14_arg0.oryxBorn = true
   end
   if l_14_arg0.oryxBorn ~= nil then
      oryxBorn = true
   end
   local l_14_1 = findType("OryxScimitarHorned")
   for l_14_2 = 1, table.getn(l_14_1) do
      local l_14_5 = resolveTable(l_14_1[l_14_2].value)
      if l_14_5 and basicNeedsSatisfied(l_14_5) == true then
         return 1
      end
   end
   return 0
end

evalbreedingprogramneedsmarkhor = function(l_15_arg0)
   if l_15_arg0.boostAdoptMarkhor == nil then
      boostSpeciesAdoptionProbabiltiy("Markhor")
      l_15_arg0.boostAdoptMarkhor = 1
   end
   if countType("Markhor_Young") >= 1 then
      l_15_arg0.markhorBorn = true
   end
   if l_15_arg0.markhorBorn ~= nil then
      markhorBorn = true
   end
   local l_15_1 = findType("Markhor")
   for l_15_2 = 1, table.getn(l_15_1) do
      local l_15_5 = resolveTable(l_15_1[l_15_2].value)
      if l_15_5 and basicNeedsSatisfied(l_15_5) == true then
         return 1
      end
   end
   return 0
end

evalbreedingprogrambreedtortoise = function()
   if countType("TortoiseGalapagos_Young") >= 1 or tortoiseBorn ~= nil then
      resetAdoptChance("TortoiseGalapagos")
      return 1
   end
   return 0
end

evalbreedingprogrambreedoryx = function()
   if countType("OryxScimitarHorned_Young") >= 1 or oryxBorn ~= nil then
      resetAdoptChance("OryxScimitarHorned")
      return 1
   end
   return 0
end

evalbreedingprogrambreedmarkhor = function()
   if countType("Markhor_Young") >= 1 or markhorBorn ~= nil then
      resetAdoptChance("Markhor")
      return 1
   end
   return 0
end

evalbreedingprogramreleasetortoise = function()
   local l_19_0 = {}
   local l_19_1 = queryObject("ZTStatus")
   if l_19_1 then
      l_19_0 = l_19_1:ZT_GET_ALL_ANIMALS_RELEASED()
   end
   if l_19_0 then
      local l_19_2 = {}
      for l_19_3 = 1, table.getn(l_19_0) do
         l_19_2[l_19_3] = l_19_0[l_19_3].value
      end
      if howManySpeciesInTable(l_19_2, "TortoiseGalapagos") >= 1 then
         return 1
      end
   end
   return 0
end

evalbreedingprogramreleaseoryx = function()
   local l_20_0 = {}
   local l_20_1 = queryObject("ZTStatus")
   if l_20_1 then
      l_20_0 = l_20_1:ZT_GET_ALL_ANIMALS_RELEASED()
   end
   if l_20_0 then
      local l_20_2 = {}
      for l_20_3 = 1, table.getn(l_20_0) do
         l_20_2[l_20_3] = l_20_0[l_20_3].value
      end
      if howManySpeciesInTable(l_20_2, "OryxScimitarHorned") >= 1 then
         return 1
      end
   end
   return 0
end

evalbreedingprogramreleasemarkhor = function()
   local l_21_0 = {}
   local l_21_1 = queryObject("ZTStatus")
   if l_21_1 then
      l_21_0 = l_21_1:ZT_GET_ALL_ANIMALS_RELEASED()
   end
   if l_21_0 then
      local l_21_2 = {}
      for l_21_3 = 1, table.getn(l_21_0) do
         l_21_2[l_21_3] = l_21_0[l_21_3].value
      end
      if howManySpeciesInTable(l_21_2, "Markhor") >= 1 then
         return 1
      end
   end
   return 0
end

completebreedingprogram = function()
   setuservar("EndangeredAnimalsCampaignscenario2", "completed")
   local l_22_0 = getuservar("EndangeredAnimalsCampaignscenario3")
   if l_22_0 ~= "completed" then
      setuservar("EndangeredAnimalsCampaignscenario3", "unlocked")
   end
   showscenariowin("EndangeredAnimals:BreedingProgramSuccessOverview", "EndangeredAnimalsCampaignscenario3")
end

forceAdoption = function()
   local l_23_0 = getAllEndangeredSpeciesList()
   local l_23_1 = animalsInZoo()
   local l_23_2 = {}
   local l_23_3 = (getHalfStars() + 2) * 10
   for l_23_4 = 1, table.getn(l_23_0) do
      local l_23_7 = false
      for l_23_8 = 1, table.getn(l_23_1) do
         if l_23_0[l_23_4] == l_23_1[l_23_8] then
            l_23_7 = true
         end
      end
      if l_23_7 == false then
         local l_23_8 = queryObject("ZTWorldMgr")
         if l_23_8 then
            local l_23_9, l_23_10 = l_23_8:BFG_GET_ATTR_FLOAT, l_23_8
            local l_23_11
            l_23_9, l_23_11 = l_23_9(l_23_10, l_23_11), {key = l_23_0[l_23_4], val = "f_adoptRarity"}
            if l_23_9 <= l_23_3 then
               l_23_10 = table
               l_23_10 = l_23_10.getn
               l_23_11 = l_23_2
               l_23_10 = l_23_10(l_23_11)
               l_23_10 = l_23_10 + 1
               l_23_11 = l_23_0[l_23_4]
               l_23_2[l_23_10] = l_23_11
            end
         end
      end
   end
   if table.getn(l_23_2) >= 1 then
      local l_23_4 = l_23_2[1]
      local l_23_5 = getCostByBinder(l_23_4 .. "_Adult_F")
      for l_23_6 = 1, table.getn(l_23_2) do
         local l_23_9 = getCostByBinder(l_23_2[l_23_6] .. "_Adult_F")
         if l_23_9 < l_23_5 then
            l_23_5 = l_23_9
            l_23_4 = l_23_2[l_23_6]
         end
      end
      local l_23_6 = l_23_4
      l_23_4 = l_23_4 .. "_Adult_"
      if math.random(2) == 0 then
         l_23_4 = l_23_4 .. "M"
      else
         l_23_4 = l_23_4 .. "F"
      end
      local l_23_7 = getCostByBinder(l_23_4)
      takeCashNoPopup(l_23_7)
      placeCratedObjectAtGate(l_23_4)
      local l_23_8 = getLocID("EndangeredAnimals:EndangeredAnimalsZooForcedAdoption")
      local l_23_9 = string.format(l_23_8, getlocidfromspecies(l_23_6))
      genericokpaneltext(nil, l_23_9)
      return l_23_6
   end
end

evalzoototalwin = function(l_24_arg0)
   if endtable == nil then
      endtable = getAllEndangeredSpeciesList()
   end
   local l_24_1 = 0
   if getHalfStars() >= 10 then
      local l_24_2 = animalsInZoo()
      local l_24_3 = true
      for l_24_4 = 1, table.getn(l_24_2) do
         local l_24_7 = false
         for l_24_8 = 1, table.getn(endtable) do
            if l_24_2[l_24_4] == endtable[l_24_8] then
               l_24_7 = true
         else
            end
         end
         if l_24_7 == false then
            l_24_3 = false
         end
         l_24_4 = true
         if l_24_3 == l_24_4 then
            l_24_4 = 1
            return l_24_4
         else
            l_24_2 = animalsInZoo
            l_24_2 = l_24_2()
            --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

evalcatchup1 = function(l_25_arg0)
   if doCatchup ~= nil and doCatchup == true then
      if l_25_arg0.catchuptimer == nil then
         l_25_arg0.catchuptimer = getCurrentMonth()
         l_25_arg0.catchuptimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_25_1 = getCurrentMonth()
         local l_25_2 = getCurrentTimeOfDay()
         if (l_25_arg0.catchuptimer + 1 <= l_25_1 and l_25_arg0.catchuptimerday <= l_25_2) or l_25_arg0.catchuptimer + 2 <= l_25_1 then
            showscenariofail("EndangeredAnimals:EndangeredAnimalsZooCatchUpFailure", "EndangeredAnimalsCampaignscenario3")
            return -1
         end
         local l_25_3 = getEndangeredSpeciesList()
         if table.getn(l_25_3) >= 1 then
            BFLOG(">= 1 endangered animals")
            return 1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

evalcatchup2 = function(l_26_arg0)
   if doCatchup ~= nil and doCatchup == true then
      if l_26_arg0.catchuptimer == nil then
         l_26_arg0.catchuptimer = getCurrentMonth()
         l_26_arg0.catchuptimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         local l_26_1 = getCurrentMonth()
         local l_26_2 = getCurrentTimeOfDay()
         if (l_26_arg0.catchuptimer + 1 <= l_26_1 and l_26_arg0.catchuptimerday <= l_26_2) or l_26_arg0.catchuptimer + 2 <= l_26_1 then
            showscenariofail("EndangeredAnimals:EndangeredAnimalsZooCatchUpFailure", "EndangeredAnimalsCampaignscenario3")
            return -1
         end
         local l_26_3 = getEndangeredSpeciesList()
         if table.getn(l_26_3) >= 2 then
            BFLOG(">= 2 endangered animals")
            return 1
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

evalfirstforcedadoption = function(l_27_arg0)
   if firstForcedAdoption ~= nil and l_27_arg0.finishedFirstForcedAdoption == nil then
      l_27_arg0.speciesType = firstForcedAdoptionType
      local l_27_1 = getDonations(l_27_arg0.speciesType)
      if l_27_1 >= 300 then
         local l_27_2 = getCostByBinder(l_27_arg0.speciesType .. "_Adult_F")
         giveCash(l_27_2)
         local l_27_3 = getLocID("EndangeredAnimals:EndangeredAnimalsZooDonationGoalDone")
         local l_27_4 = string.format(l_27_3, getlocidfromspecies(l_27_arg0.speciesType))
         setalttext("FirstForcedAdoption", "success", l_27_4)
         l_27_3 = getLocID("EndangeredAnimals:EndangeredAnimalsZooDonationSuccess")
         l_27_4 = string.format(l_27_3, getlocidfromspecies(l_27_arg0.speciesType))
         genericokpaneltext(nil, l_27_4)
         l_27_arg0.finishedFirstForcedAdoption = true
         return 1
      end
   end
end

evalsecondforcedadoption = function(l_28_arg0)
   if secondForcedAdoption ~= nil and l_28_arg0.finishedSecondForcedAdoption == nil then
      l_28_arg0.speciesType = secondForcedAdoptionType
      local l_28_1 = getDonations(l_28_arg0.speciesType)
      if l_28_1 >= 300 then
         local l_28_2 = getCostByBinder(l_28_arg0.speciesType .. "_Adult_F")
         giveCash(l_28_2)
         local l_28_3 = getLocID("EndangeredAnimals:EndangeredAnimalsZooDonationGoalDone")
         local l_28_4 = string.format(l_28_3, getlocidfromspecies(l_28_arg0.speciesType))
         setalttext("SecondForcedAdoption", "success", l_28_4)
         l_28_3 = getLocID("EndangeredAnimals:EndangeredAnimalsZooDonationSuccess")
         l_28_4 = string.format(l_28_3, getlocidfromspecies(l_28_arg0.speciesType))
         genericokpaneltext(nil, l_28_4)
         l_28_arg0.finishedSecondForcedAdoption = true
         return 1
      end
   end
end

completezoototalwin = function()
   setuservar("breedingcenterlock", "true")
   setuservar("EndangeredAnimalsCampaignscenario3", "completed")
   showscenariowin("EndangeredAnimals:EndangeredAnimalsZooSuccessOverview", nil)
end


