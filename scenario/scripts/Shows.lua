include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
getShows = function()
   local l_1_0 = queryObject("ZTAIMgr")
   showTable = {}
   if l_1_0 ~= nil then
      showTable = l_1_0:ZTAI_GET_ALL_SHOWS()
      if showTable ~= nil then
         return showTable
      else
         return nil
      end
   else
      BFLOG(SYSERROR, "Failed to get ZTAIMgr")
      return nil
   end
   -- Tried to add an 'end' here but it's incorrect
end

getOpenShows = function()
   local l_2_0 = queryObject("ZTAIMgr")
   showTable = {}
   if l_2_0 ~= nil then
      showTable = l_2_0:ZTAI_GET_ALL_OPEN_SHOWS()
      if showTable ~= nil then
         BFLOG("Num of shows: " .. table.getn(showTable))
         return showTable
      else
         return nil
      end
   else
      BFLOG(SYSERROR, "Failed to get ZTAIMgr")
      return nil
   end
   -- Tried to add an 'end' here but it's incorrect
end

getShowAttendace = function(l_3_arg0)
   if l_3_arg0 ~= nil then
      local l_3_1 = l_3_arg0:ZTAI_GET_SHOW_ATTENDANCE()
      BFLOG(SYSTRACE, "Shows Attendance " .. l_3_1)
      return l_3_1
   else
      BFLOG(SYSERROR, "Show is nil")
   end
end

getAnimalsInShow = function(l_4_arg0)
   if l_4_arg0 ~= nil then
      local l_4_1 = l_4_arg0:ZTAI_GET_ANIMALS_IN_SHOW()
      BFLOG(SYSTRACE, "Num of animals in show " .. table.getn(l_4_1))
      return l_4_1
   else
      BFLOG(SYSERROR, "Show is nil")
   end
end

getNumTrickSlots = function(l_5_arg0, l_5_arg1)
   if l_5_arg1 ~= nil and l_5_arg0 ~= nil then
      local l_5_2 = l_5_arg0:ZTAI_GET_NUM_TRICK_SLOTS(l_5_arg1)
      BFLOG("Num Tricks slots for animal" .. l_5_2)
      return l_5_2
   end
end

hasSpeciesInShowWithXNumTricks = function(l_6_arg0, l_6_arg1)
   local l_6_2 = getShows()
   if l_6_2 ~= nil then
      for l_6_3 = 1, table.getn(l_6_2) do
         local l_6_6 = resolveTable(l_6_2[l_6_3].value)
         if l_6_6 ~= nil then
            local l_6_7 = getAnimalsInShow(l_6_6)
            if l_6_7 ~= nil then
               for l_6_8 = 1, table.getn(l_6_7) do
                  local l_6_11 = resolveTable(l_6_7[l_6_8].value)
                  if l_6_11 ~= nil and isEntityKindOf(l_6_11, l_6_arg0) and l_6_arg1 <= getNumTrickSlots(l_6_6, l_6_11) then
                     return 1
                  end
               end
            end
         end
      end
   end
   return 0
end

getShowStarRating = function(l_7_arg0)
   if l_7_arg0 ~= nil then
      local l_7_1 = l_7_arg0:ZTAI_GET_SHOW_STAR_RATING()
      BFLOG(SYSTRACE, "Shows Rating " .. l_7_1)
      return l_7_1
   else
      BFLOG(SYSERROR, "Show is nil")
   end
end

getTrickDifficulty = function(l_8_arg0)
   local l_8_1 = queryObject("ZTAIMgr")
   if l_8_1 ~= nil then
      return l_8_1:BFAI_GET_TRICK_DIFFICULTY(l_8_arg0)
   else
      BFLOG(SYSERROR, "Failed to get ZTAIMgr")
      return nil
   end
end

getTrickPopularity = function(l_9_arg0)
   local l_9_1 = queryObject("ZTAIMgr")
   if l_9_1 ~= nil then
      return l_9_1:BFAI_GET_TRICK_POPULARITY(l_9_arg0)
   else
      BFLOG(SYSERROR, "Failed to get ZTAIMgr")
      return nil
   end
end

getTrickSkillLevel = function(l_10_arg0, l_10_arg1)
   if l_10_arg0 == nil then
      BFLOG(SYSERROR, "animal doesn't exist")
      return nil
   end
   local l_10_2 = l_10_arg0:BFG_GET_COMPONENT("ZTAITrickComponent")
   if l_10_2 then
      return l_10_2:ZTAI_GET_TRICK_SCORE(l_10_arg1)
   else
      BFLOG(SYSERROR, "Failed to get ZTAITrickComponent")
      return nil
   end
end

