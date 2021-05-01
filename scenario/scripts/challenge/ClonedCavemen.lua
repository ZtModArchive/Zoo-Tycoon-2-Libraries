include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
validate = function()
   if isChalDeclinedForever("clonedcavemen") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "clonedcavemen")
   local l_1_0 = getglobalvar("clonedcavemen_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Glacier") >= 1 and getHalfStars() >= 6 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, "clonedcavemen")
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/clonedcavemen.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo("clonedcavemen", "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalClonedCavemen = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if l_2_arg0.accept == nil and challenge == nil then
      setglobalvar("challenge", "accept")
      local l_2_1 = findType("Guest")
      local l_2_2 = {}
      l_2_2[1] = getLocID("Challengetext:Caveman1")
      l_2_2[2] = getLocID("Challengetext:Caveman2")
      l_2_2[3] = getLocID("Challengetext:Caveman3")
      l_2_2[4] = getLocID("Challengetext:Caveman4")
      l_2_2[5] = getLocID("Challengetext:Caveman5")
      if l_2_1 == nil or table.getn(l_2_1) < 5 then
         BFLOG(SYSERROR, "Guest table is nil or too few guests")
         return -1
      end
      for l_2_3 = 1, 5 do
         local l_2_6 = math.random(table.getn(l_2_1))
         local l_2_7 = resolveTable(l_2_1[l_2_6].value)
         if l_2_7 ~= nil then
            pos = l_2_7:BFG_GET_ENTITY_POSITION()
            local l_2_8 = l_2_7:BFG_GET_ENTITY_FACING_DIRECTION()
            local l_2_9 = math.atan2(l_2_8.y, l_2_8.x)
            l_2_9 = math.deg(l_2_9) + 90
            BFLOG(SYSNOTE, "Caveman position: " .. pos.x .. "," .. pos.y .. " Angle " .. l_2_9)
            local l_2_10 = placeObject("Guest_Adult_M_Caveman", pos.x, pos.y, l_2_9)
            if l_2_10 ~= nil then
               l_2_10:BFG_SET_ATTR_STRING("s_name", l_2_2[l_2_3])
               l_2_10:BFG_SET_ATTR_BOOLEAN("b_Frozen", false)
               l_2_10:BFG_SET_ATTR_BOOLEAN("b_InGlacier", false)
               l_2_10:BFG_SET_ATTR_FLOAT("f_TagValue", 100)
            end
            table.remove(l_2_1, l_2_6)
         end
      end
      setglobalvar("numCavemenTagged", tostring(0))
      logDebugChallengeInfo("clonedcavemen", "accepted")
      local l_2_3 = queryObject("BFScenarioMgr")
      if l_2_3 then
         l_2_3:BFS_SHOWRULE("clonedcavemen")
      end
      setchallengeactive()
      local l_2_4 = getLocID("Challengetext:CHCaptureCavemen")
      genericokpaneltext("photochal:goals_label", l_2_4)
      l_2_arg0.accept = 1
   end
   if l_2_arg0.accept == 1 then
      local l_2_1, l_2_1 = tonumber(getglobalvar("numCavemenTagged"))
      if l_2_1 ~= nil then
         l_2_1 = BFLOG
         l_2_1("evalClonedCavemen -- numCavemenTagged = " .. l_2_1)
         if l_2_1 >= 5 then
            l_2_1 = 1
            return l_2_1
         end
         l_2_1 = 5 - l_2_1
         --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

completeClonedCavemen = function(l_3_arg0)
   giveCash(3000)
   placeCratedObjectAtGate("Glacier")
   showchallengewin("Challengetext:CHCaptureCavemenSuccess")
   resetchallengeoverandcomplete("clonedcavemen")
   incrementglobalchallenges()
end

failClonedCavemen = function(l_4_arg0)
   takeCash(500)
   showchallengefail("Challengetext:CHCaptureCavemenFailure")
   resetchallengeover("clonedcavemen")
end


