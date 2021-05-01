include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/photoutil.lua")
leisuretransportationCHALLENGE_NAME = "leisuretransportation"
validate = function()
   if isChalDeclinedForever(leisuretransportationCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", leisuretransportationCHALLENGE_NAME)
   local l_1_0 = getglobalvar(leisuretransportationCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and countType("Guest") <= 100 and getHalfStars() >= 3 then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, leisuretransportationCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  BFLOG("giving out challenge")
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/" .. leisuretransportationCHALLENGE_NAME .. ".xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(leisuretransportationCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalleisuretransportation = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(leisuretransportationCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE(leisuretransportationCHALLENGE_NAME)
      end
      logDebugChallengeInfo(leisuretransportationCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(leisuretransportationCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(leisuretransportationCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(leisuretransportationCHALLENGE_NAME, "declined")
      end
      declinenotfail = 1
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      showchallengepanel("PhotoChallengetext:PHLeisureTransportation")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if numPhotoRequirements() == 0 then
         return 1
         -- Tried to add an 'end' here but it's incorrect
         numPhotoRequirementsMet()
         local l_2_1 = queryObject("ZTPhotoChallengesComponent")
         local l_2_2 = l_2_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED()
         if l_2_2 then
            return 1
         else
            return 0
         end
         if alreadyTaken ~= nil and l_2_arg0.alreadyTaken == nil then
            l_2_arg0.alreadyTaken = alreadyTaken
         end
         if l_2_arg0.alreadyTaken ~= nil then
            alreadyTaken = l_2_arg0.alreadyTaken
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

scoreJeepWithGuests = function(l_3_arg0)
   if scoreT1ContainsHowManyT2(l_3_arg0, "groundvehicle", "Guest") >= 3 then
      return 1
   end
   return 0
end

scoreJeepWithFirstAnimal = function(l_4_arg0)
   if alreadyTaken ~= nil then
      return 1
   end
   local l_4_1 = animalsInZoo()
   for l_4_2 = 1, table.getn(l_4_1) do
      if numEntityExistsFromVehicle(l_4_arg0, l_4_1[l_4_2], "groundvehicle") >= 1 then
         alreadyTaken = l_4_1[l_4_2]
         BFLOG("SETTING alreadyTaken: " .. alreadyTaken)
         return 1
      end
   end
   return 0
end

scoreJeepWithSecondAnimal = function(l_5_arg0)
   if alreadyTaken == nil then
      return 0
   end
   local l_5_1 = animalsInZoo()
   for l_5_2 = 1, table.getn(l_5_1) do
      if alreadyTaken ~= nil and l_5_1[l_5_2] ~= alreadyTaken and numEntityExistsFromVehicle(l_5_arg0, l_5_1[l_5_2], "groundvehicle") >= 1 then
         return 1
      end
   end
   return 0
end

completeleisuretransportation = function(l_6_arg0)
   giveGuest(10)
   showchallengewin("PhotoChallengetext:PHLeisureTransportationSuccess")
   resetchallengeoverandcomplete(leisuretransportationCHALLENGE_NAME)
   incrementglobalchallenges()
end

failleisuretransportation = function(l_7_arg0)
   if declinenotfail == nil then
      showchallengefail("PhotoChallengetext:PHLeisureTransportationFailure")
   end
   resetchallengeover(leisuretransportationCHALLENGE_NAME)
   declinenotfail = nil
end


