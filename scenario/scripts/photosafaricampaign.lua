include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/photoutil.lua")
DIVA_TYPE = "Guest_Adult_F_Rockstar"
SCIENTIST_TYPE = "Guest_Adult_M_Scientist"
RICH_TYPE = "Guest_Adult_M_Business"
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

completegoal = function()
   completeshowoverview()
   return 1
end

evalguestphotos = function(l_3_arg0)
   if l_3_arg0.guestPhotoChallengeStarted == nil then
      local l_3_1 = queryObject("ZTPhotoChallengesComponent")
      if l_3_1 then
         l_3_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignVIPGuests")
      end
      local l_3_2 = queryObject("BFScenarioMgr")
      if l_3_2 then
         l_3_2:UI_DISABLE("photo challenges")
      end
      l_3_arg0.guestPhotoChallengeStarted = true
   end
   local l_3_1 = queryObject("ZTPhotoChallengesComponent")
   if l_3_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

scoreChildMimic = function(l_4_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest_Young", "Stand_MimicCat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest_Young", "Stand_MimicChimp") >= 1 or scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest_Young", "Stand_MimicFlamingo") >= 1 or scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest_Young", "Stand_MimicGorilla") >= 1 or scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest_Young", "Stand_MimicKangaroo") >= 1 or scoreAnyEntityTypeDoingAnimX(l_4_arg0, "Guest_Young", "Stand_MimicMoose") >= 1 then
      return 1
   end
   return 0
end

scoreGuestGorillaBars = function(l_5_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_5_arg0, "Guest_Young", "Stand_GorillaBars") >= 1 then
      return 1
   end
   return 0
end

scoreGuestBinoculars = function(l_6_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_6_arg0, "Guest", "LookThroughBinoculars_Idle") >= 1 or scoreAnyEntityTypeDoingAnimX(l_6_arg0, "Guest", "LookThroughBinoculars_Left") >= 1 or scoreAnyEntityTypeDoingAnimX(l_6_arg0, "Guest", "LookThroughBinoculars_Right") >= 1 then
      return 1
   end
   return 0
end

completeguestphotos = function()
   showRule("ThreeStars")
   completeshowoverview()
end

evalthreestars = function()
   if getHalfStars() >= 6 then
      return 1
   end
   return 0
end

completethreestars = function()
   showRule("VIPPhotos")
   completeshowoverview()
end

evalvipphotos = function(l_10_arg0)
   if l_10_arg0.vipPhotoChallengeStarted == nil then
      local l_10_1 = queryObject("ZTPhotoChallengesComponent")
      if l_10_1 then
         l_10_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignVIPVIPs")
      end
      local l_10_2 = queryObject("BFScenarioMgr")
      if l_10_2 then
         l_10_2:UI_DISABLE("photo challenges")
      end
      l_10_arg0.vipPhotoChallengeStarted = true
   end
   if l_10_arg0.spawnCounter == nil then
      l_10_arg0.spawnCounter = 0
   elseif l_10_arg0.spawnCounter < 100 then
      l_10_arg0.spawnCounter = l_10_arg0.spawnCounter + 1
   end
   if l_10_arg0.spawnCounter >= 8 and l_10_arg0.richGiven == nil then
      local l_10_1 = getZooEntrancePos()
      placeObject(RICH_TYPE, l_10_1.x, l_10_1.y, l_10_1.z)
      local l_10_2 = findType(RICH_TYPE)
      BFLOG(table.getn(l_10_2))
      if table.getn(l_10_2) ~= 1 then
         BFLOG("Found more than one rich dude, possible error")
      end
      local l_10_3 = resolveTable(l_10_2[1].value)
      if l_10_3 then
         BFLOG("Setting rich guy name")
         local l_10_4 = getLocID("PhotoSafari:VIPsBusinessmanName")
         l_10_3:BFG_SET_ATTR_STRING("s_name", l_10_4)
         displayZooMessageWithZoom("PhotoSafari:VIPsBusinessmanEntered", 1, 30, l_10_3)
      end
      l_10_arg0.richGiven = true
   end
   if l_10_arg0.spawnCounter >= 80 and l_10_arg0.scientistGiven == nil then
      local l_10_1 = getZooEntrancePos()
      placeObject(SCIENTIST_TYPE, l_10_1.x, l_10_1.y, l_10_1.z)
      local l_10_2 = findType(SCIENTIST_TYPE)
      BFLOG(table.getn(l_10_2))
      if table.getn(l_10_2) ~= 1 then
         BFLOG("Found more than one scientist, possible error")
      end
      local l_10_3 = resolveTable(l_10_2[1].value)
      if l_10_3 then
         BFLOG("Setting scientist name")
         local l_10_4 = getLocID("PhotoSafari:VIPsScientistName")
         l_10_3:BFG_SET_ATTR_STRING("s_name", l_10_4)
         displayZooMessageWithZoom("PhotoSafari:VIPsScientistEntered", 1, 30, l_10_3)
      end
      l_10_arg0.scientistGiven = true
   end
   local l_10_1 = queryObject("ZTPhotoChallengesComponent")
   if l_10_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   if l_10_arg0.scientistGiven ~= nil and countType(SCIENTIST_TYPE) == 0 and getglobalvar("gotpicofscientist") == nil then
      return -1
   end
   if l_10_arg0.richGiven ~= nil and countType(RICH_TYPE) == 0 then
      failureType = "scientist"
      if l_10_arg0.richGiven ~= nil then
         failureType = "rich"
         return -1
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

