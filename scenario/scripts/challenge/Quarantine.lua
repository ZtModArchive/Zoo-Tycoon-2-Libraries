include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/token.lua")
chooseDisease = function()
   local l_1_0 = {}
   l_1_0[1] = "PoopingDisease"
   l_1_0[2] = "SpeedySyndrome"
   l_1_0[3] = "SlowingSyndrome"
   local l_1_1 = {}
   l_1_1[1] = "t_GetPoopingDisease"
   l_1_1[2] = "t_GetSpeedyDisease"
   l_1_1[3] = "t_GetSlowingDisease"
   local l_1_2 = {}
   local l_1_3 = queryObject("ZTDiseaseMgr")
   if l_1_3 ~= nil then
      local l_1_4 = l_1_3:ZT_GET_CURRENT_DISEASE()
      if l_1_4 == nil or l_1_4 == "" then
         for l_1_5 = 1, table.getn(l_1_0) do
            if l_1_3:ZT_DISEASE_CURE_QUERY(l_1_0[l_1_5]) == false then
               l_1_2[table.getn(l_1_2) + 1] = l_1_5
            end
         end
      end
   end
   local l_1_4, l_1_5 = nil, nil
   local l_1_6 = table.getn(l_1_2)
   if l_1_6 > 0 then
      local l_1_7 = math.random(l_1_6)
      local l_1_8 = l_1_2[l_1_7]
      l_1_4 = l_1_0[l_1_8]
      BFLOG("chooseDisease -- random disease = " .. l_1_4)
      l_1_5 = l_1_1[l_1_8]
   end
   local l_1_7
   return l_1_7
   l_1_7 = {name = l_1_4, token = l_1_5}
end

