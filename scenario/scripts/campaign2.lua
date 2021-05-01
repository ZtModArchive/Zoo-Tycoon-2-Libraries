include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "*********I'm here so show overview panel!********")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

setinitialzoostatesmuggle = function(l_2_arg0)
   if adoptionDisabled == nil then
      disableAnimalAdoption()
      adoptionDisabled = 1
      if l_2_arg0.showpanel == nil then
         completeshowoverview()
         showUI("goal panel", true)
         l_2_arg0.showpanel = 1
      end
   end
   return 1
end

evalcratedelephant = function(l_3_arg0)
   include("scenario/scripts/entity.lua")
   include("scenario/scripts/needs.lua")
   if thisManyExist("ElephantAfrican", 1) == true then
      if allNeedSatisfied("ElephantAfrican", "environment") == true then
         return 1
      else
         BFLOG(SYSTRACE, "elephant is here but environment need not met")
         return 0
      end
   else
      BFLOG(SYSTRACE, "elephant not out yet")
   end
   -- Tried to add an 'end' here but it's incorrect
end

completecratedelephant = function(l_4_arg0)
   BFLOG(SYSTRACE, "Adopted an elephant!")
   showRule("meetelephantneeds")
   showprimarygoals()
end

evalmeetbasicneeds = function(l_5_arg0)
   BFLOG(SYSTRACE, "Checking the elephant needs")
   if thisManyExist("ElephantAfrican", 1) == true then
      if typeBasicNeedsSatisfied("ElephantAfrican") == true then
         return 1
      else
         BFLOG(SYSTRACE, "all needs don't meet threshold")
         return 0
      end
   end
   return 0
end

completemeetbasicneeds = function(l_6_arg0)
   BFLOG(SYSTRACE, "met basic needs, getting more elephants!")
   showRule("fourelephants")
   showRule("getthreemoreelephants")
   showRule("meetenvironment")
   showRule("happyelephants")
   completeshowoverview()
   local l_6_1 = findType("ElephantAfrican")
   local l_6_2 = 0
   l_6_2 = table.getn(l_6_1)
   if l_6_2 ~= 1 then
      BFLOG(SYSTRACE, "Problem with completemeetbasicneeds")
   end
   local l_6_3 = resolveTable(l_6_1[1].value)
   placeObject("ElephantAfrican_Adult_M", 85, 35, 0)
   placeObject("ElephantAfrican_Adult_F", 85, 35, 0)
   placeObject("ElephantAfrican_Adult_F", 85, 35, 0)
   local l_6_4 = findType("ElephantAfrican")
   local l_6_5 = 0
   l_6_5 = table.getn(l_6_4)
   BFLOG(SYSTRACE, "num: " .. l_6_5 .. ".")
   for l_6_6 = 1, l_6_5 do
      local l_6_9 = resolveTable(l_6_4[l_6_6].value)
      if l_6_9 ~= l_6_3 then
         crateEntity(l_6_9)
      end
   end
end

evalthreemoreelephants = function(l_7_arg0)
   if countTypeDirect("ElephantAfrican") == 4 then
      return 1
   else
      BFLOG(SYSTRACE, "new elephants not out yet")
   end
end

evalmeetenvironmentfourelephants = function(l_8_arg0)
   if countTypeDirect("ElephantAfrican") == 4 then
      if allNeedSatisfied("ElephantAfrican", "environment") == true then
         return 1
      else
         BFLOG(SYSTRACE, "four elephants here but environment need not met")
         return 0
      end
   end
   return 0
end

