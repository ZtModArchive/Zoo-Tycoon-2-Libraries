findType = function(l_1_arg0)
   if l_1_arg0 == nil then
      BFLOG(SYSTRACE, "entityType - nil type passed.")
      return nil
   end
   local l_1_1 = queryObject("BFGManager")
   if l_1_1 ~= nil then
      local l_1_2 = l_1_1:BFG_GET_ENTITIES(l_1_arg0)
      if l_1_2 ~= nil and type(l_1_2) == "table" then
         local l_1_3 = getSelectedEntity()
         if l_1_3 then
            local l_1_4 = l_1_3:BFG_FIND_CONTAINED_ENTITY(l_1_arg0)
            if l_1_4 ~= nil then
               local l_1_5 = table.getn(l_1_2)
               local l_1_6 = false
               for l_1_7 = 1, l_1_5 do
                  local l_1_10 = resolveTable(l_1_2[l_1_7].value)
                  if areCompsEqual(l_1_10, l_1_4) == true then
                     l_1_6 = true
                  end
               end
               if l_1_6 == false then
                  local l_1_7 = l_1_5 + 1
                  local l_1_8
                  l_1_2[l_1_7], l_1_8 = l_1_8, {value = l_1_4._this}
               elseif isKindOf(l_1_3:BFG_GET_BINDER_TYPE(), l_1_arg0) == true then
                  local l_1_5 = table.getn(l_1_2)
                  local l_1_6 = false
                  for l_1_7 = 1, l_1_5 do
                     local l_1_10 = resolveTable(l_1_2[l_1_7].value)
                     if areCompsEqual(l_1_10, l_1_3) == true then
                        l_1_6 = true
                     end
                  end
                  if l_1_6 == false then
                     local l_1_7 = l_1_5 + 1
                     local l_1_8
                     l_1_2[l_1_7], l_1_8 = l_1_8, {value = l_1_3._this}
                  end
               end
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
               return l_1_2
            else
               BFLOG(SYSERROR, "Failed to query BFGManager.")
            end
            -- Tried to add an 'end' here but it's incorrect
            return nil
end

findTypeDirect = function(l_2_arg0)
   local l_2_1 = queryObject("BFGManager")
   if l_2_1 ~= nil then
      return l_2_1:BFG_GET_ENTITIES_DIRECT(l_2_arg0)
   else
      BFLOG(SYSERROR, "Failed to query BFGManager.")
   end
   return nil
end

howManyChildren = function(l_3_arg0)
   local l_3_1 = 0
   local l_3_2 = findType(l_3_arg0)
   if l_3_2 == nil then
      return 0
   end
   local l_3_3 = 0
   l_3_3 = table.getn(l_3_2)
   for l_3_4 = 1, l_3_3 do
      local l_3_7 = resolveTable(l_3_2[l_3_4].value)
      if l_3_7 ~= nil then
         local l_3_8 = l_3_7:BFG_GET_ATTR_BOOLEAN("b_Adult")
         if l_3_8 == nil then
            BFLOG(SYSERROR, "Error trying to find adults.")
            return 0
         elseif l_3_8 == false then
            l_3_1 = l_3_1 + 1
         end
      end
   end
   return l_3_1
end

getSickestAnimal = function()
   local l_4_0 = findType("animal")
   if l_4_0 == nil then
      return nil
   end
   local l_4_1 = 0
   l_4_1 = table.getn(l_4_0)
   local l_4_2 = nil
   for l_4_3 = 1, l_4_1 do
      local l_4_6 = resolveTable(l_4_0[l_4_3].value)
      if not needMeetsThreshold(l_4_6, "health", 50) then
         BFLOG(SYSTRACE, "Sick!")
         --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

placeObject = function(l_5_arg0, l_5_arg1, l_5_arg2, l_5_arg3, l_5_arg4, l_5_arg5)
   if ignore == nil then
      ignore = false
   end
   local l_5_6 = findType(l_5_arg0)
   BFLOG("type table count: " .. table.getn(l_5_6))
   local l_5_7 = queryObject("ZTWorldMgr")
   if l_5_7 then
      BFLOG(SYSTRACE, "Placing an entity")
      local l_5_8, l_5_9 = l_5_7:ZT_PLACEOBJECT, l_5_7
      local l_5_10
      l_5_8(l_5_9, l_5_10)
      l_5_10 = {placementobject = l_5_arg0, x = tonumber(l_5_arg1), y = tonumber(l_5_arg2), z = 0, r = tonumber(l_5_arg3), ignoreLandCollision = l_5_arg4, ignoreWaterAdjacent = l_5_arg5}
      l_5_8 = findType
      l_5_9 = l_5_arg0
      l_5_8 = l_5_8(l_5_9)
      l_5_9 = BFLOG
      l_5_10 = "new type table count: "
      l_5_10 = l_5_10 .. table.getn(l_5_8)
      l_5_9(l_5_10)
      l_5_9 = table
      l_5_9 = l_5_9.getn
      l_5_10 = l_5_8
      l_5_9 = l_5_9(l_5_10)
      if l_5_9 == 1 then
         l_5_9 = resolveTable
         l_5_10 = l_5_8[1]
         l_5_10 = l_5_10.value
         l_5_9 = l_5_9(l_5_10)
         l_5_10 = nameEntity
         l_5_10(l_5_9)
         return l_5_9
      else
         l_5_9 = 1
         l_5_10 = table
         l_5_10 = l_5_10.getn
         l_5_10 = l_5_10(l_5_8)
         l_5_9 = l_5_9 - 1
         for l_5_11 = l_5_9, l_5_10 do
            local l_5_12 = false
            for l_5_13 = 1, table.getn(l_5_6) do
               local l_5_16 = resolveTable(l_5_8[l_5_9].value)
               local l_5_17 = resolveTable(l_5_6[l_5_13].value)
               if areCompsEqual(l_5_16, l_5_17) == true then
                  l_5_12 = true
               end
            end
            if l_5_12 == false then
               nameEntity(resolveTable(l_5_8[l_5_9].value))
               return resolveTable(l_5_8[l_5_9].value)
            end
         end
      else
         BFLOG(SYSERROR, "***** Can't locate ZTWorldMgr! *****")
      end
      -- Tried to add an 'end' here but it's incorrect
end

thisManyExist = function(l_6_arg0, l_6_arg1)
   local l_6_2 = 0
   local l_6_3 = findType(l_6_arg0)
   if l_6_3 == nil then
      if l_6_arg1 == 0 then
         return true
      else
         return false
      end
   end
   if l_6_arg1 <= table.getn(l_6_3) then
      return true
   else
      return false
   end
end

