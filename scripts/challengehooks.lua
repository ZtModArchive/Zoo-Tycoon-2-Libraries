include("scenario/scripts/misc.lua")
include("photo/testscoring.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/awards.lua")
GetChallenge = function(l_1_arg0)
   local l_1_1 = table.getn(l_1_arg0)
   if l_1_1 < 1 then
      BFLOG(SYSERROR, "No args specified!")
      return nil
   end
   BFLOG(SYSTRACE, "Trying to launch " .. l_1_arg0[1].value .. " challenge")
   local l_1_2 = queryObject("BFScenarioMgr")
   if l_1_2 then
      l_1_2:BFS_ADDSCENARIO("scenario/goals/challenge/" .. l_1_arg0[1].value .. ".xml")
      return 1
   end
end


