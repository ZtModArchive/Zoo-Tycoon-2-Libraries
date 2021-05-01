tokenUsage = function()
   BFLOG(SYSERROR, "Usage: giveToken( { animalName, tokenName, timeout, timein }, force )")
   return nil
end

isToken = function(l_2_arg0)
   return string.len(l_2_arg0) > 2 and string.find(l_2_arg0, "t_") == 1
end

unpackArgs = function(l_3_arg0)
   if l_3_arg0 == nil or type(l_3_arg0) ~= "table" then
      return nil
   end
   local l_3_1 = table.getn(l_3_arg0)
   local l_3_2
   if l_3_1 < 2 then
      return nil
   else
      l_3_2 = {timeout = "3.0", timein = "0.0", tokenName = l_3_arg0[2].value}
      --[[ DECOMPILER ERROR 279: unhandled construct in 'if' ]]
end

giveToken = function(l_4_arg0, l_4_arg1)
   local l_4_2 = unpackArgs(l_4_arg0)
   if l_4_2 == nil then
      tokenUsage()
      return 
   end
   local l_4_3 = queryObject("BFGManager")
   if l_4_3 ~= nil then
      local l_4_4 = l_4_3:BFG_GET_NAMED_ENTITY(l_4_arg0[1].value)
      if l_4_4 ~= nil then
         local l_4_5 = string.format("[[<BFAIToken Name=\"%s\" Force=\"%d\" Timeout=\"%.1f\" Timein=\"%.1f\" Reconsider=\"%d\" />]]", l_4_2.tokenName, l_4_arg1, l_4_2.timeout, l_4_2.timein, 1)
         local l_4_6 = loadComponent(l_4_5)
         if l_4_6 ~= nil then
            LUALOG("***** Sending token: " .. l_4_2.tokenName .. " *****")
            l_4_4:BFG_SEND_TOKEN(l_4_6)
         else
            LUALOG("***** Failed to create token: " .. l_4_2.tokenName .. " *****")
         end
      else
         LUALOG("***** Subject not found! *****")
      end
   else
      LUALOG("***** Game manager not found! *****")
   end
   -- Tried to add an 'end' here but it's incorrect
   -- Tried to add an 'end' here but it's incorrect
end


