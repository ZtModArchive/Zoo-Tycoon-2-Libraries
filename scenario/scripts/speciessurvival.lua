include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
setinitialzoostate = function(l_1_arg0)
   if disableAdoption == nil then
      BFLOG(SYSNOTE, "______________DISABLING THE ADOPTION TAB_________________")
      disableAnimalAdoption()
      disableAdoption = 1
      if l_1_arg0.showpanel == nil then
         BFLOG(SYSTRACE, "*********I'm here so show overview panel!********")
         completeshowoverview()
         showUI("goal panel", true)
         l_1_arg0.showpanel = 1
      end
   end
   return 1
end

giverandomanimal = function()
   local l_2_0 = findTypeDirect("animal")
   local l_2_1 = math.random(5)
   if l_2_1 == 1 then
      BFLOG(SYSRTACE, "placing camel")
      placeObject("CamelDromedary_Adult_F", 80, 30, 0)
   elseif l_2_1 == 2 then
      BFLOG(SYSRTACE, "placing kangaroo")
      placeObject("Kangaroo_Adult_F", 80, 30, 0)
   elseif l_2_1 == 3 then
      BFLOG(SYSRTACE, "placing gemsbok")
      placeObject("Gemsbok_Adult_M", 80, 30, 0)
   elseif l_2_1 == 4 then
      BFLOG(SYSRTACE, "placing flamingo")
      placeObject("FlamingoGreater_Adult_M", 80, 30, 0)
   else
      BFLOG(SYSRTACE, "placing croc")
      placeObject("CrocodileNile_Adult_F", 80, 30, 0)
   end
   local l_2_2 = findTypeDirect("animal")
   BFLOG(SYSTRACE, "newanimaltable size: " .. table.getn(l_2_2))
   BFLOG(SYSTRACE, "animaltable size: " .. table.getn(l_2_0))
   for l_2_3 = 1, table.getn(l_2_2) do
      local l_2_6 = false
      local l_2_7 = 0
      for l_2_8 = 1, table.getn(l_2_0) do
         local l_2_11 = resolveTable(l_2_2[l_2_3].value)
         local l_2_12 = resolveTable(l_2_0[l_2_8].value)
         if areCompsEqual(l_2_11, l_2_12) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_2_6 = true
         end
      end
      if l_2_6 == false then
         BFLOG(SYSTRACE, "i = " .. l_2_3)
         local l_2_8 = resolveTable(l_2_2[l_2_3].value)
         crateEntity(l_2_8)
   else
      end
   end
   genericokpanel(nil, "SpeciesSurvival:VulnerableAnimalsBreedingBonusAnimal")
end

