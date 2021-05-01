kickoffanim1 = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_1_arg0) .. " elements")
      local l_1_1 = l_1_arg0[2]
      if l_1_1 ~= nil then
         local l_1_2 = l_1_1.value
         if l_1_2 ~= nil then
            local l_1_3 = resolveTable(l_1_2)
            if l_1_3 ~= nil then
               l_1_3:sendMessage("BFG_SETPHYSANIM", "used1")
            else
               LUALOG(SYSERROR, "couldn't resolve target entity pointer")
            end
         else
            LUALOG(SYSERROR, "couldn't resolve target handle")
         end
      else
         LUALOG(SYSERROR, "couldn't parse second argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end

kickoffanim2 = function(l_2_arg0)
   if l_2_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_2_arg0) .. " elements")
      local l_2_1 = l_2_arg0[2]
      if l_2_1 ~= nil then
         local l_2_2 = l_2_1.value
         if l_2_2 ~= nil then
            local l_2_3 = resolveTable(l_2_2)
            if l_2_3 ~= nil then
               l_2_3:sendMessage("BFG_SETPHYSANIM", "used2")
            else
               LUALOG(SYSERROR, "couldn't resolve target entity pointer")
            end
         else
            LUALOG(SYSERROR, "couldn't resolve target handle")
         end
      else
         LUALOG(SYSERROR, "couldn't parse second argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end

kickoffanim3 = function(l_3_arg0)
   if l_3_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_3_arg0) .. " elements")
      local l_3_1 = l_3_arg0[2]
      if l_3_1 ~= nil then
         local l_3_2 = l_3_1.value
         if l_3_2 ~= nil then
            local l_3_3 = resolveTable(l_3_2)
            if l_3_3 ~= nil then
               l_3_3:sendMessage("BFG_SETPHYSANIM", "used3")
            else
               LUALOG(SYSERROR, "couldn't resolve target entity pointer")
            end
         else
            LUALOG(SYSERROR, "couldn't resolve target handle")
         end
      else
         LUALOG(SYSERROR, "couldn't parse second argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end