existNumChildren = function(l_7_arg0, l_7_arg1)
   local l_7_2 = 0
   local l_7_3 = findType(l_7_arg0)
   if l_7_3 == nil then
      if l_7_arg1 == 0 then
         return true
      else
         return false
      end
   end
   local l_7_4 = 0
   l_7_4 = table.getn(l_7_3)
   for l_7_5 = 1, l_7_4 do
      local l_7_8 = resolveTable(l_7_3[l_7_5].value)
      if l_7_8 ~= nil then
         local l_7_9 = l_7_8:BFG_GET_ATTR_BOOLEAN("b_Adult")
         if l_7_9 == nil then
            BFLOG(SYSERROR, "Error trying to find children.")
            return nil
         elseif l_7_9 == false then
            BFLOG(SYSTRACE, "Found a baby")
            l_7_2 = l_7_2 + 1
         end
      end
   end
   if l_7_arg1 <= l_7_2 then
      return true
   end
   return false
end

existNumAdults = function(l_8_arg0, l_8_arg1)
   local l_8_2 = 0
   local l_8_3 = findType(l_8_arg0)
   if l_8_3 == nil then
      if l_8_arg1 == 0 then
         return true
      else
         return false
      end
   end
   local l_8_4 = 0
   l_8_4 = table.getn(l_8_3)
   for l_8_5 = 1, l_8_4 do
      local l_8_8 = resolveTable(l_8_3[l_8_5].value)
      if l_8_8 ~= nil then
         local l_8_9 = l_8_8:BFG_GET_ATTR_BOOLEAN("b_Adult")
         if l_8_9 == nil then
            BFLOG(SYSERROR, "Error trying to find adults.")
            return nil
         elseif l_8_9 == true then
            l_8_2 = l_8_2 + 1
         end
      end
   end
   if l_8_arg1 <= l_8_2 then
      return true
   end
   return false
end

existFemale = function(l_9_arg0)
   local l_9_1 = findType(l_9_arg0)
   if l_9_1 == nil then
      BFLOG(SYSTRACE, "existFemale - no objects found.")
      return false
   end
   local l_9_2 = 0
   l_9_2 = table.getn(l_9_1)
   for l_9_3 = 1, l_9_2 do
      local l_9_6 = resolveTable(l_9_1[l_9_3].value)
      if l_9_6 ~= nil then
         local l_9_7 = l_9_6:BFG_GET_ATTR_BOOLEAN("b_Male")
         if l_9_7 == nil then
            BFLOG(SYSERROR, "Error trying to find a lady.")
            return nil
         elseif l_9_7 == false then
            return true
         end
      end
   end
   return false
end

existMale = function(l_10_arg0)
   local l_10_1 = findType(l_10_arg0)
   if l_10_1 == nil then
      BFLOG(SYSTRACE, "existMale - no objects found.")
      return false
   end
   local l_10_2 = table.getn(l_10_1)
   for l_10_3 = 1, l_10_2 do
      local l_10_6 = resolveTable(l_10_1[l_10_3].value)
      if l_10_6 ~= nil then
         local l_10_7 = l_10_6:BFG_GET_ATTR_BOOLEAN("b_Male")
         if l_10_7 == nil then
            BFLOG(SYSERROR, "Error trying to find a male.")
            return nil
         elseif l_10_7 == true then
            return true
         end
      end
   end
   return false
end

isMale = function(l_11_arg0)
   if l_11_arg0 == nil then
      return false
   end
   local l_11_1 = l_11_arg0:BFG_GET_ATTR_BOOLEAN("b_Male")
   if l_11_1 == nil then
      BFLOG(SYSERROR, "Error trying to find a male.")
      return nil
   elseif l_11_1 == true then
      return true
   end
   return false
end

isFemale = function(l_12_arg0)
   if l_12_arg0 == nil then
      return false
   end
   local l_12_1 = l_12_arg0:BFG_GET_ATTR_BOOLEAN("b_Male")
   if l_12_1 == nil then
      BFLOG(SYSERROR, "Error trying to find a male.")
      return nil
   elseif l_12_1 == true then
      return true
   end
   return false
end

countType = function(l_13_arg0)
   local l_13_1 = findType(l_13_arg0)
   if l_13_1 then
      return table.getn(l_13_1)
   end
   return 0
end

countTypeDirect = function(l_14_arg0)
   local l_14_1 = findTypeDirect(l_14_arg0)
   if l_14_1 then
      return table.getn(l_14_1)
   end
   return 0
end

crateEntity = function(l_15_arg0)
   if l_15_arg0 ~= nil then
      l_15_arg0:BFG_SEND_SIGNAL_SHARED("ZT_CRATE_ENTITY")
   end
end

uncrateEntity = function(l_16_arg0)
   if l_16_arg0 ~= nil then
      l_16_arg0:BFG_SEND_SIGNAL_SHARED("ZT_UNCRATE_ENTITY")
   end
end

crateNewEntity = function(l_17_arg0, l_17_arg1)
   for l_17_2 = 1, table.getn(l_17_arg1) do
      local l_17_5 = false
      local l_17_6 = 0
      for l_17_7 = 1, table.getn(l_17_arg0) do
         local l_17_10 = resolveTable(l_17_arg1[l_17_2].value)
         local l_17_11 = resolveTable(l_17_arg0[l_17_7].value)
         if areCompsEqual(l_17_10, l_17_11) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_17_5 = true
         end
      end
      if l_17_5 == false then
         BFLOG(SYSTRACE, "i = " .. l_17_2)
         local l_17_7 = resolveTable(l_17_arg1[l_17_2].value)
         crateEntity(l_17_7)
   else
      end
   end
end

findNewEntity = function(l_18_arg0, l_18_arg1)
   for l_18_2 = 1, table.getn(l_18_arg1) do
      local l_18_5 = false
      local l_18_6 = 0
      for l_18_7 = 1, table.getn(l_18_arg0) do
         local l_18_10 = resolveTable(l_18_arg1[l_18_2].value)
         local l_18_11 = resolveTable(l_18_arg0[l_18_7].value)
         if areCompsEqual(l_18_10, l_18_11) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_18_5 = true
         end
      end
      if l_18_5 == false then
         BFLOG(SYSTRACE, "i = " .. l_18_2)
         return resolveTable(l_18_arg1[l_18_2].value)
      end
   end
end

getNeedPointsBadCum = function(l_19_arg0)
   if l_19_arg0 ~= nil then
      return l_19_arg0:BFG_GET_ATTR_FLOAT("f_needPointsBadCum")
   end
   return nil
end

getNeedPointsGoodCum = function(l_20_arg0)
   if l_20_arg0 ~= nil then
      return l_20_arg0:BFG_GET_ATTR_FLOAT("f_needPointsGoodCum")
   end
   return nil
end

