include("scenario/scripts/misc.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/economy.lua")
sickneedmet = function()
   local l_1_0 = queryObject("BFScenarioMgr")
   if l_1_0 and scen3UIDisabled ~= 1 then
      l_1_0:UI_DISABLE("put up for adoption")
      scen3UIDiabled = 1
   end
   if scen3DidAnimalDie() then
      return -1
   end
   if allNeedMeetsThreshold("animal", "health", 50) == true then
      return 1
   end
   BFLOG(SYSTRACE, "At least one animal is sick.")
   return 0
end

foodneedmet = function(l_2_arg0)
   local l_2_1 = queryObject("BFScenarioMgr")
   if l_2_1 and scen3UIDisabled ~= 1 then
      l_2_1:UI_DISABLE("put up for adoption")
      scen3UIDiabled = 1
   end
   if scen3DidAnimalDie() then
      return -1
   end
   if allNeedSatisfied("animal", "hunger") == true then
      return 1
   end
   BFLOG(SYSTRACE, "At least one animal is hungry.")
   return 0
end

gainzoofame = function()
   if getHalfStars() >= 6 then
      return 1
   end
   return 0
end

scen3failure = function()
   showscenariofail("genericscenariofailure:animaldiedsick", "campaign1scenario3")
end

scen3DidAnimalDie = function()
   local l_5_0 = {}
   local l_5_1 = queryObject("ZTStatus")
   if l_5_1 then
      l_5_0 = l_5_1:ZT_GET_ALL_ANIMALS_RELEASED()
   end
   if countType("BearGrizzly") + howManySpeciesInTable(l_5_0, "BearGrizzly") < 2 or countType("BeaverAmerican") + howManySpeciesInTable(l_5_0, "BeaverAmerican") < 1 or countType("ZebraCommon") + howManySpeciesInTable(l_5_0, "ZebraCommon") < 4 or countType("Moose") + howManySpeciesInTable(l_5_0, "Moose") < 2 then
      return true
   end
   return false
end

finishcampaign = function(l_6_arg0)
   setuservar("campaign1scenario3", "completed")
   local l_6_1 = queryObject("UIRoot")
   if l_6_1 then
      local l_6_2 = l_6_1:UI_GET_CHILD("goalpanel")
      if l_6_2 then
         l_6_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_6_3 = l_6_1:UI_GET_CHILD("Introduction tab")
      if l_6_3 then
         l_6_3:UI_ACTIVATE_OFF()
         l_6_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Winner.")
   setglobalvar("nextScenario", "campaign1scenario3")
   setuservar("flowerarchlock", "true")
   local l_6_2 = getlocidfromspecies("PathArch_Flower_df")
   local l_6_3 = getLocID("itemunlock:newitemgeneral") .. " " .. l_6_2
   genericokpaneltext(nil, l_6_3)
   enableAnimalAdoption()
   showscenariowin("C1scenariogoals:S4success", nil)
end

C1finalwin = function(l_7_arg0)
   incrementAwardPoints(5)
   local l_7_1 = queryObject("UIRoot")
   if l_7_1 then
      local l_7_2 = l_7_1:UI_GET_CHILD("goalpanel")
      if l_7_2 then
         l_7_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_7_3 = l_7_1:UI_GET_CHILD("Introduction tab")
      if l_7_3 then
         l_7_3:UI_ACTIVATE_OFF()
         l_7_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Winner.")
   enableAnimalAdoption()
   showscenariowin("C1scenariogoals:C1youwin", "campaign1scenario2")
end

failC1part1 = function()
   showscenariofail("C1scenariogoals:C1failanimaldeathoverview", "campaign1scenario1")
end

failC1 = function()
   showscenariofail("C1scenariogoals:C1failanimaldeathoverview", "campaign1scenario1")
end

