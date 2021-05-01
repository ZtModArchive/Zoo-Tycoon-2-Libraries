getEntityInstanceData = function(l_1_arg0, l_1_arg1)
   local l_1_2 = l_1_arg0:getEDI()
   if l_1_2 ~= nil then
      return l_1_2:getVar(l_1_arg1)
   else
      return nil
   end
end

generateCaption = function(l_2_arg0)
   local l_2_1 = l_2_arg0:localize("ZTPhotoMode:default_photo_caption")
   local l_2_2 = 100000000
   local l_2_3 = (l_2_arg0:getFirstInterestingEntity())
   local l_2_4 = nil
   while l_2_3 do
      local l_2_5 = getEntityInstanceData(l_2_3, "s_name")
      if l_2_5 ~= nil then
         local l_2_6 = l_2_3:getPAC()
         if l_2_6 and not l_2_6.obscured then
            local l_2_7 = l_2_6:getDistFromCamera()
            if l_2_7 and l_2_7 < l_2_2 then
               l_2_4 = l_2_3
               l_2_2 = l_2_7
            end
         end
      end
      l_2_3 = l_2_arg0:getNextInterestingEntity()
      l_2_5 = nil
   end
   if l_2_4 then
      local l_2_5 = getEntityInstanceData(l_2_4, "s_name")
      if l_2_5 then
         l_2_1 = l_2_5
      end
      -- Tried to add an 'end' here but it's incorrect
      return l_2_1
end


