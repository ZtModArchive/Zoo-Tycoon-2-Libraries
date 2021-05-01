include("scenario/scripts/economy.lua")
getNearestCompostBin = function(l_1_arg0, l_1_arg1)
   if l_1_arg0 == nil or l_1_arg1 == nil or table.getn(l_1_arg1) <= 0 then
      return nil
   end
   local l_1_2 = (l_1_arg0:BFG_GET_ENTITY_POSITION())
   local l_1_3 = nil
   local l_1_4, l_1_5, l_1_6, l_1_7 = ipairs(l_1_arg1)
   for l_1_2 in l_1_4 do
      local l_1_8 = resolveTable(l_1_7.value)
      if l_1_8 ~= nil then
         local l_1_9 = l_1_8:BFG_GET_ENTITY_POSITION()
         if l_1_9 ~= nil then
            if l_1_2 == nil then
            else
               local l_1_10 = l_1_2.x - l_1_9.x
               local l_1_11 = l_1_2.y - l_1_9.y
               l_1_8.dist_squared = l_1_10 * l_1_10 + l_1_11 * l_1_11
               if l_1_3 == nil or l_1_8.dist_squared < l_1_3.dist_squared then
                  l_1_3 = l_1_8
               end
               -- Tried to add an 'end' here but it's incorrect
            end
            -- Tried to add an 'end' here but it's incorrect
         end
         return l_1_3
end

sellCompostInternal = function(l_2_arg0)
   local l_2_1 = 500
   local l_2_2 = l_2_1 * l_2_arg0
   local l_2_3 = queryObject("ZTEconomyMgr")
   if l_2_3 then
      local l_2_4, l_2_5 = l_2_3:ZT_GENERIC_TRANSACTION, l_2_3
      local l_2_6
      l_2_4(l_2_5, l_2_6)
      l_2_6 = {_type = "BFStringFloatObj", string = "destroy", float = l_2_2}
   end
end

sellCompost = function(l_3_arg0)
   if l_3_arg0 == nil or table.getn(l_3_arg0) < 2 then
      return 
   end
   local l_3_1 = queryObject("BFGManager")
   if l_3_1 ~= nil then
      local l_3_2 = resolveTable(l_3_arg0[2].value)
      if l_3_2 ~= nil then
         local l_3_3 = 100
         local l_3_4 = l_3_2:BFG_GET_ATTR_FLOAT("f_PooLevel")
         sellCompostInternal(l_3_4 / l_3_3)
         local l_3_5, l_3_6 = l_3_2:BFG_SET_ATTR_FLOAT, l_3_2
         local l_3_7 = {"f_PooLevel", 0}
         l_3_5(l_3_6, l_3_7)
      end
   end
end

adjustAndSellCompost = function(l_4_arg0, l_4_arg1)
   if l_4_arg0 == nil or l_4_arg1 == nil then
      BFLOG("nearestBin or poo was nil")
      return 
   end
   local l_4_2 = 5
   local l_4_3
   local l_4_4 = 100
   local l_4_6 = l_4_arg0:BFG_GET_ATTR_FLOAT("f_PooLevel")
   l_4_6, l_4_3 = l_4_6 + l_4_3[l_4_arg1:BFG_GET_BINDER_TYPE()] * l_4_2, {Poop_BigCat = 3, Poop_Bird = 1, Poop_Large = 3, Poop_Medium = 2, Poop_Rhinoceros = 3, Poop_Small = 1, Poop_Ungulate = 2, Poop_Ungulate_Small = 1, Poop_Dog = 2, Poop_Reptile = 1, Poop_Dino = 3, Poop_Giant = 3, Poop_GiantBird = 2, Poop_BigCat_Sick = 0, Poop_Bird_Sick = 0, Poop_Dog_Sick = 0, Poop_Large_Sick = 0, Poop_Medium_Sick = 0, Poop_Reptile_Sick = 0, Poop_Rhinoceros_Sick = 0, Poop_Small_Sick = 0, Poop_Ungulate_Sick = 0, Poop_Ungulate_Small_Sick = 0, Poop_Dino_Sick = 0, Poop_Giant_Sick = 0, Poop_GiantBird_Sick = 0}
   --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

CompostPoo = function(l_5_arg0)
   if l_5_arg0 == nil or table.getn(l_5_arg0) < 2 then
      return 0
   end
   local l_5_1 = queryObject("BFGManager")
   if l_5_1 ~= nil then
      local l_5_2 = getNearestCompostBin(resolveTable(l_5_arg0[1].value), l_5_1:BFG_GET_ENTITIES("compost_df"))
      if l_5_2 ~= nil then
         adjustAndSellCompost(l_5_2, resolveTable(l_5_arg0[2].value))
         return "complete"
      end
   end
   return "complete"
end