setinitialzoostate = function(l_10_arg0)
   if disableUIelements == nil then
      local l_10_1 = countType("frontgate_df")
      if l_10_1 > 0 then
         BFLOG(SYSTRACE, "Disabling UI Elements")
         local l_10_2 = queryObject("BFScenarioMgr")
         if l_10_2 then
            disableUIelements = 1
            local l_10_3 = queryObject("UIRoot")
            if l_10_3 then
               local l_10_4 = l_10_3:UI_GET_CHILD("Introduction tab")
               if l_10_4 then
                  l_10_4:UI_ACTIVATE_OFF()
                  l_10_4:UI_ACTIVATE_ON()
               end
               local l_10_5 = l_10_3:UI_GET_CHILD("goalpanel")
               if l_10_5 then
                  l_10_5:ZT_AUTOPOPULATE_LIST()
               end
               local l_10_6 = l_10_3:UI_GET_CHILD("MainGUI")
               if l_10_6 then
                  local l_10_7 = l_10_6:UI_GET_CHILD("animals")
                  if l_10_7 then
                     l_10_7:UI_ACTIVATE_ON()
                  end
                  local l_10_8 = l_10_6:UI_GET_CHILD("Animal Enrichment Tab")
                  if l_10_8 then
                     l_10_8:UI_ACTIVATE_ON()
                  end
                  if l_10_7 then
                     l_10_7:UI_ACTIVATE_OFF()
                  end
               end
            end
            if l_10_arg0.showpanel == nil then
               BFLOG(SYSTRACE, "show goal panel overview")
               showUI("goals layout", true)
               l_10_2:UI_DISABLE("Buy Animal Tab")
               l_10_2:UI_DISABLE("Adopt Animal Tab")
               l_10_2:UI_DISABLE("open zoo toggle button")
               l_10_2:UI_DISABLE("release to wild")
               l_10_2:UI_DISABLE("put up for adoption")
               l_10_arg0.showpanel = 1
            end
            return 1
         end
      end
   end
   return 1
end

setinitialzoostatescenario2 = function(l_11_arg0)
   if disableUIelements2 == nil then
      local l_11_1 = countType("frontgate_df")
      if l_11_1 > 0 then
         BFLOG(SYSTRACE, "Disabling UI Elements")
         local l_11_2 = queryObject("BFScenarioMgr")
         if l_11_2 then
            disableUIelements2 = 1
            local l_11_3 = queryObject("UIRoot")
            if l_11_3 then
               local l_11_4 = l_11_3:UI_GET_CHILD("Introduction tab")
               if l_11_4 then
                  l_11_4:UI_ACTIVATE_OFF()
                  l_11_4:UI_ACTIVATE_ON()
               end
               local l_11_5 = l_11_3:UI_GET_CHILD("goalpanel")
               if l_11_5 then
                  l_11_5:ZT_AUTOPOPULATE_LIST()
               end
               local l_11_6 = l_11_3:UI_GET_CHILD("MainGUI")
               if l_11_6 then
                  local l_11_7 = l_11_6:UI_GET_CHILD("animals")
                  if l_11_7 then
                     l_11_7:UI_ACTIVATE_ON()
                  end
                  local l_11_8 = l_11_6:UI_GET_CHILD("Animal Enrichment Tab")
                  if l_11_8 then
                     l_11_8:UI_ACTIVATE_ON()
                  end
                  if l_11_7 then
                     l_11_7:UI_ACTIVATE_OFF()
                  end
               end
            end
            if l_11_arg0.showpanel == nil then
               BFLOG(SYSTRACE, "show goal panel overview")
               showUI("goals layout", true)
               l_11_2:UI_DISABLE("Buy Animal Tab")
               l_11_2:UI_DISABLE("Adopt Animal Tab")
               l_11_arg0.showpanel = 1
            end
            return 1
         end
      end
   end
   return 1
end

setinitialzoostatescenario3 = function(l_12_arg0)
   if showUIelements3 == nil then
      local l_12_1 = countType("frontgate_df")
      if l_12_1 > 0 then
         BFLOG(SYSTRACE, "Show UI Elements")
         showUIelements3 = 1
         local l_12_2 = queryObject("UIRoot")
         if l_12_2 then
            local l_12_3 = l_12_2:UI_GET_CHILD("Introduction tab")
            if l_12_3 then
               l_12_3:UI_ACTIVATE_OFF()
               l_12_3:UI_ACTIVATE_ON()
            end
            local l_12_4 = l_12_2:UI_GET_CHILD("goalpanel")
            if l_12_4 then
               l_12_4:ZT_AUTOPOPULATE_LIST()
            end
         end
         if l_12_arg0.showpanel == nil then
            BFLOG(SYSTRACE, "show goal panel overview")
            showUI("goals layout", true)
            l_12_arg0.showpanel = 1
         end
      end
   end
   return 1