evalvulnerableanimalsbreeding = function(l_3_arg0)
   if speciesCanMate("Cheetah") == false then
      BFLOG(SYSTRACE, "No cheetahs!  Fail")
      failAnimal = "Cheetah"
      return -1
   end
   if speciesCanMate("Ibex") == false then
      BFLOG(SYSTRACE, "No ibex!  Fail")
      failAnimal = "Ibex"
      return -1
   end
   if speciesCanMate("BeaverAmerican") == false then
      BFLOG(SYSTRACE, "No beavers!  Fail")
      failAnimal = "BeaverAmerican"
      return -1
   end
   if speciesCanMate("Hippopotamus") == false then
      BFLOG(SYSTRACE, "No hippos!  Fail")
      failAnimal = "Hippopotamus"
      return -1
   end
   if l_3_arg0.giverand ~= nil then
      local l_3_1 = getCurrentTimeOfDay()
      if l_3_arg0.giverand <= l_3_1 then
         giverandomanimal()
         l_3_arg0.giverand = nil
      end
   end
   local l_3_1 = getAnimalsPutUpForAdoption()
   if l_3_arg0.countadoptions == nil then
      l_3_arg0.countadoptions = getAnimalsPutUpForAdoption()
   end
   BFLOG(SYSTRACE, "Num adoptions: " .. l_3_arg0.countadoptions .. ".")
   if l_3_arg0.countadoptions < l_3_1 then
      if l_3_arg0.cheetahdone == nil then
         l_3_arg0.cheetahdone = false
         -- Tried to add an 'end' here but it's incorrect
         if l_3_arg0.hippodone == nil then
            l_3_arg0.hippodone = false
         end
         if l_3_arg0.beaverdone == nil then
            l_3_arg0.beaverdone = false
         end
         if l_3_arg0.ibexdone == nil then
            l_3_arg0.ibexdone = false
         end
         local l_3_2 = getLastAnimalPutUpForAdoption()
         if l_3_2 ~= nil then
            thetype = getSpeciesFromType(l_3_2)
            if l_3_arg0.cheetahdone == false and thetype == "Cheetah" then
               BFLOG(SYSTRACE, "Cheetah adopted!")
               l_3_arg0.cheetahdone = true
               l_3_arg0.countadoptions = l_3_arg0.countadoptions + 1
               giveCash(2000)
               if l_3_arg0.giverand == nil then
                  l_3_arg0.giverand = getCurrentTimeOfDay() + 0.1
                  if l_3_arg0.giverand > 1 then
                     l_3_arg0.giverand = 0 - l_3_arg0.giverand
                  elseif l_3_arg0.hippodone == false and thetype == "Hippopotamus" then
                     BFLOG(SYSTRACE, "Hippo adopted!")
                     l_3_arg0.hippodone = true
                     l_3_arg0.countadoptions = l_3_arg0.countadoptions + 1
                     giveCash(2000)
                     if l_3_arg0.giverand == nil then
                        l_3_arg0.giverand = getCurrentTimeOfDay() + 0.1
                        if l_3_arg0.giverand > 1 then
                           l_3_arg0.giverand = 0 - l_3_arg0.giverand
                        elseif l_3_arg0.beaverdone == false and thetype == "BeaverAmerican" then
                           BFLOG(SYSTRACE, "Beaver adopted!")
                           l_3_arg0.beaverdone = true
                           l_3_arg0.countadoptions = l_3_arg0.countadoptions + 1
                           giveCash(2000)
                           if l_3_arg0.giverand == nil then
                              l_3_arg0.giverand = getCurrentTimeOfDay() + 0.1
                              if l_3_arg0.giverand > 1 then
                                 l_3_arg0.giverand = 0 - l_3_arg0.giverand
                              elseif l_3_arg0.ibexdone == false and thetype == "Ibex" then
                                 BFLOG(SYSTRACE, "Ibex adopted!")
                                 l_3_arg0.ibexdone = true
                                 l_3_arg0.countadoptions = l_3_arg0.countadoptions + 1
                                 giveCash(2000)
                                 if l_3_arg0.giverand == nil then
                                    l_3_arg0.giverand = getCurrentTimeOfDay() + 0.1
                                    if l_3_arg0.giverand > 1 then
                                       l_3_arg0.giverand = 0 - l_3_arg0.giverand
                                    end
                                 end
                              end
                              -- Tried to add an 'end' here but it's incorrect
                           end
                        end
                     end
                  end
               end
               -- Tried to add an 'end' here but it's incorrect
               if l_3_arg0.countadoptions == 1 then
                  showRule("animaloneadopted")
               elseif l_3_arg0.countadoptions == 2 then
                  showRule("animaltwoadopted")
               elseif l_3_arg0.countadoptions == 3 then
                  showRule("animalthreeadopted")
               elseif l_3_arg0.countadoptions == 4 then
                  showRule("animalfouradopted")
               end
               if l_3_arg0.cheetahdone == true and l_3_arg0.hippodone == true and l_3_arg0.beaverdone == true and l_3_arg0.ibexdone == true then
                  return 1
               end
               -- Tried to add an 'end' here but it's incorrect
               return 0
end

completevulnerableanimalsbreeding = function()
   enableAnimalAdoption()
   BFLOG(SYSTRACE, "completevulnerableanimalsbreeding")
   local l_4_0 = getuservar("SpeciesSurvivalscenario2")
   if l_4_0 == nil or l_4_0 ~= "completed" then
      setuservar("SpeciesSurvivalscenario2", "unlocked")
   end
   setuservar("SpeciesSurvivalscenario1", "completed")
   showscenariowin("SpeciesSurvival:VulnerableAnimalsSuccessoverview", "SpeciesSurvivalscenario2")
end

failvulnerableanimalsbreeding = function()
   local l_5_0 = getLocID("SpeciesSurvival:VulnerableAnimalsFailureoverview")
   local l_5_1 = (string.format(l_5_0, getlocidfromspecies(failAnimal)))
   failAnimal = nil
   setalttext("vulnerableanimalsbreeding", "failure", l_5_1)
   setaltoverviewtext("vulnerableanimalsbreeding", "failure", l_5_1)
   showscenariofailtext(l_5_1, "SpeciesSurvivalscenario1")
end

evalbreedgorilla = function()
   if existNumChildren("GorillaMountain", 1) == true then
      return 1
   end
   if existMale("GorillaMountain") == false or existFemale("GorillaMountain") == false then
      failAnimal = "GorillaMountain"
      return -1
   end
   return 0