deleteEntity = function(l_21_arg0)
   uncrateEntity(l_21_arg0)
   local l_21_1 = queryObject("BFGManager")
   if l_21_1 ~= nil then
      l_21_1:BFG_REMOVE_ENTITY(l_21_arg0)
   end
end

deleteEntitiesByType = function(l_22_arg0)
   local l_22_1 = queryObject("BFGManager")
   if l_22_1 == nil then
      return 
   end
   local l_22_2 = findTypeDirect(l_22_arg0)
   if l_22_2 ~= nil then
      local l_22_3 = table.getn(l_22_2)
      for l_22_4 = 1, l_22_3 do
         local l_22_7 = resolveTable(l_22_2[l_22_4].value)
         if l_22_7 ~= nil then
            l_22_1:BFG_REMOVE_ENTITY(l_22_7)
         end
      end
   end
end

getTableFromTableEntityExist = function(l_23_arg0)
   if l_23_arg0 == nil then
      BFLOG(SYSTRACE, "getTableFromTableEntityExist - nil table passed in")
      return nil
   end
   local l_23_1 = {}
   local l_23_2 = table.getn(l_23_arg0)
   local l_23_3 = 1
   for l_23_4 = 1, l_23_2 do
      if countType(l_23_arg0[l_23_4]) >= 1 then
         l_23_1[l_23_3] = l_23_arg0[l_23_4]
         l_23_3 = l_23_3 + 1
      end
   end
   return l_23_1
end

animalsInZoo = function()
   return getUniqueSpeciesTable("animal")
end

animalsInZooDirect = function()
   return getUniqueSpeciesTableDirect("animal")
end

animalsNotInZoo = function()
   local l_26_0 = getAllSpeciesList()
   local l_26_1 = {}
   local l_26_2 = table.getn(l_26_0)
   local l_26_3 = 1
   for l_26_4 = 1, l_26_2 do
      if countType(l_26_0[l_26_4]) == 0 then
         l_26_1[l_26_3] = l_26_0[l_26_4]
         l_26_3 = l_26_3 + 1
      end
   end
   return l_26_1
end

getSpeciesFromType = function(l_27_arg0)
   local l_27_1 = ""
   local l_27_2 = queryObject("ZTWorldMgr")
   if l_27_2 ~= nil then
      local l_27_3, l_27_4 = l_27_2:BFG_GET_ATTR_STRING, l_27_2
      local l_27_5
      l_27_3, l_27_5 = l_27_3(l_27_4, l_27_5), {key = l_27_arg0, val = "s_Species"}
      l_27_1 = l_27_3
   end
   return l_27_1
end

getAllSpeciesList = function()
   local l_28_0 = {}
   local l_28_1 = queryObject("BFGManager")
   if l_28_1 ~= nil then
      local l_28_2 = l_28_1:BFG_GET_DERIVED_LEAF_TYPES("animal")
      for l_28_3 = 1, table.getn(l_28_2) do
         local l_28_6 = l_28_2[l_28_3].value
         l_28_6 = getSpeciesFromType(l_28_6)
         local l_28_7 = false
         for l_28_8 = 1, table.getn(l_28_0) do
            if l_28_6 == l_28_0[l_28_8] then
               l_28_7 = true
            end
         end
         if l_28_7 == false then
            l_28_0[table.getn(l_28_0) + 1] = l_28_6
         end
      end
   end
   return l_28_0
end

numSpeciesAvailable = function()
   local l_29_0 = queryObject("BFGManager")
   if l_29_0 ~= nil then
      local l_29_1, l_29_1 = l_29_0:BFG_GET_DERIVED_LEAF_TYPES("animal")
      if l_29_1 then
         l_29_1 = table
         l_29_1 = l_29_1.getn
         return l_29_1(l_29_1)
      end
   end
   return nil
end

getAllEndangeredSpeciesList = function()
   local l_30_0 = {}
   local l_30_1 = queryObject("BFGManager")
   if l_30_1 ~= nil then
      local l_30_2 = l_30_1:BFG_GET_DERIVED_LEAF_TYPES("animal")
      for l_30_3 = 1, table.getn(l_30_2) do
         local l_30_6 = l_30_2[l_30_3].value
         l_30_6 = getSpeciesFromType(l_30_6)
         local l_30_7 = false
         for l_30_8 = 1, table.getn(l_30_0) do
            if l_30_6 == l_30_0[l_30_8] then
               l_30_7 = true
            end
         end
         local l_30_8 = getStringFromBinder(l_30_6, "s_Endangerment")
         if l_30_8 == "LowRisk" or l_30_8 == "Vulnerable" or l_30_8 == "Extinct" then
            l_30_7 = true
         end
         if l_30_7 == false then
            l_30_0[table.getn(l_30_0) + 1] = l_30_6
         end
      end
   end
   return l_30_0
end

animalsNotInTable = function(l_31_arg0)
   local l_31_1 = {}
   local l_31_2 = table.getn(l_31_arg0)
   local l_31_3 = 1
   for l_31_4 = 1, l_31_2 do
      if countType(l_31_arg0[l_31_4]) == 0 then
         l_31_1[l_31_3] = l_31_arg0[l_31_4]
         l_31_3 = l_31_3 + 1
      end
   end
   return l_31_1
end

howManyEntityInTable = function(l_32_arg0, l_32_arg1)
   if l_32_arg0 == nil then
      return 0
   end
   local l_32_2 = 0
   local l_32_3 = nil
   for l_32_4 = 1, table.getn(l_32_arg0) do
      if l_32_arg0[l_32_4].value == l_32_arg1 then
         l_32_2 = l_32_2 + 1
      end
   end
   return l_32_2
end

howManyInTableExist = function(l_33_arg0)
   if l_33_arg0 == nil then
      return 0, 0
   end
   local l_33_1 = table.getn(l_33_arg0)
   if l_33_1 == 0 then
      return 0, 0
   end
   local l_33_2 = 0
   local l_33_3 = 0
   for l_33_4 = 1, l_33_1 do
      local l_33_7 = countType(l_33_arg0[l_33_4])
      if l_33_7 > 0 then
         l_33_2 = l_33_2 + 1
         l_33_3 = l_33_3 + l_33_7
      end
   end
   return l_33_2, l_33_3
end

howManySpeciesInTable = function(l_34_arg0, l_34_arg1)
   if l_34_arg0 == nil then
      return 0
   end
   local l_34_2 = 0
   local l_34_3 = nil
   for l_34_4 = 1, table.getn(l_34_arg0) do
      if getSpeciesFromType(l_34_arg0[l_34_4]) == l_34_arg1 then
         l_34_2 = l_34_2 + 1
      end
   end
   return l_34_2
end

howManyEnrichExist = function()
   local l_35_0 = getResearchableEnrichmentItems()
   return howManyInTableExist(l_35_0)
end

howManyAnimalsInZoo = function()
   local l_36_0 = animalsInZoo()
   return table.getn(l_36_0)
