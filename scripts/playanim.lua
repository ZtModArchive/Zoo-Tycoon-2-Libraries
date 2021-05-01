exec = function(l_1_arg0)
   local l_1_1 = queryObject("BFGManager")
   if l_1_1 ~= nil then
      local l_1_2 = l_1_1:BFG_GET_SELECTED_ENTITY()
      if l_1_2 ~= nil then
         if l_1_arg0 ~= nil then
            local l_1_3 = table.getn(l_1_arg0)
            local l_1_4 = {}
            if l_1_3 >= 1 then
               l_1_4.seqToken = l_1_arg0[1].value
               local l_1_5 = queryObject("ZTDevConsole")
               if l_1_5 ~= nil then
                  l_1_5:UI_CHANGED_TEXT("reload " .. l_1_4.seqToken)
               end
            end
            if l_1_3 >= 2 then
               l_1_4.scale = tonumber(l_1_arg0[2].value)
            end
            if l_1_3 >= 3 then
               l_1_4.time = tonumber(l_1_arg0[3].value)
            end
            l_1_2:sendMessage("ANIM_REQUEST", l_1_4)
         else
            BFLOG(SYSERROR, "***** No animation was specified! *****")
         end
      else
         BFLOG(SYSERROR, "***** No selected entity *****")
      end
   else
      BFLOG(SYSERROR, "***** Can't locate ZTMainMode! *****")
   end
   -- Tried to add an 'end' here but it's incorrect
   -- Tried to add an 'end' here but it's incorrect
end


