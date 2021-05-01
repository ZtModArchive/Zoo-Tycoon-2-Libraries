include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
SCENARIO_REWARD = 5000
ANIMAL_TYPE1 = "Carnivora"
ANIMAL_TYPE2 = "Cetacea"
ANIMAL_TYPE3 = "Chondrichthyes"
ANIMAL_TYPE4 = "Testudines"
ANIMAL_TYPE5 = "Perciformes"
DONATION_GOAL = 1000
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

evalOverallGoal = function(l_2_arg0)
   BFLOG("Eval Overall")
   if l_2_arg0.carnivoraDone == nil and testMarineAnimalType(ANIMAL_TYPE1) == 1 then
      l_2_arg0.carnivoraDone = 1
      giveCash(SCENARIO_REWARD)
      genericokpanel(nil, "MarineAnimals:MarineDiversityCarnivoraDone")
      setRuleState("Carnivora", "success")
   end
   if l_2_arg0.cetaceaDone == nil and testMarineAnimalType(ANIMAL_TYPE2) == 1 then
      l_2_arg0.cetaceaDone = 1
      giveCash(SCENARIO_REWARD)
      genericokpanel(nil, "MarineAnimals:MarineDiversityCetaceaDone")
      setRuleState("Cetacea", "success")
   end
   if l_2_arg0.chondrichthyesDone == nil and testMarineAnimalType(ANIMAL_TYPE3) == 1 then
      l_2_arg0.chondrichthyesDone = 1
      giveCash(SCENARIO_REWARD)
      genericokpanel(nil, "MarineAnimals:MarineDiversityChondrichthyesDone")
      setRuleState("Chondrichthyes", "success")
   end
   if l_2_arg0.testudinesDone == nil and testMarineAnimalType(ANIMAL_TYPE4) == 1 then
      l_2_arg0.testudinesDone = 1
      giveCash(SCENARIO_REWARD)
      genericokpanel(nil, "MarineAnimals:MarineDiversityTestudinesDone")
      setRuleState("Testudines", "success")
   end
   if l_2_arg0.perciformesDone == nil and testMarineAnimalType(ANIMAL_TYPE5) == 1 then
      l_2_arg0.perciformesDone = 1
      giveCash(SCENARIO_REWARD)
      genericokpanel(nil, "MarineAnimals:MarineDiversityPerciformesDone")
      setRuleState("Perciformes", "success")
   end
   if l_2_arg0.carnivoraDone ~= nil and l_2_arg0.testudinesDone ~= nil and l_2_arg0.chondrichthyesDone ~= nil and l_2_arg0.cetaceaDone ~= nil and l_2_arg0.perciformesDone ~= nil then
      return 1
   end
   if l_2_arg0.aquariumTimer == nil then
      l_2_arg0.aquariumTimer = getCurrentMonth()
      l_2_arg0.aquariumTimerDay = getCurrentTimeOfDay()
   end
   if checkTimeLimit(l_2_arg0, 2, 0) == -1 and l_2_arg0.showGoal == nil then
      l_2_arg0.showGoal = 1
      BFLOG("Show Aquarium Goals")
      setRuleState("AquariumGoals", "neutral")
      showRule("AquariumGoals")
      showRule("Octopus")
      completeshowoverview()
   end
end

completeOverallGoal = function()
   local l_3_0 = getuservar("MarineAnimalsCampaignscenario3")
   if l_3_0 ~= "completed" then
      setuservar("MarineAnimalsCampaignscenario1", "unlocked")
   end
   setuservar("MarineAnimalsCampaignscenario3", "completed")
   showscenariowin("MarineAnimals:MarineDiversitySuccess", "MarineAnimalsCampaignscenario1")
end

testMarineAnimalType = function(l_4_arg0)
   animalTable = findType(l_4_arg0)
   if animalTable == nil then
      return 0
   end
   for l_4_1 = 1, table.getn(animalTable) do
      local l_4_4 = resolveTable(animalTable[l_4_1].value)
      if l_4_4 and isMarineAnimal(l_4_4) then
         BFLOG("Found Marine animal of family " .. l_4_arg0)
         if basicNeedsNotCritical(l_4_4) then
            BFLOG("Animal's basic needs are met")
            return 1
         else
            BFLOG("Animal's basic needs are NOT met")
         end
      end
   end
   return 0
end

getDonationsMarineSpecies = function()
   local l_5_0 = getMarineSpeciesList()
   local l_5_1 = 0
   for l_5_2 = 1, table.getn(l_5_0) do
      l_5_1 = l_5_1 + getDonations(l_5_0[l_5_2])
   end
   return l_5_1
end

evalMarineDonations = function()
   if DONATION_GOAL <= getDonationsMarineSpecies() then
      return 1
   end
   return 0
end

completeMarineDonations = function()
   placeCratedObjectAtGate("PenguinEmperor_Adult_M")
   placeCratedObjectAtGate("PenguinEmperor_Adult_F")
end

evalAquarium = function(l_8_arg0)
   BFLOG("Eval Aquarium")
   local l_8_1 = 0
   if countType("Aquarium_Octopus") >= 1 then
      if l_8_arg0.hasOctopusAquarium == nil then
         setRuleState("Octopus", "success")
         l_8_arg0.hasOctopusAquarium = 1
         showprimarygoals()
         -- Tried to add an 'end' here but it's incorrect
         l_8_1 = l_8_1 + 1
         -- Tried to add an 'end' here but it's incorrect
         if countType("Aquarium_SeaHorse") >= 1 then
            if l_8_arg0.hasSeaHorseAquarium == nil then
               setRuleState("SeaHorse", "success")
               l_8_arg0.hasSeaHorseAquarium = 1
               showprimarygoals()
               -- Tried to add an 'end' here but it's incorrect
               l_8_1 = l_8_1 + 1
               -- Tried to add an 'end' here but it's incorrect
               if countType("Aquarium_TropicalFish") >= 1 then
                  if l_8_arg0.hasTropicalAquarium == nil then
                     setRuleState("Tropical", "success")
                     l_8_arg0.hasTropicalAquarium = 1
                     showprimarygoals()
                     -- Tried to add an 'end' here but it's incorrect
                     l_8_1 = l_8_1 + 1
                     -- Tried to add an 'end' here but it's incorrect
                     BFLOG("Number of different aquariums in zoo: " .. l_8_1)
                     if l_8_1 >= 3 then
                        BFLOG("Aquarium Goal success")
                        setRuleState("AquariumGoals", "success")
                        return 1
                     end
                     return 0
end

completeAquarium = function()
   completeshowoverview()
   placeCratedWaterObjectAtGate("SharkHammerheadScalloped_Adult_M")
end


