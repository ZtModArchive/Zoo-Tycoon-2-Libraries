habitathaswater = function(l_1_arg0)
   local l_1_1 = "complete"
   if l_1_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_1_arg0) .. " elements")
      local l_1_2 = l_1_arg0[1]
      if l_1_2 ~= nil then
         local l_1_3 = l_1_2.value
         if l_1_3 ~= nil then
            local l_1_4 = resolveTable(l_1_3)
            if l_1_4 ~= nil then
               local l_1_5 = l_1_4:BFG_GET_TRAVERSABLE_AREA()
               if l_1_5 ~= nil then
                  local l_1_6 = {}
                  l_1_6.featureName = "water"
                  if l_1_5:BFG_TA_HAS_BIOME_FEATURE(l_1_6) == false then
                     l_1_1 = "failure"
                  else
                     LUALOG("couldn't resolve ta pointer")
                  end
               else
                  LUALOG("couldn't resolve subject entity pointer")
               end
            else
               LUALOG("couldn't resolve subject handle")
            end
         else
            LUALOG("couldn't parse second argument")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         return l_1_1
end