evalhappyelephants = function(l_9_arg0)
   BFLOG(SYSTRACE, "evalhappyelephants")
   if l_9_arg0.startevalhappyelephants == nil then
      l_9_arg0.startevalhappyelephants = 1
      l_9_arg0.startbad = {}
      l_9_arg0.startgood = {}
      l_9_arg0.happyelephanttimer = getCurrentMonth()
      l_9_arg0.happyelephanttimerday = getCurrentTimeOfDay()
      local l_9_1 = findType("ElephantAfrican")
      local l_9_2 = 0
      l_9_2 = table.getn(l_9_1)
      if l_9_2 ~= 4 then
         BFLOG(SYSTRACE, "You have a strange number of elephants!!!!!")
      end
      l_9_arg0.startbad = {}
      l_9_arg0.startgood = {}
      l_9_arg0.animalsave = {}
      for l_9_3 = 1, l_9_2 do
         l_9_arg0.animalsave[l_9_3] = l_9_1[l_9_3]
         l_9_arg0.animalsave[l_9_3].id = l_9_3
         local l_9_6 = resolveTable(l_9_1[l_9_3].value)
         l_9_arg0.startbad[l_9_3] = getNeedPointsBadCum(l_9_6)
         l_9_arg0.startgood[l_9_3] = getNeedPointsGoodCum(l_9_6)
         if getNeedPointsBadCum(l_9_6) ~= nil then
            BFLOG(SYSTRACE, "Bad: " .. getNeedPointsBadCum(l_9_6) .. ".")
         end
         if getNeedPointsGoodCum(l_9_6) ~= nil then
            BFLOG(SYSTRACE, "Good: " .. getNeedPointsGoodCum(l_9_6) .. ".")
         end
      end
   end
   local l_9_1 = getCurrentMonth()
   local l_9_2 = getCurrentTimeOfDay()
   BFLOG(SYSTRACE, "start month: " .. l_9_arg0.happyelephanttimer .. "   current month: " .. l_9_1)
   BFLOG(SYSTRACE, "start day: " .. l_9_arg0.happyelephanttimerday .. "  current day: " .. l_9_2)
   if (l_9_arg0.happyelephanttimer + 2 <= l_9_1 and l_9_arg0.happyelephanttimerday <= l_9_2) or l_9_arg0.happyelephanttimer + 3 <= l_9_1 then
      BFLOG(SYSTRACE, "Finishing evalhappyelephants goal")
      l_9_arg0.endbad = {}
      l_9_arg0.endgood = {}
      local l_9_3 = table.getn(l_9_arg0.animalsave)
      if l_9_3 ~= 4 then
         BFLOG(SYSTRACE, "You have a strange number of elephants!!!!!")
         if l_9_3 < 4 then
            BFLOG("You have < 4 elephants.  Most likely one of them died.")
            return -1
         end
      end
      for l_9_4 = 1, l_9_3 do
         BFLOG(SYSTRACE, "i = " .. l_9_4 .. ".")
         local l_9_7 = resolveTable(l_9_arg0.animalsave[l_9_4].value)
         if l_9_7 == nil then
            return -1
         end
         local l_9_8 = l_9_arg0.endbad
         local l_9_9 = l_9_arg0.animalsave[l_9_4].id
         l_9_8[l_9_9] = getNeedPointsBadCum(l_9_7)
         l_9_8 = l_9_arg0.endgood
         l_9_9 = l_9_arg0.animalsave
         l_9_9 = l_9_9[l_9_4]
         l_9_9 = l_9_9.id
         l_9_8[l_9_9] = getNeedPointsGoodCum(l_9_7)
         l_9_8 = getNeedPointsBadCum
         l_9_9 = l_9_7
         l_9_8 = l_9_8(l_9_9)
         if l_9_8 ~= nil then
            l_9_8 = BFLOG
            l_9_9 = SYSTRACE
            l_9_8(l_9_9, "Bad: " .. getNeedPointsBadCum(l_9_7) .. ".")
         end
         l_9_8 = getNeedPointsGoodCum
         l_9_9 = l_9_7
         l_9_8 = l_9_8(l_9_9)
         if l_9_8 ~= nil then
            l_9_8 = BFLOG
            l_9_9 = SYSTRACE
            l_9_8(l_9_9, "Good: " .. getNeedPointsGoodCum(l_9_7) .. ".")
         end
      end
      for l_9_4 = 1, l_9_3 do
         local l_9_7 = l_9_arg0.endgood[l_9_arg0.animalsave[l_9_4].id] - l_9_arg0.startgood[l_9_arg0.animalsave[l_9_4].id]
         local l_9_8 = l_9_arg0.endbad[l_9_arg0.animalsave[l_9_4].id] - l_9_arg0.startbad[l_9_arg0.animalsave[l_9_4].id]
         BFLOG(SYSTRACE, "!!!!!!!!  goodval = " .. l_9_7 .. "    badval = " .. l_9_8 .. ".")
         if l_9_7 - l_9_8 < 0 then
            return -1
         end
      end
      return 1
   end
   return 0
end

completethreemoreelephants = function()
   BFLOG(SYSTRACE, "WIN")
   local l_10_0 = getuservar("campaign2scenario2")
   if l_10_0 ~= "completed" then
      setuservar("campaign2scenario2", "unlocked")
   end
   setuservar("campaign2scenario1", "completed")
   showscenariowin("ElephantHerdScenarioGoals:finishmeetneedsoverview", "campaign2scenario2")
