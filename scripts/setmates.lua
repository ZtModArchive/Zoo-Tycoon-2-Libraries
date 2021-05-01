setmates = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      LUALOG("setmates -- args is " .. table.getn(l_1_arg0) .. " elements")
      local l_1_1 = l_1_arg0[1]
      if l_1_1 ~= nil then
         local l_1_2 = l_1_1.value
         if l_1_2 ~= nil then
            local l_1_3 = resolveTable(l_1_2)
            if l_1_3 ~= nil then
               local l_1_4 = l_1_arg0[2]
               if l_1_4 ~= nil then
                  local l_1_5 = l_1_4.value
                  if l_1_5 ~= nil then
                     local l_1_6 = resolveTable(l_1_5)
                     if l_1_6 ~= nil then
                        l_1_6:sendMessage("BFAI_CLEAR_RELATIONSHIP", "mate")
                        l_1_3:sendMessage("BFAI_CLEAR_RELATIONSHIP", "mate")
                        local l_1_7 = {}
                        l_1_7.relation = "mate"
                        l_1_7.target = l_1_6
                        l_1_3:sendMessage("BFAI_ADD_RELATIONSHIP", l_1_7)
                        l_1_7.target = l_1_3
                        l_1_6:sendMessage("BFAI_ADD_RELATIONSHIP", l_1_7)
                        return "complete"
                     else
                        LUALOG("setmates -- couldn't resolve target/mother entity pointer")
                     end
                  else
                     LUALOG("setmates -- couldn't resolve target/mother handle")
                  end
               else
                  LUALOG("setmates -- couldn't parse third argument (args[2]/target/mother)")
               end
            else
               LUALOG("setmates -- couldn't resolve subject/father entity pointer")
            end
         else
            LUALOG("setmates -- couldn't resolve subject/father handle")
         end
      else
         LUALOG("setmates -- couldn't parse second argument (args[1]/subject/father)")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "error"
end