end

howManyAnimalsInZooDirect = function()
   local l_37_0 = animalsInZooDirect()
   return table.getn(l_37_0)
end

entityHasGrandmother = function(l_38_arg0)
   if l_38_arg0 then
      local l_38_1 = l_38_arg0:sendMessage("BFAI_GET_RELATED_ENTITIES", "grandMM")
      if l_38_1 ~= nil and type(l_38_1) == "table" then
         return true
      end
      local l_38_2 = l_38_arg0:sendMessage("BFAI_GET_RELATED_ENTITIES", "grandFM")
      if l_38_2 ~= nil and type(l_38_2) == "table" then
         return true
      else
         BFLOG(SYSTRACE, "entityHasGrandmother - Bad entity")
      end
      -- Tried to add an 'end' here but it's incorrect
      return false
end

entityHasRelative = function(l_39_arg0, l_39_arg1)
   if l_39_arg0 then
      local l_39_2 = l_39_arg0:sendMessage("BFAI_GET_RELATED_ENTITIES", l_39_arg1)
      if l_39_2 ~= nil and type(l_39_2) == "table" then
         return true
      else
         BFLOG(SYSTRACE, "entityHasRelative - Bad entity")
      end
      -- Tried to add an 'end' here but it's incorrect
      return false
end

getSelectedEntity = function()
   local l_40_0 = queryObject("BFGManager")
   if l_40_0 ~= nil then
      return l_40_0:BFG_GET_SELECTED_ENTITY()
   end
   return nil
end

isEntityKindOf = function(l_41_arg0, l_41_arg1)
   if l_41_arg0 ~= nil then
      local l_41_2 = findType(l_41_arg1)
      if l_41_2 ~= nil then
         local l_41_3 = table.getn(l_41_2)
         for l_41_4 = 1, l_41_3 do
            if resolveTable(l_41_2[l_41_4].value) == l_41_arg0 then
               return true
            end
         end
      else
         BFLOG("Bad Binder Type: " .. l_41_arg1)
      end
   end
   return false
end

getRandomAnimalType = function()
   local l_42_0 = getAllSpeciesList()
   local l_42_1 = table.getn(l_42_0)
   return l_42_0[math.random(l_42_1)]
end

getTotalGoodCumPoints = function()
   local l_43_0 = findType("animal")
   if l_43_0 == nil then
      return 0
   end
   local l_43_1 = table.getn(l_43_0)
   local l_43_2 = 0
   for l_43_3 = 1, l_43_1 do
      local l_43_6 = resolveTable(l_43_0[l_43_3].value)
      l_43_2 = l_43_2 + getNeedPointsGoodCum(l_43_6)
   end
   return l_43_2
end

getTotalBadCumPoints = function()
   local l_44_0 = findType("animal")
   if l_44_0 == nil then
      return 0
   end
   local l_44_1 = table.getn(l_44_0)
   local l_44_2 = 0
   for l_44_3 = 1, l_44_1 do
      local l_44_6 = resolveTable(l_44_0[l_44_3].value)
      l_44_2 = l_44_2 + getNeedPointsBadCum(l_44_6)
   end
   return l_44_2
end

existMaleFemaleSameSpecies = function()
   local l_45_0 = findType("animal")
   if l_45_0 == nil then
      return false
   end
   local l_45_1 = table.getn(l_45_0)
   for l_45_2 = 1, l_45_1 do
      local l_45_5 = resolveTable(l_45_0[l_45_2].value)
      if l_45_5 ~= nil then
         local l_45_6 = l_45_5:BFG_GET_BINDER_TYPE()
         l_45_6 = getSpeciesFromType(l_45_6)
         --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

getLastAnimalPutUpForAdoption = function()
   local l_46_0 = queryObject("ZTStatus")
   if l_46_0 then
      return l_46_0:ZT_GET_LAST_ANIMAL_PUTUPFORADOPTION()
   else
      BFLOG(SYSTRACE, "Error getting ZTStatus")
      return nil
   end
end

getLastSpeciesReleased = function()
   local l_47_0 = queryObject("ZTStatus")
   if l_47_0 then
      return l_47_0:ZT_GET_LAST_SPECIES_RELEASED()
   else
      BFLOG(SYSTRACE, "Error getting ZTStatus")
      return nil
   end
end

getLastAnimalReleasedID = function()
   local l_48_0 = queryObject("ZTStatus")
   if l_48_0 then
      local l_48_1 = l_48_0:ZT_GET_LAST_ANIMAL_RELEASED()
      if l_48_1 ~= nil then
         BFLOG("Last Animal ID: " .. l_48_1)
      else
         BFLOG("Last Animal ID nil")
      end
      return l_48_1
   else
      BFLOG(SYSTRACE, "Error getting ZTStatus")
      return nil
   end
end

giveEntityBasicNeedTrouble = function(l_49_arg0, l_49_arg1)
   if l_49_arg0 ~= nil then
      local l_49_2 = math.random(4)
      local l_49_3 = "hunger"
      if l_49_2 == 1 then
         l_49_3 = "thirst"
      elseif l_49_2 == 2 then
         l_49_3 = "rest"
      elseif l_49_2 == 3 then
         l_49_3 = "exercise"
      else
         l_49_3 = "hunger"
      end
      local l_49_4 = 100
      local l_49_5 = math.random(2)
      if l_49_5 == 1 then
         l_49_4 = l_49_arg0:BFAI_GET_PRESSING_THRESHOLD(l_49_3)
      else
         l_49_4 = l_49_arg0:BFAI_GET_CRITICAL_THRESHOLD(l_49_3)
      end
      l_49_arg0:BFG_SET_ATTR_FLOAT(l_49_3, l_49_4 + 5)
      local l_49_6 = math.random(l_49_arg1)
      if l_49_6 == 1 then
         l_49_arg0:BFG_SET_ATTR_FLOAT("health", 70)
      end
   end
end

giveEntityPressingRandAdvancedNeed = function(l_50_arg0)
   if l_50_arg0 ~= nil then
      local l_50_1 = math.random(4)
      local l_50_2 = "hygiene"
      if l_50_1 == 1 then
         l_50_2 = "social"
      elseif l_50_1 == 2 then
         l_50_2 = "stimulation"
      elseif l_50_1 == 3 then
         l_50_2 = "privacy"
      else
         l_50_2 = "hygiene"
      end
      l_50_arg0:BFG_SET_ATTR_FLOAT(l_50_2, l_50_arg0:BFAI_GET_PRESSING_THRESHOLD(l_50_2) + 5)
   end
end

