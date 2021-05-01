include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
placeplant = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      LUALOG("placeplant -- args is " .. table.getn(l_1_arg0) .. " elements")
      local l_1_1 = l_1_arg0[1]
      if l_1_1 ~= nil then
         local l_1_2 = l_1_1.value
         if l_1_2 ~= nil then
            local l_1_3 = resolveTable(l_1_2)
            if l_1_3 ~= nil then
               local l_1_4 = l_1_3:BFG_GET_ENTITY_POSITION()
               BFLOG("Pos X=" .. l_1_4.x .. " Y=" .. l_1_4.y)
               local l_1_5 = filterPlantsByBiome("Savannah")
               if l_1_5 ~= nil then
                  local l_1_6 = l_1_5[math.random(table.getn(l_1_5))]
                  LUALOG("placeplant -- plant to place" .. l_1_6)
                  placeObject(l_1_6, l_1_4.x, l_1_4.y, 0, false, false)
               else
                  LUALOG("placeplant -- plantTable was nil")
               end
            else
               LUALOG("placeplant -- couldn't resolve subject entity pointer")
            end
         else
            LUALOG("placeplant -- couldn't resolve subject handle")
         end
      else
         LUALOG("placeplant -- couldn't parse second argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end

filterPlantsByBiome = function(l_2_arg0)
   local l_2_1 = findType("plant")
   if l_2_1 == nil then
      return nil
   end
   local l_2_2 = {}
   local l_2_3 = 1
   local l_2_4 = table.getn(l_2_1)
   for l_2_5 = 1, l_2_4 do
      local l_2_8 = resolveTable(l_2_1[l_2_5].value)
      if l_2_8 ~= nil then
         local l_2_9 = l_2_8:BFG_GET_PRIMARY_BIOME()
         BFLOG("Location: " .. l_2_9)
         local l_2_10 = nil
         l_2_10 = string.find(l_2_9, "_" .. l_2_arg0)
         if l_2_10 ~= nil then
            BFLOG("Found")
            l_2_2[l_2_3] = l_2_1[l_2_5]
            l_2_3 = l_2_3 + 1
         end
      end
   end
   return l_2_2
end


