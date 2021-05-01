include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
LUALOG(SYSERROR, "dinocampaign.lua started")
WIN_SPECIES = "TyrannosaurusRex"
GUESTA_AMOUNT = 100
GUESTB_AMOUNT = 150
GUESTA_REWARD = "Carnotaurus_Adult_M"
GUESTB_REWARD = "Triceratops_Adult_M"
FAMEA_STARS = 3
FAMEB_STARS = 4
FAMEC_STARS = 5
FAMEA_REWARD_AMOUNT = 10000
FAMEB_REWARD_AMOUNT = 20000
FAMEC_REWARD_AMOUNT = 35000
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   showUI("goal panel", true)
   return 1
end

evalhavewinspec = function()
   if countType(WIN_SPECIES) > 0 then
      return 1
   end
   return 0
end

completehavewinspec = function()
   local l_3_0 = findType(WIN_SPECIES)
   for l_3_1 = 1, table.getn(l_3_0) do
      local l_3_4 = resolveTable(l_3_0[l_3_1].value)
      LUALOG(SYSERROR, "animal needs increased.")
      giveEntityBasicNeedTrouble(l_3_4, 0)
   end
   return 1
end

evaltrexneeds = function(l_4_arg0)
   if countType(WIN_SPECIES) > 0 and typeBasicNeedsSatisfied(WIN_SPECIES) == true then
      return 1
   end
   local l_4_1 = getCurrentMonth()
   if l_4_1 >= 1 and l_4_arg0.guestChallengeDino == nil then
      l_4_arg0.guestChallengeDino = true
      showRule("GuestA")
      genericokpanel(nil, "DinosaurZoo:DinosaurZooGuest1Overview")
   end
   return 0
end

completetrexneeds = function()
   showprimarygoals()
   return 1
end

evalFameA = function()
   if FAMEA_STARS * 2 <= getHalfStars() then
      return 1
   end
   return 0
end

evalFameB = function()
   if FAMEB_STARS * 2 <= getHalfStars() then
      return 1
   end
   return 0
end

evalFameC = function()
   if FAMEC_STARS * 2 <= getHalfStars() then
      return 1
   end
   return 0
end

completeFameA = function()
   showRule("FameB")
   giveCash(FAMEA_REWARD_AMOUNT)
   completeshowoverview()
   return 1
end

completeFameB = function()
   showRule("FameC")
   giveCash(FAMEB_REWARD_AMOUNT)
   completeshowoverview()
   return 1
end

completeFameC = function()
   showRule("TrexNeeds")
   giveCash(FAMEC_REWARD_AMOUNT)
   completeshowoverview()
   return 1
end

evalGuestA = function()
   if GUESTA_AMOUNT <= getNumGuests(-1) then
      return 1
   end
   return 0
end

evalGuestB = function()
   if GUESTB_AMOUNT <= getNumGuests(-1) then
      return 1
   end
   return 0
end

completeGuestA = function()
   genericokpanel(nil, "DinosaurZoo:DinosaurZooGuest1Success")
   showRule("GuestB")
   placeCratedObjectAtGate(GUESTA_REWARD)
   return 1
end

completeGuestB = function()
   genericokpanel(nil, "DinosaurZoo:DinosaurZooGuest2Success")
   placeCratedObjectAtGate(GUESTB_REWARD)
   return 1
end

completetotalwin = function()
   setuservar("DinosaurZooCampaignscenario1", "completed")
   showscenariowin("DinosaurZoo:DinosaurZooSuccessOverview")
   return 1
end