end

completebreedgorilla = function()
   showprimarygoals()
   showRule("gorilladonations")
end

evalbreedredpanda = function(l_8_arg0)
   if existNumChildren("PandaRed", 1) == true then
      return 1
   end
   if existMale("PandaRed") == false or existFemale("PandaRed") == false then
      failAnimal = "PandaRed"
      return -1
   end
   return 0
end

completebreedredpanda = function()
   showprimarygoals()
   showRule("redpandadonations")
end

evalbreedsnowleopard = function(l_10_arg0)
   if existNumChildren("LeopardSnow", 1) == true then
      return 1
   end
   if existMale("LeopardSnow") == false or existFemale("LeopardSnow") == false then
      failAnimal = "LeopardSnow"
      return -1
   end
   return 0
end

completebreedsnowleopard = function()
   showRule("snowleoparddonations")
   showprimarygoals()
end

completebreedendangeredanimals = function()
   showprimarygoals()
end

evaldonationsgorilla = function()
   if countType("GorillaMountain") < 1 then
      failAnimal = "GorillaMountain"
      failType = 1
      return -1
   end
   if getDonations("GorillaMountain") >= 7500 then
      return 1
   end
   return 0
end

completedonationsgorilla = function()
   showprimarygoals()
end

evaldonationsredpanda = function()
   if countType("PandaRed") < 1 then
      failAnimal = "PandaRed"
      failType = 1
      return -1
   end
   if getDonations("PandaRed") >= 7500 then
      return 1
   end
   return 0
end

completedonationsredpanda = function()
   showprimarygoals()
end

evaldonationssnowleopard = function()
   if countType("LeopardSnow") < 1 then
      failAnimal = "LeopardSnow"
      failType = 1
      return -1
   end
   if getDonations("LeopardSnow") >= 7500 then
      return 1
   end
   return 0
end

completedonationssnowleopard = function()
   showprimarygoals()
end

completeendangeredanimals = function()
   enableAnimalAdoption()
   BFLOG(SYSTRACE, "completeendangeredanimals")
   local l_19_0 = getuservar("SpeciesSurvivalscenario3")
   if l_19_0 ~= "completed" then
      setuservar("SpeciesSurvivalscenario3", "unlocked")
   end
   setuservar("SpeciesSurvivalscenario2", "completed")
   showscenariowin("SpeciesSurvival:EndangeredAnimalsSuccessPart2overview", "SpeciesSurvivalscenario3")
end

failendangeredanimals = function()
   local l_20_0 = ""
   if failType == nil or failType == 0 then
      l_20_0 = getLocID("SpeciesSurvival:EndangeredAnimalsFailureoverview")
   else
      l_20_0 = getLocID("SpeciesSurvival:EndangeredAnimalsFailureAllGone")
   end
   local l_20_1 = (string.format(l_20_0, getlocidfromspecies(failAnimal)))
   failAnimal = nil
   setalttext("endangeredanimals", "failure", l_20_1)
   setaltoverviewtext("endangeredanimals", "failure", l_20_1)
   showscenariofailtext(l_20_1, "SpeciesSurvivalscenario2")
end

