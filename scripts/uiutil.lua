getUI = function(l_1_arg0)
   local l_1_1 = queryObject("UIRoot")
   if l_1_1 == nil then
      return nil
   end
   if l_1_arg0 == nil then
      return nil
   end
   local l_1_2 = nil
   if type(l_1_arg0) == "table" then
      local l_1_3 = table.getn(l_1_arg0)
      for l_1_4 = 1, l_1_3 do
         if l_1_4 == 1 then
            l_1_2 = l_1_1:UI_GET_CHILD(l_1_arg0[l_1_4])
         else
            l_1_2 = l_1_2:UI_GET_CHILD(l_1_arg0[l_1_4])
         end
         if l_1_2 == nil then
      else
         end
      end
   elseif type(l_1_arg0) == "string" then
      l_1_2 = l_1_1:UI_GET_CHILD(l_1_arg0)
   end
   -- Tried to add an 'end' here but it's incorrect
   return l_1_2
end

getUIText = function(l_2_arg0)
   local l_2_1 = getUI(l_2_arg0)
   if l_2_1 == nil then
      return ""
   end
   return l_2_1:UI_GET_TEXT()
end

popup = function(l_3_arg0)
   local l_3_1 = getUI("Alert Box")
   if l_3_1 == nil then
      return 
   end
   local l_3_2 = l_3_1:UI_GET_CHILD("Alert Text")
   if l_3_2 == nil then
      return 
   end
   l_3_2:UI_SET_TEXT(l_3_arg0)
   l_3_1:UI_SHOW()
end

sendMessageToChildrenByName = function(l_4_arg0, l_4_arg1, l_4_arg2)
   if l_4_arg0 == nil then
      return 
   end
   local l_4_3 = l_4_arg0:UI_GET_CHILDREN()
   if l_4_3 == nil or type(l_4_3) ~= "table" then
      return 
   end
   local l_4_4 = {}
   local l_4_5 = table.getn(l_4_3)
   for l_4_6 = 1, l_4_5 do
      local l_4_9 = resolveTable(l_4_3[l_4_6].value)
      if l_4_9 ~= nil then
         local l_4_10 = l_4_9:UI_GET_NAME()
         if l_4_10 == l_4_arg1 then
            l_4_4[table.getn(l_4_4) + 1] = l_4_9
         else
            sendMessageToChildrenByName(l_4_9, l_4_arg1, l_4_arg2)
         end
      end
   end
   l_4_5 = table.getn(l_4_4)
   for l_4_6 = 1, l_4_5 do
      l_4_4[l_4_6]:sendMessage(l_4_arg2)
   end
end

broadcastByName = function(l_5_arg0)
   if l_5_arg0 == nil or type(l_5_arg0) ~= "table" or table.getn(l_5_arg0) < 3 then
      return 
   end
   local l_5_1 = getUI(l_5_arg0[1].value)
   if l_5_1 == nil then
      return 
   end
   sendMessageToChildrenByName(l_5_1, l_5_arg0[2].value, l_5_arg0[3].value)
end

devConsole = function(l_6_arg0)
   if l_6_arg0 == nil then
      return 
   end
   local l_6_1 = getUI("devconsole")
   if l_6_1 == nil then
      ZTMode = queryObject("ZTMode")
      ZTMode:sendMessage("ZT_SET_DEVMODE")
      ZTMode:sendMessage("ZT_SET_DEVMODE")
      l_6_1 = getUI("devconsole")
   end
   if l_6_1 == nil then
      return 
   end
   l_6_1:UI_KEYBOARD_ENTER()
   l_6_1:UI_SET_EDIT(l_6_arg0)
   l_6_1:UI_KEYBOARD_LEAVE()
end

setReplacementText = function(l_7_arg0)
   if type(l_7_arg0) ~= "table" then
      return 
   end
   if table.getn(l_7_arg0) < 3 then
      return 
   end
   local l_7_1 = l_7_arg0[1].value
   local l_7_2 = l_7_arg0[2].value
   local l_7_3 = l_7_arg0[3].value
   local l_7_4 = queryObject("BFScenarioMgr")
   if l_7_4 == nil then
      return 
   end
   local l_7_5 = getUI(l_7_1)
   if l_7_5 == nil then
      return 
   end
   l_7_2 = l_7_4:BFS_GETLOCID(l_7_2)
   l_7_2 = string.format(l_7_2, l_7_3)
   l_7_5:UI_SET_TEXT(l_7_2)
end