end

failthreemoreelephants = function()
   showscenariofail("ElephantHerdScenarioGoals:failedmeetneeds", "campaign2scenario1")
end

evalcratedzebras = function()
   if countTypeDirect("ZebraCommon") == 6 then
      if allNeedSatisfied("ZebraCommon", "environment") == true then
         return 1
      else
         BFLOG(SYSTRACE, "zebras here but environment need not met")
         return 0
      end
   -- Tried to add an 'end' here but it's incorrect
   else
   end
end

evalcratedlions = function()
   BFLOG(SYSTRACE, "evalcratedlions")
   if countTypeDirect("Lion") == 8 then
      if allNeedSatisfied("Lion", "environment") == true then
         return 1
      else
         BFLOG(SYSTRACE, "lions here but environment need not met")
         return 0
      end
   -- Tried to add an 'end' here but it's incorrect
   else
   end
end

evalmeetgroupsbasicneeds = function()
   if uidisable == nil then
      local l_14_0 = queryObject("BFScenarioMgr")
      if l_14_0 then
         l_14_0:UI_DISABLE("put up for adoption")
         uidisable = 1
      end
   end
   local l_14_0 = {}
   local l_14_1 = queryObject("ZTStatus")
   if l_14_1 then
      l_14_0 = l_14_1:ZT_GET_ALL_ANIMALS_RELEASED()
   end
   local l_14_2 = countType("Lion") + howManyEntityInTable(l_14_0, "Lion_Adult_F") + howManyEntityInTable(l_14_0, "Lion_Adult_M")
   local l_14_3 = countType("ZebraCommon") + howManyEntityInTable(l_14_0, "ZebraCommon_Adult_F") + howManyEntityInTable(l_14_0, "ZebraCommon_Adult_M")
   if l_14_2 < 8 then
      gWhatAnimal = "Lion"
      return -1
   elseif l_14_3 < 6 then
      BFLOG(SYSNOTE, "We have lost a Zebra!")
      gWhatAnimal = "ZebraCommon"
      return -1
   elseif typeBasicNeedsSatisfied("ZebraCommon") == true and typeBasicNeedsSatisfied("Lion") == true then
      return 1
   end
end

completezebrasandlions = function()
   BFLOG(SYSTRACE, "Zebras and lions in good shape!")
   showRule("adoptchimps")
   completeshowoverview()
   for l_15_0 = 1, 7 do
      placeObject("Chimpanzee_Adult_F", 30, 10, 0)
   end
   local l_15_0 = findType("Chimpanzee")
   local l_15_1 = 0
   l_15_1 = table.getn(l_15_0)
   for l_15_2 = 1, l_15_1 do
      local l_15_5 = resolveTable(l_15_0[l_15_2].value)
      giveEntityBasicNeedTrouble(l_15_5, 2)
      crateEntity(l_15_5)
   end
   giveCashNoPopup(8000)
end

evalcratedchimps = function()
   if uidisable == nil then
      local l_16_0 = queryObject("BFScenarioMgr")
      if l_16_0 then
         l_16_0:UI_DISABLE("put up for adoption")
         uidisable = 1
      end
   end
   if countTypeDirect("Chimpanzee") == 7 then
      if typeBasicNeedsSatisfied("Chimpanzee") == true then
         return 1
      else
         BFLOG(SYSTRACE, "chimps here but basic needs not met")
         return 0
      end
   else
      local l_16_0 = queryObject("ZTStatus")
      if l_16_0 then
         local l_16_1 = l_16_0:ZT_GET_ALL_ANIMALS_RELEASED()
         if countType("Chimpanzee") + howManyEntityInTable(l_16_1, "Chimpanzee_Adult_F") + howManyEntityInTable(l_16_1, "Chimpanzee_Adult_M") < 7 then
            return -1
         elseif countType("Lion") + howManyEntityInTable(l_16_1, "Lion_Adult_F") + howManyEntityInTable(l_16_1, "Lion_Adult_M") < 8 then
            return -1
         else
            gWhatAnimal, gWhatAnimal = "Lion", "Chimpanzee"
            if countType("ZebraCommon") + howManyEntityInTable(l_16_1, "ZebraCommon_Adult_F") + howManyEntityInTable(l_16_1, "ZebraCommon_Adult_M") < 6 then
               gWhatAnimal = "ZebraCommon"
               return -1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