nameEntity = function(l_51_arg0)
   if l_51_arg0 ~= nil then
      local l_51_1 = queryObject("ZTWorldMgr")
      if l_51_1 then
         l_51_1:ZT_NAME_ENTITY(l_51_arg0)
      else
         BFLOG(SYSTRACE, "unable to query ZTWorldMgr - nameEntity")
      end
   end
end

unpairedAnimal = function(l_52_arg0)
   if countType(l_52_arg0 .. "_Adult_F") >= 1 and countType(l_52_arg0 .. "_Adult_M") == 0 then
      return true
   elseif countType(l_52_arg0 .. "_Adult_M") >= 1 and countType(l_52_arg0 .. "_Adult_F") == 0 then
      return true
   end
   return false
end

getAnimalsFromLocation = function(l_53_arg0, l_53_arg1)
   local l_53_2 = findType("animal")
   if l_53_2 == nil then
      return nil
   end
   local l_53_3 = {}
   local l_53_4 = 1
   local l_53_5 = table.getn(l_53_2)
   for l_53_6 = 1, l_53_5 do
      local l_53_9 = resolveTable(l_53_2[l_53_6].value)
      if l_53_9 ~= nil then
         local l_53_10 = l_53_9:BFG_GET_LOCATION()
         BFLOG("Location: " .. l_53_10)
         local l_53_11 = nil
         if l_53_arg1 then
            l_53_11 = string.find(l_53_10, l_53_arg0)
         else
            l_53_11 = string.find(l_53_10, "_" .. l_53_arg0)
         end
         if l_53_11 ~= nil then
            BFLOG("Found")
            l_53_3[l_53_4] = l_53_2[l_53_6]
            l_53_4 = l_53_4 + 1
         end
      end
   end
   return l_53_3
end

getAnimalsFromBiome = function(l_54_arg0)
   local l_54_1 = findType("animal")
   if l_54_1 == nil then
      return nil
   end
   local l_54_2 = {}
   local l_54_3 = 1
   local l_54_4 = table.getn(l_54_1)
   for l_54_5 = 1, l_54_4 do
      local l_54_8 = resolveTable(l_54_1[l_54_5].value)
      if l_54_8 ~= nil then
         local l_54_9 = l_54_8:BFG_GET_PRIMARY_BIOME()
         if l_54_9 == l_54_arg0 then
            l_54_2[l_54_3] = l_54_1[l_54_5]
            l_54_3 = l_54_3 + 1
         end
      end
   end
   return l_54_2
end

getUniqueSpecies = function(l_55_arg0)
   if l_55_arg0 == nil then
      return nil
   end
   local l_55_1 = {}
   local l_55_2 = table.getn(l_55_arg0)
   for l_55_3 = 1, l_55_2 do
      local l_55_6 = resolveTable(l_55_arg0[l_55_3].value)
      if l_55_6 ~= nil then
         local l_55_7 = l_55_6:BFG_GET_BINDER_TYPE()
         l_55_7 = getSpeciesFromType(l_55_7)
         local l_55_8 = table.getn(l_55_1)
         local l_55_9 = false
         for l_55_10 = 1, l_55_8 do
            if l_55_7 == l_55_1[l_55_10] then
               l_55_9 = true
            end
         end
         if l_55_9 == false then
            l_55_1[l_55_8 + 1] = l_55_7
         end
      end
   end
   return l_55_1
end

getUniqueSpeciesTable = function(l_56_arg0)
   local l_56_1 = {}
   local l_56_2 = findType(l_56_arg0)
   local l_56_3 = table.getn(l_56_2)
   for l_56_4 = 1, l_56_3 do
      local l_56_7 = resolveTable(l_56_2[l_56_4].value)
      if l_56_7 then
         local l_56_8 = l_56_7:BFG_GET_BINDER_TYPE()
         l_56_8 = getSpeciesFromType(l_56_8)
         local l_56_9 = false
         for l_56_10 = 1, table.getn(l_56_1) do
            if l_56_8 == l_56_1[l_56_10] then
               l_56_9 = true
            end
         end
         if l_56_9 == false then
            l_56_1[table.getn(l_56_1) + 1] = l_56_8
         end
      end
   end
   return l_56_1
end

getUniqueSpeciesTableDirect = function(l_57_arg0)
   local l_57_1 = {}
   local l_57_2 = findTypeDirect(l_57_arg0)
   local l_57_3 = table.getn(l_57_2)
   for l_57_4 = 1, l_57_3 do
      local l_57_7 = resolveTable(l_57_2[l_57_4].value)
      if l_57_7 then
         local l_57_8 = l_57_7:BFG_GET_BINDER_TYPE()
         l_57_8 = getSpeciesFromType(l_57_8)
         local l_57_9 = false
         for l_57_10 = 1, table.getn(l_57_1) do
            if l_57_8 == l_57_1[l_57_10] then
               l_57_9 = true
            end
         end
         if l_57_9 == false then
            l_57_1[table.getn(l_57_1) + 1] = l_57_8
         end
      end
   end
   return l_57_1
end

doesentityhaveenoughbiome = function(l_58_arg0, l_58_arg1, l_58_arg2)
   if l_58_arg0 == nil then
      return false
   end
   if animalTableMeetsThreshold(animaltable, "space", 30) == false then
      return false
   end
   if l_58_arg0 ~= nil then
      local l_58_3 = l_58_arg0:BFG_GET_TRAVERSABLE_AREA()
      if l_58_3 ~= nil then
         local l_58_4 = l_58_3:BFG_TA_COUNT_BIOME(l_58_arg1)
         local l_58_5 = l_58_3:BFG_TA_GET_COUNT()
         if l_58_4 ~= nil and l_58_5 ~= nil and l_58_arg2 <= 100 * l_58_4 / l_58_5 then
            return true
         end
      end
   end
   return false
end

existEntityMeetsEnvThreshhold = function(l_59_arg0, l_59_arg1, l_59_arg2)
   if l_59_arg0 == nil then
      return false
   end
   local l_59_3 = table.getn(l_59_arg0)
   for l_59_4 = 1, l_59_3 do
      local l_59_7 = resolveTable(l_59_arg0[l_59_4].value)
      if doesentityhaveenoughbiome(l_59_7, l_59_arg1, l_59_arg2) then
         return true
      end
   end
   return false
end

getAvailableSpecies = function()
   local l_60_0 = nil
   local l_60_1 = queryObject("ZTAdoptionMgr")
   if l_60_1 then
      l_60_0 = l_60_1:ZT_GET_AVAILABLE_SPECIES()
   end
   return l_60_0
end

canMate = function(l_61_arg0, l_61_arg1)
   if l_61_arg0 and l_61_arg1 and l_61_arg0:BFG_CAN_MATE_WITH(l_61_arg1) == true then
      return true
   end
   return false
end

