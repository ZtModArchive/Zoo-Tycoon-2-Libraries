include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
makeAnimalSick = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      local l_1_1 = table.getn(l_1_arg0)
      LUALOG("makeAnimalSick -- args is " .. l_1_1 .. " elements")
      local l_1_2 = l_1_arg0[1]
      if l_1_2 ~= nil then
         local l_1_3 = l_1_2.value
         if l_1_3 ~= nil then
            local l_1_4 = resolveTable(l_1_3)
            if l_1_4 ~= nil then
               l_1_4:BFG_SET_ATTR_BOOLEAN("b_Disease", true)
               local l_1_5 = l_1_arg0[l_1_1]
               if l_1_5 ~= nil then
                  local l_1_6 = l_1_5.value
                  if l_1_6 ~= nil then
                     l_1_4:BFG_SET_ATTR_STRING("s_DiseaseName", l_1_6)
                  else
                     LUALOG("makeAnimalSick -- couldn't resolve subject entity pointer")
                  end
               else
                  LUALOG("makeAnimalSick -- couldn't resolve subject handle")
               end
            else
               LUALOG("makeAnimalSick -- couldn't parse second argument")
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
            return "complete"
end

cureAnimal = function(l_2_arg0)
   if l_2_arg0 ~= nil then
      LUALOG("cureAnimal -- args is " .. table.getn(l_2_arg0) .. " elements")
      local l_2_1 = l_2_arg0[1]
      if l_2_1 ~= nil then
         local l_2_2 = l_2_1.value
         if l_2_2 ~= nil then
            local l_2_3 = resolveTable(l_2_2)
            if l_2_3 ~= nil then
               local l_2_4 = "None"
               l_2_3:BFG_SET_ATTR_BOOLEAN("b_Disease", false)
               l_2_3:BFG_SET_ATTR_STRING("s_DiseaseName", l_2_4)
            else
               LUALOG("cureAnimal -- couldn't resolve subject entity pointer")
            end
         else
            LUALOG("cureAnimal -- couldn't resolve subject handle")
         end
      else
         LUALOG("cureAnimal -- couldn't parse second argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end


