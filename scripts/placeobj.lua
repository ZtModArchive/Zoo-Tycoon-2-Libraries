placeObject = function(l_1_arg0, l_1_arg1, l_1_arg2, l_1_arg3)
   local l_1_4 = queryObject("ZTWorldMgr")
   if l_1_4 ~= nil then
      local l_1_5, l_1_6 = l_1_4:ZT_PLACEOBJECT, l_1_4
      local l_1_7
      l_1_5(l_1_6, l_1_7)
      l_1_7 = {placementobject = l_1_arg0, x = tonumber(l_1_arg1), y = tonumber(l_1_arg2), z = 0, r = tonumber(l_1_arg3)}
   else
      BFLOG(SYSERROR, "***** Can't locate ZTMode! *****")
   end
end

placeFence = function(l_2_arg0)
   local l_2_1 = queryObject("ZTMode")
   if l_2_1 ~= nil then
      l_2_1:sendMessage("ZT_SETMODE", "mode_fence_placement")
      l_2_1:sendMessage("ZT_SETFENCEPLACEMENTMODE", "rubber-band")
      l_2_1:sendMessage("ZT_SETPLACEMENTFENCE", "chainlink")
      local l_2_2, l_2_3 = l_2_1:sendMessage, l_2_1
      local l_2_4 = "ZT_SETWORLDPOSOFMOUSE"
      local l_2_5
      l_2_2(l_2_3, l_2_4, l_2_5)
      l_2_5 = {x = 12, y = 12, z = 0}
      l_2_2, l_2_3 = l_2_1:sendMessage, l_2_1
      l_2_4 = "ZT_SETWORLDPOSOFMOUSE"
      l_2_2(l_2_3, l_2_4, l_2_5)
      l_2_5 = {x = 24, y = 12, z = 0}
      l_2_2, l_2_3 = l_2_1:sendMessage, l_2_1
      l_2_4 = "ZT_SETWORLDPOSOFMOUSE"
      l_2_2(l_2_3, l_2_4, l_2_5)
      l_2_5 = {x = 24, y = 24, z = 0}
      l_2_2, l_2_3 = l_2_1:sendMessage, l_2_1
      l_2_4 = "ZT_SETWORLDPOSOFMOUSE"
      l_2_2(l_2_3, l_2_4, l_2_5)
      l_2_5 = {x = 12, y = 24, z = 0}
      l_2_2, l_2_3 = l_2_1:sendMessage, l_2_1
      l_2_4 = "ZT_SETWORLDPOSOFMOUSE"
      l_2_2(l_2_3, l_2_4, l_2_5)
      l_2_5 = {x = 12, y = 12, z = 0}
      l_2_2, l_2_3 = l_2_1:sendMessage, l_2_1
      l_2_4 = "ZT_SETPLACEMENTFENCE"
      l_2_2(l_2_3, l_2_4)
   else
      BFLOG(SYSERROR, "***** Can't locate ZTMode! *****")
   end
end

placePath = function(l_3_arg0)
   local l_3_1 = queryObject("ZTMode")
   if l_3_1 ~= nil then
      l_3_1:sendMessage("ZT_SETMODE", "mode_path_placement")
      l_3_1:sendMessage("ZT_SETPLACEMENTPATH", "asphalt")
      local l_3_2, l_3_3 = l_3_1:sendMessage, l_3_1
      local l_3_4 = "ZT_SETWORLDPOSOFMOUSE"
      local l_3_5
      l_3_2(l_3_3, l_3_4, l_3_5)
      l_3_5 = {x = 10, y = 10, z = 0}
      l_3_2, l_3_3 = l_3_1:sendMessage, l_3_1
      l_3_4 = "ZT_SETWORLDPOSOFMOUSE"
      l_3_2(l_3_3, l_3_4, l_3_5)
      l_3_5 = {x = 30, y = 30, z = 0}
      l_3_2, l_3_3 = l_3_1:sendMessage, l_3_1
      l_3_4 = "ZT_SETWORLDPOSOFMOUSE"
      l_3_2(l_3_3, l_3_4, l_3_5)
      l_3_5 = {x = 50, y = 10, z = 0}
      l_3_2, l_3_3 = l_3_1:sendMessage, l_3_1
      l_3_4 = "ZT_SETPLACEMENTPATH"
      l_3_2(l_3_3, l_3_4)
   else
      BFLOG(SYSERROR, "***** Can't locate ZTMode! *****")
   end
end

exec = function(l_4_arg0)
   if l_4_arg0 == nil or table.getn(l_4_arg0) < 3 then
      LUALOG(SYSERROR, "***** USAGE: po <type> <x> <y> [rot] *****")
   elseif table.getn(l_4_arg0) == 3 then
      placeObject(l_4_arg0[1].value, l_4_arg0[2].value, l_4_arg0[3].value, 0)
   elseif table.getn(l_4_arg0) == 4 then
      placeObject(l_4_arg0[1].value, l_4_arg0[2].value, l_4_arg0[3].value, l_4_arg0[4].value)
   end
end


