include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/photoutil.lua")
SCENARIO_ANIMAL_1 = "WalrusPacific_Adult"
SCENARIO_ANIMAL_2 = "DolphinBottlenose_Adult"
SCENARIO_ANIMAL_3 = "SeaLionCalifornia_Adult"
SCENARIO_ANIMAL_4 = "WhaleOrca_Adult"
GUEST_GOAL = 80
GUEST_REWARD = 10000
setinitialzoostate = function(l_1_arg0)
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   completeshowoverview()
   return 1
end

evalMarineShowPhotos1 = function(l_2_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 1 ****************")
   if l_2_arg0.secretary1PhotoChallengeStarted == nil then
      local l_2_1 = queryObject("ZTPhotoChallengesComponent")
      if l_2_1 then
         l_2_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("marineshowpart1")
      end
      local l_2_2 = queryObject("BFScenarioMgr")
      if l_2_2 then
         l_2_2:UI_DISABLE("photo challenges")
      end
      l_2_arg0.secretary1PhotoChallengeStarted = true
   end
   local l_2_1 = queryObject("ZTPhotoChallengesComponent")
   if l_2_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completeMarineShowPhotos1 = function()
   BFLOG(SYSTRACE, "**************** complete photo set 1 ****************")
   showRule("MarineShowPhotoSet2")
   completeshowoverview()
end

scoreWalrusBellow = function(l_4_arg0)
   local l_4_1 = {"Bellow"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_4_arg0, SCENARIO_ANIMAL_1, l_4_1) >= 1 then
      return 1
   end
   return 0
end

scoreWalrusJump = function(l_5_arg0)
   local l_5_1 = {"JumpSuccess", "JumpFailure", "JumpSuperSuccess"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_5_arg0, SCENARIO_ANIMAL_1, l_5_1) >= 1 then
      return 1
   end
   return 0
end

evalMarineShowPhotos2 = function(l_6_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 2 ****************")
   if l_6_arg0.secretary2PhotoChallengeStarted == nil then
      local l_6_1 = queryObject("ZTPhotoChallengesComponent")
      if l_6_1 then
         l_6_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("marineshowpart2")
      end
      local l_6_2 = queryObject("BFScenarioMgr")
      if l_6_2 then
         l_6_2:UI_DISABLE("photo challenges")
      end
      l_6_arg0.secretary2PhotoChallengeStarted = true
   end
   local l_6_1 = queryObject("ZTPhotoChallengesComponent")
   if l_6_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completeMarineShowPhotos2 = function()
   BFLOG(SYSTRACE, "**************** complete photo set 2 ****************")
   showRule("MarineShowPhotoSet3")
   completeshowoverview()
end

scoreDolphinCorkscrew = function(l_8_arg0)
   local l_8_1 = {"CorkscrewTwist"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_8_arg0, SCENARIO_ANIMAL_2, l_8_1) >= 1 then
      return 1
   end
   return 0
end

scoreDolphinHoopJump = function(l_9_arg0)
   if scoreAnyEntityTypeDoingTarget(l_9_arg0, SCENARIO_ANIMAL_2, "Hoop_mm") >= 1 then
      return 1
   end
   return 0
end

evalGuest = function()
   BFLOG(SYSTRACE, "**************** eval guest goal ****************")
   if GUEST_GOAL <= getNumGuests(-1) then
      return 1
   end
   return 0
end

completeGuest = function()
   BFLOG(SYSTRACE, "**************** complete guest goal ****************")
   giveCash(GUEST_REWARD)
   showprimarygoals()
end

evalMarineShowPhotos3 = function(l_12_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 3 ****************")
   if l_12_arg0.secretary3PhotoChallengeStarted == nil then
      local l_12_1 = queryObject("ZTPhotoChallengesComponent")
      if l_12_1 then
         l_12_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("marineshowpart3")
      end
      local l_12_2 = queryObject("BFScenarioMgr")
      if l_12_2 then
         l_12_2:UI_DISABLE("photo challenges")
      end
      l_12_arg0.secretary3PhotoChallengeStarted = true
   end
   local l_12_1 = queryObject("ZTPhotoChallengesComponent")
   if l_12_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completeMarineShowPhotos3 = function(l_13_arg0)
   BFLOG(SYSTRACE, "**************** complete photo set 3 ****************")
   showRule("MarineShowPhotoSet4")
   completeshowoverview()
end

scoreSeaLionSlide = function(l_14_arg0)
   if scoreAnyEntityTypeDoingTarget(l_14_arg0, SCENARIO_ANIMAL_3, "SealSlide") >= 1 or scoreAnyEntityTypeDoingTarget(l_14_arg0, SCENARIO_ANIMAL_3, "SealSlide_Male") >= 1 then
      return 1
   end
   return 0
end

scoreSeaLionHorn = function(l_15_arg0)
   if scoreAnyEntityTypeDoingTarget(l_15_arg0, SCENARIO_ANIMAL_3, "Horns_mm") >= 1 or scoreAnyEntityTypeDoingTarget(l_15_arg0, SCENARIO_ANIMAL_3, "Horns_mm_Male") >= 1 then
      return 1
   end
   return 0
end

evalMarineShowPhotos4 = function(l_16_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 4 ****************")
   if l_16_arg0.secretary3PhotoChallengeStarted == nil then
      local l_16_1 = queryObject("ZTPhotoChallengesComponent")
      if l_16_1 then
         l_16_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("marineshowpart4")
      end
      local l_16_2 = queryObject("BFScenarioMgr")
      if l_16_2 then
         l_16_2:UI_DISABLE("photo challenges")
      end
      l_16_arg0.secretary3PhotoChallengeStarted = true
   end
   local l_16_1 = queryObject("ZTPhotoChallengesComponent")
   if l_16_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

completeMarineShowPhotos4 = function(l_17_arg0)
   BFLOG(SYSTRACE, "**************** complete photo set 4 ****************")
   completeshowoverview()
end

scoreOrcaJumpBar = function(l_18_arg0)
   local l_18_1 = {"Jump"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_18_arg0, SCENARIO_ANIMAL_4, l_18_1) >= 1 then
      return 1
   end
   return 0
end

scoreOrcaSpyHopping = function(l_19_arg0)
   local l_19_1 = {"Spyhop"}
   if scoreAnyEntityTypeDoingMatchingAnimInList(l_19_arg0, SCENARIO_ANIMAL_4, l_19_1) >= 1 then
      return 1
   end
   return 0
end

completeMarineShowScenario = function(l_20_arg0)
   local l_20_1 = getuservar("MarineShowsCampaignscenario1")
   if l_20_1 ~= "completed" then
      setuservar("MarineShowsCampaignscenario4", "unlocked")
   end
   setuservar("MarineShowsCampaignscenario1", "completed")
   showscenariowin("MarineShowsCampaign:MarineShowPhotographerSuccessOverview", "MarineShowsCampaignscenario4")
end