validate = function()
   if isChalDeclinedForever("quarantine") == true then
      return 0
   end
   setglobalvar("current_challenge_name", "quarantine")
   do
      if table.getn(getExtinctEntityList()) >= 10 and getHalfStars() >= 4 and countType("CloningCenter") >= 1 then
         local l_2_0 = chooseDisease()
         if l_2_0.name ~= nil then
            local l_2_1 = queryObject("BFScenarioMgr")
            if l_2_1 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, "quarantine")
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_2_1:BFS_ADDSCENARIO("scenario/goals/challenge/quarantine.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo("quarantine", "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

giveDisease = function(l_3_arg0, l_3_arg1)
   local l_3_2
   disease, l_3_2 = l_3_2, {key = l_3_arg1, val = l_3_arg0}
   l_3_2 = BFLOG
   l_3_2("Attempting to give " .. l_3_arg1 .. " to " .. l_3_arg0)
   l_3_2 = queryObject
   l_3_2 = l_3_2("ZTDiseaseMgr")
   if l_3_2 ~= nil then
      return l_3_2:ZT_FORCE_DISEASE(disease)
   else
      BFLOG("Manager is nil")
   end
end

evalQuarantine = function(l_4_arg0)
   BFLOG("******************* evalQuarantine *******************")
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_4_1 = queryObject("BFScenarioMgr")
      if l_4_1 then
         l_4_1:BFS_SHOWRULE("quarantine")
      end
      logDebugChallengeInfo("quarantine", "accepted")
      setchallengeactive()
      l_4_arg0.accept = 1
      showprimarygoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar("quarantine" .. "_decline_forever", "true")
         logDebugChallengeInfo("quarantine", "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo("quarantine", "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_4_arg0.accept == nil and challenge == nil then
      l_4_arg0.DiseasedAnimal = chooseDiseaseAnimal()
      BFLOG("evalQuarantine -- comp.DiseasedAnimal = " .. l_4_arg0.DiseasedAnimal)
      setglobalvar("givenAnimalType", l_4_arg0.DiseasedAnimal)
      local l_4_1 = getlocidfromspecies(l_4_arg0.DiseasedAnimal)
      stringdat = getLocID("Challengetext:CHQuarantineShort")
      showme = string.format(stringdat, l_4_1)
      setalttext("quarantine", "neutral", showme)
      local l_4_2 = getLocID("Challengetext:CHQuarantine")
      local l_4_3 = string.format(l_4_2, l_4_1)
      setaltoverviewtext("quarantine", "neutral", l_4_3)
      showchallengepaneltext(l_4_3)
      setglobalvar("challenge", "waiting")
   end
   if l_4_arg0.accept == 1 then
      if l_4_arg0.giveAnimal == nil and l_4_arg0.diseaseName == nil then
         if l_4_arg0.placedAnimal == nil then
            l_4_arg0.placedAnimal = placeCratedObjectAtGate(l_4_arg0.DiseasedAnimal .. "_Adult_F")
            -- Tried to add an 'end' here but it's incorrect
            local l_4_1 = findEntityByID(l_4_arg0.placedAnimal)
            if l_4_1 == nil then
               BFLOG("placed animal is nil!")
            end
            local l_4_2 = getName(l_4_1)
            BFLOG(l_4_2 .. " placed at gate")
            local l_4_3 = chooseDisease()
            local l_4_4 = giveDisease(l_4_2, l_4_3.name)
            if l_4_4 == true then
               l_4_arg0.diseaseName = l_4_3.name
               l_4_arg0.diseaseToken = l_4_3.token
               BFLOG("Disease is " .. l_4_arg0.diseaseName .. "; Token is " .. l_4_arg0.diseaseToken)
            end
            if l_4_arg0.diseaseName ~= nil and l_4_arg0.diseaseName ~= "" then
               BFLOG(l_4_arg0.diseaseName .. " given to " .. l_4_2)
               setglobalvar("sickAnimalID", tostring(l_4_arg0.placedAnimal))
               l_4_arg0.giveAnimal = 1
               l_4_arg0.seedDiseaseTimer = getCurrentSimTime()
               l_4_arg0.extinctDonationsStart = getDonationsByEndangerment("Extinct")
               l_4_1:BFG_SET_ATTR_BOOLEAN("b_Disease", true)
            end
            -- Tried to add an 'end' here but it's incorrect
            if l_4_arg0.seededAnimal == nil and l_4_arg0.giveAnimal == 1 then
               local l_4_1 = getCurrentSimTime() - l_4_arg0.seedDiseaseTimer
               if l_4_1 >= 90 then
                  local l_4_2 = getExtinctEntityList()
                  if l_4_2 == nil then
                     BFLOG(SYSTRACE, "evalQuarantine -- objects is nil")
                     l_4_arg0.seededAnimal = 1
                     return 0
                  end
                  local l_4_3 = table.getn(l_4_2)
                  if l_4_3 <= 0 then
                     BFLOG("evalQuarantine -- NO ANIMALS")
                     l_4_arg0.seededAnimal = 1
                     return 0
                  end
                  local l_4_4 = {}
                  for l_4_5 = 1, l_4_3 do
                     local l_4_8 = resolveTable(l_4_2[l_4_5].value)
                     if l_4_8:BFG_GET_ATTR_BOOLEAN("b_Adult") and l_4_8:BFG_GET_ENTITY_ID() ~= l_4_arg0.placedAnimal then
                        l_4_4[table.getn(l_4_4) + 1] = l_4_8
                     end
                  end
                  l_4_3 = table.getn(l_4_4)
                  if l_4_3 <= 0 then
                     BFLOG("evalQuarantine -- NO ADULT ANIMALS")
                     l_4_arg0.seededAnimal = 1
                     return 0
                  end
                  local l_4_5 = math.random(l_4_3)
                  local l_4_6 = l_4_4[l_4_5]
                  if l_4_6 ~= nil then
                     local l_4_7 = getName(l_4_6)
                     local l_4_8 = {}
                     local l_4_9 = {"value"}
                     l_4_8[1] = l_4_9
                     l_4_9 = {"value"}
                     l_4_8[2] = l_4_9
                     l_4_9 = {"value"}
                     l_4_8[3] = l_4_9
                     l_4_9 = {"value"}
                     l_4_8[4] = l_4_9
                     l_4_9 = l_4_8[1]
                     l_4_9.value = l_4_7
                     l_4_9 = l_4_8[2]
                     l_4_9.value = l_4_arg0.diseaseToken
                     l_4_9 = l_4_8[3]
                     l_4_9.value = 300
                     l_4_9 = l_4_8[4]
                     l_4_9.value = 0
                     l_4_9 = giveToken
                     l_4_9(l_4_8, 0)
                     l_4_9 = BFLOG
                     l_4_9("Gave " .. l_4_arg0.diseaseName .. " to " .. l_4_7)
                  else
                     BFLOG("evalQuarantine -- single was nil")
                  end
                  l_4_arg0.seededAnimal = 1
               end
            end
            if l_4_arg0.seededAnimal == 1 and l_4_arg0.giveAnimal == 1 then
               local l_4_1, l_4_1 = tonumber(getglobalvar("sickAnimalID"))
               l_4_1 = findEntityByID
               l_4_1 = l_4_1(l_4_1)
               --[[ DECOMPILER ERROR 1093: Confused at declaration of local variable ]]
end

completeQuarantine = function(l_5_arg0)
   local l_5_1 = getglobalvar("givenAnimalType")
   BFLOG("completeQuarantine -- animalType = " .. l_5_1)
   placeCratedObjectAtGate(l_5_1 .. "_Adult_M")
   local l_5_2 = tonumber(getglobalvar("quarantineCashReward"))
   giveCash(l_5_2)
   local l_5_3 = getlocidfromspecies(l_5_1)
   local l_5_4 = getLocID("Challengetext:CHQuarantineSuccessShort")
   local l_5_5 = string.format(l_5_4, l_5_3)
   setalttext("quarantine", "success", l_5_5)
   l_5_4 = getLocID("Challengetext:CHQuarantineSuccess")
   l_5_5 = string.format(l_5_4, l_5_3)
   setaltoverviewtext("quarantine", "success", l_5_5)
   showchallengewintext(l_5_5)
   resetchallengeoverandcomplete("quarantine")
   incrementglobalchallenges()
end

failQuarantine = function(l_6_arg0)
   if declinenotfail == nil then
      local l_6_1 = getglobalvar("givenAnimalType")
      local l_6_2 = getlocidfromspecies(l_6_1)
      if givenAnimalDied == 1 then
         showchallengefail("Challengetext:CHQuarantineDeath")
      else
         local l_6_3 = getLocID("Challengetext:CHQuarantineTimeFailure")
         local l_6_4 = string.format(l_6_3, l_6_2)
         showchallengefailtext(l_6_4)
         l_6_3 = getLocID("Challengetext:CHQuarantineTimeFailureShort")
         setalttext("quarantine", "failure", l_6_3)
      end
   end
   resetchallengeover("quarantine")
   declinenotfail = nil
end

chooseDiseaseAnimal = function()
   local l_7_0 = {}
   l_7_0[1] = "BearShortfaced"
   l_7_0[2] = "CatSaberToothed"
   l_7_0[3] = "LionCave"
   l_7_0[4] = "Quagga"
   l_7_0[5] = "RhinocerosWooly"
   local l_7_1 = l_7_0[math.random(table.getn(l_7_0))]
   BFLOG("chooseDiseaseAnimal -- random diseased animal = " .. l_7_1)
   return l_7_1
end


