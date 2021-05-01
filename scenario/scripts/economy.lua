include("scenario/scripts/ui.lua")
include("scenario/scripts/misc.lua")
include("scenario/scripts/entity.lua")
getIncome = function(l_1_arg0)
   local l_1_1 = queryObject("ZTEconomyMgr")
   if l_1_1 then
      local l_1_2 = l_1_1:ZT_GET_ZOO_INCOME(l_1_arg0)
      if l_1_2 ~= nil then
         return l_1_2
      end
   end
   return nil
end

getProfit = function(l_2_arg0)
   local l_2_1 = queryObject("ZTEconomyMgr")
   if l_2_1 then
      local l_2_2 = l_2_1:ZT_GET_ZOO_PROFIT(l_2_arg0)
      if l_2_2 ~= nil then
         return l_2_2
      end
   end
   return nil
end

howMuchCash = function()
   local l_3_0 = queryObject("ZTEconomyMgr")
   if l_3_0 then
      return l_3_0:ZT_GET_ZOO_CASH()
   end
   return nil
end

setCash = function(l_4_arg0)
   local l_4_1 = queryObject("ZTEconomyMgr")
   if l_4_1 then
      l_4_1:ZT_SET_ZOO_CASH(l_4_arg0)
   end
end

giveCashNoPopup = function(l_5_arg0)
   local l_5_1 = queryObject("ZTEconomyMgr")
   if l_5_1 then
      local l_5_2, l_5_3 = l_5_1:ZT_GENERIC_TRANSACTION, l_5_1
      local l_5_4
      l_5_2(l_5_3, l_5_4)
      l_5_4 = {_type = "BFStringFloatObj", string = "cash_grants", float = l_5_arg0}
   end
end

giveCash = function(l_6_arg0)
   local l_6_1 = queryObject("ZTEconomyMgr")
   if l_6_1 then
      local l_6_2, l_6_3 = l_6_1:ZT_GENERIC_TRANSACTION, l_6_1
      local l_6_4
      l_6_2(l_6_3, l_6_4)
      l_6_4 = {_type = "BFStringFloatObj", string = "cash_grants", float = l_6_arg0}
      l_6_2 = showgivecash
      l_6_3 = "Challengetext:GenericMoneyGrant"
      l_6_4 = l_6_arg0
      l_6_2(l_6_3, l_6_4)
   end
end

takeCash = function(l_7_arg0)
   local l_7_1 = queryObject("ZTEconomyMgr")
   if l_7_1 then
      local l_7_2, l_7_3 = l_7_1:ZT_GENERIC_TRANSACTION, l_7_1
      local l_7_4
      l_7_2(l_7_3, l_7_4)
      l_7_4 = {_type = "BFStringFloatObj", string = "remove_cash_grants", float = l_7_arg0}
      l_7_arg0 = 0 - l_7_arg0
      l_7_2 = showgivecash
      l_7_3 = "Challengetext:GenericMoneyLoss"
      l_7_4 = l_7_arg0
      l_7_2(l_7_3, l_7_4)
   end
end

takeCashNoPopup = function(l_8_arg0)
   local l_8_1 = queryObject("ZTEconomyMgr")
   if l_8_1 then
      local l_8_2, l_8_3 = l_8_1:ZT_GENERIC_TRANSACTION, l_8_1
      local l_8_4
      l_8_2(l_8_3, l_8_4)
      l_8_4 = {_type = "BFStringFloatObj", string = "remove_cash_grants", float = l_8_arg0}
   end
end

getAdmissionPrice = function(l_9_arg0)
   local l_9_1 = queryObject("ZTStatus")
   if l_9_1 then
      return l_9_1:ZT_GET_ADMISSION_PRICE(l_9_arg0)
   end
   BFLOG(SYSERROR, "Can't get ZTStatus")
   return nil
end

setAdmissionPrice = function(l_10_arg0, l_10_arg1)
   do
      local l_10_2
      local l_10_3 = queryObject("ZTStatus")
   end
   if l_10_3 then
end

getDonations = function(l_11_arg0)
   local l_11_1 = queryObject("ZTStatus")
   if l_11_1 then
      local l_11_2 = "Donate_" .. l_11_arg0
      return l_11_1:ZT_GET_DONATIONBYANIMALTYPE(l_11_2)
   else
      BFLOG(SYSTRACE, "Error querying ZTStatus")
   end
   return 0
end

getDonationsByEndangerment = function(l_12_arg0)
   local l_12_1 = queryObject("ZTStatus")
   if l_12_1 then
      return l_12_1:ZT_GET_DONATION_ENDANGERMENT(l_12_arg0)
   else
      BFLOG(SYSTRACE, "Error querying ZTStatus")
   end
   return 0
end

getDonationsAllAnimals = function()
   local l_13_0 = queryObject("ZTStatus")
   if l_13_0 then
      return l_13_0:ZT_GET_DONATION_ALLANIMALS()
   else
      BFLOG(SYSTRACE, "Error querying ZTStatus")
   end
   return 0
end

getCostByBinder = function(l_14_arg0)
   local l_14_1 = 0
   local l_14_2 = queryObject("ZTEconomyMgr")
   if l_14_2 then
      l_14_1 = l_14_2:ZT_GET_COST_BY_BINDER(l_14_arg0)
   else
      BFLOG(SYSTRACE, "error querying ZTEconomyMgr")
   end
   return l_14_1
end

cashCheat = function()
   giveCash(100000)
   return 1
end

getLifetimeEconomyInfo = function(l_16_arg0, l_16_arg1)
   local l_16_2 = queryObject("ZTEconomyMgr")
   if l_16_2 then
      local l_16_3, l_16_4 = l_16_2:ZT_GET_INFO, l_16_2
      local l_16_5
      return l_16_3(l_16_4, l_16_5)
      l_16_5 = {_type = "ZTEconomyInfo", period = "lifetime", category = l_16_arg0, type = l_16_arg1}
   end
end

getTotalDonations = function()
   return 0 + getDonationsAllAnimals() + getDonations("Education")
end


