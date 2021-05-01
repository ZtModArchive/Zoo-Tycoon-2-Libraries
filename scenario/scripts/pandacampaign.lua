include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "*********I'm here so show overview panel!********")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalpandasadopt = function(l_2_arg0)
   if l_2_arg0.boostAdoptPanda == nil then
      boostSpeciesAdoptionProbabiltiy("PandaGiant")
      l_2_arg0.boostAdoptPanda = 1
   end
   if getZooFame() >= 91 and thisManyExist("PandaGiant_Adult_M", 1) == true then
      return 1
   end
   return 0
end

completepandasadopt = function(l_3_arg0)
   BFLOG(SYSTRACE, "completepandasadopt")
   resetAdoptChance("PandaGiant")
   local l_3_1 = findType("PandaGiant_Adult_F")
   local l_3_2 = getZooEntrancePos()
   placeObject("PandaGiant_Adult_F", l_3_2.x, l_3_2.y, l_3_2.z)
   local l_3_3 = findType("PandaGiant_Adult_F")
   for l_3_4 = 1, table.getn(l_3_3) do
      local l_3_7 = false
      local l_3_8 = 0
      for l_3_9 = 1, table.getn(l_3_1) do
         local l_3_12 = resolveTable(l_3_3[l_3_4].value)
         local l_3_13 = resolveTable(l_3_1[l_3_9].value)
         if areCompsEqual(l_3_12, l_3_13) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_3_7 = true
         end
      end
      if l_3_7 == false then
         local l_3_9 = resolveTable(l_3_3[l_3_4].value)
         local l_3_10 = getLocID("Pandas:Pandaname")
         l_3_9:BFG_SET_ATTR_STRING("s_name", l_3_10)
         crateEntity(l_3_9)
   else
      end
   end
   local l_3_4 = getLocID("Pandas:PandasSuccessPart1overview")
   local l_3_5 = getLocID("Pandas:Pandaname")
   local l_3_6 = string.format(l_3_4, l_3_5, l_3_5)
   setaltoverviewtext("Pandasbreed", "neutral", l_3_6)
   showRule("Pandasbreed")
   showprimarygoals()
end

evalpandasbreed = function(l_4_arg0)
   BFLOG(SYSTRACE, "evalpandasbreed")
   if thisManyExist("PandaGiant_Young", 1) == true then
      return 1
   end
   return 0
end

completepandasbreed = function()
   BFLOG(SYSTRACE, "completepandasbreed")
   showprimarygoals()
end

completepandas = function(l_6_arg0)
   local l_6_1 = getLocID("Pandas:PandasSuccessPart2overview")
   local l_6_2 = getLocID("Pandas:Pandaname")
   local l_6_3 = string.format(l_6_1, l_6_2)
   setaltoverviewtext("Pandasbreed", "success", l_6_3)
   setuservar("pandalock", "true")
   setuservar("Pandascampaign", "completed")
   local l_6_4 = getlocidfromspecies("GildedStatue_df")
   local l_6_5 = getLocID("itemunlock:newitemgeneral") .. l_6_4
   genericokpaneltext(nil, l_6_5)
   showscenariowintext(l_6_3, nil)
   BFLOG(SYSTRACE, "completepandas")
end


