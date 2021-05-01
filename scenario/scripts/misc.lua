include("scenario/scripts/entity.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/token.lua")
getBiomes = function()
   local l_1_0 = queryObject("ZTWorldMgr")
   if l_1_0 then
      return l_1_0:ZT_GET_BIOME_LIST()
   end
   return nil
end

getCurrentMonth = function()
   local l_2_0 = queryObject("ZTStatus")
   if l_2_0 then
      return l_2_0:ZT_GET_CURRENT_MONTH()
   end
   return nil
end

getNumGuests = function(l_3_arg0)
   local l_3_1 = queryObject("ZTEconomyMgr")
   if l_3_1 then
      if l_3_arg0 == -1 then
         local l_3_2, l_3_3 = l_3_1:ZT_GET_INFO, l_3_1
         local l_3_4
         return l_3_2(l_3_3, l_3_4)
         l_3_4 = {_type = "ZTEconomyInfo", period = "lifetime", category = "admissions", type = "totalUsers"}
      else
         local l_3_2, l_3_3 = l_3_1:ZT_GET_INFO, l_3_1
         local l_3_4
         return l_3_2(l_3_3, l_3_4)
         l_3_4 = {_type = "ZTEconomyInfo", period = "monthly", category = "admissions", type = "totalUsers", month = l_3_arg0}
      end
   end
end

getCurrentTimeOfDay = function()
   local l_4_0 = queryObject("ZTStatus")
   if l_4_0 then
      return l_4_0:ZT_GET_CURRENT_DAYOFMONTH()
   else
      return -1
   end
end

getCurrentSimTime = function()
   local l_5_0 = queryObject("ZTStatus")
   if l_5_0 then
      return l_5_0:ZT_GET_SIM_TIME()
   else
      return -1
   end
end

getRealTime = function()
   return os.clock()
end

animalMeetsBiomeNeed = function(l_7_arg0)
   local l_7_1 = needMet(l_7_arg0, "environment")
   if l_7_1 == true then
      local l_7_2 = getPrimaryBiome(l_7_arg0)
      if l_7_2 ~= "" then
         return l_7_2
      end
   end
   return nil
end

getPrimaryBiome = function(l_8_arg0)
   if l_8_arg0 ~= nil then
      return l_8_arg0:BFG_GET_PRIMARY_BIOME()
   end
   return nil
end

getLocation = function(l_9_arg0)
   if l_9_arg0 ~= nil then
      return l_9_arg0:BFG_GET_LOCATION()
   end
   return nil
end

getCameraBiome = function(l_10_arg0)
   local l_10_1 = queryObject("ZTWorldMgr")
   if l_10_1 then
      return l_10_1:ZT_IS_CAMERA_OVER_BIOME(l_10_arg0)
   end
   return false
end

getCameraX = function()
   local l_11_0 = queryObject("ZTWorldMgr")
   if l_11_0 then
      return l_11_0:BFG_GET_CAMERA_X()
   end
   return nil
end

getCameraY = function()
   local l_12_0 = queryObject("ZTWorldMgr")
   if l_12_0 then
      return l_12_0:BFG_GET_CAMERA_Y()
   end
   return nil
end

getCameraZ = function()
   local l_13_0 = queryObject("ZTWorldMgr")
   if l_13_0 then
      return l_13_0:BFG_GET_CAMERA_Z()
   end
   return nil
end

getCameraZoom = function()
   local l_14_0 = queryObject("ZTWorldMgr")
   if l_14_0 then
      return l_14_0:BFG_GET_CAMERA_ZOOM()
   end
   return nil
end

setuservar = function(l_15_arg0, l_15_arg1)
   local l_15_2 = queryObject("BFScenarioMgr")
   local l_15_3, l_15_4 = l_15_2:BFS_SETUSERVAL, l_15_2
   local l_15_5
   l_15_3(l_15_4, l_15_5)
   l_15_5 = {key = l_15_arg0, val = l_15_arg1}
end

getuservar = function(l_16_arg0)
   local l_16_1 = queryObject("BFScenarioMgr")
   return l_16_1:BFS_GETUSERVAL(l_16_arg0)
end

setglobalvar = function(l_17_arg0, l_17_arg1)
   local l_17_2 = queryObject("BFScenarioMgr")
   local l_17_3, l_17_4 = l_17_2:BFS_SETGLOBALVAR, l_17_2
   local l_17_5
   l_17_3(l_17_4, l_17_5)
   l_17_5 = {key = l_17_arg0, val = l_17_arg1}
end

getglobalvar = function(l_18_arg0)
   local l_18_1 = queryObject("BFScenarioMgr")
   return l_18_1:BFS_GETGLOBALVAR(l_18_arg0)
end

giveaward = function(l_19_arg0)
   local l_19_1 = queryObject("ZTAwardMgr")
   if l_19_1 ~= nil then
      local l_19_2 = l_19_1:ZT_HAS_AWARD(l_19_arg0)
      if l_19_2 then
         BFLOG(SYSTRACE, "Already has it.")
      else
         l_19_1:ZT_GIVE_AWARD(l_19_arg0)
         BFLOG(SYSTRACE, "Gave it.")
      end
   else
      BFLOG(SYSTRACE, "No award manager.")
   end
   -- Tried to add an 'end' here but it's incorrect
end

isResearchable = function(l_20_arg0)
   local l_20_1 = false
   local l_20_2 = queryObject("ZTWorldMgr")
   if l_20_2 then
      l_20_1 = l_20_2:ZT_IS_RESEARCHABLE(l_20_arg0)
   end
   return l_20_1
