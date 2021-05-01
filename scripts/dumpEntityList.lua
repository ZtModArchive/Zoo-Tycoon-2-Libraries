include("scenario/scripts/entity.lua")
dumpEntityList = function()
   local l_1_0 = findType("entity")
   local l_1_1 = {}
   for l_1_2 = 1, table.getn(l_1_0) do
      local l_1_5 = resolveTable(l_1_0[l_1_2].value)
      if l_1_5 then
         local l_1_6 = false
         local l_1_7 = l_1_5:BFG_GET_BINDER_TYPE()
         for l_1_8 = 1, table.getn(l_1_1) do
            if l_1_7 == l_1_1[l_1_8] then
               l_1_6 = true
            end
         end
         if l_1_6 == false then
            l_1_1[table.getn(l_1_1) + 1] = l_1_7
         end
      end
   end
   for l_1_2 = 1, table.getn(l_1_1) do
      BFLOG(l_1_1[l_1_2])
   end
   return 1
end


