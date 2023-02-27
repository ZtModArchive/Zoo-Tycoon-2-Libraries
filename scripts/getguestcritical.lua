include("scenario/scripts/misc.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
exec = function(l_1_arg0)
   local l_1_1 = findType("Guest")
   local l_1_2 = 0
   local l_1_3 = 0
   local l_1_4 = 0
   local l_1_5 = 0
   local l_1_6 = 0
   local l_1_7 = 0
   for l_1_8 = 1, table.getn(l_1_1) do
      local l_1_11 = resolveTable(l_1_1[l_1_8].value)
      if l_1_11 ~= nil then
         if needMeetsThreshold(l_1_11, "hunger", 90) == false then
            l_1_2 = l_1_2 + 1
         end
         if needMeetsThreshold(l_1_11, "thirst", 90) == false then
            l_1_3 = l_1_3 + 1
         end
         if needMeetsThreshold(l_1_11, "rest", 90) == false then
            l_1_4 = l_1_4 + 1
         end
         if needMeetsThreshold(l_1_11, "amusement", 90) == false then
            l_1_5 = l_1_5 + 1
         end
         if needMeetsThreshold(l_1_11, "happiness", 90) == false then
            l_1_7 = l_1_7 + 1
         end
         if needMeetsThreshold(l_1_11, "bathroom", 90) == false then
            l_1_6 = l_1_6 + 1
         end
      end
   end  
   BFLOG(SYSTRACE, "-----------------------------------------------------------")
      if l_1_7 ~= 0 then
         BFLOG(SYSTRACE, "happiness critical: " .. l_1_7)
      end
      if l_1_2 ~= 0 then
         BFLOG(SYSTRACE, "hunger critical: " .. l_1_2)
      end
      if l_1_3 ~= 0 then
         BFLOG(SYSTRACE, "thirst critical: " .. l_1_3)
      end
      if l_1_4 ~= 0 then
         BFLOG(SYSTRACE, "rest critical: " .. l_1_4)
      end
      if l_1_5 ~= 0 then
         BFLOG(SYSTRACE, "amusement critical: " .. l_1_5)
      end
      if l_1_6 ~= 0 then
         BFLOG(SYSTRACE, "bathroom critical: " .. l_1_6)
      end
      BFLOG(SYSTRACE, "-----------------------------------------------------------")
      return 1
end