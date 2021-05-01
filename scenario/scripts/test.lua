evalNeutral = function(l_1_arg0)
   return 0
end

evalSuccess = function(l_2_arg0)
   return 1
end

evalFailure = function(l_3_arg0)
   return -1
end

executeSuccess = function(l_4_arg0)
   BFLOG(SYSTRACE, "Success.")
end

executeFailure = function(l_5_arg0)
   BFLOG(SYSTRACE, "Failure.")
end

incCounter = function(l_6_arg0)
   if l_6_arg0.counter == nil then
      l_6_arg0.counter = 1
   else
      l_6_arg0.counter = l_6_arg0.counter + 1
   end
end

decCounter = function(l_7_arg0)
   if l_7_arg0.counter == nil then
      l_7_arg0.counter = -1
   else
      l_7_arg0.counter = l_7_arg0.counter - 1
   end
end

getCounter = function(l_8_arg0)
   if l_8_arg0.counter == nil then
      l_8_arg0.counter = 0
   end
   return l_8_arg0.counter
end

logCounter = function(l_9_arg0)
   if l_9_arg0.counter == nil then
      BFLOG(SYSTRACE, "Counter is not set.")
   else
      BFLOG(SYSTRACE, "Counter is %d" .. l_9_arg0.counter)
   end
end

findType = function(l_10_arg0)
   local l_10_1 = queryObject("BFGManager")
   if l_10_1 ~= nil then
      local l_10_2 = l_10_1:BFG_GET_ENTITIES(l_10_arg0)
      if l_10_2 ~= nil and type(l_10_2) == "table" then
         return l_10_2
      end
   end
   BFLOG(SYSERROR, "Failed to query BFGManager.")
   return nil
end

randomType = function(l_11_arg0)
   local l_11_1 = findType(l_11_arg0)
   if l_11_1 ~= nil then
      local l_11_2, l_11_2 = table.getn(l_11_1)
      if l_11_2 > 0 then
         l_11_2 = math
         l_11_2 = l_11_2.random
         l_11_2 = l_11_2(l_11_2)
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

pickType = function(l_12_arg0, l_12_arg1)
   local l_12_2 = findType(l_12_arg0)
   while l_12_2 ~= nil do
      local l_12_3 = table.getn(l_12_2)
      if l_12_3 > 0 then
         local l_12_4 = math.random(l_12_3)
         local l_12_5 = resolveTable(l_12_2[l_12_4].value)
         if l_12_5.picked == nil then
            l_12_arg1.picked = l_12_5
            return true
         else
            table.remove(l_12_2, l_12_4)
         end
      else
         l_12_2 = nil
      end
      -- Tried to add an 'end' here but it's incorrect
   end
   return false
end

countType = function(l_13_arg0)
   local l_13_1 = 0
   local l_13_2 = findType(l_13_arg0)
   if l_13_2 ~= nil then
      l_13_1 = table.getn(l_13_2)
   end
   BFLOG(SYSTRACE, "Found " .. l_13_1 .. " entities of type " .. l_13_arg0 .. ".")
   return l_13_1
end

countNeed = function(l_14_arg0, l_14_arg1)
   local l_14_2 = 0
   local l_14_3 = findType(l_14_arg0)
   local l_14_4 = table.getn(l_14_3)
   for l_14_5 = 1, l_14_4 do
      local l_14_8 = resolveTable(l_14_3[l_14_5].value)
      if needMet(l_14_8, l_14_arg1) then
         l_14_2 = l_14_2 + 1
      end
   end
   return l_14_4 - (l_14_2)
end

CriticalNeed = function(l_15_arg0, l_15_arg1)
   if l_15_arg0 == nil then
      BFLOG(SYSERROR, "CriticalNeed - Entity is nil.")
      return nil
   elseif l_15_arg1 == nil then
      BFLOG(SYSERROR, "CriticalNeed - Need is nil.")
      return nil
   else
      local l_15_2 = l_15_arg0:sendMessage("BFAI_GET_CRITICAL", l_15_arg1)
      if l_15_2 == nil then
         BFLOG(SYSERROR, "Couldn't get " .. l_15_arg1 .. " from entity.")
         return nil
      elseif l_15_2 == true then
         return false
      else
         return true
      end
   end
end

countCriticalNeed = function(l_16_arg0, l_16_arg1)
   local l_16_2 = 0
   local l_16_3 = findType(l_16_arg0)
   local l_16_4 = table.getn(l_16_3)
   for l_16_5 = 1, l_16_4 do
      local l_16_8 = resolveTable(l_16_3[l_16_5].value)
      if CriticalNeed(l_16_8, l_16_arg1) then
         l_16_2 = l_16_2 + 1
      end
   end
   return l_16_4 - (l_16_2)
end

printThing = function(l_17_arg0)
   if l_17_arg0 == nil then
      return "nil"
   elseif type(l_17_arg0) == "boolean" then
      if l_17_arg0 then
         return "bool(true)"
      else
         return "bool(false)"
      end
   elseif type(l_17_arg0) == "number" then
      return "number(" .. l_17_arg0 .. ")"
   elseif type(l_17_arg0) == "string" then
      return "string(" .. l_17_arg0 .. ")"
   elseif type(l_17_arg0) == "function" then
      return "function()"
   elseif type(l_17_arg0) == "userdata" then
      return "userdata()"
   elseif type(l_17_arg0) == "thread" then
      return "thread()"
   elseif type(l_17_arg0) == "table" then
      local l_17_1 = "table("
      local l_17_2, l_17_3 = next(l_17_arg0)
      while l_17_2 ~= nil do
         local l_17_4 = printThing(l_17_2)
         local l_17_5 = printThing(l_17_3)
         l_17_1 = l_17_1 .. "[" .. l_17_4 .. "=" .. l_17_5 .. "]"
         l_17_2, l_17_3 = next(l_17_arg0, l_17_2)
      end
      l_17_1 = l_17_1 .. ")"
      return l_17_1
   else
      return nil
   end
   -- Tried to add an 'end' here but it's incorrect
