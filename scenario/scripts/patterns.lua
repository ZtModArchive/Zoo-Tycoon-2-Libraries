keephappy = function()
   require("scenario/scripts/misc")
   if happytimer == nil then
      happytimer = getCurrentMonth()
      happytimerday = getCurrentTimeOfDay()
      BFLOG(SYSTRACE, "KeepHappy started.")
   end
   if happyover == nil then
      if allTypeBasicNeedsMet("TigerBengal") == false then
         BFLOG(SYSTRACE, "FAILED challenge.")
         happyover = 1
         -- Tried to add an 'end' here but it's incorrect
         local l_1_0 = getCurrentMonth()
         local l_1_1 = getCurrentTimeOfDay()
         local l_1_2 = happytimer + 6
         if l_1_2 <= l_1_0 and happytimerday <= l_1_1 then
            BFLOG(SYSTRACE, "Passed challenge!")
            happyover = 1
         end
         -- Tried to add an 'end' here but it's incorrect
end

reduceadmissionrefundsick = function()
   require("scenario/scripts/misc")
   if refundtimer == nil then
      refundtimer = getCurrentMonth()
      refundtimerday = getCurrentTimeOfDay()
      giveCash(5000)
      oldadmissionadult = getAdmissionPrice("adult_admission")
      oldadmissionchild = getAdmissionPrice("child_admission")
      setAdmissionPrice("adult_admission", oldadmissionadult / 2)
      setAdmissionPrice("child_admission", oldadmissionchild / 2)
      displayadmissionadult = oldadmissionadult / 2
      displayadmissionchild = oldadmissionchild / 2
      BFLOG(SYSTRACE, "Setting adult admission to: " .. displayadmissionadult .. ".")
      BFLOG(SYSTRACE, "Setting child admission to: " .. displayadmissionchild .. ".")
      BFLOG(SYSTRACE, "ReduceAdmissionRefundSick started.")
   end
   if refundover == nil then
      if areAnySick() == true then
         refundover = 1
         BFLOG(SYSTRACE, "Animal sick.  Challenge FAILED")
         -- Tried to add an 'end' here but it's incorrect
         local l_2_0 = getCurrentMonth()
         local l_2_1 = getCurrentTimeOfDay()
         local l_2_2 = refundtimer + 6
         if l_2_2 <= l_2_0 and refundtimerday <= l_2_1 then
            BFLOG(SYSTRACE, "Passed challenge!")
            setAdmissionPrice("adult_admission", oldadmissionadult)
            setAdmissionPrice("child_admission", oldadmissionchild)
            local l_2_3 = 0
            for l_2_4 = refundtimer, l_2_0 do
               l_2_3 = l_2_3 + getNumGuests(l_2_4)
            end
            BFLOG(SYSTRACE, "Total number of guests for refund: " .. l_2_3 .. ".")
            local l_2_4 = (l_2_3) * ((oldadmissionadult / 2 + oldadmissionchild / 2) / 2)
            giveCash(l_2_4)
            BFLOG(SYSTRACE, "Total refund: " .. l_2_4 .. ".")
            refundover = 1
         end
         -- Tried to add an 'end' here but it's incorrect
end