evalsecondgenerationbreeding = function(l_21_arg0)
   BFLOG(SYSTRACE, "evalsecondgenerationbreeding")
   if existMale("ZebraCommon") == false or existFemale("ZebraCommon") == false then
      failAnimal = "ZebraCommon"
      return -1
   end
   if existMale("LemurRingtailed") == false or existFemale("LemurRingtailed") == false then
      failAnimal = "LemurRingtailed"
      return -1
   end
   if existMale("Chimpanzee") == false or existFemale("Chimpanzee") == false then
      failAnimal = "Chimpanzee"
      return -1
   end
   if existNumChildren("ZebraCommon", 1) == true then
      showRule("zebrasfirstbreeding")
      if l_21_arg0.showzebrapanel == nil then
         l_21_arg0.showzebrapanel = 1
         showprimarygoals()
      end
      if l_21_arg0.extrazebra == nil then
         l_21_arg0.extrazebra = 1
      elseif l_21_arg0.extrazebra == 1 then
         l_21_arg0.extrazebra = -1
         local l_21_1 = findType("ZebraCommon_Adult_M")
         placeObject("ZebraCommon_Adult_M", 100, 30, 0)
         local l_21_2 = findType("ZebraCommon_Adult_M")
         crateNewEntity(l_21_1, l_21_2)
         genericokpanel(nil, "SpeciesSurvival:SecondGenerationBreedingBonusAnimal")
      end
      -- Tried to add an 'end' here but it's incorrect
      if l_21_arg0.extrazebra ~= nil then
         local l_21_1 = findType("ZebraCommon")
         if l_21_1 then
            local l_21_2 = table.getn(l_21_1)
            for l_21_3 = 1, l_21_2 do
               local l_21_6 = resolveTable(l_21_1[l_21_3].value)
               if entityHasGrandmother(l_21_6) == true then
                  showRule("zebrassecondbreeding")
                  return 1
               end
            end
         else
            BFLOG(SYSTRACE, "no zebratable")
         end
      end
      if existNumChildren("LemurRingtailed", 1) == true then
         showRule("lemursfirstbreeding")
         if l_21_arg0.showlemurpanel == nil then
            l_21_arg0.showlemurpanel = 1
            showprimarygoals()
         end
         if l_21_arg0.extralemur == nil then
            l_21_arg0.extralemur = 1
         elseif l_21_arg0.extralemur == 1 then
            l_21_arg0.extralemur = -1
            local l_21_1 = findType("LemurRingtailed_Adult_M")
            placeObject("LemurRingtailed_Adult_M", 100, 30, 0)
            local l_21_2 = findType("LemurRingtailed_Adult_M")
            crateNewEntity(l_21_1, l_21_2)
            genericokpanel(nil, "SpeciesSurvival:SecondGenerationBreedingBonusAnimal")
         end
         -- Tried to add an 'end' here but it's incorrect
         if l_21_arg0.extralemur ~= nil then
            BFLOG("Checking for grandmothers")
            local l_21_1 = findType("LemurRingtailed")
            if l_21_1 then
               local l_21_2 = table.getn(l_21_1)
               for l_21_3 = 1, l_21_2 do
                  local l_21_6 = resolveTable(l_21_1[l_21_3].value)
                  if entityHasGrandmother(l_21_6) == true then
                     showRule("lemurssecondbreeding")
                     return 1
                  end
               end
            else
               BFLOG(SYSTRACE, "no lemurtable")
            end
         end
         if existNumChildren("Chimpanzee", 1) == true then
            showRule("chimpsfirstbreeding")
            if l_21_arg0.showchimppanel == nil then
               l_21_arg0.showchimppanel = 1
               showprimarygoals()
            end
            if l_21_arg0.extrachimp == nil then
               l_21_arg0.extrachimp = 1
            elseif l_21_arg0.extrachimp == 1 then
               l_21_arg0.extrachimp = -1
               local l_21_1 = findType("Chimpanzee_Adult_M")
               placeObject("Chimpanzee_Adult_M", 100, 30, 0)
               local l_21_2 = findType("Chimpanzee_Adult_M")
               crateNewEntity(l_21_1, l_21_2)
               genericokpanel(nil, "SpeciesSurvival:SecondGenerationBreedingBonusAnimal")
            end
            -- Tried to add an 'end' here but it's incorrect
            if l_21_arg0.extrachimp ~= nil then
               local l_21_1 = findType("Chimpanzee")
               if l_21_1 then
                  local l_21_2 = table.getn(l_21_1)
                  for l_21_3 = 1, l_21_2 do
                     local l_21_6 = resolveTable(l_21_1[l_21_3].value)
                     if entityHasGrandmother(l_21_6) == true then
                        showRule("chimpssecondbreeding")
                        return 1
                     end
                  end
               else
                  BFLOG(SYSTRACE, "no chimptable")
               end
            end
            if l_21_arg0.numBonusAnimals == nil then
               l_21_arg0.numBonusAnimals = 0
            end
            if l_21_arg0.randTimer == nil then
               l_21_arg0.randTimer = getCurrentMonth() + 2
               BFLOG(SYSTRACE, "Seeding the month. Target Month: " .. l_21_arg0.randTimer)
            end
            if l_21_arg0.numBonusAnimals < 3 then
               local l_21_1 = getCurrentMonth()
               if l_21_arg0.randTimer <= l_21_1 then
                  giveRandomAnimalScen3()
                  l_21_arg0.numBonusAnimals = l_21_arg0.numBonusAnimals + 1
                  l_21_arg0.randTimer = getCurrentMonth() + 2
               end
            end
            return 0
end

completesecondgenerationbreeding = function()
   enableAnimalAdoption()
   setuservar("SpeciesSurvivalscenario3", "completed")
   setuservar("Pandascampaign", "unlocked")
   showscenariowin("SpeciesSurvival:SecondGenerationSuccessoverview", nil)