speciesCanMate = function(l_62_arg0)
   local l_62_1 = findType(l_62_arg0 .. "_Adult_M")
   local l_62_2 = findType(l_62_arg0 .. "_Adult_F")
   if table.getn(l_62_1) < 1 or table.getn(l_62_2) < 1 then
      return false
   end
   for l_62_3 = 1, table.getn(l_62_1) do
      local l_62_6 = resolveTable(l_62_1[l_62_3].value)
      for l_62_7 = 1, table.getn(l_62_2) do
         local l_62_10 = resolveTable(l_62_2[l_62_7].value)
         if canMate(l_62_6, l_62_10) == true then
            return true
         end
      end
   end
   return false
end

getEndangerment = function(l_63_arg0)
   local l_63_1 = ""
   if l_63_arg0 ~= nil then
      l_63_1 = l_63_arg0:BFG_GET_ATTR_STRING("s_Endangerment")
   end
   return l_63_1
end

getSpeciesName = function(l_64_arg0)
   local l_64_1 = ""
   if l_64_arg0 ~= nil then
      l_64_1 = l_64_arg0:BFG_GET_ATTR_STRING("s_Species")
   end
   return l_64_1
end

isChild = function(l_65_arg0)
   local l_65_1 = false
   if l_65_arg0 ~= nil and l_65_arg0:BFG_GET_ATTR_BOOLEAN("b_Adult") == false then
      l_65_1 = true
   end
   return l_65_1
end

getEndangeredSpeciesList = function()
   local l_66_0 = {}
   local l_66_1 = findType("animal")
   for l_66_2 = 1, table.getn(l_66_1) do
      local l_66_5 = resolveTable(l_66_1[l_66_2].value)
      local l_66_6 = getEndangerment(l_66_5)
      if l_66_6 == "Endangered" or l_66_6 == "Critical" then
         local l_66_7 = getSpeciesName(l_66_5)
         local l_66_8 = false
         for l_66_9 = 1, table.getn(l_66_0) do
            if l_66_0[l_66_9] == l_66_7 then
               l_66_8 = true
            end
         end
         if l_66_8 == false then
            l_66_0[table.getn(l_66_0) + 1] = l_66_7
         end
      end
   end
   return l_66_0
end

getMarineSpeciesList = function()
   local l_67_0 = {}
   local l_67_1 = findType("animal")
   for l_67_2 = 1, table.getn(l_67_1) do
      local l_67_5 = resolveTable(l_67_1[l_67_2].value)
      local l_67_6 = isMarineAnimal(l_67_5)
      if l_67_6 then
         local l_67_7 = getSpeciesName(l_67_5)
         local l_67_8 = false
         for l_67_9 = 1, table.getn(l_67_0) do
            if l_67_0[l_67_9] == l_67_7 then
               l_67_8 = true
            end
         end
         if l_67_8 == false then
            l_67_0[table.getn(l_67_0) + 1] = l_67_7
         end
      end
   end
   return l_67_0
end

getExtinctSpeciesList = function(l_68_arg0)
   local l_68_1 = {}
   local l_68_2 = findType("animal")
   for l_68_3 = 1, table.getn(l_68_2) do
      local l_68_6 = resolveTable(l_68_2[l_68_3].value)
      local l_68_7 = isExtinctAnimal(l_68_6)
      if l_68_7 then
         local l_68_8 = true
         if l_68_arg0 ~= nil and l_68_arg0 == true and animal:BFG_GET_ATTR_STRING("s_Product") ~= "Extinct" then
            l_68_8 = false
         end
         if l_68_8 == true then
            local l_68_9 = getSpeciesName(l_68_6)
            local l_68_10 = false
            for l_68_11 = 1, table.getn(l_68_1) do
               if l_68_1[l_68_11] == l_68_9 then
                  l_68_10 = true
               end
            end
            BFLOG("Adding: " .. l_68_9 .. " to extinct species list")
            if l_68_10 == false then
               l_68_1[table.getn(l_68_1) + 1] = l_68_9
            end
         end
      end
   end
   return l_68_1
end

getSuperExtinctSpeciesList = function()
   local l_69_0 = {}
   local l_69_1 = findType("animal")
   for l_69_2 = 1, table.getn(l_69_1) do
      local l_69_5 = resolveTable(l_69_1[l_69_2].value)
      local l_69_6 = isExtinctAnimal(l_69_5)
      if l_69_6 then
         local l_69_7 = l_69_5:BFG_GET_ATTR_BOOLEAN("b_Super")
         if l_69_7 then
            local l_69_8 = getSpeciesName(l_69_5)
            local l_69_9 = false
            for l_69_10 = 1, table.getn(l_69_0) do
               if l_69_0[l_69_10] == l_69_8 then
                  l_69_9 = true
               end
            end
            BFLOG("Adding: " .. l_69_8 .. " to extinct species list")
            if l_69_9 == false then
               l_69_0[table.getn(l_69_0) + 1] = l_69_8
            end
         end
      end
   end
   return l_69_0
end

getAllMarineSpeciesList = function()
   local l_70_0 = {}
   local l_70_1 = getAllSpeciesList()
   if l_70_1 ~= nil then
      local l_70_2 = table.getn(l_70_1)
      for l_70_3 = 1, l_70_2 do
         local l_70_6 = l_70_1[l_70_3]
         local l_70_7 = getBoolFromBinder(l_70_6, "b_MarineAnimal")
         if l_70_7 ~= nil and l_70_7 == true then
            l_70_0[table.getn(l_70_0) + 1] = l_70_6
         end
      end
   end
   return l_70_0
end

getAllExtinctSpeciesList = function(l_71_arg0)
   local l_71_1 = {}
   local l_71_2 = getAllSpeciesList()
   if l_71_2 ~= nil then
      local l_71_3 = table.getn(l_71_2)
      for l_71_4 = 1, l_71_3 do
         local l_71_7 = l_71_2[l_71_4]
         local l_71_8 = getBoolFromBinder(l_71_7, "b_ExtinctAnimal")
         if l_71_8 ~= nil and l_71_8 == true then
            local l_71_9 = true
            if l_71_arg0 ~= nil and l_71_arg0 == true and getStringFromBinder(l_71_7, "s_Product") ~= "Extinct" then
               l_71_9 = false
            end
            if l_71_9 then
               l_71_1[table.getn(l_71_1) + 1] = l_71_7
            end
         end
      end
   end
   return l_71_1
end

getShowSpeciesList = function()
   local l_72_0 = {}
   local l_72_1 = findType("animal")
   for l_72_2 = 1, table.getn(l_72_1) do
      local l_72_5 = resolveTable(l_72_1[l_72_2].value)
      local l_72_6 = isShowAnimal(l_72_5)
      if l_72_6 then
         local l_72_7 = getSpeciesName(l_72_5)
         local l_72_8 = false
         for l_72_9 = 1, table.getn(l_72_0) do
            if l_72_0[l_72_9] == l_72_7 then
               l_72_8 = true
            end
         end
         BFLOG("Adding: " .. l_72_7 .. " to marine species list")
         if l_72_8 == false then
            l_72_0[table.getn(l_72_0) + 1] = l_72_7
         end
      end
   end
   return l_72_0
