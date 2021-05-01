include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/token.lua")
include("scenario/scripts/fossil.lua")
setinitialzoostate = function(l_1_arg0)
   setglobalvar("cp2scen5_numAnimals", "0")
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   if disableAdoptionHardWay == nil then
      BFLOG(SYSNOTE, "______________DISABLING THE ADOPTION TAB_________________")
      disableAnimalAdoption()
      disableAdoptionHardWay = 1
   end
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalBuildLab = function()
   BFLOG(SYSTRACE, "**************** eval Build lab ****************")
   if countType("CloningCenter") >= 1 then
      return 1
   end
   return 0
end

completeBuildLab = function()
   BFLOG(SYSTRACE, "**************** complete Build lab ****************")
   showRule("CollectFossils")
   completeshowoverview()
   return 1
end

evalCollectFossils = function()
   BFLOG(SYSTRACE, "**************** eval collect fossils ****************")
   local l_4_0 = getNumPuzzlesReady()
   BFLOG(SYSTRACE, "**************** num Puzzles ready = " .. l_4_0)
   if l_4_0 >= 1 then
      return 1
   end
   return 0
end

completeCollectFossils = function()
   BFLOG(SYSTRACE, "**************** complete collect fossils ****************")
   showRule("BuildFossil")
   completeshowoverview()
   return 1
end

evalBuildFossil = function()
   BFLOG(SYSTRACE, "**************** eval build fossil ****************")
   local l_6_0 = getNumPuzzlesComplete()
   BFLOG(SYSTRACE, "**************** num puzzles complete = " .. l_6_0)
   if l_6_0 >= 1 then
      return 1
   end
   return 0
end

completeBuildFossil = function()
   BFLOG(SYSTRACE, "**************** complete build fossil ****************")
   showRule("CreateFossil")
   setglobalvar("BUILD_PUZZLE_GOAL_DONE", "true")
   completeshowoverview()
   return 1
end

evalCreateFossil = function()
   BFLOG(SYSTRACE, "**************** eval create fossil ****************")
   if numAnimalsCreatedAtLab() >= 1 then
      return 1
   end
   return 0
end

completeCreateFossil = function()
   BFLOG(SYSTRACE, "**************** complete create fossil *************waaaa***")
   showRule("Create4Fossil")
   showRule("SkeletonPhoto")
   completeshowoverview()
   disableAllAdoptButtons()
   return 1
end

evalCreate4Fossil = function()
   BFLOG(SYSTRACE, "**************** eval create 4 fossils ****************")
   local l_10_0 = getExtinctSpeciesList()
   local l_10_1 = table.getn(l_10_0)
   if l_10_1 >= 4 then
      local l_10_2 = findTypeDirect("animal")
      local l_10_3 = 0
      for l_10_4 = 1, table.getn(l_10_2) do
         local l_10_7 = resolveTable(l_10_2[l_10_4].value)
         if l_10_7 ~= nil and isCratedEntity(l_10_7) == false and isExtinctAnimal(l_10_7) and basicNeedsMeetThreshold(l_10_7, 60) then
            l_10_3 = l_10_3 + 1
         end
      end
      if l_10_3 >= 4 then
         return 1
      end
   end
   return 0
end

completeCreate4Fossil = function()
   BFLOG(SYSTRACE, "**************** complete create 4 fossils ****************")
   giveCash(20000)
   showRule("Create8Fossil")
   completeshowoverview()
   return 1
end

evalCreate8Fossil = function()
   BFLOG(SYSTRACE, "**************** eval create 8 fossils ****************")
   local l_12_0 = getExtinctSpeciesList()
   local l_12_1 = table.getn(l_12_0)
   if l_12_1 >= 8 then
      local l_12_2 = findTypeDirect("animal")
      local l_12_3 = 0
      for l_12_4 = 1, table.getn(l_12_2) do
         local l_12_7 = resolveTable(l_12_2[l_12_4].value)
         if l_12_7 ~= nil and isCratedEntity(l_12_7) == false and isExtinctAnimal(l_12_7) and basicNeedsMeetThreshold(l_12_7, 70) then
            l_12_3 = l_12_3 + 1
         end
      end
      if l_12_3 >= 4 then
         return 1
      end
   end
   return 0
end

completeCreate8Fossil = function()
   BFLOG(SYSTRACE, "**************** complete create 8 fossils ****************")
   showRule("4StarZoo")
   completeshowoverview()
   return 1
end

evalFame30 = function()
   BFLOG(SYSTRACE, "**************** eval 3 stars ****************")
   local l_14_0 = getHalfStars()
   if l_14_0 >= 6 then
      showRule("3StarZoo")
      return 1
   end
   return 0
end

completeFame30 = function()
   BFLOG(SYSTRACE, "**************** complete 3 stars ****************")
   giveCash(20000)
   completeshowoverview()
   return 1
end

evalFame40 = function()
   BFLOG(SYSTRACE, "**************** eval 4 stars ****************")
   if getHalfStars() >= 8 then
      return 1
   end
   return 0
end

completeFame40 = function()
   BFLOG(SYSTRACE, "**************** complete scenario ****************")
   enableAnimalAdoption()
   setuservar("cp2scen5", "completed")
   local l_17_0 = getuservar("cp2scen4")
   if l_17_0 ~= "completed" then
      setuservar("cp2scen4", "unlocked")
   end
   giveCash(50000)
   showscenariowin("DinoCampaign:HardWayFinishFourStars", "cp2scen4")
   return 1