end

failsecondgenerationbreeding = function()
   local l_23_0 = getLocID("SpeciesSurvival:SecondGenerationFailureoverview")
   local l_23_1 = string.format(l_23_0, getlocidfromspecies(failAnimal))
   setalttext("SecondGenerationbreeding", "failure", l_23_1)
   setaltoverviewtext("SecondGenerationbreeding", "failure", l_23_1)
   showscenariofailtext(l_23_1, "SpeciesSurvivalscenario3")
end

giveRandomAnimalScen2 = function(l_24_arg0)
   if l_24_arg0.numBonusAnimals == nil then
      l_24_arg0.numBonusAnimals = 0
   elseif l_24_arg0.numBonusAnimals >= 3 then
      BFLOG(SYSTRACE, "We have given all the animals we can give")
      return 1
   end
   if l_24_arg0.randTimer == nil then
      BFLOG(SYSTRACE, "Seeding the month")
      l_24_arg0.randTimer = getCurrentMonth() + 2
   end
   local l_24_1 = getCurrentMonth()
   if l_24_1 < l_24_arg0.randTimer then
      return 1
   end
   local l_24_2 = {}
   l_24_2[1] = "TigerBengal"
   l_24_2[2] = "KangarooRed"
   l_24_2[3] = "Chimpanzee"
   l_24_2[4] = "BearGrizzly"
   l_24_2[5] = "ElephantAfrican"
   local l_24_3 = math.random(5)
   local l_24_4 = ""
   if math.random(2) == 1 then
      l_24_4 = "M"
   else
      l_24_4 = "F"
   end
   local l_24_5 = l_24_2[l_24_3] .. "_Adult_" .. l_24_4
   BFLOG(SYSTRACE, "------ANIMAL TYPE = " .. l_24_5)
   local l_24_6 = l_24_2[l_24_3] .. "_Adult_" .. l_24_4
   local l_24_7 = findType(l_24_6)
   placeObject(l_24_6, 60, 30, 0)
   local l_24_8 = findType(l_24_6)
   for l_24_9 = 1, table.getn(l_24_8) do
      local l_24_12 = false
      local l_24_13 = 0
      for l_24_14 = 1, table.getn(l_24_7) do
         local l_24_17 = resolveTable(l_24_8[l_24_9].value)
         local l_24_18 = resolveTable(l_24_7[l_24_14].value)
         if areCompsEqual(l_24_17, l_24_18) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_24_12 = true
         end
      end
      if l_24_12 == false then
         BFLOG(SYSTRACE, "i = " .. l_24_9)
         local l_24_14 = resolveTable(l_24_8[l_24_9].value)
         crateEntity(l_24_14)
   else
      end
   end
   genericokpanel(nil, "SpeciesSurvival:EndangeredAnimalsBreedingBonusAnimal")
   l_24_arg0.numBonusAnimals = l_24_arg0.numBonusAnimals + 1
   l_24_arg0.randTimer = getCurrentMonth() + 2
   return 1
end

giveRandomAnimalScen3 = function()
   local l_25_0 = {}
   l_25_0[1] = "Jaguar"
   l_25_0[2] = "CamelDromedary"
   l_25_0[3] = "BearPolar"
   l_25_0[4] = "PenguinEmperor"
   l_25_0[5] = "Okapi"
   local l_25_1 = math.random(5)
   local l_25_2 = ""
   if math.random(2) == 1 then
      l_25_2 = "M"
   else
      l_25_2 = "F"
   end
   local l_25_3 = l_25_0[l_25_1] .. "_Adult_" .. l_25_2
   local l_25_4 = findType(l_25_3)
   placeObject(l_25_3, 100, 30, 0)
   local l_25_5 = findType(l_25_3)
   for l_25_6 = 1, table.getn(l_25_5) do
      local l_25_9 = false
      local l_25_10 = 0
      for l_25_11 = 1, table.getn(l_25_4) do
         local l_25_14 = resolveTable(l_25_5[l_25_6].value)
         local l_25_15 = resolveTable(l_25_4[l_25_11].value)
         if areCompsEqual(l_25_14, l_25_15) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_25_9 = true
         end
      end
      if l_25_9 == false then
         BFLOG(SYSTRACE, "i = " .. l_25_6)
         local l_25_11 = resolveTable(l_25_5[l_25_6].value)
         crateEntity(l_25_11)
   else
      end
   end
   genericokpanel(nil, "SpeciesSurvival:SecondGenerationBreedingBonusAnimal")
   return true
end