scoreBillyStiles = function(l_11_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "StandItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "StandItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "StandItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "StandItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "StandItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitPicnicTableItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitPicnicTableItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitPicnicTableItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitPicnicTableItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitPicnicTableItem_EatFork") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitPicnicTableItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitTableItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitTableItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitTableItem_Lick") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitTableItem_EatFingerFood") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitTableItem_EatFork") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitTableItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitBenchItem_Eat") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitBenchItem_Drink") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitBenchItem_Sip") >= 1 or scoreAnyEntityTypeDoingAnimX(l_11_arg0, RICH_TYPE, "SitBenchItem_Lick") >= 1 then
      setglobalvar("gotpicofrich", "true")
      return 1
   end
   return 0
end

scoreAlvinEinheim = function(l_12_arg0)
   local l_12_1 = {"GuestViewAnimal_Path", "GuestViewAnimal_Canopy", "GuestViewAnimal_Bench"}
   if scoreAnyDoingTaskInList(l_12_arg0, SCIENTIST_TYPE, l_12_1) >= 1 then
      setglobalvar("gotpicofscientist", "true")
      return 1
   end
   return 0
end

completevipphotos = function()
   showRule("DivaPhotos")
   completeshowoverview()
end

failvipphotos = function()
   local l_14_0 = ""
   if failureType == "scientist" then
      l_14_0 = getLocID("PhotoSafari:VIPsFailureScientist")
   else
      l_14_0 = getLocID("PhotoSafari:VIPsFailureBusinessman")
   end
   showscenariofailtext(l_14_0, "PhotoSafariCampaignscenario1")
end

evaldivaphotos = function(l_15_arg0)
   if l_15_arg0.divaPhotoChallengeStarted == nil then
      local l_15_1 = queryObject("ZTPhotoChallengesComponent")
      if l_15_1 then
         l_15_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignVIPDiva")
      end
      local l_15_2 = queryObject("BFScenarioMgr")
      if l_15_2 then
         l_15_2:UI_DISABLE("photo challenges")
      end
      l_15_arg0.divaPhotoChallengeStarted = true
   end
   if l_15_arg0.spawnCounter == nil then
      l_15_arg0.spawnCounter = 0
   elseif l_15_arg0.spawnCounter < 10 then
      l_15_arg0.spawnCounter = l_15_arg0.spawnCounter + 1
   end
   if l_15_arg0.spawnCounter >= 8 and l_15_arg0.divaGiven == nil then
      local l_15_1 = getZooEntrancePos()
      placeObject(DIVA_TYPE, l_15_1.x, l_15_1.y, l_15_1.z)
      local l_15_2 = findType(DIVA_TYPE)
      BFLOG(table.getn(l_15_2))
      if table.getn(l_15_2) ~= 1 then
         BFLOG("Found more than one diva, possible error")
      end
      local l_15_3 = resolveTable(l_15_2[1].value)
      if l_15_3 then
         BFLOG("Setting diva name")
         local l_15_4 = getLocID("PhotoSafari:VIPsDivaName")
         l_15_3:BFG_SET_ATTR_STRING("s_name", l_15_4)
         displayZooMessageWithZoom("PhotoSafari:VIPsDivaEntered", 1, 30, l_15_3)
      end
      l_15_arg0.divaGiven = true
   end
   local l_15_1 = queryObject("ZTPhotoChallengesComponent")
   if l_15_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   if l_15_arg0.divaGiven ~= nil and countType(DIVA_TYPE) == 0 then
      return -1
   end
   return 0