end

completeprivacygoal = function(l_13_arg0)
   BFLOG(SYSTRACE, "Completed privacy goal")
   if l_13_arg0.privacygoalpanel == nil then
      local l_13_1 = queryObject("UIRoot")
      if l_13_1 then
         local l_13_2 = l_13_1:UI_GET_CHILD("goalpanel")
         if l_13_2 then
            l_13_2:ZT_AUTOPOPULATE_LIST()
         end
         local l_13_3 = l_13_1:UI_GET_CHILD("primary goals tab")
         if l_13_3 then
            l_13_3:UI_REPRESS()
            l_13_3:UI_ACTIVATE_ON()
         end
      end
      showUI("goals layout", true)
      l_13_arg0.privacygoalpanel = 1
   end
end

completeC1part1 = function(l_14_arg0)
   local l_14_1 = queryObject("BFScenarioMgr")
   if l_14_1 then
      l_14_1:BFS_SHOWRULE("C1Scenariopart2")
      l_14_1:UI_ENABLE("open zoo toggle button")
      l_14_1:UI_ENABLE("Buy Animal Tab")
      l_14_1:UI_ENABLE("Adopt Animal Tab")
   end
   giveCashNoPopup(5000)
   local l_14_2 = queryObject("UIRoot")
   if l_14_2 then
      local l_14_3 = l_14_2:UI_GET_CHILD("goalpanel")
      if l_14_3 then
         l_14_3:ZT_AUTOPOPULATE_LIST()
      end
      local l_14_4 = l_14_2:UI_GET_CHILD("Introduction tab")
      if l_14_4 then
         l_14_4:UI_REPRESS()
         l_14_4:UI_ACTIVATE_OFF()
         l_14_4:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Completed PART 1")
   showUI("goals layout", true)
end

completeC1scen2 = function(l_15_arg0)
   local l_15_1 = queryObject("BFScenarioMgr")
   if l_15_1 then
      l_15_1:UI_ENABLE("Buy Animal Tab")
      l_15_1:UI_ENABLE("Adopt Animal Tab")
   end
   giveCashNoPopup(5000)
   local l_15_2 = queryObject("UIRoot")
   if l_15_2 then
      local l_15_3 = l_15_2:UI_GET_CHILD("goalpanel")
      if l_15_3 then
         l_15_3:ZT_AUTOPOPULATE_LIST()
      end
      local l_15_4 = l_15_2:UI_GET_CHILD("Introduction tab")
      if l_15_4 then
         l_15_4:UI_ACTIVATE_OFF()
         l_15_4:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Completed PART 1")
   setuservar("campaign1scenario2", "completed")
   local l_15_3 = getuservar("campaign1scenario3")
   if l_15_3 ~= "completed" then
      setuservar("campaign1scenario3", "unlocked")
   end
   enableAnimalAdoption()
   showscenariowin("C1scenariogoals:S3success", "campaign1scenario3")
end

completeC1scen3part1 = function(l_16_arg0)
   local l_16_1 = queryObject("BFScenarioMgr")
   if l_16_1 then
      l_16_1:BFS_SHOWRULE("fame")
   end
   local l_16_2 = queryObject("UIRoot")
   if l_16_2 then
      local l_16_3 = l_16_2:UI_GET_CHILD("goalpanel")
      if l_16_3 then
         l_16_3:ZT_AUTOPOPULATE_LIST()
      end
      local l_16_4 = l_16_2:UI_GET_CHILD("Introduction tab")
      if l_16_4 then
         l_16_4:UI_ACTIVATE_OFF()
         l_16_4:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Completed PART 1")
   showUI("goals layout", true)
end

checkNoAnimalDeaths = function()
   local l_17_0 = countType("TigerBengal")
   local l_17_1 = countType("ElephantAfrican")
   local l_17_2 = countType("ZebraCommon")
   BFLOG(SYSTRACE, "NumTigers: " .. l_17_0 .. "  NumElephants: " .. l_17_1 .. "  NumZebras: " .. l_17_2)
   if l_17_0 < 1 or l_17_1 < 1 or l_17_2 < 3 then
      BFLOG(SYSTRACE, "At least one animal died! Returning false")
      return false
   end
   return true
end

