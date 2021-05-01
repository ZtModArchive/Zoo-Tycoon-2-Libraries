GiftCheck = function(l_1_arg0)
   local l_1_1 = math.random(1, 100)
   if l_1_1 <= 50 then
      return "complete"
   end
   if l_1_arg0 ~= nil and table.getn(l_1_arg0) >= 2 then
      local l_1_2 = resolveTable(l_1_arg0[1].value)
      if l_1_2 ~= nil then
         local l_1_3 = resolveTable(l_1_arg0[2].value)
         if l_1_3 ~= nil then
            local l_1_4 = l_1_3:BFG_GET_ATTR_STRING("s_Species")
            if l_1_4 ~= nil and string.len(l_1_4) > 0 then
               local l_1_5 = "t_" .. l_1_4 .. "Gift"
               local l_1_6
               local l_1_7 = loadComponent(l_1_6)
               l_1_6 = {_xml = "BFAIToken", Name = l_1_5}
               if l_1_7 ~= nil then
                  l_1_2:BFG_SEND_TOKEN(l_1_7)
                  return "complete"
               end
            end
         end
      end
   end
   return "error"
end


