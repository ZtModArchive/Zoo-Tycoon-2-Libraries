checkforchildren = function(l_1_arg0)
   if l_1_arg0 == nil then
      return false
   end
   local l_1_1 = false
   local l_1_2 = l_1_arg0:sendMessage("BFAI_GET_RELATED_ENTITIES", "child")
   if l_1_2 ~= nil and type(l_1_2) == "table" then
      LUALOG("Found " .. table.getn(l_1_2) .. " children")
      local l_1_3 = table.foreachi
      local l_1_4 = l_1_2
      l_1_3(l_1_4, function(l_2_arg0, l_2_arg1)
         local l_2_2 = resolveTable(l_2_arg1.value)
         if l_2_2 ~= nil then
            local l_2_3 = l_2_2:BFG_GET_ATTR_BOOLEAN("b_Adult")
            if l_2_3 == nil or l_2_3 == false then
               l_1_1 = true
            end
         end
      end)
   else
      LUALOG("No children found")
   end
   return l_1_1
end

checkforpregnant = function(l_2_arg0)
   if l_2_arg0 == nil then
      return false
   end
   local l_2_1 = l_2_arg0:sendMessage("BFAI_HAS_TOKEN", "t_Pregnant")
   local l_2_2 = l_2_arg0:sendMessage("BFAI_HAS_TOKEN", "t_Pregnant1")
   --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

canreproduce = function(l_3_arg0)
   local l_3_1 = "complete"
   if l_3_arg0 ~= nil then
      LUALOG("args is " .. table.getn(l_3_arg0) .. " elements")
      local l_3_2 = l_3_arg0[1]
      if l_3_2 ~= nil then
         local l_3_3 = l_3_2.value
         if l_3_3 ~= nil then
            local l_3_4 = resolveTable(l_3_3)
            if l_3_4 ~= nil then
               if checkforpregnant(l_3_4) then
                  LUALOG("Mother cannot reproduce because she is already pregnant")
                  l_3_1 = "failure"
               elseif checkforchildren(l_3_4) then
                  LUALOG("Mother cannot reproduce because she has children")
                  l_3_1 = "failure"
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
         LUALOG("RETURNING " .. l_3_1 .. " from canreproduce")
         return l_3_1
end