animalbasicneeds = function(l_18_arg0)
   if checkNoAnimalDeaths() == false then
      return -1
   end
   if typeBasicNeedsSatisfied("animal") == true then
      return 1
   end
   BFLOG(SYSTRACE, "At least one animal does not have satisfied basic needs.")
   return 0
end

adoptnewanimal = function(l_19_arg0)
   local l_19_1 = findType("animal")
   if l_19_1 ~= nil then
      local l_19_2 = table.getn(l_19_1)
      if l_19_2 > 5 then
         if l_19_arg0.showpanel == nil then
            g_showpanel = true
            l_19_arg0.showpanel = 1
            BFLOG(SYSTRACE, "chrilee - SHOWING THE PANEL!")
         elseif l_19_arg0.showpanel ~= nil then
            g_showpanel = false
            BFLOG(SYSTRACE, "chrilee - DON'T SHOW THE PANEL")
         end
         return 1
      else
         return 0
      end
   end
   return 0
end

needdonationboxes = function(l_20_arg0)
   local l_20_1 = countType("donationbox")
   BFLOG(SYSTRACE, "Donation boxes in zoo is " .. l_20_1)
   if l_20_1 >= 3 then
      return 1
   else
      return 0
   end
   return 0
end

shelterneedmet = function(l_21_arg0)
   if allNeedSatisfied("animal", "privacy") == true then
      return 1
   end
   return 0
end

environmentneedmet = function(l_22_arg0)
   if uidisabled == nil then
      local l_22_1 = queryObject("BFScenarioMgr")
      if l_22_1 then
         l_22_1:UI_DISABLE("put up for adoption")
      end
      uidisabled = 1
   end
   local l_22_1 = {}
   local l_22_2 = queryObject("ZTStatus")
   if l_22_2 then
      l_22_1 = l_22_2:ZT_GET_ALL_ANIMALS_RELEASED()
   end
   if countType("Cheetah") + howManyEntityInTable(l_22_1, "Cheetah_Adult_M") < 1 or countType("CamelDromedary") + howManyEntityInTable(l_22_1, "CamelDromedary_Adult_M") < 1 or countType("Gemsbok") + howManyEntityInTable(l_22_1, "Gemsbok_Adult_F") < 3 or countType("Moose") + howManyEntityInTable(l_22_1, "Moose_Adult_F") < 1 then
      return -1
   end
   if allNeedMeetsThreshold("animal", "environment", 20) == true then
      return 1
   end
   return 0
end

failC1scen2 = function()
   showscenariofail("genericscenariofailure:animaldiedsick", "campaign1scenario2")
end

cleanexhibits = function(l_24_arg0)
   if checkNoAnimalDeaths() == false then
      return -1
   end
   local l_24_1 = countType("Poop")
   local l_24_2 = countType("Keeper")
   BFLOG(SYSTRACE, "Keepers in zoo is " .. l_24_2)
   BFLOG(SYSTRACE, "Poo in zoo is " .. l_24_1)
   if l_24_1 <= 0 and l_24_2 >= 2 then
      return 1
   else
      return 0
   end
end

evaltrashcan = function(l_25_arg0)
   if checkNoAnimalDeaths() == false then
      return -1
   end
   if howMuchCash() < 200 and countType("Worker") < 2 and countType("Keeper") < 2 then
      BFLOG(SYSTRACE, "Failing because you are out of cash with not enough workers")
      showscenariofail("C1scenariogoals:S1nocash")
      return -1
   end
   local l_25_1 = queryObject("BFGManager")
   local l_25_2 = countType("Worker")
   BFLOG(SYSTRACE, "Workers in zoo is " .. l_25_2)
   local l_25_3 = countType("TrashGround")
   BFLOG(SYSTRACE, "Trash in zoo is " .. l_25_3)
   local l_25_4 = countType("RecyclableGround")
   BFLOG(SYSTRACE, "Recycle trash in zoo is " .. l_25_4)
   local l_25_5 = 0
   if l_25_1 ~= nil then
      local l_25_6 = l_25_1:BFG_GET_ENTITIES("trashcan_df")
      if l_25_6 ~= nil and type(l_25_6) == "table" then
         l_25_5 = table.getn(l_25_6)
         for l_25_7 = 1, l_25_5 do
            local l_25_10 = resolveTable(l_25_6[l_25_7].value)
            if l_25_10 ~= nil then
               local l_25_11 = l_25_10:BFG_GET_ATTR_FLOAT("f_TrashLevel")
               BFLOG(SYSTRACE, "Trash level is [" .. l_25_11 .. "]")
               if l_25_11 > 20 then
                  return 0
               end
            end
         end
      end
   end
   if l_25_5 > 0 and l_25_2 >= 2 and l_25_3 < 1 and l_25_4 < 1 then
      return 1
   else
      return 0
   end
   return 0