end

getResearchableEnrichmentItems = function()
   local l_21_0 = {}
   local l_21_1 = queryObject("BFGManager")
   if l_21_1 ~= nil then
      local l_21_2 = l_21_1:BFG_GET_DERIVED_LEAF_TYPES("enrichment")
      for l_21_3 = 1, table.getn(l_21_2) do
         local l_21_6 = l_21_2[l_21_3].value
         if isResearchable(l_21_6) == true then
            local l_21_7 = false
            for l_21_8 = 1, table.getn(l_21_0) do
               if l_21_6 == l_21_0[l_21_8] then
                  l_21_7 = true
               end
            end
            if l_21_7 == false then
               l_21_0[table.getn(l_21_0) + 1] = l_21_6
            end
         end
      end
   end
   return l_21_0
end

howManyEnrichResearched = function()
   local l_22_0 = getResearchableEnrichmentItems()
   local l_22_1 = 0
   local l_22_2 = queryObject("ZTResearchMgr")
   if l_22_2 then
      local l_22_3 = table.getn(l_22_0)
      for l_22_4 = 1, l_22_3 do
         tmp = l_22_2:ZT_RESEARCH_IS_UNLOCKED(l_22_0[l_22_4])
         if tmp == true then
            l_22_1 = l_22_1 + 1
      else
      end
         end
      else
         BFLOG(SYSTRACE, "Can't grasp ZTResearchMgr")
      end
      return l_22_1
end

getLocID = function(l_23_arg0)
   local l_23_1 = queryObject("BFScenarioMgr")
   if l_23_1 then
      return l_23_1:BFS_GETLOCID(l_23_arg0)
   else
      BFLOG(SYSTRACE, "Couldn't get BFScenarioMgr")
   end
end

getZooFame = function()
   local l_24_0 = queryObject("ZTStatus")
   if l_24_0 then
      local l_24_1 = l_24_0:ZT_GET_ZOO_FAME()
      BFLOG(SYSTRACE, "Zoo fame is..." .. l_24_1)
      return l_24_1
   end
end

giveGuest = function(l_25_arg0)
   local l_25_1 = queryObject("ZTAIGuestMgr")
   if l_25_1 then
      for l_25_2 = 1, l_25_arg0 do
         BFLOG(SYSTRACE, "Adding a guest")
         l_25_1:ZTAI_CREATE_GUEST()
      end
   else
      BFLOG(SYSTRACE, "Failed to query ZTAIGuestMgr")
   end
end

getAnimalsPutUpForAdoption = function()
   local l_26_0 = queryObject("ZTStatus")
   local l_26_1 = 0
   if l_26_0 then
      l_26_1 = l_26_0:ZT_GET_ANIMALS_PUTUPFORADOPTION()
   else
      BFLOG(SYSTRACE, "error querying ZTStatus")
   end
   return l_26_1
end

getAnimalsReleased = function()
   local l_27_0 = queryObject("ZTStatus")
   local l_27_1 = 0
   if l_27_0 then
      l_27_1 = l_27_0:ZT_GET_ANIMALS_RELEASED()
   else
      BFLOG(SYSTRACE, "error querying ZTStatus")
   end
   return l_27_1
end

countCenterBiome = function(l_28_arg0)
   mgr = queryObject("ZTWorldMgr")
   if mgr then
      return mgr:ZT_GET_BIOME_COUNT(l_28_arg0)
   end
   return 0
end

countCenterBiomeWater = function(l_29_arg0)
   mgr = queryObject("ZTWorldMgr")
   if mgr then
      return mgr:ZT_GET_BIOME_WATER_COUNT(l_29_arg0)
   end
   return 0
end

countWaterGroups = function()
   local l_30_0 = queryObject("ZTWorldMgr")
   if l_30_0 ~= nil then
      local l_30_1 = l_30_0:ZT_GET_NUM_WATER_GROUP()
      if l_30_1 ~= nil then
         BFLOG("Found num water groups: " .. l_30_1)
         return l_30_1
      else
         BFLOG("Failed to find Manager")
      end
      -- Tried to add an 'end' here but it's incorrect
end

setchallengeactive = function()
   setglobalvar("challenge", nil)
   setglobalvar("challengeactive", "true")
   local l_31_0 = queryObject("UIRoot")
   if l_31_0 then
      local l_31_1 = l_31_0:UI_GET_CHILD("photo challenges layout")
      if l_31_1 then
         local l_31_2 = l_31_1:UI_GET_CHILD("decline")
         if l_31_2 then
            l_31_2:UI_SHOW()
         end
      end
   end
end

resetchallengeover = function(l_32_arg0)
   BFLOG("set challenge to nil")
   setglobalvar("challenge", nil)
   BFLOG("challenge active is false")
   setglobalvar("challengeactive", "false")
   BFLOG("delay challenge is true")
   setglobalvar("delaychallenges", "true")
   BFLOG("challenge name _over is true")
   setglobalvar(l_32_arg0 .. "_over", "true")
end

resetchallengeoverandcomplete = function(l_33_arg0)
   setglobalvar("challenge", nil)
   setglobalvar("challengeactive", "false")
   setglobalvar("delaychallenges", "true")
   setglobalvar(l_33_arg0 .. "_over", "true")
   setglobalvar(l_33_arg0 .. "_complete", "true")
   local l_33_1 = queryObject("UIRoot")
   if l_33_1 then
      local l_33_2 = l_33_1:UI_GET_CHILD("photo challenges layout")
      if l_33_2 then
         local l_33_3 = l_33_2:UI_GET_CHILD("decline")
         if l_33_3 then
            l_33_3:UI_HIDE()
         end
      end
   end
