exec = function(l_1_arg0)
   local l_1_1 = queryObject("BFGManager")
   if l_1_1 == nil then
      LUALOG(SYSERROR, "***** Can't find the game manager! *****")
      return 
   end
   local l_1_2 = queryObject("ZTMode")
   if l_1_2 == nil then
      LUALOG(SYSERROR, "***** Can't find the UI root mode! *****")
      return 
   end
   local l_1_3 = l_1_arg0[1].value
   local l_1_4 = l_1_1:BFG_GET_ENTITIES(l_1_3)
   if l_1_4 ~= nil and type(l_1_4) == "table" then
      LUALOG("***** Found " .. table.getn(l_1_4) .. " entities of type " .. l_1_3 .. " *****")
      local l_1_5 = l_1_1:BFG_GET_SELECTED_ENTITY()
      local l_1_6 = table.foreachi
      local l_1_7 = l_1_4
      l_1_6(l_1_7, function(l_2_arg0, l_2_arg1)
         local l_2_2 = resolveTable(l_2_arg1.value)
         if l_2_2 ~= nil then
            LUALOG("***** Selecting " .. l_1_3 .. " #" .. l_2_arg0 .. " *****")
            l_1_2:sendMessage("ZT_SET_SELECTED_ENTITY", l_2_2)
            local l_2_3 = os.clock()
            local l_2_4 = 2
            while os.clock() - l_2_3 < l_2_4 do
               l_1_1:BFG_UPDATEONCE()
               -- Tried to add an 'end' here but it's incorrect
            end
      end)
      l_1_6, l_1_7 = l_1_2:sendMessage, l_1_2
      l_1_6(l_1_7, "ZT_SET_SELECTED_ENTITY", l_1_5)
   else
      LUALOG(SYSERROR, "***** Could not get a valid entity list! *****")
   end
end


