exec = function(l_1_arg0)
   local l_1_1 = queryObject("BFGManager")
   if l_1_1 ~= nil then
      local l_1_2 = l_1_1:BFG_GET_SELECTED_ENTITY()
      if l_1_2 ~= nil then
         local l_1_3 = table.getn(l_1_arg0)
         if l_1_arg0 ~= nil and l_1_3 > 0 then
            local l_1_4 = {"hunger", "thirst", "bathroom", "stimulation", "exercise", "reproduction", "privacy", "rest", "hygiene", "lifespan", "social", "health", "environment", "biome", "f_needPointsGood", "f_needPointsBad"}
            local l_1_5 = {}
            local l_1_6, l_1_7, l_1_8, l_1_9 = ipairs(l_1_4)
            for l_1_2 in l_1_6 do
               l_1_5.name = l_1_9
               l_1_5.value = 0
               l_1_2:BFG_SET_ATTR_FLOAT(l_1_5)
            end
            l_1_6 = l_1_arg0[1]
            l_1_6 = l_1_6.value
            l_1_5.name = l_1_6
            if l_1_3 >= 2 then
               l_1_6 = tonumber
               l_1_7 = l_1_arg0[2]
               l_1_7 = l_1_7.value
               l_1_6 = l_1_6(l_1_7)
               l_1_5.value = l_1_6
            else
               l_1_5.value = 100
            end
            l_1_6, l_1_7 = l_1_2:BFG_SET_ATTR_FLOAT, l_1_2
            l_1_8 = l_1_5
            l_1_6(l_1_7, l_1_8)
            l_1_5.name = "f_needPointsGood"
            l_1_5.value = 100
            l_1_6, l_1_7 = l_1_2:BFG_SET_ATTR_FLOAT, l_1_2
            l_1_8 = l_1_5
            l_1_6(l_1_7, l_1_8)
         else
            LUALOG("***** USAGE: so <attribute> [value] *****")
         end
      else
         LUALOG("***** No entity selected *****")
      end
   else
      LUALOG("***** Game manager not found! *****")
   end
   -- Tried to add an 'end' here but it's incorrect
   -- Tried to add an 'end' here but it's incorrect
end