end

setaltoverviewtext = function(l_34_arg0, l_34_arg1, l_34_arg2)
   local l_34_3 = queryObject("BFScenarioMgr")
   if l_34_3 then
      local l_34_4
      l_34_3:BFS_SETALTOVERVIEWTEXT(l_34_4)
      l_34_4 = {_type = "BFScenarioAltTextData", rulename = l_34_arg0, rulestate = l_34_arg1, ruletext = l_34_arg2}
      BFLOG(SYSTRACE, "alt text set")
   end
end

setalttext = function(l_35_arg0, l_35_arg1, l_35_arg2)
   local l_35_3 = queryObject("BFScenarioMgr")
   if l_35_3 then
      local l_35_4
      l_35_3:BFS_SETALTTEXT(l_35_4)
      l_35_4 = {_type = "BFScenarioAltTextData", rulename = l_35_arg0, rulestate = l_35_arg1, ruletext = l_35_arg2}
      BFLOG(SYSTRACE, "alt text set")
   else
      BFLOG(SYSTRACE, "Failed to get manager")
   end
end

incrementglobalchallenges = function()
   if getglobalvar("numchallcomplete") == nil then
      local l_36_0, l_36_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

incrementendangeredchallenges = function()
   if getglobalvar("numendangeredchallcomplete") == nil then
      local l_37_0, l_37_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

incrementmarineanimalchallenges = function()
   if getglobalvar("nummarineanimalchallcomplete") == nil then
      local l_38_0, l_38_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

incrementmarineshowchallenges = function()
   if getglobalvar("nummarineshowchallcomplete") == nil then
      local l_39_0, l_39_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

incrementphotochallenges = function()
   if getglobalvar("numphotocomplete") == nil then
      local l_40_0, l_40_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

getlocidfromspecies = function(l_41_arg0)
   return getLocID("entityname:" .. l_41_arg0)
end

clearphotochallenge = function(l_42_arg0)
   local l_42_1 = queryObject("ZTPhotoChallengesComponent")
   if l_42_1 then
      l_42_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("bogusChallengeSetName")
   end
   local l_42_2 = queryObject("BFScenarioMgr")
   if l_42_2 then
      l_42_2:BFS_HIDERULE(l_42_arg0)
   end
end

getHalfStars = function(l_43_arg0)
   local l_43_1 = 0
   local l_43_2 = queryObject("ZTStatus")
   if l_43_2 then
      l_43_1 = l_43_2:ZT_GET_FAME_HALFSTARS()
   end
   return l_43_1
end

incrementAwardPoints = function(l_44_arg0)
   local l_44_1 = queryObject("ZTStatus")
   if l_44_1 then
      l_44_1:ZT_INC_AWARD_POINTS(l_44_arg0)
   else
      BFLOG(SYSTRACE, "error getting ZTStatus in incrementAwardPoints")
   end
end

processVince = function(l_45_arg0)
   local l_45_1 = queryObject("BFScenarioMgr")
   if l_45_1 then
      l_45_1:BFS_PROCESS_VINCE(l_45_arg0)
   else
      BFLOG(SYSTRACE, "processVince - error getting BFScenarioMgr")
   end
end

displayZooMessage = function(l_46_arg0, l_46_arg1, l_46_arg2)
   local l_46_3
   local l_46_4 = queryObject("ZTWorldMgr")
   if l_46_4 then
      l_46_4:ZT_DISPLAY_ZOO_MESSAGE(l_46_3)
      l_46_3 = {_type = "ZTZooMessageData", display = getLocID(l_46_arg0), priority = l_46_arg1, timeout = l_46_arg2, target = nil}
   end
end

displayZooMessageWithZoom = function(l_47_arg0, l_47_arg1, l_47_arg2, l_47_arg3)
   local l_47_4
   local l_47_5 = queryObject("ZTWorldMgr")
   if l_47_5 then
      l_47_5:ZT_DISPLAY_ZOO_MESSAGE(l_47_4)
      l_47_4 = {_type = "ZTZooMessageData", display = getLocID(l_47_arg0), priority = l_47_arg1, timeout = l_47_arg2, target = l_47_arg3}
   end
end

displayZooMessageTextWithZoom = function(l_48_arg0, l_48_arg1, l_48_arg2, l_48_arg3)
   local l_48_4
   local l_48_5 = queryObject("ZTWorldMgr")
   if l_48_5 then
      l_48_5:ZT_DISPLAY_ZOO_MESSAGE(l_48_4)
      l_48_4 = {_type = "ZTZooMessageData", display = l_48_arg0, priority = l_48_arg1, timeout = l_48_arg2, target = l_48_arg3}
   end
end

saveOptions = function()
   local l_49_0 = queryObject("BFScenarioMgr")
   if l_49_0 then
      l_49_0:BFS_SAVEOPTIONS()
   end
end

setMaxFame = function(l_50_arg0)
   local l_50_1 = queryObject("ZTStatus")
   if l_50_1 then
      l_50_1:ZT_SET_MAX_FAME_REACHED(l_50_arg0)
   end
end

unlockEntity = function(l_51_arg0)
   mgr = queryObject("ZTResearchMgr")
   if mgr then
      mgr:ZT_RESEARCH_UNLOCK_ENTITY_KIND(l_51_arg0)
   end
