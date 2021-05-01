include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
powersurgeCHALLENGE_NAME = "powersurge"
CHALLENGE_REWARD = 5000
validate = function()
   if isChalDeclinedForever(powersurgeCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", powersurgeCHALLENGE_NAME)
   local l_1_0 = getglobalvar(powersurgeCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Water_Filter") >= 1 and howMuchCash() >= 3000 and getHalfStars() >= 3 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, powersurgeCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/powersurge.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(powersurgeCHALLENGE_NAME, "skipped")
               end
               startFlash()
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

breakWaterFilters = function()
   local l_2_0 = findType("Water_Filter")
   local l_2_1 = table.getn(l_2_0)
   if l_2_0 ~= nil then
      for l_2_2 = 1, l_2_1 do
         local l_2_5 = resolveTable(l_2_0[l_2_2].value)
         if l_2_5 then
            pos = l_2_5:BFG_GET_ENTITY_POSITION()
            local l_2_6 = l_2_5:BFG_GET_ENTITY_FACING_DIRECTION()
            angle = math.atan2(l_2_6.y, l_2_6.x)
            deleteEntity(l_2_5)
            angle = math.deg(angle) + 90
            BFLOG(SYSNOTE, "Filter Position: " .. pos.x .. "," .. pos.y .. " Angle " .. angle)
            placeObject("Water_Filter_Busted", pos.x, pos.y, angle)
         end
      end
   end
   return l_2_1
end

evalpowersurge = function(l_3_arg0)
   path = getglobalvar("path")
   if path == "PathA" and l_3_arg0.accept == nil then
      l_3_arg0.path = "PathA"
      local l_3_1 = queryObject("BFScenarioMgr")
      if l_3_1 then
         l_3_1:BFS_SHOWRULE(powersurgeCHALLENGE_NAME)
      end
      logDebugChallengeInfo(powersurgeCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_3_arg0.accept = 1
      showprimarygoals()
   elseif path == "PathB" then
      l_3_arg0.path = "PathB"
      return 1
   end
   if path == nil then
      stopFlash()
      local l_3_1 = breakWaterFilters()
      BFLOG("filter count " .. l_3_1)
      setglobalvar("numfilters", tostring(l_3_1))
      showbranchpanel("Challengetext:CHPowerSurge", "Challengetext:CHPowerSurgeWait", "Challengetext:CHPowerSurgeBuyFilters")
      setglobalvar("challenge", "waiting")
   end
   if l_3_arg0.accept ~= nil then
      if checkTimeLimit(l_3_arg0, 2, 0) == -1 then
         local l_3_1 = queryObject("BFScenarioMgr")
         if l_3_1 then
            l_3_1:UI_ENABLE("Water_Filter")
         end
         return 1
      else
         setglobalvar("WaterFilter", "true")
      end
      return 0
   end
end

completepowersurge = function(l_4_arg0)
   setglobalvar("WaterFilter", "false")
   local l_4_1 = getglobalvar("path")
   local l_4_2 = tonumber(getglobalvar("numfilters"))
   BFLOG("numfilters = " .. l_4_2)
   if l_4_1 == "PathA" then
      showchallengewin("Challengetext:CHPowerSurgeSuccess")
      for l_4_3 = 1, l_4_2 do
         placeCratedWaterAdjacentObjectAtGate("Water_Filter")
      end
      giveCash(CHALLENGE_REWARD)
   end
   resetchallengeoverandcomplete(powersurgeCHALLENGE_NAME)
   incrementglobalchallenges()
end


