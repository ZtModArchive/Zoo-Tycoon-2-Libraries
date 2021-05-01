scoreTigerBig = function(l_1_arg0)
   local l_1_1 = 0
   local l_1_2 = l_1_arg0:getType("TigerBengal")
   local l_1_3 = findMatchingEntity(l_1_arg0, l_1_2)
   if l_1_3 then
      pa = l_1_3:getPAC()
      if pa then
         l_1_1 = pa.getPercentOfScreen
         BFLOG(SYSNOTE, "tiger percent seen: " .. pa.percentSeen)
         BFLOG(SYSNOTE, "tiger percent seen in center: " .. pa.percentSeenInCenter)
         BFLOG(SYSNOTE, "tiger percent of screen: " .. pa.percentOfScreen)
      else
         BFLOG(SYSNOTE, "no photo analysis component")
      end
   else
      BFLOG(SYSNOTE, "no TigerBengal present")
   end
   -- Tried to add an 'end' here but it's incorrect
   return l_1_1
end

scoreT1ContainsT2 = function(l_2_arg0, l_2_arg1, l_2_arg2)
   local l_2_3 = 0
   local l_2_4 = l_2_arg0:getType(l_2_arg1)
   local l_2_5 = l_2_arg0:getFirstInterestingEntity()
   while l_2_5 do
      if l_2_5:isKindOf(l_2_4) then
         BFLOG(SYSNOTE, "found t1")
         local l_2_6 = l_2_5:getPAC()
         if l_2_6 then
            BFLOG(SYSNOTE, "found t1's PAC")
            local l_2_7 = l_2_6:getFirstContainedEntity()
            while l_2_7 do
               BFLOG(SYSNOTE, "examining an entity")
               if l_2_7:isKindOf(l_2_arg2) then
                  BFLOG(SYSNOTE, "found t2")
                  l_2_3 = 100
               else
                  l_2_7 = l_2_6:getNextContainedEntity()
               end
            else
            end
         else
         end
      end
      l_2_5 = l_2_arg0:getNextInterestingEntity()
   end
   return l_2_3
end

keeperOnBench = function(l_3_arg0)
   local l_3_1 = 0
   local l_3_2 = l_3_arg0:getType("bench")
   local l_3_3 = l_3_arg0:getFirstInterestingEntity()
   while l_3_3 do
      if l_3_3:isKindOf(l_3_2) then
         BFLOG(SYSNOTE, "found bench")
         local l_3_4 = l_3_3:getPAC()
         if l_3_4 then
            BFLOG(SYSNOTE, "found bench's PAC")
            local l_3_5 = l_3_4:getFirstContainedEntity()
            while l_3_5 do
               BFLOG(SYSNOTE, "checking out " .. l_3_5:getEDI():getVar("s_name"))
               if l_3_5:isKindOf("Keeper") then
                  BFLOG(SYSNOTE, "found keeper")
                  l_3_1 = 100
               else
                  l_3_5 = l_3_4:getNextContainedEntity()
               end
            else
            end
         else
         end
      end
      l_3_3 = l_3_arg0:getNextInterestingEntity()
   end
   return l_3_1
end

guestHoldingHamburger = function(l_4_arg0)
   local l_4_1 = 0
   local l_4_2 = l_4_arg0:getType("Guest")
   local l_4_3 = l_4_arg0:getFirstInterestingEntity()
   while l_4_3 do
      if l_4_3:isKindOf(l_4_2) then
         BFLOG(SYSNOTE, "found guest " .. l_4_3:getEDI():getVar("s_name"))
         local l_4_4 = l_4_3:getPAC()
         if l_4_4 then
            BFLOG(SYSNOTE, "found guest's PAC")
            local l_4_5 = l_4_4:getFirstContainedEntity()
            while l_4_5 do
               BFLOG(SYSNOTE, "examining an item")
               if l_4_5:isKindOf("Hamburger") then
                  BFLOG(SYSNOTE, "found burger")
                  l_4_1 = 100
               else
                  l_4_5 = l_4_4:getNextContainedEntity()
               end
            else
            end
         else
         end
      end
      l_4_3 = l_4_arg0:getNextInterestingEntity()
   end
   return l_4_1
end

chimpInTree = function(l_5_arg0)
   return scoreT1ContainsT2(l_5_arg0, "tree", "Chimpanzee")
end

scoreTigerWalking = function(l_6_arg0)
   return scoreAnyEntityTypeDoingX(l_6_arg0, "TigerBengal", "Walk_Ahead")
end

scoreTigerEating = function(l_7_arg0)
   return scoreAnyEntityTypeDoingX(l_7_arg0, "TigerBengal", "Eat")