end

getAnimalsAvailableByStars = function(l_52_arg0)
   local l_52_1 = 0
   if l_52_arg0 == nil then
      l_52_1 = getHalfStars()
   else
      l_52_1 = l_52_arg0
   end
   local l_52_2 = l_52_1 * 10
   local l_52_3 = {}
   local l_52_4 = queryObject("BFGManager")
   if l_52_4 ~= nil then
      local l_52_5 = l_52_4:BFG_GET_DERIVED_LEAF_TYPES("animal")
      for l_52_6 = 1, table.getn(l_52_5) do
         local l_52_9 = l_52_5[l_52_6].value
         speciesName = getSpeciesFromType(l_52_9)
         if speciesName ~= "" then
            local l_52_10 = false
            for l_52_11 = 1, table.getn(l_52_3) do
               if speciesName == l_52_3[l_52_11] then
                  l_52_10 = true
               end
            end
            if l_52_10 == false then
               local l_52_11 = queryObject("ZTWorldMgr")
               if l_52_11 then
                  local l_52_12, l_52_13 = l_52_11:BFG_GET_ATTR_FLOAT, l_52_11
                  local l_52_14
                  l_52_12, l_52_14 = l_52_12(l_52_13, l_52_14), {key = speciesName, val = "f_adoptRarity"}
                  if l_52_12 <= l_52_2 then
                     l_52_13 = table
                     l_52_13 = l_52_13.getn
                     l_52_14 = l_52_3
                     l_52_13 = l_52_13(l_52_14)
                     l_52_13 = l_52_13 + 1
                     l_52_14 = speciesName
                     l_52_3[l_52_13] = l_52_14
                  end
               end
            end
         end
      end
   end
   return l_52_3
end

getZooEntrancePos = function()
   local l_53_0 = findType("entrance")
   local l_53_1 = {}
   l_53_1.x = 50
   l_53_1.y = 0
   l_53_1.z = 0
   if table.getn(l_53_0) == 1 then
      local l_53_2 = resolveTable(l_53_0[1].value)
      if l_53_2 then
         l_53_1 = l_53_2:BFG_GET_ENTITY_POSITION()
      else
         BFLOG("a strange number of entrances")
      end
      -- Tried to add an 'end' here but it's incorrect
      return l_53_1
end

setChallengeDebugMode = function(l_54_arg0)
   if l_54_arg0 == true then
      setglobalvar("challenge_debug_mode", "true")
   else
      setglobalvar("challenge_debug_mode", "false")
   end
end

getChallengeDebugMode = function()
   local l_55_0 = getglobalvar("challenge_debug_mode")
   if l_55_0 == nil or l_55_0 ~= "true" then
      return false
   end
   return true
end

turnOnChallengeDebugMode = function()
   setglobalvar("challenge_debug_mode", "true")
end

turnOffChallengeDebugMode = function()
   setglobalvar("challenge_debug_mode", "false")
end

setAddScenarioSuppression = function(l_58_arg0)
   if l_58_arg0 == true then
      setglobalvar("add_scenario_suppression", "true")
   else
      setglobalvar("add_scenario_suppression", "false")
   end
end

getAddScenarioSuppression = function()
   local l_59_0 = getglobalvar("add_scenario_suppression")
   if l_59_0 == nil or l_59_0 ~= "true" then
      return false
   end
   return true
end

turnOnScenarioSuppression = function()
   setglobalvar("add_scenario_suppression", "true")
end

turnOffScenarioSuppression = function()
   setglobalvar("add_scenario_suppression", "false")
end

setPrereqGather = function(l_62_arg0)
   if l_62_arg0 == true then
      setglobalvar("prereq_gather", "true")
   else
      setglobalvar("prereq_gather", "false")
   end
end

getPrereqGather = function()
   local l_63_0 = getglobalvar("prereq_gather")
   if l_63_0 == nil or l_63_0 ~= "true" then
      return false
   end
   return true
end

setDeclineForever = function(l_64_arg0)
   if l_64_arg0 == true then
      setglobalvar("decline_forever", "true")
   else
      setglobalvar("decline_forever", "false")
   end
end

getDeclineForever = function()
   local l_65_0 = getglobalvar("decline_forever")
   if l_65_0 == nil or l_65_0 ~= "true" then
      return false
   end
   return true
end

turnOnDeclineForever = function()
   setglobalvar("decline_forever", "true")
end

turnOffDeclineForever = function()
   setglobalvar("decline_forever", "false")
end

isChalDeclinedForever = function(l_68_arg0)
   local l_68_1 = getglobalvar(l_68_arg0 .. "_decline_forever")
   if l_68_1 == nil or l_68_1 ~= "true" then
      return false
   end
   return true
end

incChallengesOffered = function()
   if getglobalvar("challenges_offered") == nil then
      local l_69_0, l_69_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

getChallengesOffered = function()
   if getglobalvar("challenges_offered") == nil then
      local l_70_0 = 0
   end
   --[[ DECOMPILER ERROR 874: Confused about usage of registers ]]
end

logDebugChallengeInfo = function(l_71_arg0, l_71_arg1)
   if getChallengeDebugMode() == true then
      BFLOG(SYSNOTE, "Challenge_offered: " .. l_71_arg0 .. " : " .. l_71_arg1 .. " : " .. getChallengesOffered())
   end
end

turnOnDisableModals = function()
   local l_72_0 = queryObject("UIRoot")
   if l_72_0 then
      l_72_0:UI_ROOT_SETDISABLEMODAL("on")
   end
