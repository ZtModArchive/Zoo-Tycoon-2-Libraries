CrateAnimal = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_1_arg0) .. " elements")
      local l_1_1 = l_1_arg0[1]
      if l_1_1 ~= nil then
         local l_1_2 = l_1_1.value
         if l_1_2 ~= nil then
            local l_1_3 = resolveTable(l_1_2)
            if l_1_3 ~= nil then
               l_1_3:BFG_SEND_SIGNAL_SHARED("ZT_CRATE_ENTITY")
            else
               LUALOG(SYSERROR, "couldn't resolve subject entity pointer")
            end
         else
            LUALOG(SYSERROR, "couldn't resolve subject handle")
         end
      else
         LUALOG(SYSERROR, "couldn't parse first argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end


