include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

completegoal = function()
   completeshowoverview()
   return 1
end

evalbuildtram = function()
   local l_3_0 = findTypeDirect("station")
   local l_3_1 = table.getn(l_3_0)
   for l_3_2 = 1, l_3_1 do
      local l_3_5 = resolveTable(l_3_0[l_3_2].value)
      if l_3_5 ~= nil then
         local l_3_6 = l_3_5:sendMessage("ZT_GET_CIRCUIT")
         if l_3_6 ~= nil and l_3_6:ZT_GET_CLOSED_CIRCUIT() == true and l_3_6:ZT_GET_NUM_FORWARD_SEGMENTS() >= 2 then
            return 1
         end
      end
   end
   return 0
end

completebuildtram = function(l_4_arg0)
   showRule("FourStars")
   giveCash(8000)
   completeshowoverview()
end

evalfourstars = function(l_5_arg0)
   if getHalfStars() >= 8 then
      return 1
   end
   if getCurrentMonth() >= 5 and l_5_arg0.antelopeChallenge == nil then
      if countType("AntelopeSableGiant") == 0 then
         l_5_arg0.antelopeChallenge = true
         showRule("BonusAntelope")
         showprimarygoals()
      else
         l_5_arg0.antelopeChallenge = true
         l_5_arg0.antelopeNoPrereq = true
      end
   end
   if l_5_arg0.antelopeChallenge ~= nil and l_5_arg0.antelopeChallenge == true and l_5_arg0.antelopeNoPrereq == nil then
      antelopeChallenge = true
   end
   return 0
end

completefourstars = function()
   setuservar("TransportationCampaignscenario1", "completed")
   local l_6_0 = getuservar("TransportationCampaignscenario3")
   if l_6_0 ~= "completed" then
      setuservar("TransportationCampaignscenario3", "unlocked")
   end
   showscenariowin("TransportationCampaign:GreatSavannahSuccessOverview", "TransportationCampaignscenario3")
end

evalantelope = function(l_7_arg0)
   if antelopeChallenge ~= nil and antelopeChallenge == true then
      if l_7_arg0.antelopetimer == nil then
         l_7_arg0.antelopetimer = getCurrentMonth()
         l_7_arg0.antelopetimerday = getCurrentTimeOfDay()
         -- Tried to add an 'end' here but it's incorrect
         if countType("AntelopeSableGiant") >= 2 and averageTypeBasicNeedsMeetsThreshold("AntelopeSableGiant", 23) and typeBasicNeedsNotCritical("AntelopeSableGiant") then
            return 1
         end
         local l_7_1 = getCurrentMonth()
         if (l_7_arg0.antelopetimer + 1 <= l_7_1 and l_7_arg0.antelopetimerday <= getCurrentTimeOfDay()) or l_7_arg0.antelopetimer + 2 <= l_7_1 then
            return -1
         end
         return 0
         -- Tried to add an 'end' here but it's incorrect
end

completeantelope = function()
   genericokpanel(nil, "TransportationCampaign:GreatSavannahGiantSableAntelopeSuccess")
   giveGuest(10)
end

failantelope = function()
   local l_9_0 = ""
   if countType("AntelopeSableGiant") >= 2 then
      genericokpanel(nil, "TransportationCampaign:GreatSavannahGiantSableAntelopeFailureNeed")
      l_9_0 = getLocID("TransportationCampaign:GreatSavannahGiantSableAntelopeFailureNeed")
   else
      genericokpanel(nil, "TransportationCampaign:GreatSavannahGiantSableAntelopeFailureNoAntelope")
      l_9_0 = getLocID("TransportationCampaign:GreatSavannahGiantSableAntelopeFailureNoAntelope")
   end
   setalttext("BonusAntelope", "failure", l_9_0)
end

evaleightspecies = function()
   local l_10_0 = animalsInZoo()
   if table.getn(l_10_0) >= 8 then
      return 1
   end
   return 0
end

completeeightspecies = function()
   showRule("TwelveSpecies")
   giveCash(4000)
   completegoal()
end

evaltwelvespecies = function()
   local l_12_0 = animalsInZoo()
   if table.getn(l_12_0) >= 12 then
      return 1
   end
   return 0
end

completetwelvespecies = function()
   showRule("SixteenSpecies")
   giveCash(10000)
   completegoal()
end

evalsixteenspecies = function()
   local l_14_0 = animalsInZoo()
   if table.getn(l_14_0) >= 16 then
      return 1
   end
   return 0
end

completesixteenspecies = function()
   setuservar("TransportationCampaignscenario2", "completed")
   local l_15_0 = getuservar("TransportationCampaignscenario1")
   if l_15_0 ~= "completed" then
      setuservar("TransportationCampaignscenario1", "unlocked")
   end
   showscenariowin("TransportationCampaign:BridgingGapSuccessOverview", "TransportationCampaignscenario1")
end

evalfivestarzoo = function(l_16_arg0)
   if getHalfStars() >= 6 and l_16_arg0.threeStarGrant == nil then
      l_16_arg0.threeStarGrant = true
      giveCash(10000)
      local l_16_1 = getLocID("TransportationCampaign:ReachForStarsGrant")
      genericokpaneltext(nil, l_16_1)
   end
   if getHalfStars() >= 8 and l_16_arg0.fourStarGrant == nil then
      l_16_arg0.fourStarGrant = true
      giveCash(20000)
      local l_16_1 = getLocID("TransportationCampaign:ReachForStarsGrant")
      genericokpaneltext(nil, l_16_1)
   end
   if getHalfStars() >= 10 then
      return 1
   end
   if getCurrentMonth() >= 13 then
      return -1
   end
   return 0
end

evalfourstartour = function()
   if maxStationTypeStarRating("groundstation") >= 4 then
      return 1
   end
   if maxStationTypeStarRating("skystation") >= 4 then
      return 1
   end
   if getCurrentMonth() >= 13 then
      return -1
   end
   return 0
end

completefivestarzoo = function()
   showprimarygoals()
end

completefourstartour = function()
   showprimarygoals()
end

failfivestarzoo = function()
   showscenariofail("TransportationCampaign:ReachForStarsFailure", "TransportationCampaignscenario3")
end

failfourstartour = function()
   showscenariofail("TransportationCampaign:ReachForStarsFailure", "TransportationCampaignscenario3")
end

completereachforthestars = function()
   setuservar("vehiclegatelock", "true")
   local l_22_0 = getlocidfromspecies("FancyTourGate_df")
   if l_22_0 then
      local l_22_1 = getLocID("itemunlock:newitemgeneral") .. " " .. l_22_0
      genericokpaneltext(nil, l_22_1)
   end
   setuservar("TransportationCampaignscenario3", "completed")
   showscenariowin("TransportationCampaign:ReachForStarsSuccessOverview", nil)
end