setTrickSkillLevel = function(l_11_arg0, l_11_arg1, l_11_arg2)
   if l_11_arg0 == nil then
      BFLOG(SYSERROR, "animal doesn't exist")
      return nil
   end
   local l_11_3 = l_11_arg0:BFG_GET_COMPONENT("ZTAITrickComponent")
   if l_11_3 then
      local l_11_4, l_11_5 = l_11_3:ZTAI_SET_TRICK_LEVEL, l_11_3
      local l_11_6
      return l_11_4(l_11_5, l_11_6)
      l_11_6 = {key = l_11_arg1, val = l_11_arg2}
   else
      BFLOG(SYSERROR, "Failed to get ZTAITrickComponent")
      return nil
   end
end

findSpeciesKnowsTrick = function(l_12_arg0, l_12_arg1)
   local l_12_2 = findType(l_12_arg0)
   if l_12_2 then
      for l_12_3 = 1, table.getn(l_12_2) do
         local l_12_6 = resolveTable(l_12_2[1].value)
         if l_12_6 and getTrickSkillLevel(l_12_6, l_12_arg1) >= 0 then
            return l_12_6
         end
      end
   end
   return nil
end

hasShowOfStarRatingX = function(l_13_arg0)
   local l_13_1 = getOpenShows()
   local l_13_2 = 0
   if l_13_1 ~= nil then
      for l_13_3 = 1, table.getn(l_13_1) do
         local l_13_6 = resolveTable(l_13_1[l_13_3].value)
         if l_13_6 ~= nil then
            local l_13_7 = getShowStarRating(l_13_6)
            BFLOG("Current rating of show " .. l_13_3 .. " " .. l_13_7)
            BFLOG("Needed rating of show " .. l_13_3 .. " " .. l_13_arg0)
            if l_13_arg0 <= l_13_7 then
               return 1, l_13_7
            elseif l_13_2 <= l_13_7 then
               l_13_2 = l_13_7
            end
         end
      end
   end
   return 0, l_13_2
end

totalNumOfShowDonors = function()
   local l_14_0 = getShows()
   local l_14_1 = 0
   if l_14_0 ~= nil then
      for l_14_2 = 1, table.getn(l_14_0) do
         local l_14_5 = resolveTable(l_14_0[l_14_2].value)
         if l_14_5 ~= nil then
            l_14_1 = l_14_1 + l_14_5:ZTAI_SHOW_NUM_DONORS()
         end
      end
   end
   BFLOG("Total Donors for all shows: " .. l_14_1)
   return l_14_1
end

hasSpeciesInShow = function(l_15_arg0)
   local l_15_1 = getShows()
   if l_15_1 ~= nil then
      for l_15_2 = 1, table.getn(l_15_1) do
         local l_15_5 = resolveTable(l_15_1[l_15_2].value)
         if l_15_5 ~= nil then
            local l_15_6 = getAnimalsInShow(l_15_5)
            if l_15_6 ~= nil then
               for l_15_7 = 1, table.getn(l_15_6) do
                  local l_15_10 = resolveTable(l_15_6[l_15_7].value)
                  if l_15_10 ~= nil and isEntityKindOf(l_15_10, l_15_arg0) then
                     return 1
                  end
               end
            end
         end
      end
   end
   return 0
end

hasSpeciesWithTrickOfLevelX = function(l_16_arg0, l_16_arg1, l_16_arg2)
   local l_16_3 = findType(l_16_arg0)
   if l_16_3 then
      for l_16_4 = 1, table.getn(l_16_3) do
         local l_16_7 = resolveTable(l_16_3[l_16_4].value)
         if l_16_7 ~= nil then
            local l_16_8 = getTrickSkillLevel(l_16_7, l_16_arg1)
            if l_16_8 then
               BFLOG("Current Trick Level for " .. l_16_arg1 .. ": " .. l_16_8)
               BFLOG("Needed Trick Level for " .. l_16_arg1 .. ": " .. l_16_arg2)
               if l_16_arg2 <= l_16_8 then
                  return true
               else
                  BFLOG("Trick level is nil")
               end
            else
               BFLOG("animal is nil")
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
         end
      else
         BFLOG("Table is nil")
      end
      return false
end

