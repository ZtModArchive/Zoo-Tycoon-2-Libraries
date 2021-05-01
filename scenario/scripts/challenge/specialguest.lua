include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
RAND_SKEW = 30
specialguestCHALLENGE_NAME = "specialguest"
validate = function()
   if isChalDeclinedForever(specialguestCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", specialguestCHALLENGE_NAME)
   local l_1_0 = getglobalvar(specialguestCHALLENGE_NAME .. "_over")
   if l_1_0 == nil or l_1_0 ~= "true" then
      setglobalvar(specialguestCHALLENGE_NAME .. "_canrepeat", "true")
      do
         local l_1_1 = math.random(RAND_SKEW)
         if l_1_1 == 1 then
            local l_1_2 = queryObject("BFScenarioMgr")
            if l_1_2 then
               if getPrereqGather() == true then
                  BFLOG(SYSTRACE, specialguestCHALLENGE_NAME)
                  -- Tried to add an 'end' here but it's incorrect
                  incChallengesOffered()
                  if getAddScenarioSuppression() == false then
                     l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/specialguest.xml")
                  elseif getPrereqGather() == false then
                     logDebugChallengeInfo(specialguestCHALLENGE_NAME, "skipped")
                  end
                  return 1
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
               end
               return 0
end

evalspecialguest = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(specialguestCHALLENGE_NAME)
      end
      local l_2_2 = getLocID("Challengetext:CHSpecialGuest")
      local l_2_3 = string.format(l_2_2, l_2_arg0.guestname, l_2_arg0.animalname, l_2_arg0.guestname)
      setaltoverviewtext("specialguest", "neutral", l_2_3)
      l_2_2 = getLocID("Challengetext:CHSpecialGuestShort")
      l_2_3 = string.format(l_2_2, l_2_arg0.animalname, l_2_arg0.guestname)
      setalttext("specialguest", "neutral", l_2_3)
      logDebugChallengeInfo(specialguestCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(specialguestCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(specialguestCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(specialguestCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = getAnimalsAvailableByStars(getHalfStars() + 2)
      l_2_arg0.whatanimal = l_2_1[math.random(table.getn(l_2_1))]
      l_2_arg0.cashreward = 4000
      specialGuestReward = l_2_arg0.cashreward
      specialGuestAnimal = getlocidfromspecies(l_2_arg0.whatanimal)
      specialGuestName = nil
      specialGuestGender = nil
      specialGuestInStasis = false
      specialGuestHandle = nil
      local l_2_2 = queryObject("ZTAIGuestMgr")
      if math.random(50) > 25 and l_2_2 then
         specialGuestName = l_2_2:ZTAI_RANDOM_GUEST_NAME("Guest_Adult_M")
         specialGuestGender = "male"
         do break end
         if l_2_2 then
            specialGuestName = l_2_2:ZTAI_RANDOM_GUEST_NAME("Guest_Adult_F")
            specialGuestGender = "female"
         end
      end
      l_2_arg0.guestgender = specialGuestGender
      l_2_arg0.guestname = specialGuestName
      l_2_arg0.animalname = specialGuestAnimal
      local l_2_3 = getLocID("Challengetext:CHSpecialGuest")
      local l_2_4 = string.format(l_2_3, specialGuestName, specialGuestAnimal, specialGuestName)
      showchallengepaneltext(l_2_4)
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept ~= nil then
      specialGuestName = l_2_arg0.guestname
      specialGuestAnimal = l_2_arg0.animalname
      specialGuestGender = l_2_arg0.guestgender
      specialGuestReward = l_2_arg0.cashreward
      if l_2_arg0.specialguesttimer == nil then
         l_2_arg0.specialguesttimer = getCurrentMonth()
         l_2_arg0.specialguesttimerday = getCurrentTimeOfDay()
      end
      BFLOG(SYSTRACE, "Guest coming will be looking for a: " .. l_2_arg0.whatanimal .. ".")
      local l_2_1 = getCurrentMonth()
      local l_2_2 = getCurrentTimeOfDay()
      if (l_2_arg0.specialguesttimer + 1 <= l_2_1 and l_2_arg0.specialguesttimerday <= l_2_2) or l_2_arg0.specialguesttimer + 2 <= l_2_1 then
         if specialGuestCreated == nil then
            specialGuestCreated = false
            specialGuestRunOnce = false
            -- Tried to add an 'end' here but it's incorrect
            if specialGuestRunOnce == false then
               if l_2_arg0.guestgender == "male" then
                  specialGuestPreTable = findType("Guest_Adult_M")
                  placeObject("Guest_Adult_M", getZooEntrancePos().x, getZooEntrancePos().y, 0)
                  specialGuestRunOnce = true
               elseif l_2_arg0.guestgender == "female" then
                  specialGuestPreTable = findType("Guest_Adult_F")
                  placeObject("Guest_Adult_F", getZooEntrancePos().x, getZooEntrancePos().y, 0)
                  specialGuestRunOnce = true
               end
            end
            if specialGuestCreated == false then
               if l_2_arg0.guestgender == "male" then
                  local l_2_3 = findType("Guest_Adult_M")
                  local l_2_4 = table.getn(specialGuestPreTable)
                  local l_2_5 = table.getn(l_2_3)
                  if l_2_4 < l_2_5 then
                     local l_2_6 = resolveTable(l_2_3[l_2_5].value)
                     if l_2_6 ~= nil then
                        l_2_6:BFG_SET_ATTR_STRING("s_name", l_2_arg0.guestname)
                        l_2_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", l_2_arg0.whatanimal)
                        specialGuestCreated = true
                     elseif l_2_arg0.guestgender == "female" then
                        local l_2_3 = findType("Guest_Adult_F")
                        local l_2_4 = table.getn(specialGuestPreTable)
                        local l_2_5 = table.getn(l_2_3)
                        if l_2_4 < l_2_5 then
                           local l_2_6 = resolveTable(l_2_3[l_2_5].value)
                           if l_2_6 ~= nil then
                              l_2_6:BFG_SET_ATTR_STRING("s_name", l_2_arg0.guestname)
                              l_2_6:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", l_2_arg0.whatanimal)
                              specialGuestCreated = true
                           elseif countType(l_2_arg0.whatanimal) >= 1 then
                              giveCash(l_2_arg0.cashreward)
                              return 1
                           else
                              return -1
                           end
                           -- Tried to add an 'end' here but it's incorrect
                        end
                     end
                     -- Tried to add an 'end' here but it's incorrect
                  end
                  -- Tried to add an 'end' here but it's incorrect
                  -- Tried to add an 'end' here but it's incorrect
end

completespecialguest = function(l_3_arg0)
   local l_3_1 = queryObject("BFScenarioMgr")
   local l_3_2 = ""
   if l_3_1 then
      l_3_2 = l_3_1:BFS_LOCALIZEFLOAT(specialGuestReward)
   end
   local l_3_3 = getLocID("Challengetext:CHSpecialGuestSuccess")
   local l_3_4 = string.format(l_3_3, specialGuestName, specialGuestAnimal, l_3_2)
   local l_3_5 = getLocID("Challengetext:CHSpecialGuestSuccessShort")
   local l_3_6 = string.format(l_3_5, specialGuestName, specialGuestAnimal)
   setalttext("specialguest", "success", l_3_6)
   setaltoverviewtext("specialguest", "success", l_3_4)
   showchallengewintext(l_3_4)
   resetchallengeoverandcomplete(specialguestCHALLENGE_NAME)
   incrementglobalchallenges()
end

failspecialguest = function(l_4_arg0)
   if declinenotfail == nil then
      local l_4_1 = queryObject("BFScenarioMgr")
      local l_4_2 = ""
      if l_4_1 then
         l_4_2 = l_4_1:BFS_LOCALIZEFLOAT(specialGuestReward)
      end
      local l_4_3 = getLocID("Challengetext:CHSpecialGuestFailure")
      local l_4_4 = string.format(l_4_3, specialGuestAnimal, specialGuestName, l_4_2, specialGuestAnimal)
      local l_4_5 = getLocID("Challengetext:CHSpecialGuestFailureShort")
      local l_4_6 = string.format(l_4_5, specialGuestName, specialGuestAnimal, l_4_2)
      setalttext("specialguest", "failure", l_4_6)
      setaltoverviewtext("specialguest", "failure", l_4_4)
      showchallengefailtext(l_4_4)
   end
   resetchallengeover(specialguestCHALLENGE_NAME)
   declinenotfail = nil
end