end

scoreElephantWalking = function(l_8_arg0)
   return scoreAnyEntityTypeDoingX(l_8_arg0, "ElephantAfrican", "Walk_Ahead")
end

scoreElephantBrowsing = function(l_9_arg0)
   return scoreAnyEntityTypeDoingX(l_9_arg0, "ElephantAfrican", "Browse")
end

scoreNearbyMotherAndYoungTiger = function(l_10_arg0)
   local l_10_1 = l_10_arg0:getType("TigerBengal_Adult_F")
   local l_10_2 = l_10_arg0:getType("TigerBengal_Young")
   return scoreNearbyEntityTypes(l_10_arg0, l_10_1, l_10_2, 10, 100)
end

scoreNearbyTigerAndGorilla = function(l_11_arg0)
   local l_11_1 = l_11_arg0:getType("TigerBengal")
   local l_11_2 = l_11_arg0:getType("GorillaMountain")
   return scoreNearbyEntityTypes(l_11_arg0, l_11_1, l_11_2, 10, 100)
end

scoreHungryTiger = function(l_12_arg0)
   local l_12_1 = 0
   local l_12_2 = l_12_arg0:getType("TigerBengal")
   local l_12_3 = l_12_arg0:getFirstInterestingEntity()
   while l_12_3 do
      if l_12_3:isKindOf(l_12_2) then
         score = getEntityStateVar(l_12_3, "hunger") / 100
         BFLOG(SYSNOTE, "score: " .. score)
         if l_12_1 < score then
            l_12_1 = score
            BFLOG(SYSNOTE, "new highscore: " .. l_12_1)
         end
      end
      l_12_3 = l_12_arg0:getNextInterestingEntity()
   end
   BFLOG(SYSNOTE, "highscore: " .. l_12_1)
   return l_12_1
end

scoreNearbyEntityTypes = function(l_13_arg0, l_13_arg1, l_13_arg2, l_13_arg3, l_13_arg4)
   local l_13_5 = findMatchingEntity(l_13_arg0, l_13_arg1)
   if l_13_5 then
      BFLOG(SYSNOTE, "found first entity")
      local l_13_6 = l_13_arg0:getFirstInterestingEntity()
      while 1 do
         if l_13_6:isKindOf(l_13_arg2) then
            BFLOG(SYSNOTE, "found matching entities!")
            local l_13_7, l_13_7, l_13_7 = l_13_5:getFirstPhysObj()
            l_13_7, l_13_7 = l_13_7:getPosition, l_13_7
            l_13_7 = l_13_7(l_13_7)
            --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

scoreIsEntitySleeping = function(l_14_arg0)
   return scorePlaySetInContext(l_14_arg0, "Sleep")
end

nearbyScore = function(l_15_arg0, l_15_arg1, l_15_arg2, l_15_arg3)
   local l_15_4 = distSquared(l_15_arg0, l_15_arg1)
   BFLOG(SYSNOTE, "dist: " .. l_15_4)
   local l_15_5 = 0
   if l_15_4 <= l_15_arg2 then
      BFLOG(SYSNOTE, "dist <= minDist")
      l_15_5 = 1
   elseif l_15_arg3 <= l_15_4 then
      BFLOG(SYSNOTE, "dist >= minDist")
      l_15_5 = 0
   else
      BFLOG(SYSNOTE, "minDist < dist < maxDist")
      l_15_5 = 1 - (l_15_4 - l_15_arg2) / (l_15_arg3 - l_15_arg2)
   end
   return l_15_5
end

findMatchingEntity = function(l_16_arg0, l_16_arg1)
   local l_16_2 = l_16_arg0:getFirstInterestingEntity()
   while l_16_2 do
      if l_16_2:isKindOf(l_16_arg1) then
         return l_16_2
      end
      l_16_2 = l_16_arg0:getNextInterestingEntity()
   end
   return l_16_2
end

distSquared = function(l_17_arg0, l_17_arg1)
   return (l_17_arg0.x - l_17_arg1.x) * (l_17_arg0.x - l_17_arg1.x) + (l_17_arg0.y - l_17_arg1.y) * (l_17_arg0.y - l_17_arg1.y) + (l_17_arg0.z - l_17_arg1.z) * (l_17_arg0.z - l_17_arg1.z)
end

scorePlaySetInContext = function(l_18_arg0, l_18_arg1)
   local l_18_2 = l_18_arg0:getBM()
   if l_18_2 then
      local l_18_3 = l_18_2:isPlaySetInContext(l_18_arg1)
      if l_18_3 then
         BFLOG(SYSNOTE, "entity is doing " .. l_18_arg1)
         return 1
      end
   end
   return 0