hasSpeciesWithTrickAtorBelowLevelX = function(l_17_arg0, l_17_arg1, l_17_arg2)
   local l_17_3 = findType(l_17_arg0)
   if l_17_3 then
      for l_17_4 = 1, table.getn(l_17_3) do
         local l_17_7 = resolveTable(l_17_3[l_17_4].value)
         if l_17_7 ~= nil then
            local l_17_8 = getTrickSkillLevel(l_17_7, l_17_arg1)
            if l_17_8 then
               BFLOG("Current Trick Level for " .. l_17_arg1 .. ": " .. l_17_8)
               BFLOG("Needed Trick Level for " .. l_17_arg1 .. ": " .. l_17_arg2)
               if l_17_8 <= l_17_arg2 then
                  return true
               else
                  BFLOG("Trick level is nil")
               end
            else
               BFLOG("animal is nil")
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
         end
      else
         BFLOG("Table is nil")
      end
      return false
end

getAllTricks = function(l_18_arg0)
   if l_18_arg0 == nil then
      BFLOG(SYSERROR, "animal doesn't exist")
      return nil
   end
   local l_18_1 = l_18_arg0:BFG_GET_COMPONENT("ZTAITrickComponent")
   if l_18_1 then
      local l_18_2 = l_18_1:ZTAI_GET_ALL_TRICKS()
      if l_18_2 ~= nil then
         BFLOG("size of trick table: " .. table.getn(l_18_2))
         return l_18_2
      else
         BFLOG("trickTable nil very bad")
      end
   else
      BFLOG(SYSERROR, "Failed to get ZTAITrickComponent")
      return nil
   end
   -- Tried to add an 'end' here but it's incorrect
end

getAvailableShowAnimals = function()
   local l_19_0 = queryObject("ZTShowMixerManager")
   if l_19_0 then
      BFLOG("Found")
      local l_19_1 = l_19_0:ZT_SHOWMIXER_GET_NUM_AVAILABLE_ANIMALS()
      if l_19_1 ~= nil then
         BFLOG("Num animals available: " .. l_19_1)
         return l_19_1
      else
         BFLOG("Size is nil")
      end
   else
      BFLOG("not found")
   end
   -- Tried to add an 'end' here but it's incorrect
end

mixerEnableAllAnimals = function()
   local l_20_0 = queryObject("ZTShowMixerManager")
   if l_20_0 then
      BFLOG("Found")
      l_20_0:ZT_SHOWMIXER_ENABLE_ALL_ANIMALS(true)
   else
      BFLOG("not found")
   end
end

mixerDisableAllAnimals = function()
   local l_21_0 = queryObject("ZTShowMixerManager")
   if l_21_0 then
      BFLOG("Found")
      l_21_0:ZT_SHOWMIXER_ENABLE_ALL_ANIMALS(false)
   else
      BFLOG("not found")
   end
end

mixerDisableAllTricks = function()
   local l_22_0 = queryObject("ZTShowMixerManager")
   if l_22_0 then
      BFLOG("Found")
      l_22_0:ZT_SHOWMIXER_ENABLE_ALL_TRICKS(false)
   else
      BFLOG("not found")
   end
end

mixerDisableAllTricks = function()
   local l_23_0 = queryObject("ZTShowMixerManager")
   if l_23_0 then
      BFLOG("Found")
      l_23_0:ZT_SHOWMIXER_ENABLE_ALL_TRICKS(false)
   else
      BFLOG("not found")
   end
end

mixerEnableTrick = function(l_24_arg0, l_24_arg1)
   local l_24_2 = queryObject("ZTShowMixerManager")
   if l_24_2 then
      BFLOG("Found")
      local l_24_3
      l_24_2:ZT_SHOWMIXER_ENABLE_TRICK(l_24_3)
      l_24_3 = {string = l_24_arg0, float = l_24_arg1}
   else
      BFLOG("not found")
   end
end

mixerEnableAnimal = function(l_25_arg0)
   local l_25_1 = queryObject("ZTShowMixerManager")
   if l_25_1 then
      BFLOG("Found")
      l_25_1:ZT_SHOWMIXER_ENABLE_ANIMAL(l_25_arg0)
   else
      BFLOG("not found")
   end
end

mixerDisableAllOtherAnimals = function(l_26_arg0)
   local l_26_1 = queryObject("ZTShowMixerManager")
   if l_26_1 then
      BFLOG("Found")
      local l_26_2
      l_26_1:ZT_SHOWMIXER_ENABLE_ALL_ANIMALS(l_26_2)
      l_26_2 = {string = l_26_arg0, float = 0}
   else
      BFLOG("not found")
   end
end

mixerIsWaitTrick = function(l_27_arg0, l_27_arg1)
   local l_27_2 = queryObject("ZTShowMixerManager")
   if l_27_2 then
      BFLOG("Found")
      local l_27_3
      return l_27_2:ZT_SHOWMIXER_IS_WAIT_TRICK(l_27_3)
      l_27_3 = {string = l_27_arg0, float = l_27_arg1}
   else
      BFLOG("not found")
   end
end