end

scoreDiva = function(l_16_arg0)
   if scoreAnyEntityTypeDoingAnimX(l_16_arg0, DIVA_TYPE, "Dance_Idle") >= 1 then
      return 1
   end
   return 0
end

completedivaphotos = function()
   setuservar("PhotoSafariCampaignscenario1", "completed")
   local l_17_0 = getuservar("PhotoSafariCampaignscenario2")
   if l_17_0 ~= "completed" then
      setuservar("PhotoSafariCampaignscenario2", "unlocked")
   end
   showscenariowin("PhotoSafari:VIPsSuccessOverview", "PhotoSafariCampaignscenario2")
end

faildivaphotos = function()
   showscenariofail("PhotoSafari:VIPsFailureDiva", "PhotoSafariCampaignscenario1")
end

evaljavanphotos1 = function(l_19_arg0)
   if l_19_arg0.boostAdoptJavan == nil then
      boostSpeciesAdoptionProbabiltiy("RhinocerosJavan")
      l_19_arg0.boostAdoptJavan = 1
   end
   if l_19_arg0.javan1PhotoChallengeStarted == nil then
      local l_19_1 = queryObject("ZTPhotoChallengesComponent")
      if l_19_1 then
         l_19_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignJavan1")
      end
      local l_19_2 = queryObject("BFScenarioMgr")
      if l_19_2 then
         l_19_2:UI_DISABLE("photo challenges")
      end
      l_19_arg0.javan1PhotoChallengeStarted = true
   end
   local l_19_1 = queryObject("ZTPhotoChallengesComponent")
   if l_19_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completejavanphotos1 = function()
   showRule("JavanPhotoSet2")
   completeshowoverview()
end

scoreJavanRhinoAerialEating = function(l_21_arg0)
   if scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_21_arg0, "RhinocerosJavan", "Chew_Eat") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_21_arg0, "RhinocerosJavan", "Chew_Eat", "skytram") >= 1 or scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_21_arg0, "RhinocerosJavan", "Chew_Browse") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_21_arg0, "RhinocerosJavan", "Chew_Browse", "skytram") >= 1 or scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_21_arg0, "RhinocerosJavan", "Chew_Graze") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_21_arg0, "RhinocerosJavan", "Chew_Graze", "skytram") >= 1 or scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_21_arg0, "RhinocerosJavan", "Chew_Pullhorn") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_21_arg0, "RhinocerosJavan", "Chew_Pullhorn", "skytram") >= 1 or scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_21_arg0, "RhinocerosJavan", "Chew_Idle") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_21_arg0, "RhinocerosJavan", "Chew_Idle", "skytram") >= 1 then
      return 1
   end
   return 0
end

scoreJavanRhinoAerialSleeping = function(l_22_arg0)
   if scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_22_arg0, "RhinocerosJavan", "Sleep_Idle") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_22_arg0, "RhinocerosJavan", "Sleep_Idle", "skytram") >= 1 then
      return 1
   end
   if scoreAnyEntityTypeDoingAnimXFromElevatedPath(l_22_arg0, "RhinocerosJavan", "Lie_Idle") >= 1 or scoreAnyEntityTypeDoingAnimXFromVehicle(l_22_arg0, "RhinocerosJavan", "Lie_Idle", "skytram") >= 1 then
      return 1
   end
   if scoreAnyEntityTypeDoingTargetFromElevatedPath(l_22_arg0, "RhinocerosJavan", "ShadeStructure_Shelter") >= 1 then
      return 1
   end
   if scoreAnyEntityTypeDoingTargetFromVehicle(l_22_arg0, "RhinocerosJavan", "ShadeStructure_Shelter", "skytram") >= 1 then
      return 1
   end
   return 0
end

