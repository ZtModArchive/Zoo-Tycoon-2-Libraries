include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
GUEST_GOAL1 = 50
GUEST_GOAL2 = 75
GUEST_GOAL3 = 100
GUEST_REWARD1 = 20000
GUEST_REWARD2 = 20000
GUEST_REWARD3 = 30000
SCENARIO_GOAL1 = 3
SCENARIO_GOAL2 = 6
SCENARIO_GOAL3 = 10
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

numOfMarineAnimals = function()
   return table.getn(getUniqueSpecies(getMarineEntityList()))
end

eval3MarineAnimals = function()
   if SCENARIO_GOAL1 <= numOfMarineAnimals() then
      return 1
   end
   return 0
end

complete3MarineAnimals = function()
   placeCratedObjectAtGate("SeaHorse_mm")
   showRule("Get_6")
   completeshowoverview()
end

eval6MarineAnimals = function()
   if SCENARIO_GOAL2 <= numOfMarineAnimals() then
      return 1
   end
   return 0
end

complete6MarineAnimals = function()
   placeCratedObjectAtGate("giftcart_mm")
   showRule("Get_10")
   completeshowoverview()
end

eval10MarineAnimals = function()
   if SCENARIO_GOAL3 <= numOfMarineAnimals() then
      return 1
   end
   return 0
end

complete10MarineAnimals = function()
   BFLOG(SYSTRACE, "WIN")
   local l_8_0 = getuservar("MarineAnimalsCampaignscenario1")
   if l_8_0 ~= "completed" then
      setuservar("MarineAnimalsCampaignscenario2", "unlocked")
   end
   setuservar("MarineAnimalsCampaignscenario1", "completed")
   showscenariowin("MarineAnimals:TakeThePlungeSuccessOverview", "MarineAnimalsCampaignscenario2")
end

evalGuest1 = function(l_9_arg0)
   if GUEST_GOAL1 <= getNumGuests(-1) then
      return 1
   end
   return 0
end

completeGuest1 = function(l_10_arg0)
   giveCash(GUEST_REWARD1)
   showRule("Guest2")
   completeshowoverview()
end

evalGuest2 = function()
   if GUEST_GOAL2 <= getNumGuests(-1) then
      return 1
   end
   return 0
end

completeGuest2 = function()
   giveCash(GUEST_REWARD2)
   showRule("Guest3")
   completeshowoverview()
end

evalGuest3 = function()
   if GUEST_GOAL3 <= getNumGuests(-1) then
      return 1
   end
   return 0
end

completeGuest3 = function()
   giveCash(GUEST_REWARD3)
   completeshowoverview()
end


