include("scripts/uiutil.lua")
findType = function(l_1_arg0)
   local l_1_1 = queryObject("BFGManager")
   if l_1_1 ~= nil then
      local l_1_2 = l_1_1:BFG_GET_ENTITIES(l_1_arg0)
      if l_1_2 ~= nil and type(l_1_2) == "table" then
         return l_1_2
      end
   end
   BFLOG(SYSERROR, "Failed to query BFGManager.")
   return nil
end

rebuild = function(l_2_arg0)
   BFLOG(SYSNOTE, "Rebuild " .. l_2_arg0)
   local l_2_1 = findType(l_2_arg0)
   local l_2_2 = table.getn(l_2_1)
   BFLOG(SYSNOTE, "Found " .. l_2_2 .. " entries")
   for l_2_3 = 1, l_2_2 do
      local l_2_6 = resolveTable(l_2_1[l_2_3].value)
      if l_2_6 ~= nil then
         local l_2_7 = l_2_6:BFG_GET_BINDER_TYPE()
         l_2_6:BFG_ENTITY_MORPH_TO_NEW_ENTITY(l_2_7)
         BFLOG(SYSNOTE, "Morphed " .. l_2_3 .. " of type " .. l_2_7)
      end
   end
end

exec = function(l_3_arg0)
   BFLOG(SYSNOTE, "Rebuilding.")
   if l_3_arg0 == nil or table.getn(l_3_arg0) < 1 then
      BFLOG(SYSERROR, "***** USAGE: rebuild <type> *****")
   else
      devConsole("exit")
      rebuild(l_3_arg0[1].value)
   end
end