evaljavanphotos2 = function(l_23_arg0)
   if l_23_arg0.javan2PhotoChallengeStarted == nil then
      local l_23_1 = queryObject("ZTPhotoChallengesComponent")
      if l_23_1 then
         l_23_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignJavan2")
      end
      local l_23_2 = queryObject("BFScenarioMgr")
      if l_23_2 then
         l_23_2:UI_DISABLE("photo challenges")
      end
      l_23_arg0.javan2PhotoChallengeStarted = true
   end
   local l_23_1 = queryObject("ZTPhotoChallengesComponent")
   if l_23_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completejavanphotos2 = function()
   giveCash(10000)
   placeCratedObjectAtGate("RhinocerosJavan_Adult_F")
   showRule("FinalGoals")
   completeshowoverview()
end

scoreJavanRhinoAerialSaltLick = function(l_25_arg0)
   if scoreAnyEntityTypeDoingTargetFromElevatedPath(l_25_arg0, "RhinocerosJavan", "SaltLick_df") >= 1 then
      return 1
   end
   if scoreAnyEntityTypeDoingTargetFromVehicle(l_25_arg0, "RhinocerosJavan", "SaltLick_df", "skytram") >= 1 then
      return 1
   end
   return 0
end

scoreJavanRhinoAerialPursuitBall = function(l_26_arg0)
   if scoreAnyEntityTypeDoingTargetFromElevatedPath(l_26_arg0, "RhinocerosJavan", "PursuitBall") >= 1 then
      return 1
   end
   if scoreAnyEntityTypeDoingTargetFromVehicle(l_26_arg0, "RhinocerosJavan", "PursuitBall", "skytram") >= 1 then
      return 1
   end
   return 0
end

evaljavanfemale = function()
   if countType("RhinocerosJavan_Adult_F") >= 1 then
      return 1
   end
   return 0
end

completejavanfemale = function()
   showRule("JavanPhotoSet3")
   completeshowoverview()
end

evalincreasefame = function()
   if getHalfStars() >= 7 then
      return 1
   end
   return 0
end

completeincreasefame = function()
   giveCash(10000)
   showprimarygoals()
end

evaljavanphotos3 = function(l_31_arg0)
   if l_31_arg0.javan3PhotoChallengeStarted == nil then
      local l_31_1 = queryObject("ZTPhotoChallengesComponent")
      if l_31_1 then
         l_31_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignJavan3")
      end
      local l_31_2 = queryObject("BFScenarioMgr")
      if l_31_2 then
         l_31_2:UI_DISABLE("photo challenges")
      end
      l_31_arg0.javan3PhotoChallengeStarted = true
   end
   local l_31_1 = queryObject("ZTPhotoChallengesComponent")
   if l_31_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completejavanphotos3 = function(l_32_arg0)
   showprimarygoals()
end

completejavanscenario = function(l_33_arg0)
   setuservar("PhotoSafariCampaignscenario2", "completed")
   local l_33_1 = getuservar("PhotoSafariCampaignscenario3")
   if l_33_1 ~= "completed" then
      setuservar("PhotoSafariCampaignscenario3", "unlocked")
   end
   showscenariowin("PhotoSafari:JavanRhinoSuccessOverview", "PhotoSafariCampaignscenario3")
end

scoreJavanRhinoBaby = function(l_34_arg0)
   if numEntityExistsFromElevatedPath(l_34_arg0, "RhinocerosJavan_Young") >= 1 then
      return 1
   end
   if numEntityExistsFromVehicle(l_34_arg0, "RhinocerosJavan_Young", "skytram") >= 1 then
      return 1
   end
   return 0
end

evalhealthyanimalphotos = function(l_35_arg0)
   if l_35_arg0.closedZoo == nil then
      local l_35_1 = queryObject("BFScenarioMgr")
      if l_35_1 then
         l_35_1:UI_DISABLE("open zoo toggle button")
         local l_35_2 = queryObject("UIRoot")
         if l_35_2 then
            local l_35_3 = l_35_2:UI_GET_CHILD("close zoo toggle button")
            if l_35_3 then
               l_35_3:UI_ACTIVATE_ON()
            end
         end
      end
      l_35_arg0.closedZoo = 1
   end
   if l_35_arg0.healthyanimalPhotoChallengeStarted == nil then
      local l_35_1 = queryObject("ZTPhotoChallengesComponent")
      if l_35_1 then
         l_35_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignHealthyAnimals")
      end
      local l_35_2 = queryObject("BFScenarioMgr")
      if l_35_2 then
         l_35_2:UI_DISABLE("photo challenges")
      end
      l_35_arg0.healthyanimalPhotoChallengeStarted = true
   end
   local l_35_1 = queryObject("ZTPhotoChallengesComponent")
   if l_35_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completehealthyanimalphotos = function()
   giveCash(2000)
   showRule("SeventyFiveGuests")
   completeshowoverview()