end

turnOffDisableModals = function()
   local l_73_0 = queryObject("UIRoot")
   if l_73_0 then
      l_73_0:UI_ROOT_SETDISABLEMODAL("off")
   end
end

isFreeform = function()
   local l_74_0 = queryObject("ZTStatus")
   local l_74_1 = false
   if l_74_0 then
      l_74_1 = l_74_0:ZT_GET_IS_FREEFORM()
   end
   return l_74_1
end

placeObjectAtGate = function(l_75_arg0)
   local l_75_1 = getZooEntrancePos()
   local l_75_2 = placeObject(l_75_arg0, l_75_1.x, l_75_1.y, l_75_1.z)
   return l_75_2:BFG_GET_ENTITY_ID()
end

placeObjectAtGateWithOffset = function(l_76_arg0, l_76_arg1, l_76_arg2)
   local l_76_3 = getZooEntrancePos()
   local l_76_4 = placeObject(l_76_arg0, l_76_3.x + l_76_arg1, l_76_3.y + l_76_arg2, l_76_3.z)
   return l_76_4:BFG_GET_ENTITY_ID()
end

placeCratedObjectAtGate = function(l_77_arg0)
   local l_77_1 = findType(l_77_arg0)
   BFLOG("obj table count: " .. table.getn(l_77_1))
   local l_77_2 = getZooEntrancePos()
   placeObject(l_77_arg0, l_77_2.x + 10, l_77_2.y + 10, l_77_2.z, false, false)
   local l_77_3 = findType(l_77_arg0)
   BFLOG("new obj table count: " .. table.getn(l_77_3))
   for l_77_4 = 1, table.getn(l_77_3) do
      local l_77_7 = false
      for l_77_8 = 1, table.getn(l_77_1) do
         local l_77_11 = resolveTable(l_77_3[l_77_4].value)
         local l_77_12 = resolveTable(l_77_1[l_77_8].value)
         if areCompsEqual(l_77_11, l_77_12) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_77_7 = true
         end
      end
      if l_77_7 == false then
         BFLOG(SYSTRACE, "Crating an entity")
         local l_77_8 = resolveTable(l_77_3[l_77_4].value)
         crateEntity(l_77_8)
         return l_77_8:BFG_GET_ENTITY_ID()
      end
   end
end

placeCratedDiseasedAnimalAtGate = function(l_78_arg0, l_78_arg1)
   local l_78_2 = findType(l_78_arg0)
   BFLOG("obj table count: " .. table.getn(l_78_2))
   local l_78_3 = getZooEntrancePos()
   placeObject(l_78_arg0, l_78_3.x + 10, l_78_3.y + 10, l_78_3.z, false, false)
   local l_78_4 = findType(l_78_arg0)
   BFLOG("new obj table count: " .. table.getn(l_78_4))
   for l_78_5 = 1, table.getn(l_78_4) do
      local l_78_8 = false
      for l_78_9 = 1, table.getn(l_78_2) do
         if areCompsEqual(resolveTable(l_78_4[l_78_5].value), resolveTable(l_78_2[l_78_9].value)) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_78_8 = true
         end
      end
      if l_78_8 == false then
         BFLOG(SYSTRACE, "Crating an entity")
         resolveTable(l_78_4[l_78_5].value):BFG_SET_ATTR_BOOLEAN("b_Disease", true)
         token = {}
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

placeCratedWaterAdjacentObjectAtGate = function(l_79_arg0)
   local l_79_1 = findType(l_79_arg0)
   BFLOG("obj table count: " .. table.getn(l_79_1))
   local l_79_2 = getZooEntrancePos()
   placeObject(l_79_arg0, l_79_2.x + 10, l_79_2.y + 10, l_79_2.z, false, true)
   local l_79_3 = findType(l_79_arg0)
   BFLOG("new obj table count: " .. table.getn(l_79_3))
   for l_79_4 = 1, table.getn(l_79_3) do
      local l_79_7 = false
      for l_79_8 = 1, table.getn(l_79_1) do
         local l_79_11 = resolveTable(l_79_3[l_79_4].value)
         local l_79_12 = resolveTable(l_79_1[l_79_8].value)
         if areCompsEqual(l_79_11, l_79_12) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_79_7 = true
         end
      end
      if l_79_7 == false then
         BFLOG(SYSTRACE, "Crating an entity")
         local l_79_8 = resolveTable(l_79_3[l_79_4].value)
         crateEntity(l_79_8)
         return l_79_8:BFG_GET_ENTITY_ID()
      end
   end
end

placeCratedWaterObjectAtGate = function(l_80_arg0)
   local l_80_1 = findType(l_80_arg0)
   local l_80_2 = getZooEntrancePos()
   placeObject(l_80_arg0, l_80_2.x + 10, l_80_2.y + 10, l_80_2.z, true, false)
   local l_80_3 = findType(l_80_arg0)
   for l_80_4 = 1, table.getn(l_80_3) do
      local l_80_7 = false
      for l_80_8 = 1, table.getn(l_80_1) do
         local l_80_11 = resolveTable(l_80_3[l_80_4].value)
         local l_80_12 = resolveTable(l_80_1[l_80_8].value)
         if areCompsEqual(l_80_11, l_80_12) == true then
            BFLOG(SYSTRACE, "comps are equal")
            l_80_7 = true
         end
      end
      if l_80_7 == false then
         BFLOG(SYSTRACE, "Crating an entity")
         local l_80_8 = resolveTable(l_80_3[l_80_4].value)
         crateEntity(l_80_8)
         return l_80_8:BFG_GET_ENTITY_ID()
      end
   end