end

getMarineEntityList = function()
   local l_73_0 = {}
   local l_73_1 = findType("animal")
   for l_73_2 = 1, table.getn(l_73_1) do
      local l_73_5 = resolveTable(l_73_1[l_73_2].value)
      if l_73_5 then
         local l_73_6 = isMarineAnimal(l_73_5)
         if l_73_6 then
            BFLOG("Adding 1 to marine entity list")
            local l_73_7 = table.getn(l_73_0) + 1
            l_73_0[l_73_7] = l_73_1[l_73_2]
         end
      end
   end
   return l_73_0
end

getExtinctEntityList = function()
   local l_74_0 = {}
   local l_74_1 = findType("animal")
   for l_74_2 = 1, table.getn(l_74_1) do
      local l_74_5 = resolveTable(l_74_1[l_74_2].value)
      if l_74_5 then
         local l_74_6 = isExtinctAnimal(l_74_5)
         if l_74_6 then
            BFLOG("Adding 1 to extinct entity list")
            local l_74_7 = table.getn(l_74_0) + 1
            l_74_0[l_74_7] = l_74_1[l_74_2]
         end
      end
   end
   return l_74_0
end

getStringFromBinder = function(l_75_arg0, l_75_arg1)
   local l_75_2 = ""
   local l_75_3 = queryObject("ZTWorldMgr")
   if l_75_3 ~= nil then
      local l_75_4, l_75_5 = l_75_3:BFG_GET_ATTR_STRING, l_75_3
      local l_75_6
      l_75_4, l_75_6 = l_75_4(l_75_5, l_75_6), {key = l_75_arg0, val = l_75_arg1}
      l_75_2 = l_75_4
   end
   return l_75_2
end

getBoolFromBinder = function(l_76_arg0, l_76_arg1)
   local l_76_2 = ""
   local l_76_3 = queryObject("ZTWorldMgr")
   if l_76_3 ~= nil then
      local l_76_4, l_76_5 = l_76_3:BFG_GET_ATTR_BOOLEAN, l_76_3
      local l_76_6
      l_76_4, l_76_6 = l_76_4(l_76_5, l_76_6), {key = l_76_arg0, val = l_76_arg1}
      l_76_2 = l_76_4
   end
   return l_76_2
end

isMarineAnimal = function(l_77_arg0)
   local l_77_1 = false
   if l_77_arg0 ~= nil and l_77_arg0:BFG_GET_ATTR_BOOLEAN("b_MarineAnimal") == true then
      l_77_1 = true
   end
   return l_77_1
end

isShowAnimal = function(l_78_arg0)
   local l_78_1 = false
   if l_78_arg0 ~= nil and l_78_arg0:BFG_GET_ATTR_BOOLEAN("b_ShowAnimal") == true then
      l_78_1 = true
   end
   return l_78_1
end

isMarineAnimalByType = function(l_79_arg0)
   BFLOG("isMarineAnimalByType type = " .. l_79_arg0)
   local l_79_1 = false
   local l_79_2 = findType(l_79_arg0)
   if l_79_2 then
      for l_79_3 = 1, table.getn(l_79_2) do
         local l_79_6 = resolveTable(l_79_2[l_79_3].value)
         if l_79_6 then
            local l_79_7 = l_79_6:BFG_GET_ATTR_BOOLEAN("b_MarineAnimal")
            if l_79_7 == true then
               l_79_1 = true
               return l_79_1
            else
               BFLOG("not a marine animal")
            end
         else
            BFLOG("single is nil")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
   end
   return l_79_1
end

isExtinctAnimal = function(l_80_arg0)
   local l_80_1 = false
   if l_80_arg0 ~= nil and l_80_arg0:BFG_GET_ATTR_BOOLEAN("b_ExtinctAnimal") == true then
      l_80_1 = true
   end
   return l_80_1
end

isExtinctAnimalByType = function(l_81_arg0)
   BFLOG("isExtinctAnimalByType type = " .. l_81_arg0)
   local l_81_1 = false
   local l_81_2 = findType(l_81_arg0)
   if l_81_2 then
      for l_81_3 = 1, table.getn(l_81_2) do
         local l_81_6 = resolveTable(l_81_2[l_81_3].value)
         if l_81_6 then
            local l_81_7 = l_81_6:BFG_GET_ATTR_BOOLEAN("b_ExtinctAnimal")
            if l_81_7 == true then
               l_81_1 = true
               return l_81_1
            else
               BFLOG("not an extinct animal")
            end
         else
            BFLOG("single is nil")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
   end
   return l_81_1
end

isPregnant = function(l_82_arg0)
   local l_82_1 = false
   if l_82_arg0 ~= nil and l_82_arg0:BFG_GET_ATTR_BOOLEAN("b_Pregnant") == true then
      l_82_1 = true
   end
   return l_82_1
end

hasPregnantAnimal = function(l_83_arg0)
   for l_83_1 = 1, table.getn(l_83_arg0) do
      local l_83_4 = resolveTable(l_83_arg0[l_83_1].value)
      if l_83_4 and isPregnant(l_83_4) then
         return true
      end
   end
   return false
end

inSameHabitat = function(l_84_arg0, l_84_arg1)
   return l_84_arg0:BFAI_IS_ENTITY_IN_HABITAT(l_84_arg1)
end

getNeedPoints = function(l_85_arg0, l_85_arg1)
   if l_85_arg0 ~= nil then
      return l_85_arg0:BFG_GET_ATTR_FLOAT(l_85_arg1)
   end
   return nil
end

getID = function(l_86_arg0)
   if l_86_arg0 then
      return l_86_arg0:BFG_GET_ENTITY_ID()
   end
end

findEntityByID = function(l_87_arg0)
   local l_87_1 = queryObject("BFGManager")
   if l_87_1 then
      BFLOG("Entntiy ID: " .. l_87_arg0)
      local l_87_2 = (l_87_1:BFG_GET_ENTITY_FROM_ID(l_87_arg0))
      local l_87_3 = nil
      if l_87_2 ~= nil then
         l_87_3 = resolveTable(l_87_2[1].value)
      else
         BFLOG("Failed to get entity")
      end
      return l_87_3
   end
end

