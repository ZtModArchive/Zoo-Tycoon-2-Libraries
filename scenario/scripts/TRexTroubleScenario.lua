include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/token.lua")
include("scenario/scripts/photoutil.lua")
local l_0_0 = {"Ankylosaurus", "Carnotaurus", "Deinonychus", "Deinosuchus", "Dimetrodon", "Kentrosaurus", "Protarchaeopteryx", "Stegosaurus", "Stokesosaurus", "Styracosaurus", "Triceratops", "TyrannosaurusRex", "Utahraptor", "Velociraptor"}
TRexTroubleDinoList = l_0_0
l_0_0 = function(l_1_arg0)
   BFLOG(SYSTRACE, "**************** set intial zoo state ****************")
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

setinitialzoostate = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** eval 4 stars ****************")
   if getHalfStars() >= 8 then
      return 1
   end
   return 0
end

evalFame40 = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete 4 stars ****************")
   showRule("GetFirstDino")
   showRule("DinoPhotos")
   giveCash(20000)
   completeshowoverview()
   return 1
end

completeFame40 = l_0_0
l_0_0 = function()
   local l_4_0 = {}
   for l_4_1 = 1, table.getn(TRexTroubleDinoList) do
      local l_4_4 = TRexTroubleDinoList[l_4_1]
      if l_4_4 ~= nil then
         BFLOG(SYSTRACE, "**************** Species name = " .. l_4_4)
         local l_4_5 = countType(l_4_4)
         if l_4_5 ~= nil and l_4_5 > 0 then
            BFLOG(SYSTRACE, "**************** added to list  ****************")
            l_4_0[table.getn(l_4_0) + 1] = l_4_4
         end
      end
   end
   return l_4_0
end

getDinoList = l_0_0
l_0_0 = function()
   local l_5_0 = {}
   for l_5_1 = 1, table.getn(TRexTroubleDinoList) do
      local l_5_4 = findType(TRexTroubleDinoList[l_5_1])
      for l_5_5 = 1, table.getn(l_5_4) do
         local l_5_8 = resolveTable(l_5_4[l_5_5].value)
         if l_5_8 ~= nil then
            l_5_0[table.getn(l_5_0) + 1] = l_5_8
         end
      end
   end
   return l_5_0
end

getDinoEntityList = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** eval Get Dino ****************")
   local l_6_0 = getDinoEntityList()
   BFLOG(SYSTRACE, "**************** Size of dino list = " .. table.getn(l_6_0))
   local l_6_1 = 0
   for l_6_2 = 1, table.getn(l_6_0) do
      local l_6_5 = l_6_0[l_6_2]
      if isCratedEntity(l_6_5) == false and basicNeedsMeetThreshold(l_6_5, 60) then
         l_6_1 = l_6_1 + 1
      end
   end
   if l_6_1 >= 1 then
      return 1
   end
   return 0
end

evalAcquireDino = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete Get Dino ****************")
   showRule("BuildDRT")
   giveCash(10000)
   completeshowoverview()
   return 1
end

completeAcquireDino = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** eval Build DRT ****************")
   if countType("DinoRecoveryBuilding") >= 1 then
      return 1
   end
   return 0
end

evalBuildDRT = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete Build DRT ****************")
   showRule("Get4Dinos")
   giveCash(5000)
   completeshowoverview()
   return 1
end

completeBuildDRT = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** eval Get 4 Dinos ****************")
   local l_10_0 = getDinoEntityList()
   BFLOG(SYSTRACE, "**************** Size of dino list = " .. table.getn(l_10_0))
   local l_10_1 = 0
   for l_10_2 = 1, table.getn(l_10_0) do
      local l_10_5 = l_10_0[l_10_2]
      if isCratedEntity(l_10_5) == false and basicNeedsMeetThreshold(l_10_5, 70) then
         l_10_1 = l_10_1 + 1
      end
   end
   local l_10_2 = getDinoList()
   if l_10_1 >= 4 and l_10_2 ~= nil and table.getn(l_10_2) >= 4 then
      return 1
   end
   return 0
end

evalAcquire4Dinos = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete Get 4 Dinos ****************")
   showRule("5StarZoo")
   giveCash(20000)
   completeshowoverview()
   return 1
end

completeAcquire4Dinos = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** eval 5 stars ****************")
   if getHalfStars() >= 10 then
      return 1
   end
   return 0
end

evalFame50 = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** cause rampage ****************")
   local l_13_0 = queryObject("BFGRampageMgr")
   if l_13_0 then
      local l_13_1 = getDinoEntityList()
      for l_13_2 = 1, table.getn(l_13_1) do
         local l_13_5 = l_13_1[l_13_2]
         local l_13_6 = isCratedEntity(l_13_5)
         if l_13_6 == false then
            BFLOG(SYSTRACE, "**************** force rampage ****************")
            l_13_0:BFG_FORCE_RAMPAGE(l_13_5)
         end
      end
   else
      BFLOG(SYSTRACE, "**************** rampageMgr nil ****************")
   end
