include("scenario/scripts/misc.lua")
include("scenario/scripts/ui.lua")
include("scenario/scripts/entity.lua")
include("scenario/scripts/needs.lua")
include("scenario/scripts/economy.lua")
include("scenario/scripts/Shows.lua")
tagCaveman = function(l_1_arg0)
   local l_1_1 = tonumber(getglobalvar("numCavemenTagged"))
   if l_1_1 == nil then
      BFLOG("tagCaveman -- numTagged was nil setting to one")
      setglobalvar("numCavemenTagged", tostring(1))
   else
      BFLOG("tagCaveman -- incremented numTagged = " .. l_1_1 + 1)
      setglobalvar("numCavemenTagged", tostring(l_1_1 + 1))
   end
   return 
end