isCratedEntity = function(l_88_arg0)
   local l_88_1 = l_88_arg0:BFG_GET_BINDER_TYPE()
   local l_88_2 = getID(l_88_arg0)
   if l_88_1 then
      local l_88_3 = findTypeDirect(l_88_1)
      if l_88_3 then
         for l_88_4 = 1, table.getn(l_88_3) do
            local l_88_7 = resolveTable(l_88_3[l_88_4].value)
            if l_88_7 and getID(l_88_7) == l_88_2 then
               return false
            end
         end
      else
         BFLOG("Table is nil")
      end
   else
      BFLOG("Bad Type")
   end
   -- Tried to add an 'end' here but it's incorrect
   return true
end

isCratedEntityID = function(l_89_arg0)
   local l_89_1 = findEntityByID(l_89_arg0)
   local l_89_2 = l_89_1:BFG_GET_BINDER_TYPE()
   if l_89_2 then
      local l_89_3 = findTypeDirect(l_89_2)
      if l_89_3 then
         for l_89_4 = 1, table.getn(l_89_3) do
            local l_89_7 = resolveTable(l_89_3[l_89_4].value)
            if l_89_7 and getID(l_89_7) == l_89_arg0 then
               return false
            end
         end
      else
         BFLOG("Table is nil")
      end
   else
      BFLOG("Bad Type")
   end
   -- Tried to add an 'end' here but it's incorrect
   return true
end

setNeed = function(l_90_arg0, l_90_arg1, l_90_arg2)
   if l_90_arg0 then
      l_90_arg0:BFG_SET_ATTR_FLOAT(l_90_arg1, l_90_arg2)
   end
end

howManyOfTypeInCrate = function(l_91_arg0)
   local l_91_1 = findType(l_91_arg0)
   local l_91_2 = findTypeDirect(l_91_arg0)
   if l_91_1 and l_91_2 then
      local l_91_3 = table.getn(l_91_1)
      local l_91_4 = table.getn(l_91_2)
      BFLOG("Size of diff: " .. l_91_3 - l_91_4)
   end
end

getMaxShowSeen = function(l_92_arg0)
   if l_92_arg0 then
      return l_92_arg0:BFG_GET_ATTR_FLOAT("f_MaxShowSeen")
   end
end

getName = function(l_93_arg0)
   if l_93_arg0 then
      return l_93_arg0:BFG_GET_ATTR_STRING("s_name")
   end
end

getIsTankInWorld = function()
   BFLOG("getIsTankInworld")
   local l_94_0 = queryObject("ZTTankMgr")
   if l_94_0 ~= nil then
      BFLOG("Found Manager")
      local l_94_1 = l_94_0:ZT_IS_TANK_IN_WORLD()
      if l_94_1 ~= nil then
         return l_94_1
      else
         BFLOG("failed to get table")
      end
   else
      BFLOG("failed to get Manager")
   end
   -- Tried to add an 'end' here but it's incorrect
   return nil
end

getTankWaterHeightList = function()
   local l_95_0 = queryObject("ZTTankMgr")
   if l_95_0 ~= nil then
      BFLOG("Found Manager")
      local l_95_1 = l_95_0:ZT_GET_TANK_WATER_HEIGHT()
      if l_95_1 ~= nil then
         return l_95_1
      else
         BFLOG("failed to get table")
      end
   else
      BFLOG("failed to get Manager")
   end
   -- Tried to add an 'end' here but it's incorrect
   return nil
end

setTankWallHeight = function(l_96_arg0)
   local l_96_1 = queryObject("ZTTankMgr")
   if l_96_1 ~= nil then
      BFLOG("Found Manager")
      l_96_1:ZT_SET_TANK_WALL_HEIGHT(l_96_arg0)
   else
      BFLOG("failed to get Manager")
   end
   return nil
end

getTankFloorHeightList = function()
   local l_97_0 = queryObject("ZTTankMgr")
   if l_97_0 ~= nil then
      BFLOG("Found Manager")
      local l_97_1 = l_97_0:ZT_GET_TANK_FLOOR_HEIGHT()
      if l_97_1 ~= nil then
         return l_97_1
      else
         BFLOG("failed to get table")
      end
   else
      BFLOG("failed to get Manager")
   end
   -- Tried to add an 'end' here but it's incorrect
   return nil
end

disableAllAdoptButtons = function()
   local l_98_0 = findType("animal")
   if l_98_0 then
      for l_98_1 = 1, table.getn(l_98_0) do
         local l_98_4 = resolveTable(l_98_0[l_98_1].value)
         if l_98_4 then
            l_98_4:BFG_SET_ATTR_BOOLEAN("b_showAdopt", false)
         end
      end
   end
end

isEntityOnBiome = function(l_99_arg0, l_99_arg1)
   return l_99_arg0:BFAI_IS_ENTITY_ON_BIOME(l_99_arg1)
end

allExtinctAnimalsCured = function()
   local l_100_0 = true
   local l_100_1 = getExtinctEntityList()
   for l_100_2 = 1, table.getn(l_100_1) do
      local l_100_5 = resolveTable(l_100_1[l_100_2].value)
      if l_100_5 ~= nil then
         local l_100_6 = l_100_5:BFG_GET_ATTR_BOOLEAN("b_Disease")
         if l_100_6 == true then
            BFLOG("allExtinctAnimalsCured -- " .. getSpeciesName(l_100_5) .. " is diseased")
            l_100_0 = false
         else
            BFLOG("allExtinctAnimalsCured -- animal was nil")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
      return l_100_0
end

countEntitiesMatchingAttribute = function(l_101_arg0, l_101_arg1, l_101_arg2)
   local l_101_3 = findType(l_101_arg0)
   if l_101_3 == nil then
      BFLOG("No entities of type " .. l_101_arg0 .. " found.")
      return 0
   end
   local l_101_4 = false
   local l_101_5 = false
   local l_101_6 = false
   local l_101_7 = string.sub(l_101_arg1, 1, 2)
   if l_101_7 == "b_" then
      l_101_4 = true
   elseif l_101_7 == "f_" then
      l_101_5 = true
   elseif l_101_7 == "s_" then
      l_101_6 = true
   end
   local l_101_8 = 0
   local l_101_9 = 0
   l_101_9 = table.getn(l_101_3)
   for l_101_10 = 1, l_101_9 do
      local l_101_13 = resolveTable(l_101_3[l_101_10].value)
      if l_101_13 ~= nil then
         local l_101_14 = nil
         if l_101_4 == true then
            l_101_14 = l_101_13:BFG_GET_ATTR_BOOLEAN(l_101_arg1)
         elseif l_101_5 == true then
            l_101_14 = l_101_13:BFG_GET_ATTR_FLOAT(l_101_arg1)
         elseif l_101_6 == true then
            l_101_14 = l_101_13:BFG_GET_ATTR_STRING(l_101_arg1)
         end
         if l_101_14 ~= nil and l_101_14 == l_101_arg2 then
            l_101_8 = l_101_8 + 1
         else
            BFLOG("single is nil")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
      return l_101_8
end


