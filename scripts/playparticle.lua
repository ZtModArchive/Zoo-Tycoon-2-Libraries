playParticle = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_1_arg0) .. " elements")
      local l_1_1 = l_1_arg0[1]
      if l_1_1 ~= nil then
         local l_1_2 = l_1_1.value
         if l_1_2 ~= nil then
            local l_1_3 = resolveTable(l_1_2)
            if l_1_3 ~= nil then
               local l_1_4 = table.getn(l_1_arg0)
               for l_1_5 = 1, l_1_4 do
                  if type(l_1_arg0[l_1_5].value) == "string" then
                     l_1_3:BFG_PLAY_PARTICLE(l_1_arg0[l_1_5].value)
                  end
               end
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


