include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/token.lua")
include("scenario/scripts/fossil.lua")
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalRhino = function(l_2_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 1 ****************")
   local l_2_1 = findTypeDirect("RhinocerosWooly")
   if l_2_1 ~= nil then
      local l_2_2 = table.getn(l_2_1)
      if l_2_2 < 1 then
         return 0
      end
      for l_2_3 = 1, l_2_2 do
         local l_2_6 = resolveTable(l_2_1[l_2_3].value)
         if isCratedEntity(l_2_6) == false and basicNeedsMetAlternate(l_2_6) then
            return 1
         end
      end
   end
   return 0
end

completeRhino = function()
   BFLOG(SYSTRACE, "**************** complete goal 1 ****************")
   showRule("ExtinctGlacier")
   completeshowoverview()
end

evalGlacier = function(l_4_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 1 ****************")
   local l_4_1 = findTypeDirect("Glacier")
   if l_4_1 ~= nil then
      local l_4_2 = findType("RhinocerosWooly")
      for l_4_3 = 1, table.getn(l_4_2) do
         local l_4_6 = resolveTable(l_4_2[l_4_3].value)
         if l_4_6 then
            for l_4_7 = 1, table.getn(l_4_1) do
               local l_4_10 = resolveTable(l_4_1[l_4_7].value)
               if l_4_10 and inSameHabitat(l_4_6, l_4_10) then
                  return 1
               end
            end
         end
      end
   end
   return 0
end

completeGlacier = function()
   BFLOG(SYSTRACE, "**************** complete goal 1 ****************")
   giveCash(5000)
   showRule("ExtinctCatBear")
   showRule("FindRhinoFossil")
   completeshowoverview()
end

evalCatBear = function(l_6_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 2 ****************")
   local l_6_1 = findTypeDirect("CatSaberToothed")
   local l_6_2 = findTypeDirect("BearShortfaced")
   if l_6_1 ~= nil and l_6_2 ~= nil then
      local l_6_3 = table.getn(l_6_1)
      local l_6_4 = table.getn(l_6_2)
      BFLOG(l_6_3 .. " Sabertoothed Cats found; " .. l_6_4 .. " Shortfaced Bears found")
      if l_6_3 < 1 or l_6_4 < 1 then
         return 0
      end
      local l_6_5 = false
      for l_6_6 = 1, l_6_3 do
         local l_6_9 = resolveTable(l_6_1[l_6_6].value)
         local l_6_10 = isCratedEntity(l_6_9)
         if l_6_10 == false and basicNeedsMetAlternate(l_6_9) then
            l_6_5 = true
            BFLOG("At least one cat has its basic needs met")
         else
            BFLOG("At least one cat does not have its basic needs met")
         end
      end
      local l_6_6 = false
      for l_6_7 = 1, l_6_4 do
         local l_6_10 = resolveTable(l_6_2[l_6_7].value)
         local l_6_11 = isCratedEntity(l_6_10)
         if l_6_11 == false and basicNeedsMetAlternate(l_6_10) then
            l_6_6 = true
            BFLOG("At least one bear has its basic needs met")
         else
            BFLOG("At least one bear does not have its basic needs met")
         end
      end
      if l_6_5 == true and l_6_6 == true then
         return 1
      end
   end
   return 0
end

completeCatBear = function(l_7_arg0)
   BFLOG(SYSTRACE, "**************** complete goal 2 ****************")
   giveCash(10000)
   showRule("ExtinctUnlockMastodon")
   completeshowoverview()
end

evalUnlockMastodon = function(l_8_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 3 ****************")
   if getHalfStars() >= 9 then
      return 1
   end
   return 0
end

completeUnlockMastodon = function(l_9_arg0)
   BFLOG(SYSTRACE, "**************** complete goal 3 ****************")
   giveCash(10000)
   showRule("ExtinctMastodon")
   showRule("ExtinctFame50")
   completeshowoverview()
end

evalMastodon = function(l_10_arg0)
   BFLOG(SYSTRACE, "**************** eval goal 4 ****************")
   local l_10_1 = findTypeDirect("MastodonAmerican")
   if l_10_1 ~= nil then
      local l_10_2 = table.getn(l_10_1)
      if l_10_2 < 1 then
         return 0
      end
      for l_10_3 = 1, l_10_2 do
         local l_10_6 = resolveTable(l_10_1[l_10_3].value)
         if isCratedEntity(l_10_6) == false and basicNeedsMeetThreshold(l_10_6, 60) then
            return 1
         end
      end
   end
   return 0
end

completeMastodon = function(l_11_arg0)
   BFLOG(SYSTRACE, "**************** complete goal 4 ****************")
   setuservar("cp2scen3", "completed")
   giveCash(20000)
   showscenariowin("ExtinctCampaign:IceAgeFinishMastodon", nil)
   local l_11_1 = getuservar("extinct_xtlock")
   if l_11_1 ~= "true" then
      showchallengewin("ExtinctCampaign:UnlockExtinctTheme")
      setuservar("extinct_xtlock", "true")
   end
end

evalFame35 = function()
   if getHalfStars() >= 7 then
      return 1
   end
   return 0
end

completeFame35 = function()
   giveCash(5000)
   showRule("ExtinctFame40")
   completeshowoverview()
end

evalFame40 = function()
   if getHalfStars() >= 8 then
      return 1
   end
   return 0
end

completeFame40 = function()
   giveCash(8000)
   completeshowoverview()
end

evalFame50 = function()
   if getHalfStars() >= 10 then
      return 1
   end
   return 0
end

completeFame50 = function()
   giveCash(15000)
   completeshowoverview()
end

evalFindRhinoFossil = function()
   BFLOG(SYSTRACE, "**************** eval collect a fossil ****************")
   local l_18_0 = getNumPiecesFoundForSpecies("RhinocerosWooly")
   BFLOG(SYSTRACE, "**************** num Pieces for RhinocerosWooly = " .. l_18_0)
   if l_18_0 >= 1 then
      return 1
   end
   return 0
end

completeFindRhinoFossil = function()
   BFLOG(SYSTRACE, "**************** complete collect a fossil ****************")
   giveCash(2000)
   showRule("FindAllRhinoFossils")
   completeshowoverview()
   return 1
end

evalFindAllRhinoFossils = function()
   BFLOG(SYSTRACE, "**************** eval collect all fossils ****************")
   local l_20_0 = getNumPiecesFoundForSpecies("RhinocerosWooly")
   BFLOG(SYSTRACE, "**************** num Pieces for RhinocerosWooly = " .. l_20_0)
   if l_20_0 >= 15 then
      return 1
   end
   return 0
end

completeFindAllRhinoFossils = function()
   BFLOG(SYSTRACE, "**************** complete collect all fossils ****************")
   giveCash(3000)
   showRule("BuildFossil")
   completeshowoverview()
   return 1
end

evalBuildFossil = function()
   BFLOG(SYSTRACE, "**************** eval build fossil ****************")
   if isPuzzleComplete("RhinocerosWooly") then
      return 1
   end
   return 0
end

completeBuildFossil = function()
   BFLOG(SYSTRACE, "**************** complete build fossil ****************")
   giveCash(5000)
   showRule("CreateSuperRhino")
   completeshowoverview()
   return 1
end

evalSuperRhino = function()
   BFLOG(SYSTRACE, "**************** eval create super rhino ****************")
   local l_24_0 = findTypeDirect("RhinocerosWooly")
   if l_24_0 ~= nil then
      local l_24_1 = table.getn(l_24_0)
      if l_24_1 < 1 then
         return 0
      end
      for l_24_2 = 1, l_24_1 do
         local l_24_5 = resolveTable(l_24_0[l_24_2].value)
         local l_24_6 = isCratedEntity(l_24_5)
         local l_24_7 = l_24_5:BFG_GET_ATTR_BOOLEAN("b_Super")
         if l_24_6 == false and l_24_7 ~= nil and l_24_7 == true then
            return 1
         end
      end
   end
   return 0
end

completeSuperRhino = function()
   BFLOG(SYSTRACE, "**************** complete create super rhino ****************")
   giveCash(15000)
   setMaxFame(getZooFame() + 1.875)
   giveGuest(5)
   completeshowoverview()
end