end

completecamp2scen2 = function()
   BFLOG(SYSTRACE, "WIN")
   local l_17_0 = getuservar("campaign2scenario3")
   if l_17_0 ~= "completed" then
      setuservar("campaign2scenario3", "unlocked")
   end
   setuservar("campaign2scenario2", "completed")
   showscenariowin("CruelConditions:finishCruelscenariooverview", "campaign2scenario3")
end

failcamp2scen2 = function()
   local l_18_0 = getlocidfromspecies(gWhatAnimal)
   local l_18_1 = getLocID("CruelConditions:failedCruelscenariooverview")
   local l_18_2 = string.format(l_18_1, l_18_0)
   showscenariofailtext(l_18_2, "campaign2scenario2")
end

evalkangaroo = function(l_19_arg0)
   BFLOG(SYSTRACE, "evalkangaroo")
   if l_19_arg0.kangarootimer == nil then
      BFLOG(SYSTRACE, "Setting the comp.kangarootimer")
      l_19_arg0.kangarootimer = getCurrentTimeOfDay()
   end
   local l_19_1 = getCurrentTimeOfDay()
   local l_19_2 = 0
   if l_19_arg0.kangarootimer <= l_19_1 then
      l_19_2 = l_19_1 - l_19_arg0.kangarootimer
      BFLOG(SYSTRACE, "setting dif = " .. l_19_2 .. ".")
   else
      l_19_2 = 1 - l_19_arg0.kangarootimer + l_19_1
      BFLOG(SYSTRACE, "setting dif = " .. l_19_2 .. ".")
   end
   if gLoaded == nil and l_19_2 > 0.088 then
      l_19_arg0.kangarootimer = l_19_1 - 0.01
      l_19_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_19_arg0.kangarootimer .. "  timenow = " .. l_19_1 .. "  dif = " .. l_19_2 .. ".")
   if l_19_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("Kangaroo") >= 1 then
         if allNeedMeetsThreshold("Kangaroo", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "Kangaroo"
            return -1
         end
      end
      if countTypeDirect("Kangaroo") < 1 then
         BFLOG(SYSTRACE, "about to fail kangaroo")
         gWhatAnimal = "Kangaroo"
         return -1
      end
   end
   return 0
end

completekangaroo = function(l_20_arg0)
   BFLOG(SYSTRACE, "completekangaroo")
   if l_20_arg0.gavetiger == nil then
      placeObject("TigerBengal_Adult_M", 135, 20, 0)
      local l_20_1 = findType("TigerBengal")
      local l_20_2 = resolveTable(l_20_1[1].value)
      giveEntityPressingRandAdvancedNeed(l_20_2)
      giveEntityPressingRandAdvancedNeed(l_20_2)
      crateEntity(l_20_2)
      showRule("bengaltiger")
      showprimarygoals()
      l_20_arg0.gavetiger = 1
   end
end

evalbengaltiger = function(l_21_arg0)
   BFLOG(SYSTRACE, "evalbengaltiger")
   if l_21_arg0.tigertimer == nil then
      l_21_arg0.tigertimer = getCurrentTimeOfDay()
   end
   local l_21_1 = getCurrentTimeOfDay()
   local l_21_2 = 0
   if l_21_arg0.tigertimer <= l_21_1 then
      l_21_2 = l_21_1 - l_21_arg0.tigertimer
      BFLOG(SYSTRACE, "setting dif = " .. l_21_2 .. ".")
   else
      l_21_2 = 1 - l_21_arg0.tigertimer + l_21_1
      BFLOG(SYSTRACE, "setting dif = " .. l_21_2 .. ".")
   end
   if gLoaded == nil and l_21_2 > 0.088 then
      l_21_arg0.tigertimer = l_21_1 - 0.01
      l_21_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_21_arg0.tigertimer .. "  timenow = " .. l_21_1 .. "  dif = " .. l_21_2 .. ".")
   if l_21_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("TigerBengal") >= 1 then
         if allNeedMeetsThreshold("TigerBengal", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "TigerBengal"
            return -1
         end
      end
      if countTypeDirect("TigerBengal") < 1 then
         BFLOG(SYSTRACE, "about to fail tiger")
         gWhatAnimal = "TigerBengal"
         return -1
      end
   end
   return 0
end

completebengaltiger = function(l_22_arg0)
   BFLOG(SYSTRACE, "completebengaltiger")
   if l_22_arg0.gavegrizzly == nil then
      placeObject("BearGrizzly_Adult_M", 135, 20, 0)
      local l_22_1 = findType("BearGrizzly")
      local l_22_2 = resolveTable(l_22_1[1].value)
      giveEntityPressingRandAdvancedNeed(l_22_2)
      giveEntityPressingRandAdvancedNeed(l_22_2)
      crateEntity(l_22_2)
      showRule("grizzlybear")
      showprimarygoals()
      l_22_arg0.gavegrizzly = 1
   end
end

evalgrizzlybear = function(l_23_arg0)
   BFLOG(SYSTRACE, "evalgrizzlybear")
   if l_23_arg0.grizzlytimer == nil then
      l_23_arg0.grizzlytimer = getCurrentTimeOfDay()
   end
   local l_23_1 = getCurrentTimeOfDay()
   local l_23_2 = 0
   if l_23_arg0.grizzlytimer <= l_23_1 then
      l_23_2 = l_23_1 - l_23_arg0.grizzlytimer
      BFLOG(SYSTRACE, "setting dif = " .. l_23_2 .. ".")
   else
      l_23_2 = 1 - l_23_arg0.grizzlytimer + l_23_1
      BFLOG(SYSTRACE, "setting dif = " .. l_23_2 .. ".")
   end
   if gLoaded == nil and l_23_2 > 0.088 then
      l_23_arg0.grizzlytimer = l_23_1 - 0.01
      l_23_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_23_arg0.grizzlytimer .. "  timenow = " .. l_23_1 .. "  dif = " .. l_23_2 .. ".")
   if l_23_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("BearGrizzly") >= 1 then
         if allNeedMeetsThreshold("BearGrizzly", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "BearGrizzly"
            return -1
         end
      end
      if countTypeDirect("BearGrizzly") < 1 then
         BFLOG(SYSTRACE, "about to fail grizzly")
         gWhatAnimal = "BearGrizzly"
         return -1
      end
   end
   return 0
end

completegrizzlybear = function(l_24_arg0)
   BFLOG(SYSTRACE, "completegrizzlybear")
   if l_24_arg0.gavegorilla == nil then
      placeObject("GorillaMountain_Adult_F", 135, 20, 0)
      local l_24_1 = findType("GorillaMountain")
      local l_24_2 = resolveTable(l_24_1[1].value)
      giveEntityPressingRandAdvancedNeed(l_24_2)
      giveEntityPressingRandAdvancedNeed(l_24_2)
      crateEntity(l_24_2)
      showRule("gorilla")
      showprimarygoals()
      l_24_arg0.gavegorilla = 1
   end
end

evalgorilla = function(l_25_arg0)
   BFLOG(SYSTRACE, "evalgorilla")
   if l_25_arg0.gorillatimer == nil then
      l_25_arg0.gorillatimer = getCurrentTimeOfDay()
   end
   local l_25_1 = getCurrentTimeOfDay()
   local l_25_2 = 0
   if l_25_arg0.gorillatimer <= l_25_1 then
      l_25_2 = l_25_1 - l_25_arg0.gorillatimer
      BFLOG(SYSTRACE, "setting dif = " .. l_25_2 .. ".")
   else
      l_25_2 = 1 - l_25_arg0.gorillatimer + l_25_1
      BFLOG(SYSTRACE, "setting dif = " .. l_25_2 .. ".")
   end
   if gLoaded == nil and l_25_2 > 0.088 then
      l_25_arg0.gorillatimer = l_25_1 - 0.01
      l_25_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_25_arg0.gorillatimer .. "  timenow = " .. l_25_1 .. "  dif = " .. l_25_2 .. ".")
   if l_25_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("GorillaMountain") >= 1 then
         if allNeedMeetsThreshold("GorillaMountain", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "GorillaMountain"
            return -1
         end
      end
      if countTypeDirect("GorillaMountain") < 1 then
         BFLOG(SYSTRACE, "about to fail gorilla")
         gWhatAnimal = "GorillaMountain"
         return -1
      end
   end
   return 0
end

completegorilla = function(l_26_arg0)
   BFLOG(SYSTRACE, "completegorilla")
   if l_26_arg0.gaverhino == nil then
      placeObject("RhinocerosBlack_Adult_M", 135, 20, 0)
      local l_26_1 = findType("RhinocerosBlack")
      local l_26_2 = resolveTable(l_26_1[1].value)
      giveEntityPressingRandAdvancedNeed(l_26_2)
      giveEntityPressingRandAdvancedNeed(l_26_2)
      crateEntity(l_26_2)
      showRule("rhino")
      showprimarygoals()
      l_26_arg0.gaverhino = 1
   end
end

evalrhino = function(l_27_arg0)
   BFLOG(SYSTRACE, "evalrhino")
   if l_27_arg0.rhinotimer == nil then
      l_27_arg0.rhinotimer = getCurrentTimeOfDay()
   end
   local l_27_1 = getCurrentTimeOfDay()
   local l_27_2 = 0
   if l_27_arg0.rhinotimer <= l_27_1 then
      l_27_2 = l_27_1 - l_27_arg0.rhinotimer
      BFLOG(SYSTRACE, "setting dif = " .. l_27_2 .. ".")
   else
      l_27_2 = 1 - l_27_arg0.rhinotimer + l_27_1
      BFLOG(SYSTRACE, "setting dif = " .. l_27_2 .. ".")
   end
   if gLoaded == nil and l_27_2 > 0.088 then
      l_27_arg0.rhinotimer = l_27_1 - 0.01
      l_27_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_27_arg0.rhinotimer .. "  timenow = " .. l_27_1 .. "  dif = " .. l_27_2 .. ".")
   if l_27_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("RhinocerosBlack") >= 1 then
         if allNeedMeetsThreshold("RhinocerosBlack", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "RhinocerosBlack"
            return -1
         end
      end
      if countTypeDirect("RhinocerosBlack") < 1 then
         BFLOG(SYSTRACE, "about to fail rhino")
         gWhatAnimal = "RhinocerosBlack"
         return -1
      end
   end
   return 0
end

completerhino = function(l_28_arg0)
   BFLOG(SYSTRACE, "completerhino")
   if l_28_arg0.gaveelephant == nil then
      placeObject("ElephantAfrican_Adult_M", 135, 20, 0)
      local l_28_1 = findType("ElephantAfrican")
      local l_28_2 = resolveTable(l_28_1[1].value)
      giveEntityPressingRandAdvancedNeed(l_28_2)
      giveEntityPressingRandAdvancedNeed(l_28_2)
      crateEntity(l_28_2)
      showRule("elephant")
      showprimarygoals()
      l_28_arg0.gaveelephant = 1
   end
end

evalelephant = function(l_29_arg0)
   BFLOG(SYSTRACE, "evalelephant")
   if l_29_arg0.elephanttimer == nil then
      l_29_arg0.elephanttimer = getCurrentTimeOfDay()
   end
   local l_29_1 = getCurrentTimeOfDay()
   local l_29_2 = 0
   if l_29_arg0.elephanttimer <= l_29_1 then
      l_29_2 = l_29_1 - l_29_arg0.elephanttimer
      BFLOG(SYSTRACE, "setting dif = " .. l_29_2 .. ".")
   else
      l_29_2 = 1 - l_29_arg0.elephanttimer + l_29_1
      BFLOG(SYSTRACE, "setting dif = " .. l_29_2 .. ".")
   end
   if gLoaded == nil and l_29_2 > 0.088 then
      l_29_arg0.elephanttimer = l_29_1 - 0.01
      l_29_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_29_arg0.elephanttimer .. "  timenow = " .. l_29_1 .. "  dif = " .. l_29_2 .. ".")
   if l_29_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("ElephantAfrican") >= 1 then
         if allNeedMeetsThreshold("ElephantAfrican", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "ElephantAfrican"
            return -1
         end
      end
      if countTypeDirect("ElephantAfrican") < 1 then
         BFLOG(SYSTRACE, "about to fail elephant")
         gWhatAnimal = "ElephantAfrican"
         return -1
      end
   end
   return 0
end

completeelephant = function(l_30_arg0)
   BFLOG(SYSTRACE, "completeelephant")
   if l_30_arg0.gavesnow == nil then
      placeObject("LeopardSnow_Adult_M", 135, 20, 0)
      local l_30_1 = findType("LeopardSnow")
      local l_30_2 = resolveTable(l_30_1[1].value)
      giveEntityPressingRandAdvancedNeed(l_30_2)
      giveEntityPressingRandAdvancedNeed(l_30_2)
      crateEntity(l_30_2)
      showRule("snowleopard")
      showprimarygoals()
      l_30_arg0.gavesnow = 1
   end
end

evalsnowleopard = function(l_31_arg0)
   BFLOG(SYSTRACE, "evalsnowleopard")
   if l_31_arg0.snowtimer == nil then
      l_31_arg0.snowtimer = getCurrentTimeOfDay()
   end
   local l_31_1 = getCurrentTimeOfDay()
   local l_31_2 = 0
   if l_31_arg0.snowtimer <= l_31_1 then
      l_31_2 = l_31_1 - l_31_arg0.snowtimer
      BFLOG(SYSTRACE, "setting dif = " .. l_31_2 .. ".")
   else
      l_31_2 = 1 - l_31_arg0.snowtimer + l_31_1
      BFLOG(SYSTRACE, "setting dif = " .. l_31_2 .. ".")
   end
   if gLoaded == nil and l_31_2 > 0.088 then
      l_31_arg0.snowtimer = l_31_1 - 0.01
      l_31_2 = 0
      gLoaded = 1
   elseif loaded ~= 1 then
      gLoaded = 1
   end
   BFLOG(SYSNOTE, "timer = " .. l_31_arg0.snowtimer .. "  timenow = " .. l_31_1 .. "  dif = " .. l_31_2 .. ".")
   if l_31_2 > 0.1 then
      BFLOG(SYSTRACE, "TIME UP")
      if countTypeDirect("LeopardSnow") >= 1 then
         if allNeedMeetsThreshold("LeopardSnow", "environment", 30) == true then
            return 1
         else
            gWhatAnimal = "LeopardSnow"
            return -1
         end
      end
      if countTypeDirect("LeopardSnow") < 1 then
         BFLOG(SYSTRACE, "about to fail snow")
         gWhatAnimal = "LeopardSnow"
         return -1
      end
   end
   return 0
end

failmeetenvironment = function(l_32_arg0)
   local l_32_1 = getlocidfromspecies(gWhatAnimal)
   local l_32_2 = getLocID("SmugglingRing:SmugglingRingFailureoverview")
   local l_32_3 = string.format(l_32_2, l_32_1)
   showscenariofailtext(l_32_3, "campaign2scenario3")
end

completesnowleopard = function(l_33_arg0)
   showRule("letemgo")
   showprimarygoals()
end

evalreleasesmuggledanimals = function(l_34_arg0)
   if l_34_arg0.gaveAnimals == nil then
      l_34_arg0.gaveAnimals = 1
      local l_34_1 = findType("Kangaroo_Adult_F")
      placeObject("Kangaroo_Adult_F", 135, 20, 0)
      local l_34_2 = findType("Kangaroo_Adult_F")
      local l_34_3 = findNewEntity(l_34_1, l_34_2)
      giveEntityPressingRandAdvancedNeed(l_34_3)
      giveEntityPressingRandAdvancedNeed(l_34_3)
      crateEntity(l_34_3)
      l_34_1 = findType("TigerBengal_Adult_F")
      placeObject("TigerBengal_Adult_F", 135, 20, 0)
      local l_34_4 = findType("TigerBengal_Adult_F")
      local l_34_5 = findNewEntity(l_34_1, l_34_4)
      giveEntityPressingRandAdvancedNeed(l_34_5)
      giveEntityPressingRandAdvancedNeed(l_34_5)
      crateEntity(l_34_5)
      l_34_1 = findType("BearGrizzly_Adult_F")
      placeObject("BearGrizzly_Adult_F", 135, 20, 0)
      local l_34_6 = findType("BearGrizzly_Adult_F")
      local l_34_7 = findNewEntity(l_34_1, l_34_6)
      giveEntityPressingRandAdvancedNeed(l_34_7)
      giveEntityPressingRandAdvancedNeed(l_34_7)
      crateEntity(l_34_7)
      l_34_1 = findType("GorillaMountain_Adult_M")
      placeObject("GorillaMountain_Adult_M", 135, 20, 0)
      local l_34_8 = findType("GorillaMountain_Adult_M")
      local l_34_9 = findNewEntity(l_34_1, l_34_8)
      giveEntityPressingRandAdvancedNeed(l_34_9)
      giveEntityPressingRandAdvancedNeed(l_34_9)
      crateEntity(l_34_9)
      l_34_1 = findType("RhinocerosBlack_Adult_F")
      placeObject("RhinocerosBlack_Adult_F", 135, 20, 0)
      local l_34_10 = findType("RhinocerosBlack_Adult_F")
      local l_34_11 = findNewEntity(l_34_1, l_34_10)
      giveEntityPressingRandAdvancedNeed(l_34_11)
      giveEntityPressingRandAdvancedNeed(l_34_11)
      crateEntity(l_34_11)
      l_34_1 = findType("ElephantAfrican_Adult_F")
      placeObject("ElephantAfrican_Adult_F", 135, 20, 0)
      local l_34_12 = findType("ElephantAfrican_Adult_F")
      local l_34_13 = findNewEntity(l_34_1, l_34_12)
      giveEntityPressingRandAdvancedNeed(l_34_13)
      giveEntityPressingRandAdvancedNeed(l_34_13)
      crateEntity(l_34_13)
      l_34_1 = findType("LeopardSnow_Adult_F")
      placeObject("LeopardSnow_Adult_F", 135, 20, 0)
      local l_34_14 = findType("LeopardSnow_Adult_F")
      local l_34_15 = findNewEntity(l_34_1, l_34_14)
      giveEntityPressingRandAdvancedNeed(l_34_15)
      giveEntityPressingRandAdvancedNeed(l_34_15)
      crateEntity(l_34_15)
   end
   local l_34_1 = queryObject("ZTStatus")
   if l_34_1 then
      local l_34_2 = l_34_1:ZT_GET_ALL_ANIMALS_RELEASED()
      if l_34_2 then
         if table.getn(l_34_2) < 7 then
            return 0
         elseif l_34_arg0.kangs == nil and (howManyEntityInTable(l_34_2, "Kangaroo_Adult_F") > 0 or howManyEntityInTable(l_34_2, "Kangaroo_Adult_M") > 0) then
            l_34_arg0.kangs = true
         end
         if l_34_arg0.tigers == nil and (howManyEntityInTable(l_34_2, "TigerBengal_Adult_M") > 0 or howManyEntityInTable(l_34_2, "TigerBengal_Adult_F") > 0) then
            l_34_arg0.tigers = true
         end
         if l_34_arg0.bears == nil and (howManyEntityInTable(l_34_2, "BearGrizzly_Adult_M") > 0 or howManyEntityInTable(l_34_2, "BearGrizzly_Adult_F") > 0) then
            l_34_arg0.bears = true
         end
         if l_34_arg0.gorillas == nil and (howManyEntityInTable(l_34_2, "GorillaMountain_Adult_M") > 0 or howManyEntityInTable(l_34_2, "GorillaMountain_Adult_F") > 0) then
            l_34_arg0.gorillas = true
         end
         if l_34_arg0.rhinos == nil and (howManyEntityInTable(l_34_2, "RhinocerosBlack_Adult_M") > 0 or howManyEntityInTable(l_34_2, "RhinocerosBlack_Adult_F") > 0) then
            l_34_arg0.rhinos = true
         end
         if l_34_arg0.elephants == nil and (howManyEntityInTable(l_34_2, "ElephantAfrican_Adult_F") > 0 or howManyEntityInTable(l_34_2, "ElephantAfrican_Adult_M") > 0) then
            l_34_arg0.elephants = true
         end
         if l_34_arg0.leopards == nil and (howManyEntityInTable(l_34_2, "LeopardSnow_Adult_F") > 0 or howManyEntityInTable(l_34_2, "LeopardSnow_Adult_M") > 0) then
            l_34_arg0.leopards = true
         end
         if l_34_arg0.kangs and l_34_arg0.tigers and l_34_arg0.bears and l_34_arg0.gorillas and l_34_arg0.rhinos and l_34_arg0.elephants and l_34_arg0.leopards then
            return 1
         end
      end
      return 0
   else
      BFLOG(SYSTRACE, "Error querying zoo status")
   end
   return 0
end

completecamp2scen3 = function()
   setuservar("campaign2scenario3", "completed")
   setuservar("sundiallock", "true")
   local l_35_0 = getlocidfromspecies("Statue_Sundial_df")
   local l_35_1 = getLocID("itemunlock:newitemgeneral") .. l_35_0
   genericokpaneltext(nil, l_35_1)
   enableAnimalAdoption()
   showscenariowin("SmugglingRing:SmugglingRingPart2Successoverview", nil)
end

failcamp2scen3 = function()
end