end

scoreEntityCurrentlyDoingPlaySet = function(l_19_arg0, l_19_arg1)
   local l_19_2 = l_19_arg0:getBM()
   if l_19_2 then
      local l_19_3 = l_19_2:getCurrentPlaySet()
      BFLOG(SYSNOTE, "current playset: " .. l_19_3)
      return l_19_3
   else
      BFLOG(SYSNOTE, "no BFBehaviorMgr found")
   end
   return ""
end

getEntityStateVar = function(l_20_arg0, l_20_arg1)
   local l_20_2 = l_20_arg0:getCM()
   if l_20_2 then
      value = l_20_2:getStateVar(l_20_arg1)
      BFLOG(SYSNOTE, l_20_arg1 .. " (var)= " .. value)
      return value
   else
      BFLOG(SYSNOTE, "no BFAICognitiveMgr found")
   end
   return 0
end

getEntitySharedVar = function(l_21_arg0, l_21_arg1)
   value = l_21_arg0:getSharedVar(l_21_arg1)
   BFLOG(SYSNOTE, l_21_arg1 .. " (shared var)= " .. value)
   return value
end

scoreAnyEntityTypeDoingX = function(l_22_arg0, l_22_arg1, l_22_arg2)
   local l_22_3 = 0
   local l_22_4 = l_22_arg0:getType(l_22_arg1)
   local l_22_5 = l_22_arg0:getFirstInterestingEntity()
   while l_22_5 do
      if l_22_5:isKindOf(l_22_4) then
         l_22_3 = 0.3
         if scorePlaySetInContext(l_22_5, l_22_arg2) > 0 then
            return 1
         end
      end
      l_22_5 = l_22_arg0:getNextInterestingEntity()
   end
   return l_22_3
end

scoreAnyEntityTypeDoingAnimX = function(l_23_arg0, l_23_arg1, l_23_arg2)
   local l_23_3 = 0
   local l_23_4 = l_23_arg0:getType(l_23_arg1)
   local l_23_5 = l_23_arg0:getFirstInterestingEntity()
   while l_23_5 do
      if l_23_5:isKindOf(l_23_4) then
         l_23_3 = 0.3
         local l_23_6 = l_23_5:getPAC()
         if l_23_6 then
            local l_23_7 = l_23_6:getActiveSequenceName()
            BFLOG(SYSNOTE, "found a matching entity doing " .. l_23_7)
            if l_23_arg2 == l_23_7 then
               return 1
            end
         end
      end
      l_23_5 = l_23_arg0:getNextInterestingEntity()
   end
   return l_23_3
end

doingAnimX = function(l_24_arg0, l_24_arg1, l_24_arg2)
   local l_24_3 = (l_24_arg0:getPAC())
   local l_24_4, l_24_5 = nil, nil
   if l_24_3 then
      l_24_4 = l_24_3:getActiveSequenceName()
      l_24_5 = l_24_3:getActiveSequenceTime()
   else
      l_24_4 = ""
      l_24_5 = 0
   end
   return l_24_4, l_24_5
end

scoreLionRoaring = function(l_25_arg0)
   local l_25_1 = 0
   local l_25_2 = l_25_arg0:getType("Lion")
   local l_25_3 = l_25_arg0:getFirstInterestingEntity()
   while l_25_3 do
      if l_25_3:isKindOf(l_25_2) then
         local l_25_4, l_25_5 = nil, nil
         l_25_4, l_25_5 = doingAnimX(l_25_3)
         if l_25_4 == "Stand_Roar" and l_25_5 >= 0.3 and l_25_5 <= 1.3 then
            return 1
         end
      end
      l_25_3 = l_25_arg0:getNextInterestingEntity()
   end
   return l_25_1
end

scoreZebraGrazing = function(l_26_arg0)
   local l_26_1 = 0
   local l_26_2 = l_26_arg0:getType("ZebraCommon")
   local l_26_3 = l_26_arg0:getFirstInterestingEntity()
   while l_26_3 do
      if l_26_3:isKindOf(l_26_2) then
         local l_26_4, l_26_5 = nil, nil
         l_26_4, l_26_5 = doingAnimX(l_26_3)
         BFLOG(SYSNOTE, "doing " .. l_26_4 .. " at time " .. l_26_5)
         if l_26_4 == "Graze_Idle" and l_26_5 >= 0.6 and l_26_5 <= 3.5 then
            return 1
         end
      end
      l_26_3 = l_26_arg0:getNextInterestingEntity()
   end
   return l_26_1
end


