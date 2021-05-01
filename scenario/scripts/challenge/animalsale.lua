include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
animalsaleCHALLENGE_NAME = "animalsale"
validate = function()
   if isChalDeclinedForever(animalsaleCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", animalsaleCHALLENGE_NAME)
   local l_1_0 = getglobalvar(animalsaleCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(animalsaleCHALLENGE_NAME .. "canrepeat", "true")
      do
         if countType("animal") >= 5 then
            local l_1_1 = queryObject("BFScenarioMgr")
            if l_1_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, animalsaleCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/animalsale.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(animalsaleCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalanimalsale = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(animalsaleCHALLENGE_NAME)
      end
      logDebugChallengeInfo(animalsaleCHALLENGE_NAME, "accepted")
      setchallengeactive()
      deleteEntity(l_2_arg0.theanimal)
      giveCash(l_2_arg0.theprice)
      g_theprice = l_2_arg0.theprice
      g_animalname = l_2_arg0.animalname
      return 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(animalsaleCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(animalsaleCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(animalsaleCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = findType("animal")
      if l_2_1 == nil then
         return -1
      end
      local l_2_2 = table.getn(l_2_1)
      local l_2_3 = math.random(l_2_2)
      l_2_arg0.theanimal = resolveTable(l_2_1[l_2_3].value)
      local l_2_4 = getCostByBinder(getSpeciesName(l_2_arg0.theanimal) .. "_Adult_F")
      BFLOG("HERE: " .. l_2_4)
      l_2_arg0.theprice = math.random(l_2_4 * 0.8, l_2_4 + l_2_4 * 0.4)
      l_2_arg0.animalname = l_2_arg0.theanimal:BFG_GET_ATTR_STRING("s_name")
      local l_2_5 = queryObject("BFScenarioMgr")
      local l_2_6 = ""
      if l_2_5 then
         l_2_6 = l_2_5:BFS_LOCALIZEFLOAT(l_2_arg0.theprice)
      end
      local l_2_7 = getLocID("Challengetext:CHAnimalSale")
      local l_2_8 = string.format(l_2_7, l_2_arg0.animalname, l_2_6)
      showchallengepaneltext(l_2_8)
      setglobalvar("challenge", "waiting")
   end
end

completeanimalsale = function(l_3_arg0)
   resetchallengeoverandcomplete(animalsaleCHALLENGE_NAME)
   local l_3_1 = queryObject("BFScenarioMgr")
   local l_3_2 = ""
   if l_3_1 then
      l_3_2 = l_3_1:BFS_LOCALIZEFLOAT(g_theprice)
   end
   local l_3_3 = getLocID("Challengetext:CHAnimalSaleSuccess")
   local l_3_4 = string.format(l_3_3, g_animalname, l_3_2)
   setAltOverviewText("animalsale", "success", l_3_4)
   l_3_3 = getLocID("Challengetext:CHAnimalSaleSuccessShort")
   l_3_4 = string.format(l_3_3, l_3_2)
   setAltText("animalsale", "success", l_3_4)
   showchallengewintext(l_3_4)
   incrementglobalchallenges()
end

failanimalsale = function(l_4_arg0)
   resetchallengeover(animalsaleCHALLENGE_NAME)
end


