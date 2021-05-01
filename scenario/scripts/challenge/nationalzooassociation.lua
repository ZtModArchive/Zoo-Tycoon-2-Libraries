include("scenario/scripts/ui.lua")
include("scenario/scripts/photoutil.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/misc.lua")
nationalzooassociationCHALLENGE_NAME = "nationalzooassociation"
validate = function()
   if isChalDeclinedForever(nationalzooassociationCHALLENGE_NAME) == true then
      return 0
   end
   setglobalvar("current_challenge_name", nationalzooassociationCHALLENGE_NAME)
   local l_1_0 = getglobalvar(nationalzooassociationCHALLENGE_NAME .. "_over")
   do
      if (l_1_0 == nil or l_1_0 ~= "true") and existMaleFemaleSameSpecies() == true then
         local l_1_1 = queryObject("BFScenarioMgr")
         if l_1_1 then
            if getPrereqGather() == true then
               BFLOG(SYSTRACE, nationalzooassociationCHALLENGE_NAME)
               -- Tried to add an 'end' here but it's incorrect
               incChallengesOffered()
               if getAddScenarioSuppression() == false then
                  l_1_1:BFS_ADDSCENARIO("scenario/goals/challenge/nationalzooassociation.xml")
               elseif getPrereqGather() == false then
                  logDebugChallengeInfo(nationalzooassociationCHALLENGE_NAME, "skipped")
               end
               return 1
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            return 0
end

evalnationalzooassociation = function(l_2_arg0)
   challenge = getglobalvar("challenge")
   if challenge == "accept" then
      local l_2_1 = queryObject("BFScenarioMgr")
      if l_2_1 then
         l_2_1:BFS_SHOWRULE(nationalzooassociationCHALLENGE_NAME .. "photo")
      end
      local l_2_2 = queryObject("ZTPhotoChallengesComponent")
      if l_2_2 then
         l_2_2:ZT_PHOTOEVENT_SET_CURRENT_CHALLENGE("ZooAssociation")
      end
      logDebugChallengeInfo(nationalzooassociationCHALLENGE_NAME, "accepted")
      setchallengeactive()
      l_2_arg0.accept = 1
      showphotogoals()
   elseif challenge == "decline" then
      if getDeclineForever() == true then
         setglobalvar(nationalzooassociationCHALLENGE_NAME .. "_decline_forever", "true")
         logDebugChallengeInfo(nationalzooassociationCHALLENGE_NAME, "declinedforever")
         setDeclineForever(false)
      elseif getChallengeDebugMode() == true then
         logDebugChallengeInfo(nationalzooassociationCHALLENGE_NAME, "declined")
      end
      return -1
   end
   if l_2_arg0.accept == nil and challenge == nil then
      local l_2_1 = showchallengepanel("ZooAssociationtext:PHZooAssociation")
      setglobalvar("challenge", "waiting")
   end
   if l_2_arg0.accept == 1 then
      if numPhotoRequirements() == 0 then
         return 1
         -- Tried to add an 'end' here but it's incorrect
         numPhotoRequirementsMet()
         local l_2_1 = queryObject("ZTPhotoChallengesComponent")
         if l_2_1:ZT_PHOTOEVENT_GET_CHALLENGES_COMPLETED() then
            return 1
         else
            return 0
         end
         -- Tried to add an 'end' here but it's incorrect
         return 0
end

scoreAnyBabyAnimal = function(l_3_arg0)
   local l_3_1 = l_3_arg0:getFirstInterestingEntity()
   while l_3_1 do
      if l_3_1:isKindOf("animal") and l_3_1:getSharedVar("b_Adult") == "false" then
         local l_3_2 = l_3_1:getPAC()
         if l_3_2 and l_3_2:hasRelationship("mother") == true then
            return 1
         end
      end
      l_3_1 = l_3_arg0:getNextInterestingEntity()
   end
   return 0
end

scoreAnyBabyAnimalwithMother = function(l_4_arg0)
   local l_4_1 = l_4_arg0:getFirstInterestingEntity()
   while l_4_1 do
      if l_4_1:isKindOf("animal") and l_4_1:getSharedVar("b_Adult") == "false" then
         local l_4_2 = l_4_1:getPAC()
         if l_4_2 then
            local l_4_3 = l_4_2:getID()
            local l_4_4 = l_4_arg0:getFirstInterestingEntity2(l_4_arg0)
            while l_4_4 do
               local l_4_5 = l_4_4:getPAC()
               if l_4_5 then
                  local l_4_6 = l_4_5:getID()
                  local l_4_7
                  l_4_7 = {_type = "ZTRelationshipQueryData", relation = "mother", id = l_4_6}
                  if l_4_2:testRelationship(l_4_7) then
                     return 1
                  end
               end
               l_4_4 = l_4_arg0:getNextInterestingEntity2(l_4_arg0)
               -- Tried to add an 'end' here but it's incorrect
               -- Tried to add an 'end' here but it's incorrect
            end
            l_4_1 = l_4_arg0:getNextInterestingEntity()
         end
         return 0
end

scoreTwoZebrasGrooming = function(l_5_arg0)
   if numEntitiesDoingAnim(l_5_arg0, "ZebraCommon", "Stand_GroomOther") >= 1 then
      return 1
   end
   return 0
end

scoreAnimalUsingEnrichment = function(l_6_arg0)
   if scoreAnyEntityTypeDoingTarget(l_6_arg0, "animal", "enrichment") >= 1 then
      return 1
   end
   return 0
end

completenationalzooassociation = function(l_7_arg0)
   giveCash(5000)
   showchallengewin("ZooAssociationtext:PHZooAssociationSuccess")
   resetchallengeoverandcomplete(nationalzooassociationCHALLENGE_NAME)
   incrementphotochallenges()
end

failnationalzooassociation = function(l_8_arg0)
   resetchallengeover(nationalzooassociationCHALLENGE_NAME)
   clearphotochallenge(nationalzooassociationCHALLENGE_NAME .. "photo")
end