end

cashCheat = function()
   giveCash(100000)
   return 1
end

testQuake = function()
   local l_82_0 = queryObject("UIRoot")
   if l_82_0 ~= nil then
      local l_82_1 = l_82_0:UI_GET_CHILD("EarthQuake")
      if l_82_1 ~= nil then
         l_82_1:UI_ACTIVATE_ON()
      end
   end
end

testFlash = function()
   local l_83_0 = queryObject("UIRoot")
   if l_83_0 ~= nil then
      local l_83_1 = l_83_0:UI_GET_CHILD("FlashEvent")
      if l_83_1 ~= nil then
         l_83_1:UI_ACTIVATE_ON()
      end
   end
end

countBreakableFences = function()
   local l_84_0 = 0
   local l_84_1 = findType("fence")
   for l_84_2 = 1, table.getn(l_84_1) do
      local l_84_5 = resolveTable(l_84_1[l_84_2].value)
      if l_84_5 and l_84_5:BFG_GET_BINDER_TYPE() == "zoowall" and l_84_5:BFG_GET_ATTR_STRING("s_Broken") then
         l_84_0 = l_84_0 + 1
      end
   end
   return l_84_0
end

countBrokenFences = function()
   local l_85_0 = 0
   local l_85_1 = findType("fence")
   for l_85_2 = 1, table.getn(l_85_1) do
      local l_85_5 = resolveTable(l_85_1[l_85_2].value)
      if l_85_5 and l_85_5:BFG_GET_BINDER_TYPE() ~= "zoowall" then
         local l_85_6 = l_85_5:BFG_GET_ATTR_FLOAT("f_FenceStrength")
         BFLOG("Strength: " .. l_85_6 .. ".")
         if l_85_6 == 0 then
            l_85_0 = l_85_0 + 1
         end
      end
   end
   return l_85_0
end

difTables = function(l_86_arg0, l_86_arg1)
   local l_86_2 = {}
   for l_86_3 = 1, table.getn(l_86_arg0) do
      local l_86_6 = false
      for l_86_7 = 1, table.getn(l_86_arg1) do
         if l_86_arg0[l_86_3] == l_86_arg1[l_86_7] then
            l_86_6 = true
         end
      end
      if l_86_6 == false then
         local l_86_7 = table.getn(l_86_2) + 1
         l_86_2[l_86_7] = l_86_arg0[l_86_3]
      end
   end
   return l_86_2
end

getZooName = function()
   local l_87_0 = ""
   local l_87_1 = queryObject("ZTStatus")
   if l_87_1 then
      l_87_0 = l_87_1:ZT_GET_ZOO_NAME()
   end
   BFLOG("Zoo name: " .. l_87_0)
   return l_87_0
end

resetScenarioRules = function()
   local l_88_0 = queryObject("BFScenarioMgr")
   if l_88_0 == nil then
      return 
   end
   l_88_0:BFS_RESET_RULE_STATES()
end

unionOfTables = function(l_89_arg0, l_89_arg1)
   local l_89_2 = l_89_arg0
   for l_89_3 = 1, table.getn(l_89_arg1) do
      local l_89_6 = false
      for l_89_7 = 1, table.getn(l_89_arg0) do
         if l_89_arg1[l_89_3] == l_89_arg0[l_89_7] then
            l_89_6 = true
         end
      end
      if l_89_6 == false then
         local l_89_7 = table.getn(l_89_2) + 1
         l_89_2[l_89_7] = l_89_arg1[l_89_3]
      end
   end
   return l_89_2
end

filterTable = function(l_90_arg0, l_90_arg1)
   local l_90_2 = {}
   for l_90_3 = 1, table.getn(l_90_arg0) do
      local l_90_6 = false
      for l_90_7 = 1, table.getn(l_90_arg1) do
         if l_90_arg1[l_90_7] == l_90_arg0[l_90_3] then
            l_90_6 = true
         end
      end
      if l_90_6 == false then
         local l_90_7 = table.getn(l_90_2) + 1
         l_90_2[l_90_7] = l_90_arg0[l_90_3]
      end
   end
   return l_90_2
end

getTotalUsersSkyStation = function(l_91_arg0)
   local l_91_1 = 0
   if l_91_arg0 then
      local l_91_2 = l_91_arg0:BFG_GET_COMPONENT("firstStation")
      if l_91_2 then
         local l_91_3 = l_91_2:ZT_GET_CIRCUIT()
         if l_91_3 then
            l_91_1 = l_91_1 + l_91_3:ZT_GET_NUM_PASSENGERS_ON_CIRCUIT()
         end
         local l_91_4 = l_91_2:ZT_GET_ECONOMY_COMPONENT()
         if l_91_4 then
            l_91_1 = l_91_1 + l_91_4:ZT_GET_LIFETIME_USERS()
         else
            BFLOG("getTotalUsersGroundStation : No firstStation found!")
         end
         -- Tried to add an 'end' here but it's incorrect
         local l_91_3 = l_91_arg0:BFG_GET_COMPONENT("returnStation")
         if l_91_3 then
            local l_91_4 = l_91_3:ZT_GET_CIRCUIT()
            if l_91_4 then
               l_91_1 = l_91_1 + l_91_4:ZT_GET_NUM_PASSENGERS_ON_CIRCUIT()
            end
            local l_91_5 = l_91_3:ZT_GET_ECONOMY_COMPONENT()
            if l_91_5 then
               l_91_1 = l_91_1 + l_91_5:ZT_GET_LIFETIME_USERS()
            end
         end
         -- Tried to add an 'end' here but it's incorrect
         return l_91_1