end

querytrashcan = function(l_26_arg0)
   local l_26_1 = queryObject("BFGManager")
   if l_26_1 ~= nil then
      local l_26_2 = l_26_1:BFG_GET_ENTITIES("trashcan_df")
      if l_26_2 ~= nil and type(l_26_2) == "table" then
         local l_26_3 = table.getn(l_26_2)
         for l_26_4 = 1, l_26_3 do
            local l_26_7 = resolveTable(l_26_2[l_26_4].value)
            if l_26_7 ~= nil then
               local l_26_8 = l_26_7:BFG_GET_ATTR_FLOAT("f_TrashLevel")
               BFLOG(SYSTRACE, "Trash level is [" .. l_26_8 .. "]")
            end
         end
      end
   end
   return 0
end

trashcanstate = function(l_27_arg0)
   local l_27_1 = countNeed("trashcan_df", "f_TrashLevel")
   if l_27_1 <= 1 then
      return 1
   else
      BFLOG(SYSTRACE, "Trashcans still full.")
      return 0
   end
end

randomType = function(l_28_arg0)
   local l_28_1 = findType(l_28_arg0)
   if l_28_1 ~= nil then
      local l_28_2, l_28_2 = table.getn(l_28_1)
      if l_28_2 > 0 then
         l_28_2 = math
         l_28_2 = l_28_2.random
         l_28_2 = l_28_2(l_28_2)
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

evaluate0 = function(l_29_arg0)
   local l_29_1 = 0
   local l_29_2 = findType("TigerBengal")
   if l_29_2 == nil then
      return 0
   end
   local l_29_3 = table.getn(l_29_2)
   for l_29_4 = 1, l_29_3 do
      local l_29_7 = resolveTable(l_29_2[l_29_4].value)
      if basicNeedsMet(l_29_7) then
         l_29_1 = l_29_1 + 1
      end
   end
   if l_29_1 >= 3 then
      return 1
   else
      BFLOG(SYSTRACE, "Count is " .. l_29_1 .. " out of " .. l_29_3 .. " tigers.")
      return 0
   end
end

complete0 = function(l_30_arg0)
   local l_30_1 = queryObject("UIRoot")
   if l_30_1 then
      local l_30_2 = l_30_1:UI_GET_CHILD("goalpanel")
      if l_30_2 then
         l_30_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_30_3 = l_30_1:UI_GET_CHILD("primary goals tab")
      if l_30_3 then
         l_30_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Completed0")
   showUI("goals layout", true)
end

conditionalcomplete = function(l_31_arg0)
   if g_showpanel == true then
      local l_31_1 = queryObject("UIRoot")
      if l_31_1 then
         local l_31_2 = l_31_1:UI_GET_CHILD("goalpanel")
         if l_31_2 then
            l_31_2:ZT_AUTOPOPULATE_LIST()
         end
         local l_31_3 = l_31_1:UI_GET_CHILD("primary goals tab")
         if l_31_3 then
            l_31_3:UI_ACTIVATE_ON()
         end
      end
      BFLOG(SYSTRACE, "Completed0")
      showUI("goals layout", true)
   end
end

complete0unlock = function(l_32_arg0)
   local l_32_1 = queryObject("UIRoot")
   if l_32_1 then
      local l_32_2 = l_32_1:UI_GET_CHILD("goalpanel")
      if l_32_2 then
         l_32_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_32_3 = l_32_1:UI_GET_CHILD("primary goals tab")
      if l_32_3 then
         l_32_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Completed0unlock")
   showUI("goals layout", true)
end

C1S1finalwin = function()
   setuservar("campaign1scenario1", "completed")
   local l_33_0 = getuservar("campaign1scenario2")
   if l_33_0 ~= "completed" then
      setuservar("campaign1scenario2", "unlocked")
   end
   enableAnimalAdoption()
   showscenariowin("C1scenariogoals:C1youwin", "campaign1scenario2")
end


