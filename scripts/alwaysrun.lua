include("scenario/scripts/awards.lua")
exec = function(l_1_arg0)
   local l_1_1 = queryObject("ZTStatus")
   if l_1_1 then
      local l_1_2 = l_1_1:ZT_GET_IS_CAMPAIGN()
      if l_1_2 == true then
         BFLOG("checking awards through alwaysrun.lua")
         checkawards(l_1_arg0)
         if l_1_arg0.hideAwardBonus == nil then
            local l_1_3 = queryObject("BFScenarioMgr")
            if l_1_3 ~= nil then
               l_1_3:UI_HIDE("award bonus")
               l_1_arg0.hideAwardBonus = 1
            end
         end
      end
   end
end