end

getTotalUsersGroundStation = function(l_92_arg0)
   local l_92_1 = 0
   if l_92_arg0 then
      local l_92_2 = l_92_arg0:BFG_GET_COMPONENT("ZTTransportStationGround")
      if l_92_2 then
         local l_92_3 = l_92_2:ZT_GET_CIRCUIT()
         if l_92_3 then
            l_92_1 = l_92_1 + l_92_3:ZT_GET_NUM_PASSENGERS_ON_CIRCUIT()
         end
         local l_92_4 = l_92_2:ZT_GET_ECONOMY_COMPONENT()
         if l_92_4 then
            l_92_1 = l_92_1 + l_92_4:ZT_GET_LIFETIME_USERS()
         else
            BFLOG("getTotalUsersGroundStation : No firstStation found!")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         return l_92_1
end

getLifetimeIncomeSkyStation = function(l_93_arg0)
   local l_93_1 = 0
   if l_93_arg0 then
      local l_93_2 = l_93_arg0:BFG_GET_COMPONENT("firstStation")
      if l_93_2 then
         local l_93_3 = l_93_2:ZT_GET_ECONOMY_COMPONENT()
         if l_93_3 then
            l_93_1 = l_93_1 + l_93_3:ZT_GET_LIFETIME_INCOME()
         else
            BFLOG("getTotalUsersGroundStation : No firstStation found!")
         end
         -- Tried to add an 'end' here but it's incorrect
         local l_93_3 = l_93_arg0:BFG_GET_COMPONENT("returnStation")
         if l_93_3 then
            local l_93_4 = l_93_3:ZT_GET_ECONOMY_COMPONENT()
            if l_93_4 then
               l_93_1 = l_93_1 + l_93_4:ZT_GET_LIFETIME_INCOME()
            end
         end
         -- Tried to add an 'end' here but it's incorrect
         return l_93_1
end

getLifetimeIncomeGroundStation = function(l_94_arg0)
   local l_94_1 = 0
   if l_94_arg0 then
      local l_94_2 = l_94_arg0:BFG_GET_COMPONENT("ZTTransportStationGround")
      if l_94_2 then
         local l_94_3 = l_94_2:ZT_GET_ECONOMY_COMPONENT()
         if l_94_3 then
            l_94_1 = l_94_1 + l_94_3:ZT_GET_LIFETIME_INCOME()
         else
            BFLOG("getLifetimeIncomeGroundStation : No ZTTransportStationGround found!")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         return l_94_1
end

getStarRatingSkyStation = function(l_95_arg0)
   local l_95_1 = 0
   if l_95_arg0 then
      local l_95_2 = l_95_arg0:BFG_GET_COMPONENT("firstStation")
      if l_95_2 then
         local l_95_3 = l_95_2:ZT_GET_TOUR_RECORDER()
         if l_95_3 then
            l_95_1 = l_95_3:ZT_GET_TOUR_STARRATING()
         else
            BFLOG("getTotalUsersGroundStation : No firstStation found!")
         end
         -- Tried to add an 'end' here but it's incorrect
         local l_95_3 = l_95_arg0:BFG_GET_COMPONENT("returnStation")
         if l_95_3 then
            local l_95_4 = l_95_3:ZT_GET_TOUR_RECORDER()
            if l_95_4 then
               local l_95_5 = l_95_4:ZT_GET_TOUR_STARRATING()
               if l_95_1 < l_95_5 then
                  l_95_1 = l_95_5
               end
            end
         end
         -- Tried to add an 'end' here but it's incorrect
         return l_95_1
end

getStarRatingGroundStation = function(l_96_arg0)
   local l_96_1 = 0
   if l_96_arg0 then
      local l_96_2 = l_96_arg0:BFG_GET_COMPONENT("ZTTransportStationGround")
      if l_96_2 then
         local l_96_3 = l_96_2:ZT_GET_TOUR_RECORDER()
         if l_96_3 then
            l_96_1 = l_96_3:ZT_GET_TOUR_STARRATING()
         else
            BFLOG("getLifetimeIncomeGroundStation : No ZTTransportStationGround found!")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         return l_96_1
end

totalUsersOfStation = function(l_97_arg0)
   local l_97_1 = 0
   local l_97_2 = findType(l_97_arg0)
   for l_97_3 = 1, table.getn(l_97_2) do
      local l_97_6 = resolveTable(l_97_2[l_97_3].value)
      if l_97_6 then
         if l_97_arg0 == "skystation" then
            l_97_1 = l_97_1 + getTotalUsersSkyStation(l_97_6)
         elseif l_97_arg0 == "groundstation" then
            l_97_1 = l_97_1 + getTotalUsersGroundStation(l_97_6)
         end
      end
   end
   return l_97_1
end

totalIncomeOfStation = function(l_98_arg0)
   local l_98_1 = 0
   local l_98_2 = findType(l_98_arg0)
   for l_98_3 = 1, table.getn(l_98_2) do
      local l_98_6 = resolveTable(l_98_2[l_98_3].value)
      if l_98_6 then
         if l_98_arg0 == "skystation" then
            l_98_1 = l_98_1 + getLifetimeIncomeSkyStation(l_98_6)
         elseif l_98_arg0 == "groundstation" then
            l_98_1 = l_98_1 + getLifetimeIncomeGroundStation(l_98_6)
         end
      end
   end
   return l_98_1
