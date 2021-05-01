include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
GUEST_GOAL = 100
GUEST_REWARD = 20
STAR_GOAL1 = 1
STAR_GOAL2 = 2
STAR_GOAL3 = 3
STAR_GOAL4 = 4
STAR_GOAL5 = 5
setinitialzoostate = function(l_1_arg0)
   completeshowoverview()
   return 1
end

evalOneStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL1) == 1 then
      return 1
   end
   return 0
end

completeOneStarShow = function()
   giveCash(10000)
   showRule("TwoStarGoal")
   completeshowoverview()
end

evalTwoStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL2) == 1 then
      return 1
   end
   return 0
end

completeTwoStarShow = function()
   giveCash(20000)
   showRule("ThreeStarGoal")
   completeshowoverview()
end

evalThreeStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL3) == 1 then
      return 1
   end
   return 0
end

completeThreeStarShow = function()
   giveCash(40000)
   showRule("FourStarGoal")
   completeshowoverview()
end

evalFourStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL4) == 1 then
      return 1
   end
   return 0
end

completeFourStarShow = function()
   giveCash(60000)
   showRule("FiveStarGoal")
   completeshowoverview()
end

evalFiveStarShow = function()
   if hasShowOfStarRatingX(STAR_GOAL5) == 1 then
      return 1
   end
   return 0
end

completeFiveStarShow = function()
   BFLOG(SYSTRACE, "WIN")
   setuservar("showcanopylock", "true")
   setuservar("MarineShowsCampaignscenario5", "completed")
   showscenariowin("MarineShowsCampaign:FiveStarShowSuccessOverview", nil)
end

evalShowAttendence = function()
   BFLOG(SYSTRACE, "**************** eval guest goal ****************")
   local l_12_0 = getOpenShows()
   if l_12_0 ~= nil then
      for l_12_1 = 1, table.getn(l_12_0) do
         local l_12_4 = resolveTable(l_12_0[l_12_1].value)
         if l_12_4 ~= nil and GUEST_GOAL <= getShowAttendace(l_12_4) then
            return 1
         end
      end
   end
   return 0
end

completeShowAttendence = function()
   giveGuests(GUEST_REWARD)
   completeshowoverview()
end


