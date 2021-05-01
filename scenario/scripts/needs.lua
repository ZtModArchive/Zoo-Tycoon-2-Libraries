include("scenario/scripts/misc.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
needMet = function(l_1_arg0, l_1_arg1)
   if l_1_arg0 == nil then
      BFLOG(SYSERROR, "needMet - Entity is nil.")
      return nil
   elseif l_1_arg1 == nil then
      BFLOG(SYSERROR, "needMet - Need is nil.")
      return nil
   else
      local l_1_2 = l_1_arg0:sendMessage("BFAI_GET_TRIGGERED", l_1_arg1)
      if l_1_2 == nil then
         BFLOG(SYSERROR, "Couldn't get " .. l_1_arg1 .. " from entity.")
         return nil
      elseif l_1_2 == true then
         local l_1_3 = getName(l_1_arg0)
         BFLOG(SYSERROR, l_1_arg1 .. " need is not met for entity " .. l_1_3)
         return false
      else
         return true
      end
   end
end

basicNeedsMet = function(l_2_arg0)
   if l_2_arg0 == nil then
      BFLOG(SYSERROR, "basicNeedsMet - entity is nil.")
      return false
   elseif not needMet(l_2_arg0, "hunger") then
      return false
   elseif not needMet(l_2_arg0, "thirst") then
      return false
   elseif not needMet(l_2_arg0, "rest") then
      return false
   elseif not needMet(l_2_arg0, "exercise") then
      return false
   elseif not needMet(l_2_arg0, "environment") then
      return false
   else
      return true
   end
end

advancedNeedsMet = function(l_3_arg0)
   if l_3_arg0 == nil then
      BFLOG(SYSERROR, "advancedNeedsMet - entity is nil.")
      return false
   elseif not needMet(l_3_arg0, "hygiene") then
      return false
   elseif not needMet(l_3_arg0, "social") then
      return false
   elseif not needMet(l_3_arg0, "stimulation") then
      return false
   elseif not needMet(l_3_arg0, "privacy") then
      return false
   else
      return true
   end
end

allNeedsMet = function(l_4_arg0)
   if l_4_arg0 == nil then
      BFLOG(SYSERROR, "allNeedsMet - entity is nil.")
      return false
   elseif not basicNeedsMet(l_4_arg0) then
      return false
   elseif not advancedNeedsMet(l_4_arg0) then
      return false
   else
      return true
   end
end

allTypeBasicNeedsMet = function(l_5_arg0)
   animals = findType(l_5_arg0)
   local l_5_1 = 0
   if animals ~= nil then
      l_5_1 = table.getn(animals)
      for l_5_2 = 1, l_5_1 do
         BFLOG(SYSTRACE, "Checking entity")
         local l_5_5 = resolveTable(animals[l_5_2].value)
         if basicNeedsMet(l_5_5) == false then
            return false
         end
      end
   end
   return true
end

allTypeAdvancedNeedsMet = function(l_6_arg0)
   animals = findType(l_6_arg0)
   local l_6_1 = 0
   if animals ~= nil then
      l_6_1 = table.getn(animals)
      for l_6_2 = 1, l_6_1 do
         local l_6_5 = resolveTable(animals[l_6_2].value)
         if advancedNeedsMet(l_6_5) == false then
            return false
         end
      end
   end
   return true
end

allTypeAllNeedsMet = function(l_7_arg0)
   animals = findType(l_7_arg0)
   local l_7_1 = 0
   if animals ~= nil then
      l_7_1 = table.getn(animals)
      for l_7_2 = 1, l_7_1 do
         local l_7_5 = resolveTable(animals[l_7_2].value)
         if allNeedsMet(l_7_5) == false then
            return false
         end
      end
   end
   return true
end

allTypeNeedMet = function(l_8_arg0, l_8_arg1)
   animals = findType(l_8_arg0)
   local l_8_2 = 0
   if animals ~= nil then
      l_8_2 = table.getn(animals)
      for l_8_3 = 1, l_8_2 do
         local l_8_6 = resolveTable(animals[l_8_3].value)
         if needMet(l_8_6, l_8_arg1) == false then
            return false
         end
      end
   end
   return true
end

allTypeChildBasicNeedsMet = function(l_9_arg0)
   local l_9_1 = 0
   local l_9_2 = findType(l_9_arg0)
   if l_9_2 == nil then
      if count == 0 then
         return true
      else
         return false
      end
   end
   local l_9_3 = 0
   l_9_3 = table.getn(l_9_2)
   for l_9_4 = 1, l_9_3 do
      local l_9_7 = resolveTable(l_9_2[l_9_4].value)
      if l_9_7 ~= nil then
         local l_9_8 = l_9_7:BFG_GET_ATTR_BOOLEAN("b_Adult")
         if l_9_8 == nil then
            BFLOG(SYSERROR, "Error trying to find adults.")
            return nil
         elseif l_9_8 == false and basicNeedsMet(l_9_7) == false then
            return false
         end
      end
   end
   return true
end

allTypeAdultBasicNeedsMet = function(l_10_arg0)
   local l_10_1 = 0
   local l_10_2 = findType(l_10_arg0)
   if l_10_2 == nil then
      if count == 0 then
         return true
      else
         return false
      end
   end
   local l_10_3 = 0
   l_10_3 = table.getn(l_10_2)
   for l_10_4 = 1, l_10_3 do
      local l_10_7 = resolveTable(l_10_2[l_10_4].value)
      if l_10_7 ~= nil then
         local l_10_8 = l_10_7:BFG_GET_ATTR_BOOLEAN("b_Adult")
         if l_10_8 == nil then
            BFLOG(SYSERROR, "Error trying to find adults.")
            return nil
         elseif l_10_8 == true and basicNeedsMet(l_10_7) == false then
            return false
         end
      end
   end
   return true
end

needMeetsThreshold = function(l_11_arg0, l_11_arg1, l_11_arg2)
   if l_11_arg0 == nil then
      BFLOG(SYSERROR, "needMeetsThreshold - entity is nil.")
      return false
   end
   local l_11_3 = l_11_arg0:BFG_GET_ATTR_FLOAT(l_11_arg1)
   BFLOG(SYSTRACE, l_11_arg1 .. " is [" .. l_11_3 .. "]")
   if l_11_3 <= l_11_arg2 then
      return true
   end
   return false
end

needSatisfied = function(l_12_arg0, l_12_arg1)
   if l_12_arg0 == nil then
      BFLOG(SYSERROR, "needSatisfied - entity is nil.")
      return false
   end
   if l_12_arg0:BFG_GET_ATTR_FLOAT(l_12_arg1) <= l_12_arg0:BFAI_GET_PRESSING_THRESHOLD(l_12_arg1) then
      return true
   end
   return false
end

allNeedMeetsThreshold = function(l_13_arg0, l_13_arg1, l_13_arg2)
   local l_13_3 = findType(l_13_arg0)
   if l_13_3 == nil then
      return false
   end
   local l_13_4 = 0
   l_13_4 = table.getn(l_13_3)
   for l_13_5 = 1, l_13_4 do
      local l_13_8 = resolveTable(l_13_3[l_13_5].value)
      if needMeetsThreshold(l_13_8, l_13_arg1, l_13_arg2) == false then
         return false
      end
   end
   return true
end

allNeedSatisfied = function(l_14_arg0, l_14_arg1)
   local l_14_2 = findType(l_14_arg0)
   if l_14_2 == nil then
      return false
   end
   local l_14_3 = 0
   l_14_3 = table.getn(l_14_2)
   for l_14_4 = 1, l_14_3 do
      local l_14_7 = resolveTable(l_14_2[l_14_4].value)
      if needSatisfied(l_14_7, l_14_arg1) == false then
         return false
      end
   end
   return true
end

typeBasicNeedsNotCritical = function(l_15_arg0)
   local l_15_1 = findType(l_15_arg0)
   if l_15_1 == nil then
      return false
   end
   local l_15_2 = 0
   l_15_2 = table.getn(l_15_1)
   for l_15_3 = 1, l_15_2 do
      local l_15_6 = resolveTable(l_15_1[l_15_3].value)
      if l_15_6 == nil then
         BFLOG(SYSERROR, "typeBasicNeedsNotCritical - entity is nil.")
      elseif not needMeetsThreshold(l_15_6, "hunger", 90) then
         return false
      elseif not needMeetsThreshold(l_15_6, "thirst", 90) then
         return false
      elseif not needMeetsThreshold(l_15_6, "rest", 90) then
         return false
      elseif not needMeetsThreshold(l_15_6, "exercise", 90) then
         return false
      elseif not needMeetsThreshold(l_15_6, "environment", 70) then
         return false
      else
         BFLOG(SYSTRACE, "typeBasicNeedsNotCritical - passed!")
         return true
      end
   end
end

basicNeedsNotCritical = function(l_16_arg0)
   if l_16_arg0 == nil then
      BFLOG(SYSERROR, "basicNeedsNotCritical - entity is nil.")
      return false
   elseif not needMeetsThreshold(l_16_arg0, "hunger", 90) then
      return false
   elseif not needMeetsThreshold(l_16_arg0, "thirst", 90) then
      return false
   elseif not needMeetsThreshold(l_16_arg0, "rest", 90) then
      return false
   elseif not needMeetsThreshold(l_16_arg0, "exercise", 90) then
      return false
   elseif not needMeetsThreshold(l_16_arg0, "environment", 70) then
      return false
   else
      BFLOG(SYSTRACE, "basicNeedsNotCritical - passed!")
      return true
   end
end

advancedNeedsNotCritical = function(l_17_arg0)
   if l_17_arg0 == nil then
      BFLOG(SYSERROR, "advancedNeedsNotCritical - entity is nil.")
      return false
   elseif not needMeetsThreshold(l_17_arg0, "social", 90) then
      return false
   elseif not needMeetsThreshold(l_17_arg0, "stimulation", 90) then
      return false
   elseif not needMeetsThreshold(l_17_arg0, "privacy", 90) then
      return false
   elseif not needMeetsThreshold(l_17_arg0, "hygiene", 90) then
      return false
   else
      BFLOG(SYSTRACE, "advancedNeedsNotCritical - passed!")
      return true
   end
end

basicNeedsMeetThreshold = function(l_18_arg0, l_18_arg1)
   if l_18_arg0 == nil then
      BFLOG(SYSERROR, "basicNeedsMeetThreshold - entity is nil.")
      return false
   elseif not needMeetsThreshold(l_18_arg0, "hunger", l_18_arg1) then
      return false
   elseif not needMeetsThreshold(l_18_arg0, "thirst", l_18_arg1) then
      return false
   elseif not needMeetsThreshold(l_18_arg0, "rest", l_18_arg1) then
      return false
   elseif not needMeetsThreshold(l_18_arg0, "exercise", l_18_arg1) then
      return false
   elseif not needMeetsThreshold(l_18_arg0, "environment", l_18_arg1) then
      return false
   else
      BFLOG(SYSTRACE, "basicNeedsMeetThreshold - passed!")
      return true
   end
end

basicNeedsSatisfied = function(l_19_arg0)
   if l_19_arg0 == nil then
      BFLOG(SYSERROR, "basicNeedsSatisfied - entity is nil.")
      return false
   elseif not needSatisfied(l_19_arg0, "hunger") then
      return false
   elseif not needSatisfied(l_19_arg0, "thirst") then
      return false
   elseif not needSatisfied(l_19_arg0, "rest") then
      return false
   elseif not needSatisfied(l_19_arg0, "exercise") then
      return false
   elseif not needSatisfied(l_19_arg0, "environment") then
      return false
   else
      BFLOG(SYSTRACE, "needSatisfied - passed!")
      return true
   end
end

advancedNeedsMeetThreshold = function(l_20_arg0, l_20_arg1)
   if l_20_arg0 == nil then
      BFLOG(SYSERROR, "advancedNeedsMeetThreshold - entity is nil.")
      return false
   elseif not needMeetsThreshold(l_20_arg0, "hygiene", l_20_arg1) then
      return false
   elseif not needMeetsThreshold(l_20_arg0, "social", l_20_arg1) then
      return false
   elseif not needMeetsThreshold(l_20_arg0, "stimulation", l_20_arg1) then
      return false
   elseif not needMeetsThreshold(l_20_arg0, "privacy", l_20_arg1) then
      return false
   else
      BFLOG(SYSTRACE, "advancedNeedsMeetThreshold - passed!")
      return true
   end
end

advancedNeedsSatisfied = function(l_21_arg0)
   if l_21_arg0 == nil then
      BFLOG(SYSERROR, "advancedNeedsSatisfied - entity is nil.")
      return false
   elseif not needSatisfied(l_21_arg0, "hygiene") then
      return false
   elseif not needSatisfied(l_21_arg0, "social") then
      return false
   elseif not needSatisfied(l_21_arg0, "stimulation") then
      return false
   elseif not needSatisfied(l_21_arg0, "privacy") then
      return false
   else
      BFLOG(SYSTRACE, "advancedNeedsSatisfied - passed!")
      return true
   end
end

allNeedsMeetThreshold = function(l_22_arg0, l_22_arg1)
   if l_22_arg0 == nil then
      return false
   end
   if not advancedNeedsMeetThreshold(l_22_arg0, l_22_arg1) then
      return false
   elseif not basicNeedsMeetThreshold(l_22_arg0, l_22_arg1) then
      return false
   else
      return true
   end
end

allNeedsSatisfied = function(l_23_arg0)
   if l_23_arg0 == nil then
      return false
   end
   if not advancedNeedsSatisfied(l_23_arg0) then
      return false
   elseif not basicNeedsSatisfied(l_23_arg0) then
      return false
   else
      return true
   end
end

typeBasicNeedsMeetThreshold = function(l_24_arg0, l_24_arg1)
   local l_24_2 = findType(l_24_arg0)
   if l_24_2 == nil then
      return false
   end
   local l_24_3 = 0
   l_24_3 = table.getn(l_24_2)
   for l_24_4 = 1, l_24_3 do
      local l_24_7 = resolveTable(l_24_2[l_24_4].value)
      if basicNeedsMeetThreshold(l_24_7, l_24_arg1) == false then
         return false
      end
   end
   return true
end

typeBasicNeedsSatisfied = function(l_25_arg0)
   local l_25_1 = findType(l_25_arg0)
   if l_25_1 == nil then
      return false
   end
   local l_25_2 = 0
   l_25_2 = table.getn(l_25_1)
   for l_25_3 = 1, l_25_2 do
      local l_25_6 = resolveTable(l_25_1[l_25_3].value)
      if basicNeedsSatisfied(l_25_6) == false then
         return false
      end
   end
   return true
end

typeAdvancedNeedsMeetThreshold = function(l_26_arg0)
   local l_26_1 = findType(l_26_arg0)
   if l_26_1 == nil then
      return false
   end
   local l_26_2 = 0
   l_26_2 = table.getn(l_26_1)
   for l_26_3 = 1, l_26_2 do
      local l_26_6 = resolveTable(l_26_1[l_26_3].value)
      if advancedNeedsMeetThreshold(l_26_6, threshold) == false then
         return false
      end
   end
   return true
end

typeAdvancedNeedsSatisfied = function(l_27_arg0)
   local l_27_1 = findType(l_27_arg0)
   if l_27_1 == nil then
      return false
   end
   local l_27_2 = 0
   l_27_2 = table.getn(l_27_1)
   for l_27_3 = 1, l_27_2 do
      local l_27_6 = resolveTable(l_27_1[l_27_3].value)
      if advancedNeedsSatisfied(l_27_6) == false then
         return false
      end
   end
   return true
end

typeAllNeedsMeetThreshold = function(l_28_arg0, l_28_arg1)
   local l_28_2 = findType(l_28_arg0)
   if l_28_2 == nil then
      return false
   end
   local l_28_3 = 0
   l_28_3 = table.getn(l_28_2)
   for l_28_4 = 1, l_28_3 do
      local l_28_7 = resolveTable(l_28_2[l_28_4].value)
      if allNeedsMeetThreshold(l_28_7, l_28_arg1) == false then
         return false
      end
   end
   return true
end

typeAllNeedsSatisfied = function(l_29_arg0)
   local l_29_1 = findType(l_29_arg0)
   if l_29_1 == nil then
      return false
   end
   local l_29_2 = 0
   l_29_2 = table.getn(l_29_1)
   for l_29_3 = 1, l_29_2 do
      local l_29_6 = resolveTable(l_29_1[l_29_3].value)
      if allNeedsSatisfied(l_29_6) == false then
         return false
      end
   end
   return true
end

animalTableMeetsThreshold = function(l_30_arg0, l_30_arg1, l_30_arg2)
   if l_30_arg0 == nil then
      return nil
   end
   local l_30_3 = table.getn(l_30_arg0)
   for l_30_4 = 1, l_30_3 do
      local l_30_7 = findType(l_30_arg0[l_30_4])
      local l_30_8 = table.getn(l_30_7)
      for l_30_9 = 1, l_30_8 do
         local l_30_12 = resolveTable(l_30_7[l_30_9].value)
         if needMeetsThreshold(l_30_12, l_30_arg1, l_30_arg2) == true then
            return true
         end
      end
   end
   return false
end

animalTableSatisfied = function(l_31_arg0, l_31_arg1)
   if l_31_arg0 == nil then
      return nil
   end
   local l_31_2 = table.getn(l_31_arg0)
   for l_31_3 = 1, l_31_2 do
      local l_31_6 = findType(l_31_arg0[l_31_3])
      local l_31_7 = table.getn(l_31_6)
      for l_31_8 = 1, l_31_7 do
         local l_31_11 = resolveTable(l_31_6[l_31_8].value)
         if needSatisfied(l_31_11, l_31_arg1) == true then
            return true
         end
      end
   end
   return false
end

doesanimalhaveenoughbiome = function(l_32_arg0, l_32_arg1, l_32_arg2)
   if l_32_arg0 == nil then
      return false
   end
   if animalTableMeetsThreshold(l_32_arg0, "space", 30) == false then
      return false
   end
   local l_32_3 = table.getn(l_32_arg0)
   for l_32_4 = 1, l_32_3 do
      local l_32_7 = findType(l_32_arg0[l_32_4])
      local l_32_8 = table.getn(l_32_7)
      for l_32_9 = 1, l_32_8 do
         local l_32_12 = resolveTable(l_32_7[l_32_9].value)
         if l_32_12 ~= nil then
            local l_32_13 = l_32_12:BFG_GET_TRAVERSABLE_AREA()
            if l_32_13 ~= nil then
               local l_32_14 = l_32_13:BFG_TA_COUNT_BIOME(l_32_arg1)
               local l_32_15 = l_32_13:BFG_TA_GET_COUNT()
               if l_32_14 ~= nil and l_32_15 ~= nil and l_32_arg2 <= 100 * l_32_14 / l_32_15 then
                  return true
               end
            end
         end
      end
   end
   return false
end

averageTypeBasicNeedsMeetsThreshold = function(l_33_arg0, l_33_arg1)
   local l_33_2 = findType(l_33_arg0)
   if l_33_2 == nil then
      return false
   end
   local l_33_3 = 0
   local l_33_4 = {"environment", "thirst", "hunger", "rest", "exercise"}
   l_33_3 = table.getn(l_33_2)
   for l_33_5 = 1, l_33_3 do
      local l_33_8 = resolveTable(l_33_2[l_33_5].value)
      local l_33_9 = 0
      for l_33_10 = 1, table.getn(l_33_4) do
         l_33_9 = l_33_9 + l_33_8:BFG_GET_ATTR_FLOAT(l_33_4[l_33_10])
      end
      local l_33_10 = (l_33_9) / table.getn(l_33_4)
      BFLOG("averageNeed for entity #" .. l_33_5 .. " : " .. l_33_10)
      if l_33_arg1 < l_33_10 then
         return false
      end
   end
   return true
end

basicNeedsMetAlternate = function(l_34_arg0)
   if l_34_arg0 == nil then
      BFLOG(SYSERROR, "basicNeedsMet - entity is nil.")
      return false
   elseif not needMet(l_34_arg0, "hunger") then
      return false
   elseif not needMet(l_34_arg0, "thirst") then
      return false
   elseif not needMet(l_34_arg0, "rest") then
      return false
   elseif not needMet(l_34_arg0, "exercise") then
      return false
   elseif not needSatisfied(l_34_arg0, "environment") then
      return false
   else
      return true
   end
end