end

scoreHealthyJaguar = function(l_37_arg0)
   if numberOfT1(l_37_arg0, "Jaguar") >= 1 then
      return 1
   end
   return 0
end

scoreHealthyCheetah = function(l_38_arg0)
   if numberOfT1(l_38_arg0, "Cheetah") >= 1 then
      return 1
   end
   return 0
end

scoreHealthyLion = function(l_39_arg0)
   if numberOfT1(l_39_arg0, "Lion") >= 1 then
      return 1
   end
   return 0
end

evalseventyfiveguests = function(l_40_arg0)
   if l_40_arg0.openZoo == nil then
      local l_40_1 = queryObject("BFScenarioMgr")
      if l_40_1 then
         l_40_1:UI_ENABLE("open zoo toggle button")
         local l_40_2 = queryObject("UIRoot")
         if l_40_2 then
            local l_40_3 = l_40_2:UI_GET_CHILD("open zoo toggle button")
            if l_40_3 then
               l_40_3:UI_ACTIVATE_ON()
            end
         end
      end
      l_40_arg0.openZoo = 1
   end
   if getNumGuests(-1) >= 75 then
      return 1
   end
   return 0
end

completeseventyfiveguests = function()
   giveCash(15000)
   showRule("LynxPhotos")
   completeshowoverview()
end

evallynxphotos = function(l_42_arg0)
   if l_42_arg0.lynxPhotoChallengeStarted == nil then
      local l_42_1 = queryObject("ZTPhotoChallengesComponent")
      if l_42_1 then
         l_42_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignLynx")
      end
      local l_42_2 = queryObject("BFScenarioMgr")
      if l_42_2 then
         l_42_2:UI_DISABLE("photo challenges")
      end
      l_42_arg0.lynxPhotoChallengeStarted = true
   end
   local l_42_1 = queryObject("ZTPhotoChallengesComponent")
   if l_42_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completelynxphotos = function()
   giveCash(40000)
   showRule("PantherPhotos")
   completeshowoverview()
end

scoreLynxUsingBeefShank = function(l_44_arg0)
   if scoreAnyEntityTypeDoingTarget(l_44_arg0, "LynxSpanish", "BeefShank") >= 1 then
      return 1
   end
   if scoreAnyEntityTypeDoingTarget(l_44_arg0, "LynxSpanish", "IceBlock_BeefShank") >= 1 then
      return 1
   end
   return 0
end

evalpantherphotos = function(l_45_arg0)
   if l_45_arg0.boostAdoptPanther == nil then
      boostSpeciesAdoptionProbabiltiy("PantherFlorida")
      l_45_arg0.boostAdoptPanther = 1
   end
   if l_45_arg0.lynxPhotoChallengeStarted == nil then
      local l_45_1 = queryObject("ZTPhotoChallengesComponent")
      if l_45_1 then
         l_45_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("photoSafariCampaignPanther")
      end
      local l_45_2 = queryObject("BFScenarioMgr")
      if l_45_2 then
         l_45_2:UI_DISABLE("photo challenges")
      end
      l_45_arg0.lynxPhotoChallengeStarted = true
   end
   local l_45_1 = queryObject("ZTPhotoChallengesComponent")
   if l_45_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completepantherphotos = function()
   setuservar("catclimberlock", "true")
   setuservar("PhotoSafariCampaignscenario3", "completed")
   showscenariowin("PhotoSafari:CatSanctuarySuccessOverview", nil)
end

scorePantherOnWetlandsRock = function(l_47_arg0)
   if scoreAnyEntityTypeDoingTarget(l_47_arg0, "PantherFlorida", "rock") >= 1 then
      return 1
   end
   return 0
end