end

hasAnimalDied = function()
   if disableAdoptionHardWay == nil then
      BFLOG(SYSNOTE, "______________DISABLING THE ADOPTION TAB_________________")
      disableAnimalAdoption()
      disableAdoptionHardWay = 1
   end
   BFLOG(SYSTRACE, "**************** has animal died ****************")
   local l_18_0 = {}
   local l_18_1 = 0
   local l_18_2 = queryObject("ZTStatus")
   if l_18_2 then
      l_18_0 = l_18_2:ZT_GET_ALL_ANIMALS_RELEASED()
      if l_18_0 ~= nil then
         l_18_1 = table.getn(l_18_0)
      end
   end
   local l_18_3 = howManyAnimalsInZoo()
   local l_18_4 = tonumber(getglobalvar("cp2scen5_numAnimals"))
   if l_18_3 < l_18_4 - l_18_1 then
      showscenariofail("DinoCampaign:HardWayAnimalDeathFail", "cp2scen5")
   else
      setglobalvar("cp2scen5_numAnimals", tostring(l_18_3))
   end
end

eval4SkeletonPhoto = function(l_19_arg0)
   local l_19_1 = getglobalvar("BUILD_PUZZLE_GOAL_DONE")
   if l_19_1 == "true" then
      BFLOG(SYSTRACE, "**************** eval photo set 1 ****************")
      if l_19_arg0.secretary1PhotoChallengeStarted == nil then
         local l_19_2 = queryObject("ZTPhotoChallengesComponent")
         if l_19_2 then
            l_19_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("TheHardWayScenarioPhoto")
         end
         local l_19_3 = queryObject("BFScenarioMgr")
         if l_19_3 then
            l_19_3:UI_ENABLE("photo challenges layout")
            l_19_3:UI_DISABLE("photo challenges")
         end
         l_19_arg0.secretary1PhotoChallengeStarted = true
      end
      local l_19_2 = queryObject("ZTPhotoChallengesComponent")
      if l_19_2:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
         return 1
      end
   end
   return 0
end

complete4SkeletonPhoto = function()
   BFLOG(SYSTRACE, "**************** complete photo goal ****************")
   giveCash(20000)
   showprimarygoals()
end

scoreCompletedSkeletonMammoth = function(l_21_arg0)
   local l_21_1 = l_21_arg0:getFirstInterestingEntity()
   while l_21_1 do
      if l_21_1:isKindOf("Statue_Mammoth") then
         return 1
      end
      if l_21_1:isKindOf("FossilEducationCenter") then
         local l_21_2 = l_21_1:getEDI()
         if l_21_2 then
            local l_21_3 = l_21_2:getVar("f_BoneLevel")
            if tonumber(l_21_3) == 9 then
               return 1
            end
         end
      end
      l_21_1 = l_21_arg0:getNextInterestingEntity()
   end
   return 0
end

scoreCompletedSkeletonIrishElk = function(l_22_arg0)
   local l_22_1 = l_22_arg0:getFirstInterestingEntity()
   while l_22_1 do
      if l_22_1:isKindOf("Statue_IrishElk") then
         return 1
      end
      if l_22_1:isKindOf("FossilEducationCenter") then
         local l_22_2 = l_22_1:getEDI()
         if l_22_2 then
            local l_22_3 = l_22_2:getVar("f_BoneLevel")
            if tonumber(l_22_3) == 19 then
               return 1
            end
         end
      end
      l_22_1 = l_22_arg0:getNextInterestingEntity()
   end
   return 0
end

scoreCompletedSkeletonTyrannosaurusRex = function(l_23_arg0)
   local l_23_1 = l_23_arg0:getFirstInterestingEntity()
   while l_23_1 do
      if l_23_1:isKindOf("Statue_TyrannosaurusRex") then
         return 1
      end
      if l_23_1:isKindOf("FossilEducationCenter") then
         local l_23_2 = l_23_1:getEDI()
         if l_23_2 then
            local l_23_3 = l_23_2:getVar("f_BoneLevel")
            if tonumber(l_23_3) == 29 then
               return 1
            end
         end
      end
      l_23_1 = l_23_arg0:getNextInterestingEntity()
   end
   return 0
end

scoreCompletedSkeletonPteranodon = function(l_24_arg0)
   local l_24_1 = l_24_arg0:getFirstInterestingEntity()
   while l_24_1 do
      if l_24_1:isKindOf("Statue_Pteranodon") then
         return 1
      end
      if l_24_1:isKindOf("FossilEducationCenter") then
         local l_24_2 = l_24_1:getEDI()
         if l_24_2 then
            local l_24_3 = l_24_2:getVar("f_BoneLevel")
            if tonumber(l_24_3) == 39 then
               return 1
            end
         end
      end
      l_24_1 = l_24_arg0:getNextInterestingEntity()
   end
   return 0
end

numAnimalsCreatedAtLab = function()
   local l_25_0 = getExtinctSpeciesList()
   local l_25_1 = 0
   for l_25_2 = 1, table.getn(l_25_0) do
      if hasSpeciesBeenUnlockedAtResearchLab(l_25_0[l_25_2]) then
         l_25_1 = l_25_1 + 1
      end
   end
   return l_25_1
end