end

maxStationTypeStarRating = function(l_99_arg0)
   local l_99_1 = 0
   local l_99_2 = findType(l_99_arg0)
   for l_99_3 = 1, table.getn(l_99_2) do
      local l_99_6 = resolveTable(l_99_2[l_99_3].value)
      if l_99_6 then
         if l_99_arg0 == "skystation" then
            local l_99_7 = getStarRatingSkyStation(l_99_6)
            if l_99_1 < l_99_7 then
               l_99_1 = l_99_7
            elseif l_99_arg0 == "groundstation" then
               local l_99_7 = getStarRatingGroundStation(l_99_6)
               if l_99_1 < l_99_7 then
                  l_99_1 = l_99_7
               end
            end
            -- Tried to add an 'end' here but it's incorrect
            -- Tried to add an 'end' here but it's incorrect
         end
         return l_99_1
end

giveBalloons = function()
   local l_100_0 = queryObject("ZTWorldMgr")
   if l_100_0 then
      local l_100_1 = l_100_0:ZT_GET_BIRTH_GENDER()
      local l_100_2 = "Balloon_Bouquet_Both"
      if l_100_1 == "male" then
         l_100_2 = "Balloon_Bouquet_Boy"
      elseif l_100_1 == "female" then
         l_100_2 = "Balloon_Bouquet_Girl"
      end
      local l_100_3 = nil
      local l_100_4 = findType(l_100_2)
      placeObjectAtGateWithOffset(l_100_2, -10, 5)
      local l_100_5 = findType(l_100_2)
      for l_100_6 = 1, table.getn(l_100_5) do
         local l_100_9 = false
         for l_100_10 = 1, table.getn(l_100_4) do
            local l_100_13 = resolveTable(l_100_5[l_100_6].value)
            local l_100_14 = resolveTable(l_100_4[l_100_10].value)
            if areCompsEqual(l_100_13, l_100_14) == true then
               BFLOG(SYSTRACE, "comps are equal")
               l_100_9 = true
            end
         end
         if l_100_9 == false then
            l_100_3 = resolveTable(l_100_5[l_100_6].value)
      else
         end
      end
      local l_100_6 = getLocID("zoomessages:Balloons")
      local l_100_7 = l_100_0:ZT_GET_BIRTH_MOTHER_NAME()
      local l_100_8 = string.format(l_100_6, l_100_7)
      displayZooMessageTextWithZoom(l_100_8, 1, 30, l_100_3)
   end
end

checkTimeLimit = function(l_101_arg0, l_101_arg1, l_101_arg2)
   if l_101_arg0.timer == nil then
      BFLOG("Set Timer")
      l_101_arg0.timer = getCurrentMonth()
      l_101_arg0.timerday = getCurrentTimeOfDay()
   end
   local l_101_3 = getCurrentMonth()
   local l_101_4 = getCurrentTimeOfDay()
   local l_101_5 = l_101_arg0.timer + l_101_arg1
   if l_101_arg2 == nil then
      l_101_arg2 = 0
   end
   if (l_101_5 <= l_101_3 and l_101_arg0.timerday + l_101_arg2 * 0.03 <= l_101_4) or l_101_5 + l_101_arg1 + 1 <= l_101_3 then
      return -1
   end
   return 0
end

boostSpeciesAdoptionProbabiltiy = function(l_102_arg0)
   local l_102_1 = numSpeciesAvailable()
   if l_102_1 < 70 then
      doubleAdoptChance(l_102_arg0)
   elseif l_102_1 >= 70 and l_102_1 < 120 then
      doubleAdoptChance(l_102_arg0)
      doubleAdoptChance(l_102_arg0)
   elseif l_102_1 >= 120 then
      doubleAdoptChance(l_102_arg0)
      doubleAdoptChance(l_102_arg0)
      doubleAdoptChance(l_102_arg0)
      doubleAdoptChance(l_102_arg0)
   end
end

hasExpansionInstalled = function(l_103_arg0)
   local l_103_1 = queryObject("ZTStatus")
   if l_103_1 then
      local l_103_2 = l_103_1:ZT_HAS_XPACK(l_103_arg0)
      if l_103_2 then
         BFLOG(SYSTRACE, "Player has " .. l_103_arg0 .. " installed")
         return true
      else
         BFLOG(SYSTRACE, "Player doesn't have " .. l_103_arg0 .. " installed")
         return false
      end
   end
end

instantWin = function()
   local l_104_0 = queryObject("BFScenarioMgr")
   if l_104_0 ~= nil then
      local l_104_1 = l_104_0:BFS_GET_RULE_NAMES()
      if l_104_1 ~= nil then
         BFLOG("size of rule names = " .. table.getn(l_104_1))
         for l_104_2 = 1, table.getn(l_104_1) do
            local l_104_5 = l_104_1[l_104_2].value
            if l_104_5 ~= "decidechallengeset" then
               BFLOG("setting rule completed: " .. l_104_5)
               local l_104_6
               l_104_0:BFS_SETRULESTATE(l_104_6)
               l_104_6 = {_type = "BFScenarioAltTextData", rulename = l_104_5, rulestate = "success", ruletext = ""}
            end
         end
         showprimarygoals()
      else
         BFLOG("ruleNames is nil")
      end
   else
      BFLOG("Failed to get Manager")
   end
   -- Tried to add an 'end' here but it's incorrect
end


