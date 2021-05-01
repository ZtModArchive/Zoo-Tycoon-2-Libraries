usage = function()
   LUALOG("***** Incorrect number of parameters passed to giveToken *****")
   LUALOG("***** USAGE (Self Targeted): gt <token name> [timeout] *****")
   LUALOG("***** USAGE (Targeted)     : gt <subject name> <token name> [timeout] *****")
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
   if l_3_1 < 1 then
      return nil
   elseif l_3_1 < 2 then
      l_3_2 = {timeout = "3.0", tokenName = l_3_arg0[1].value}
      if isToken(l_3_2.tokenName) then
         l_3_2.isSelfTask = true
         if l_3_1 > 1 then
            l_3_2.timeout = l_3_arg0[2].value
         else
            return nil
         end
      else
         l_3_2.tokenName = l_3_arg0[2].value
         if isToken(l_3_2.tokenName) then
            l_3_2.isSelfTask = false
            if l_3_1 > 2 then
               l_3_2.timeout = l_3_arg0[3].value
            else
               return nil
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
         end
         -- Tried to add an 'end' here but it's incorrect
         return l_3_2
end

giveToken = function(l_4_arg0, l_4_arg1)
   local l_4_2 = unpackArgs(l_4_arg0)
   if l_4_2 == nil then
      usage()
      return 
   end
   local l_4_3 = queryObject("BFGManager")
   if l_4_3 ~= nil then
      local l_4_4 = nil
      if l_4_2.isSelfTask then
         l_4_4 = l_4_3:BFG_GET_SELECTED_ENTITY()
      else
         l_4_4 = l_4_3:BFG_GET_NAMED_ENTITY(l_4_arg0[1].value)
      end
      if l_4_4 ~= nil then
         local l_4_5 = string.format("[[<BFAIToken Name=\"%s\" Force=\"%d\" Timeout=\"%.1f\" Reconsider=\"%d\" />]]", l_4_2.tokenName, l_4_arg1, l_4_2.timeout, 1)
         local l_4_6 = loadComponent(l_4_5)
         if l_4_6 ~= nil then
            if not l_4_2.isSelfTask then
               local l_4_7 = l_4_3:BFG_GET_SELECTED_ENTITY()
               if l_4_7 ~= nil then
                  l_4_6:BFAI_SET_TOKEN_TARGET(l_4_7)
                  local l_4_8 = queryObject("ZTMainMode")
                  if l_4_8 ~= nil then
                     l_4_8:sendMessage("ZT_SET_SELECTED_ENTITY", l_4_4)
                  else
                     LUALOG("***** Target not found! *****")
                     return 
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
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

exec1 = function(l_5_arg0)
   giveToken(l_5_arg0, "1")
end

exec2 = function(l_6_arg0)
   giveToken(l_6_arg0, "0")
end