end

log = function(l_18_arg0)
   BFLOG(SYSTRACE, printThing(l_18_arg0))
end

uitest = function(l_19_arg0)
   local l_19_1 = queryObject("UIRoot")
   if l_19_1 then
      BFLOG(SYSTRACE, "Found UIRoot")
      local l_19_2 = l_19_1:UI_GET_CHILD("splashbutton0")
      if l_19_2 then
         BFLOG(SYSTRACE, "Found splash...")
         l_19_2:UI_ACTIVATE()
      else
         BFLOG(SYSTRACE, "Didn't find splash!")
      end
      local l_19_3 = l_19_1:UI_GET_CHILD("Game Options Button")
      if l_19_3 then
         BFLOG(SYSTRACE, "Found options...")
         l_19_3:UI_ACTIVATE()
      else
         BFLOG(SYSTRACE, "Didn't find options!")
      end
      local l_19_4 = l_19_1:UI_GET_CHILD("shadows")
      if l_19_4 then
         BFLOG(SYSTRACE, "Found shadow...")
         l_19_4:UI_ACTIVATE_OFF()
      else
         BFLOG(SYSTRACE, "Didn't find shadows!")
      end
      local l_19_5 = l_19_1:UI_GET_CHILD("Apply")
      if l_19_5 then
         BFLOG(SYSTRACE, "Found appy...")
         l_19_5:UI_ACTIVATE()
      else
         BFLOG(SYSTRACE, "Didn't find apply!")
      end
      local l_19_6 = l_19_1:UI_GET_CHILD("Back")
      if l_19_6 then
         BFLOG(SYSTRACE, "Found back...")
         l_19_6:UI_ACTIVATE()
      else
         BFLOG(SYSTRACE, "Didn't find back!")
      end
   else
      BFLOG("UIRoot was not found!")
   end
   -- Tried to add an 'end' here but it's incorrect
end

hunger = function(l_20_arg0)
   local l_20_1 = queryObject("BFGManager")
   if l_20_1 ~= nil then
      local l_20_2 = l_20_1:BFG_GET_ENTITIES("animal")
      if l_20_2 ~= nil and type(l_20_2) == "table" then
         local l_20_3 = table.getn(l_20_2)
         for l_20_4 = 1, l_20_3 do
            local l_20_7 = resolveTable(l_20_2[l_20_4].value)
            if l_20_7 ~= nil then
               local l_20_8 = l_20_7:BFG_GET_ATTR_FLOAT("hunger")
               BFLOG(SYSTRACE, "Hunger is [" .. l_20_8 .. "]")
            end
         end
      end
   end
   return 0
end

evalTen = function(l_21_arg0)
   if l_21_arg0.counter == nil then
      return 0
   elseif l_21_arg0.counter >= 10 then
      return 1
   elseif dist <= -10 then
      return -1
   else
      return 0
   end
end

test = function(l_22_arg0)
   BFLOG(SYSTRACE, printThing(l_22_arg0))
   return 0
end

evaluate0 = function(l_23_arg0)
   local l_23_1 = 0
   local l_23_2 = findType("TigerBengal")
   if l_23_2 == nil then
      return 0
   end
   local l_23_3 = table.getn(l_23_2)
   for l_23_4 = 1, l_23_3 do
      local l_23_7 = resolveTable(l_23_2[l_23_4].value)
      if basicNeedsMet(l_23_7) then
         l_23_1 = l_23_1 + 1
      end
   end
   if l_23_1 >= 3 then
      return 1
   else
      BFLOG(SYSTRACE, "Count is " .. l_23_1 .. " out of " .. l_23_3 .. " tigers.")
      return 0
   end
end

complete0 = function(l_24_arg0)
   local l_24_1 = queryObject("UIRoot")
   if l_24_1 then
      local l_24_2 = l_24_1:UI_GET_CHILD("goalpanel")
      if l_24_2 then
         l_24_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_24_3 = l_24_1:UI_GET_CHILD("primary goals tab")
      if l_24_3 then
         l_24_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Completed0")
   showUI("goals layout", true)
end

eval1a = function(l_25_arg0)
   local l_25_1 = countType("Giraffe")
   BFLOG(SYSTRACE, "Giraffes in zoo is " .. l_25_1)
   if l_25_1 >= 2 then
      return 1
   else
      return 0
   end
end

eval1b = function(l_26_arg0)
   local l_26_1 = countNeed("Giraffe", "hunger")
   if l_26_1 >= 2 then
      return 1
   else
      BFLOG(SYSTRACE, "Giraffes still hungry.")
      return 0
   end
end

eval1c = function(l_27_arg0)
   local l_27_1 = countNeed("Giraffe", "thirst")
   if l_27_1 >= 2 then
      return 1
   else
      BFLOG(SYSTRACE, "Giraffes still thirsty.")
      return 0
   end
end

complete1 = function(l_28_arg0)
   BFLOG(SYSTRACE, "Complete1")
   showUI("goals layout", true)
end

executeWin = function(l_29_arg0)
   BFLOG(SYSTRACE, "Winner.")
   showUI("goals layout", true)
end

executeLose = function(l_30_arg0)
   BFLOG(SYSTRACE, "Loser.")
   showUI("goals layout", true)
end