end

causeRampage = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete 5 stars ****************")
   showRule("StopRampage")
   giveCash(75000)
   completeshowoverview()
   causeRampage()
   return 1
end

completeFame50 = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** eval rampage ****************")
   local l_15_0 = getExtinctEntityList()
   for l_15_1 = 1, table.getn(l_15_0) do
      local l_15_4 = resolveTable(l_15_0[l_15_1].value)
      if l_15_4 then
         local l_15_5 = l_15_4:BFG_GET_ATTR_BOOLEAN("b_Rampage")
         if l_15_5 and l_15_5 == true then
            return 0
         else
            BFLOG("single is nil")
         end
         -- Tried to add an 'end' here but it's incorrect
      end
      return 1
end

evalStopRampage = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete rampage ****************")
   showRule("GetTRex")
   completeshowoverview()
   return 1
end

completeStopRampage = l_0_0
l_0_0 = function(l_17_arg0)
   local l_17_1 = findType("TyrannosaurusRex")
   local l_17_2 = table.getn(l_17_1)
   if l_17_2 < 1 then
      return 0
   end
   for l_17_3 = 1, l_17_2 do
      local l_17_6 = resolveTable(l_17_1[l_17_3].value)
      if basicNeedsMetAlternate(l_17_6) then
         return 1
      end
   end
   return 0
end

evalAcquireTRex = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete release TRex ****************")
   showRule("ReleaseTRex")
   completeshowoverview()
end

completeAcquireTRex = l_0_0
l_0_0 = function(l_19_arg0)
   BFLOG(SYSTRACE, "**************** eval release TRex ****************")
   local l_19_1 = getLastSpeciesReleased()
   if l_19_1 ~= nil then
      BFLOG(SYSTRACE, "**************** last species released = " .. l_19_1)
      if l_19_1 == "TyrannosaurusRex" then
         return 1
      end
   end
   return 0
end

evalReleaseTRex = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete scenario ****************")
   setuservar("cp2scen6", "completed")
   setuservar("brachiosaurus_slide_lock", "true")
   giveCash(50000)
   showscenariowin("DinoCampaign:TroubleFinishReleaseTrex", nil)
   return 1
end

completeReleaseTRex = l_0_0
l_0_0 = function(l_21_arg0)
   BFLOG(SYSTRACE, "**************** eval photo set 1 ****************")
   if l_21_arg0.secretary1PhotoChallengeStarted == nil then
      local l_21_1 = queryObject("ZTPhotoChallengesComponent")
      if l_21_1 then
         l_21_1:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("TRexTroubleScenarioPhoto")
      end
      local l_21_2 = queryObject("BFScenarioMgr")
      if l_21_2 then
         l_21_2:UI_ENABLE("photo challenges layout")
         l_21_2:UI_DISABLE("photo challenges")
      end
      l_21_arg0.secretary1PhotoChallengeStarted = true
   end
   local l_21_1 = queryObject("ZTPhotoChallengesComponent")
   if l_21_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
      return 1
   end
   return 0
end

evalDinoPhotos = l_0_0
l_0_0 = function()
   BFLOG(SYSTRACE, "**************** complete photo goal ****************")
   giveCash(15000)
   showprimarygoals()
end

completeDinoPhotos = l_0_0
l_0_0 = function(l_23_arg0)
   local l_23_1 = {"Eat"}
   local l_23_2 = getDinoList()
   for l_23_3 = 1, table.getn(l_23_2) do
      local l_23_6 = l_23_2[l_23_3]
      if scoreAnyDoingTaskInList(l_23_arg0, l_23_6, l_23_1) >= 1 then
         return 1
      end
   end
   return 0
end

scoreDinoEating = l_0_0
l_0_0 = function(l_24_arg0)
   local l_24_1 = {"PlayBasic", "PlayMedium", "PlayAdvanced", "PlayElite"}
   local l_24_2 = getDinoList()
   for l_24_3 = 1, table.getn(l_24_2) do
      local l_24_6 = l_24_2[l_24_3]
      if scoreAnyEntityTypeDoingTaskWithTarget(l_24_arg0, l_24_6, l_24_1, "DinoPreyDummy") >= 1 then
         return 1
      end
   end
end

scoreDinoWithDummy = l_0_0
l_0_0 = function(l_25_arg0)
   local l_25_1 = {"Sleep", "Rest"}
   local l_25_2 = getDinoList()
   for l_25_3 = 1, table.getn(l_25_2) do
      local l_25_6 = l_25_2[l_25_3]
      if scoreAnyDoingTaskInList(l_25_arg0, l_25_6, l_25_1) >= 1 then
         return 1
      end
   end
   return 0
end

scoreDinoSleeping = l_0_0

