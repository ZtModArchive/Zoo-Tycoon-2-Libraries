include("scenario/scripts/entity.lua")
isActivated = function(l_1_arg0)
   if l_1_arg0:UI_IS_ACTIVATED() == true then
      return true
   else
      return false
   end
end

isHighlighted = function(l_2_arg0)
   if l_2_arg0:UI_IS_HIGHLIGHTED() == true then
      return true
   else
      return false
   end
end

isNormal = function(l_3_arg0)
   if l_3_arg0:UI_IS_NORMAL() == true then
      return true
   else
      return false
   end
end

isAlternate = function(l_4_arg0)
   if l_4_arg0:UI_IS_ALTERNATE() == true then
      return true
   else
      return false
   end
end

isVisible = function(l_5_arg0)
   if l_5_arg0:UI_IS_HIDDEN() == false then
      return true
   else
      return false
   end
end

isNormalByName = function(l_6_arg0)
   local l_6_1 = queryObject("UIRoot")
   if l_6_1 then
      local l_6_2 = l_6_1:UI_GET_CHILD(l_6_arg0)
      if l_6_2 then
         if isNormal(l_6_2) == true then
            return true
         else
            return false
         end
      end
   end
   return nil
end

isActivatedByName = function(l_7_arg0)
   local l_7_1 = queryObject("UIRoot")
   if l_7_1 then
      local l_7_2 = l_7_1:UI_GET_CHILD(l_7_arg0)
      if l_7_2 then
         if isActivated(l_7_2) == true then
            return true
         else
            return false
         end
      end
   end
   return nil
end

isHighlightedByName = function(l_8_arg0)
   local l_8_1 = queryObject("UIRoot")
   if l_8_1 then
      local l_8_2 = l_8_1:UI_GET_CHILD(l_8_arg0)
      if l_8_2 then
         BFLOG(SYSTRACE, "Got element ok")
         if isHighlighted(l_8_2) == true then
            BFLOG(SYSTRACE, "true")
            return true
         else
            BFLOG(SYSTRACE, "false")
            return false
         end
      end
   end
   return nil
end

isAlternateByName = function(l_9_arg0)
   local l_9_1 = queryObject("UIRoot")
   if l_9_1 then
      local l_9_2 = l_9_1:UI_GET_CHILD(l_9_arg0)
      if l_9_2 then
         if isAlternate(l_9_2) == true then
            return true
         else
            return false
         end
      end
   end
   return nil
end

isVisibleByName = function(l_10_arg0)
   local l_10_1 = queryObject("UIRoot")
   if l_10_1 then
      local l_10_2 = l_10_1:UI_GET_CHILD(l_10_arg0)
      if l_10_2 then
         if isVisible(l_10_2) == true then
            return true
         else
            return false
         end
      end
   end
   return nil
end

isDisabledByName = function(l_11_arg0)
   local l_11_1 = queryObject("UIRoot")
   if l_11_1 then
      local l_11_2 = l_11_1:UI_GET_CHILD(l_11_arg0)
      if l_11_2 then
         if l_11_2:UI_IS_DISABLED() == true then
            return true
         else
            return false
         end
      end
   end
   return nil
end

showTutorialHeading = function(l_12_arg0)
   local l_12_1 = queryObject("ZTScenarioMgr")
   if l_12_1 then
      l_12_1:UI_SHOW("tutorial info")
   end
   local l_12_2 = queryObject("UIRoot")
   if l_12_2 then
      local l_12_3 = l_12_2:UI_GET_CHILD("tutorial info")
      if l_12_3 then
         local l_12_4 = l_12_3:UI_GET_CHILD("tutorial heading text")
         if l_12_4 then
            l_12_4:UI_SET_LOCID(l_12_arg0)
         end
      end
   end
end

showTutorialText = function(l_13_arg0)
   local l_13_1 = queryObject("ZTScenarioMgr")
   if l_13_1 then
      l_13_1:UI_SHOW("tutorial info")
   end
   local l_13_2 = queryObject("UIRoot")
   if l_13_2 then
      local l_13_3 = l_13_2:UI_GET_CHILD("tutorial info")
      if l_13_3 then
         local l_13_4 = l_13_3:UI_GET_CHILD("tutorial text")
         if l_13_4 then
            local l_13_5, l_13_6 = l_13_4:UI_SET_SIZE, l_13_4
            local l_13_7
            l_13_5(l_13_6, l_13_7)
            l_13_7 = {x = 525, y = 0}
            l_13_5, l_13_6 = l_13_4:UI_SET_LOCID, l_13_4
            l_13_7 = l_13_arg0
            l_13_5(l_13_6, l_13_7)
         end
      end
   end
end

showTutorialImage = function(l_14_arg0)
   local l_14_1 = queryObject("UIRoot")
   if l_14_1 == nil then
      return 
   end
   local l_14_2 = l_14_1:UI_GET_CHILD("tutorial info")
   if l_14_2 == nil then
      return 
   end
   l_14_2 = l_14_2:UI_GET_CHILD("tutorial image")
   if l_14_2 == nil then
      return 
   end
   if l_14_arg0 == nil then
      l_14_2:UI_SET_VALUE("blank")
   else
      l_14_2:UI_SET_VALUE(l_14_arg0)
   end
   local l_14_3 = l_14_2:UI_GET_PARENT()
   if l_14_3 ~= nil then
      local l_14_4 = l_14_3:UI_GET_SRC_RECT()
      local l_14_5 = l_14_2:UI_GET_IMAGE_SRC_RECT()
      local l_14_6 = l_14_5.w / l_14_5.h
      local l_14_7
      if l_14_5.h < l_14_5.w then
         l_14_7.h, l_14_7 = l_14_7.w / l_14_6, {x = 0, y = 0, w = 0, h = 0, w = l_14_4.w}
      else
         l_14_7.h = l_14_4.h
         l_14_7.w = l_14_7.h * l_14_6
      end
      l_14_7.x = (l_14_4.w - l_14_7.w) / 2
      local l_14_8, l_14_9 = l_14_2:UI_SET_POS, l_14_2
      local l_14_10
      l_14_8(l_14_9, l_14_10)
      l_14_10 = {x = l_14_7.x, y = l_14_7.y}
      l_14_8, l_14_9 = l_14_2:UI_SET_SIZE, l_14_2
      l_14_8(l_14_9, l_14_10)
      l_14_10 = {x = l_14_7.w, y = l_14_7.h}
   end
end

hideTutorialText = function()
   local l_15_0 = queryObject("UIRoot")
   if l_15_0 then
      local l_15_1 = l_15_0:UI_GET_CHILD("tutorial info")
      if l_15_1 then
         l_15_1:UI_HIDE()
      end
   end
end

showRule = function(l_16_arg0)
   local l_16_1 = queryObject("BFScenarioMgr")
   if l_16_1 then
      l_16_1:BFS_SHOWRULE(l_16_arg0)
   end
end

hideRule = function(l_17_arg0)
   local l_17_1 = queryObject("BFScenarioMgr")
   if l_17_1 then
      l_17_1:BFS_HIDERULE(l_17_arg0)
   end
end

turnRuleOn = function(l_18_arg0)
   local l_18_1 = queryObject("BFScenarioMgr")
   local l_18_2
   if l_18_1 then
      l_18_1:BFS_SETRULESTATE(l_18_2)
      l_18_2 = {_type = "BFScenarioAltTextData", rulename = l_18_arg0, rulestate = "neutral", ruletext = ""}
   end
end

turnRuleOff = function(l_19_arg0)
   local l_19_1 = queryObject("BFScenarioMgr")
   local l_19_2
   if l_19_1 then
      l_19_1:BFS_SETRULESTATE(l_19_2)
      l_19_2 = {_type = "BFScenarioAltTextData", rulename = l_19_arg0, rulestate = "off", ruletext = ""}
   end
end

UIenable = function(l_20_arg0)
   local l_20_1 = queryObject("BFScenarioMgr")
   if l_20_1 then
      l_20_1:UI_ENABLE(l_20_arg0)
   end
end

UIdisable = function(l_21_arg0)
   local l_21_1 = queryObject("BFScenarioMgr")
   if l_21_1 then
      l_21_1:UI_DISABLE(l_21_arg0)
   end
end

UIactivateOn = function(l_22_arg0)
   local l_22_1 = queryObject("UIRoot")
   if l_22_1 then
      local l_22_2 = l_22_1:UI_GET_CHILD(l_22_arg0)
      if l_22_2 then
         l_22_2:UI_ACTIVATE_ON()
      end
   end
end

UIactivateOff = function(l_23_arg0)
   local l_23_1 = queryObject("UIRoot")
   if l_23_1 then
      local l_23_2 = l_23_1:UI_GET_CHILD(l_23_arg0)
      if l_23_2 then
         l_23_2:UI_ACTIVATE_OFF()
      end
   end
end

showUI = function(l_24_arg0, l_24_arg1)
   local l_24_2 = queryObject("UIRoot")
   if l_24_2 then
      local l_24_3 = l_24_2:UI_GET_CHILD(l_24_arg0)
      if l_24_3 then
         if l_24_arg1 then
            l_24_3:UI_SHOW()
         else
            l_24_3:UI_HIDE()
         end
      end
   end
end

showchallengepanel = function(l_25_arg0)
   local l_25_1 = queryObject("UIRoot")
   if l_25_1 then
      local l_25_2 = l_25_1:UI_GET_CHILD("challenge layout")
      if l_25_2 then
         l_25_2:UI_SHOW()
         local l_25_3 = l_25_2:UI_GET_CHILD("challenge text")
         if l_25_3 then
            l_25_3:UI_SET_LOCID(l_25_arg0)
         end
      end
   end
   BFLOG(SYSTRACE, "Show challenge panel")
end

showinstantchallengepanel = function(l_26_arg0)
   local l_26_1 = queryObject("UIRoot")
   if l_26_1 then
      local l_26_2 = l_26_1:UI_GET_CHILD("instant challenge layout")
      if l_26_2 then
         l_26_2:UI_SHOW()
         local l_26_3 = l_26_2:UI_GET_CHILD("instant challenge description text")
         if l_26_3 then
            l_26_3:UI_SET_LOCID("Challengetext:CHInstantChallengeWelcome")
         end
         local l_26_4 = l_26_2:UI_GET_CHILD("instant challenge text")
         if l_26_4 then
            l_26_4:UI_SET_LOCID(l_26_arg0)
         end
      end
   end
end

showbranchpanel = function(l_27_arg0, l_27_arg1, l_27_arg2)
   local l_27_3 = queryObject("UIRoot")
   if l_27_3 then
      local l_27_4 = l_27_3:UI_GET_CHILD("branch layout")
      if l_27_4 then
         l_27_4:UI_SHOW()
         local l_27_5 = l_27_4:UI_GET_CHILD("branch text")
         if l_27_5 then
            l_27_5:UI_SET_LOCID(l_27_arg0)
         end
         local l_27_6 = l_27_4:UI_GET_CHILD("PathA text")
         if l_27_6 then
            l_27_6:UI_SET_LOCID(l_27_arg1)
         end
         local l_27_7 = l_27_4:UI_GET_CHILD("PathB text")
         if l_27_7 then
            l_27_7:UI_SET_LOCID(l_27_arg2)
         end
      end
   end
end

showinstantchallengepaneltext = function(l_28_arg0)
   local l_28_1 = queryObject("UIRoot")
   if l_28_1 then
      local l_28_2 = l_28_1:UI_GET_CHILD("instant challenge layout")
      if l_28_2 then
         l_28_2:UI_SHOW()
         local l_28_3 = l_28_2:UI_GET_CHILD("instant challenge description text")
         if l_28_3 then
            l_28_3:UI_SET_LOCID("Challengetext:CHInstantChallengeWelcome")
         end
         local l_28_4 = l_28_2:UI_GET_CHILD("instant challenge text")
         if l_28_4 then
            l_28_4:UI_SET_TEXT(l_28_arg0)
         end
      end
   end
end

showchallengepaneltext = function(l_29_arg0)
   local l_29_1 = queryObject("UIRoot")
   if l_29_1 then
      local l_29_2 = l_29_1:UI_GET_CHILD("challenge layout")
      if l_29_2 then
         l_29_2:UI_SHOW()
         local l_29_3 = l_29_2:UI_GET_CHILD("challenge text")
         if l_29_3 then
            l_29_3:UI_SET_TEXT(l_29_arg0)
         end
      end
   end
   BFLOG(SYSTRACE, "Show challenge panel")
end

completeshowoverview = function()
   local l_30_0 = queryObject("UIRoot")
   if l_30_0 then
      local l_30_1 = l_30_0:UI_GET_CHILD("goalpanel")
      if l_30_1 then
         l_30_1:ZT_AUTOPOPULATE_LIST()
      end
      local l_30_2 = l_30_0:UI_GET_CHILD("Introduction tab")
      if l_30_2 then
         l_30_2:UI_REPRESS()
         l_30_2:UI_ACTIVATE_OFF()
         l_30_2:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Show overview")
   showUI("goals layout", true)
end

showprimarygoals = function()
   local l_31_0 = queryObject("UIRoot")
   if l_31_0 then
      local l_31_1 = l_31_0:UI_GET_CHILD("show all goals")
      if l_31_1 then
         l_31_1:UI_ACTIVATE_ON()
      end
      local l_31_2 = l_31_0:UI_GET_CHILD("goalpanel")
      if l_31_2 then
         l_31_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_31_3 = l_31_0:UI_GET_CHILD("primary goals tab")
      if l_31_3 then
         l_31_3:UI_ACTIVATE_OFF()
         l_31_3:UI_REPRESS()
         l_31_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Show primary page")
   showUI("goals layout", true)
end

showsecondarygoals = function()
   local l_32_0 = queryObject("UIRoot")
   if l_32_0 then
      local l_32_1 = l_32_0:UI_GET_CHILD("show all goals")
      if l_32_1 then
         l_32_1:UI_ACTIVATE_ON()
      end
      local l_32_2 = l_32_0:UI_GET_CHILD("goalpanel")
      if l_32_2 then
         l_32_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_32_3 = l_32_0:UI_GET_CHILD(" secondary tab ")
      if l_32_3 then
         l_32_3:UI_ACTIVATE_OFF()
         l_32_3:UI_REPRESS()
         l_32_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Show secondary page")
   showUI("goals layout", true)
end

showphotogoals = function()
   local l_33_0 = queryObject("UIRoot")
   if l_33_0 then
      local l_33_1 = l_33_0:UI_GET_CHILD("show all goals")
      if l_33_1 then
         l_33_1:UI_ACTIVATE_ON()
      end
      local l_33_2 = l_33_0:UI_GET_CHILD("goalpanel")
      if l_33_2 then
         l_33_2:ZT_AUTOPOPULATE_LIST()
      end
      local l_33_3 = l_33_0:UI_GET_CHILD("photo challenges tab")
      if l_33_3 then
         l_33_3:UI_ACTIVATE_OFF()
         l_33_3:UI_REPRESS()
         l_33_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Show photo page")
   showUI("goals layout", true)
end

showscenariowin = function(l_34_arg0, l_34_arg1)
   if l_34_arg1 ~= nil then
      setglobalvar("nextScenario", l_34_arg1)
   end
   local l_34_2 = queryObject("ZTMode")
   if l_34_2 ~= nil then
      l_34_2:sendMessage("ZT_SETMODE", "mode_overhead")
   end
   local l_34_3 = queryObject("UIRoot")
   if l_34_3 then
      local l_34_4 = l_34_3:UI_GET_CHILD("Scenario Win  Layout")
      if l_34_4 then
         l_34_4:UI_SHOW()
         local l_34_5 = l_34_4:UI_GET_CHILD("challenge text")
         if l_34_5 then
            l_34_5:UI_SET_LOCID(l_34_arg0)
         end
         local l_34_6 = l_34_4:UI_GET_CHILD("play next")
         if l_34_6 then
            if l_34_arg1 == nil then
               l_34_6:UI_HIDE()
            else
               l_34_6:UI_SHOW()
            end
         else
            BFLOG(SYSTRACE, "Couldn't open Scenario Win Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         saveOptions()
         processVince("scenariowin")
end

showscenariofail = function(l_35_arg0, l_35_arg1)
   local l_35_2 = queryObject("ZTMode")
   if l_35_2 ~= nil then
      l_35_2:sendMessage("ZT_SETMODE", "mode_overhead")
   end
   setglobalvar("nextScenario", l_35_arg1)
   local l_35_3 = queryObject("UIRoot")
   if l_35_3 then
      local l_35_4 = l_35_3:UI_GET_CHILD("Scenario Failed Layout")
      if l_35_4 then
         l_35_4:UI_SHOW()
         local l_35_5 = l_35_4:UI_GET_CHILD("challenge text")
         if l_35_5 then
            l_35_5:UI_SET_LOCID(l_35_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't open Scenario Fail Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         processVince("scenariofail")
end

showscenariofailtext = function(l_36_arg0, l_36_arg1)
   local l_36_2 = queryObject("ZTMode")
   if l_36_2 ~= nil then
      l_36_2:sendMessage("ZT_SETMODE", "mode_overhead")
   end
   setglobalvar("nextScenario", l_36_arg1)
   local l_36_3 = queryObject("UIRoot")
   if l_36_3 then
      local l_36_4 = l_36_3:UI_GET_CHILD("Scenario Failed Layout")
      if l_36_4 then
         l_36_4:UI_SHOW()
         local l_36_5 = l_36_4:UI_GET_CHILD("challenge text")
         if l_36_5 then
            l_36_5:UI_SET_TEXT(l_36_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't open Scenario Fail Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         processVince("scenariofail")
end

showtutorialwin = function(l_37_arg0, l_37_arg1)
   if l_37_arg1 ~= nil then
      setglobalvar("nextScenario", l_37_arg1)
   end
   local l_37_2 = queryObject("UIRoot")
   if l_37_2 then
      local l_37_3 = l_37_2:UI_GET_CHILD("tutorial complete")
      if l_37_3 then
         l_37_3:UI_SHOW()
         local l_37_4 = l_37_3:UI_GET_CHILD("challenge text")
         if l_37_4 then
            l_37_4:UI_SET_LOCID(l_37_arg0)
         end
         local l_37_5 = l_37_3:UI_GET_CHILD("play next")
         if l_37_5 then
            if l_37_arg1 == nil then
               l_37_5:UI_HIDE()
            else
               l_37_5:UI_SHOW()
            end
         else
            BFLOG(SYSTRACE, "Couldn't open tutorial win layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         saveOptions()
         processVince("scenariowin")
end

showchallengewin = function(l_38_arg0)
   local l_38_1 = queryObject("UIRoot")
   if l_38_1 then
      local l_38_2 = l_38_1:UI_GET_CHILD("Challenge Won Layout")
      if l_38_2 then
         l_38_2:UI_SHOW()
         local l_38_3 = l_38_2:UI_GET_CHILD("challenge text")
         if l_38_3 then
            l_38_3:UI_SET_LOCID(l_38_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't get challenge text")
         end
      else
         BFLOG(SYSTRACE, "Couldn't open Challenge Win Layout")
      end
      -- Tried to add an 'end' here but it's incorrect
   end
   processVince("scenariowin")
end

genericokpanel = function(l_39_arg0, l_39_arg1)
   local l_39_2 = queryObject("UIRoot")
   if l_39_2 then
      local l_39_3 = l_39_2:UI_GET_CHILD("Generic OK Layout")
      if l_39_3 then
         l_39_3:UI_SHOW()
         local l_39_4 = l_39_3:UI_GET_CHILD("Generic OK text")
         if l_39_4 then
            l_39_4:UI_SET_LOCID(l_39_arg1)
         end
         local l_39_5 = l_39_3:UI_GET_CHILD("Generic OK label")
         if l_39_5 and l_39_arg0 then
            l_39_5:UI_SET_LOCID(l_39_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't open Generic OK Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
end

genericokpaneltext = function(l_40_arg0, l_40_arg1)
   local l_40_2 = queryObject("UIRoot")
   if l_40_2 then
      local l_40_3 = l_40_2:UI_GET_CHILD("Generic OK Layout")
      if l_40_3 then
         l_40_3:UI_SHOW()
         local l_40_4 = l_40_3:UI_GET_CHILD("Generic OK text")
         if l_40_4 then
            l_40_4:UI_SET_TEXT(l_40_arg1)
         else
            BFLOG(SYSERROR, "Couldn't find the Generic OK text")
         end
         local l_40_5 = l_40_3:UI_GET_CHILD("Generic OK label")
         if l_40_5 and l_40_arg0 then
            l_40_5:UI_SET_LOCID(l_40_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't open Generic OK Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
end

showchallengewintext = function(l_41_arg0)
   local l_41_1 = queryObject("UIRoot")
   if l_41_1 then
      local l_41_2 = l_41_1:UI_GET_CHILD("Challenge Won Layout")
      if l_41_2 then
         l_41_2:UI_SHOW()
         local l_41_3 = l_41_2:UI_GET_CHILD("challenge text")
         if l_41_3 then
            BFLOG(SYSTRACE, "UI_SET_TEXT()")
            BFLOG(SYSTRACE, "val: " .. l_41_arg0)
            l_41_3:UI_SET_TEXT(l_41_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't get challenge text")
         end
      else
         BFLOG(SYSTRACE, "Couldn't open Challenge Win Layout")
      end
      -- Tried to add an 'end' here but it's incorrect
   end
   processVince("scenariowin")
end

showchallengefail = function(l_42_arg0)
   local l_42_1 = queryObject("UIRoot")
   if l_42_1 then
      local l_42_2 = l_42_1:UI_GET_CHILD("Challenge Failed Layout")
      if l_42_2 then
         l_42_2:UI_SHOW()
         local l_42_3 = l_42_2:UI_GET_CHILD("challenge text")
         if l_42_3 then
            l_42_3:UI_SET_LOCID(l_42_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't get challenge text")
         end
      else
         BFLOG(SYSTRACE, "Couldn't open Challenge Fail Layout")
      end
      -- Tried to add an 'end' here but it's incorrect
   end
   processVince("scenariofail")
end

showchallengefailtext = function(l_43_arg0)
   local l_43_1 = queryObject("UIRoot")
   if l_43_1 then
      local l_43_2 = l_43_1:UI_GET_CHILD("Challenge Failed Layout")
      if l_43_2 then
         l_43_2:UI_SHOW()
         local l_43_3 = l_43_2:UI_GET_CHILD("challenge text")
         if l_43_3 then
            l_43_3:UI_SET_TEXT(l_43_arg0)
         else
            BFLOG(SYSTRACE, "Couldn't get challenge text")
         end
      else
         BFLOG(SYSTRACE, "Couldn't open Challenge Failed Layout")
      end
      -- Tried to add an 'end' here but it's incorrect
   end
   processVince("scenariofail")
end

showgivecash = function(l_44_arg0, l_44_arg1)
   BFLOG(SYSTRACE, "showgivecash")
   local l_44_2 = queryObject("UIRoot")
   if l_44_2 then
      local l_44_3 = l_44_2:UI_GET_CHILD("Grant Layout")
      if l_44_3 then
         l_44_3:UI_SHOW()
         local l_44_4 = l_44_3:UI_GET_CHILD("challenge text")
         if l_44_4 then
            l_44_4:UI_SET_LOCID(l_44_arg0)
         end
         local l_44_5 = l_44_3:UI_GET_CHILD("zoo_bucks_display")
         if l_44_5 then
            BFLOG(SYSTRACE, "Setting zoo bucks")
            l_44_5:UI_SET_VALUE(l_44_arg1)
         else
            BFLOG(SYSTRACE, "Couldn't open Challenge Fail Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
end

showawardpanel = function()
   local l_45_0 = queryObject("UIRoot")
   if l_45_0 then
      local l_45_1 = l_45_0:UI_GET_CHILD("zoo status")
      local l_45_2 = l_45_0:UI_GET_CHILD("awards tab")
      if l_45_2 then
         l_45_2:UI_ACTIVATE_OFF()
         l_45_2:UI_REPRESS()
         l_45_2:UI_ACTIVATE_ON()
      end
      local l_45_3 = l_45_0:UI_GET_CHILD("current game")
      if l_45_3 then
         l_45_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Show award page")
   showUI("zoo status layout", true)
end

showpersistentawardpanel = function()
   local l_46_0 = queryObject("UIRoot")
   if l_46_0 then
      local l_46_1 = l_46_0:UI_GET_CHILD("zoo status")
      local l_46_2 = l_46_0:UI_GET_CHILD("awards tab")
      if l_46_2 then
         l_46_2:UI_ACTIVATE_OFF()
         l_46_2:UI_REPRESS()
         l_46_2:UI_ACTIVATE_ON()
      end
      local l_46_3 = l_46_0:UI_GET_CHILD("persistent game")
      if l_46_3 then
         l_46_3:UI_ACTIVATE_ON()
      end
   end
   BFLOG(SYSTRACE, "Show award page")
   showUI("zoo status layout", true)
end

playSound = function(l_47_arg0)
   local l_47_1 = queryObject("UIRoot")
   if l_47_1 then
      BFLOG(SYSTRACE, "playing sound: " .. l_47_arg0 .. ".")
      l_47_1:UI_PLAY_SOUND(l_47_arg0)
   end
end

setAltText = function(l_48_arg0, l_48_arg1, l_48_arg2)
   local l_48_3 = queryObject("BFScenarioMgr")
   if l_48_3 then
      local l_48_4
      l_48_3:BFS_SETALTTEXT(l_48_4)
      l_48_4 = {_type = "BFScenarioAltTextData", rulename = l_48_arg0, rulestate = l_48_arg1, ruletext = l_48_arg2}
      BFLOG(SYSTRACE, "alt text set")
   end
end

setRuleState = function(l_49_arg0, l_49_arg1)
   local l_49_2 = queryObject("BFScenarioMgr")
   if l_49_2 then
      local l_49_3
      l_49_2:BFS_SETRULESTATE(l_49_3)
      l_49_3 = {_type = "BFScenarioAltTextData", rulename = l_49_arg0, rulestate = l_49_arg1, ruletext = ""}
      BFLOG(SYSTRACE, "rule state set")
   end
end

getRuleState = function(l_50_arg0)
   local l_50_1 = queryObject("BFScenarioMgr")
   if l_50_1 then
      local l_50_2 = l_50_1:BFS_GETRULESTATE(l_50_arg0)
      if l_50_2 then
         BFLOG(SYSTRACE, "Rule: " .. l_50_arg0 .. " State: " .. l_50_2)
         return l_50_2
      end
   end
end

setAltOverviewText = function(l_51_arg0, l_51_arg1, l_51_arg2)
   local l_51_3 = queryObject("BFScenarioMgr")
   if l_51_3 then
      local l_51_4
      l_51_3:BFS_SETALTOVERVIEWTEXT(l_51_4)
      l_51_4 = {_type = "BFScenarioAltTextData", rulename = l_51_arg0, rulestate = l_51_arg1, ruletext = l_51_arg2}
      BFLOG(SYSTRACE, "alt text set")
   end
end

waitForScenarioWinClose = function()
   if isVisibleByName("Scenario Win  Layout") then
      BFLOG(SYSTRACE, "The Win Layout is still visible")
      return 0
   else
      BFLOG(SYSTRACE, "The Win Layout has been shut")
      return 1
   end
end

disableAnimalAdoption = function()
   local l_53_0 = queryObject("BFScenarioMgr")
   if l_53_0 then
      l_53_0:UI_DISABLE("Buy Animal Tab")
      l_53_0:UI_DISABLE("Adopt Animal Tab")
      local l_53_1 = queryObject("UIRoot")
      if l_53_1 then
         local l_53_2 = l_53_1:UI_GET_CHILD("Animal Food Tab")
         if l_53_2 then
            l_53_2:UI_ACTIVATE_ON()
         end
      end
      local l_53_2 = queryObject("ZTMode")
      if l_53_2 then
         l_53_2:sendMessage("ZT_SETMODE", "mode_selection")
         l_53_2:sendMessage("UI_LBUTTONDOWN")
         l_53_2:sendMessage("UI_RBUTTONDOWN")
      end
   end
end

enableAnimalAdoption = function()
   local l_54_0 = queryObject("BFScenarioMgr")
   if l_54_0 then
      l_54_0:UI_ENABLE("Buy Animal Tab")
      l_54_0:UI_ENABLE("Adopt Animal Tab")
   end
end

disableAdmissions = function()
   local l_55_0 = queryObject("BFScenarioMgr")
   if l_55_0 then
      BFLOG(SYSNOTE, "Disabling UI")
      l_55_0:UI_DISABLE("Admission Price Cheap")
      l_55_0:UI_DISABLE("Admission Price Moderate")
      l_55_0:UI_DISABLE("Admission Price Expensive")
   end
end

enableAdmissions = function(l_56_arg0)
   local l_56_1 = queryObject("BFScenarioMgr")
   if l_56_1 then
      BFLOG(SYSNOTE, "Enable UI")
      l_56_1:UI_ENABLE("Admission Price Cheap")
      l_56_1:UI_ENABLE("Admission Price Moderate")
      l_56_1:UI_ENABLE("Admission Price Expensive")
   end
   if l_56_arg0 then
      local l_56_2 = queryObject("UIRoot")
      if l_56_2 then
         if l_56_arg0 == 10 then
            local l_56_3 = l_56_2:UI_GET_CHILD("Admission Price Cheap")
            l_56_3:UI_ACTIVATE_ON()
         elseif l_56_arg0 == 20 then
            local l_56_3 = l_56_2:UI_GET_CHILD("Admission Price Moderate")
            l_56_3:UI_ACTIVATE_ON()
         else
            local l_56_3 = l_56_2:UI_GET_CHILD("Admission Price Expensive")
            l_56_3:UI_ACTIVATE_ON()
         end
      end
   end
end

showscenariowintext = function(l_57_arg0, l_57_arg1)
   if l_57_arg1 ~= nil then
      setglobalvar("nextScenario", l_57_arg1)
   end
   local l_57_2 = queryObject("ZTMode")
   if l_57_2 ~= nil then
      BFLOG(SYSTRACE, "Placing an entity")
      l_57_2:sendMessage("ZT_SETMODE", "mode_overhead")
   end
   local l_57_3 = queryObject("UIRoot")
   if l_57_3 then
      local l_57_4 = l_57_3:UI_GET_CHILD("Scenario Win  Layout")
      if l_57_4 then
         l_57_4:UI_SHOW()
         local l_57_5 = l_57_4:UI_GET_CHILD("challenge text")
         if l_57_5 then
            l_57_5:UI_SET_TEXT(l_57_arg0)
         end
         local l_57_6 = l_57_4:UI_GET_CHILD("play next")
         if l_57_6 then
            if l_57_arg1 == nil then
               l_57_6:UI_HIDE()
            else
               l_57_6:UI_SHOW()
            end
         else
            BFLOG(SYSTRACE, "Couldn't open Scenario Win Layout")
         end
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         -- Tried to add an 'end' here but it's incorrect
         saveOptions()
         processVince("scenariowin")
end

doubleAdoptChance = function(l_58_arg0)
   local l_58_1 = string.find(l_58_arg0, "_Adult_M")
   if l_58_1 == nil then
      l_58_arg0 = l_58_arg0 .. "_Adult_M"
   end
   local l_58_2 = queryObject("ZTAdoptionMgr")
   if l_58_2 ~= nil then
      local l_58_3 = l_58_2:ZT_DOUBLE_SPECIES_ADOPTPANEL_MULTIPLIER(l_58_arg0)
      local l_58_4 = BFASSERT
      l_58_4(l_58_3 == true)
   else
      BFLOG(SYSERROR, "***** Can't locate ZTAdoptionMgr! *****")
   end
end

halveAdoptChance = function(l_59_arg0)
   local l_59_1 = string.find(l_59_arg0, "_Adult_M")
   if l_59_1 == nil then
      l_59_arg0 = l_59_arg0 .. "_Adult_M"
   end
   local l_59_2 = queryObject("ZTAdoptionMgr")
   if l_59_2 ~= nil then
      local l_59_3 = l_59_2:ZT_HALVE_SPECIES_ADOPTPANEL_MULTIPLIER(l_59_arg0)
      local l_59_4 = BFASSERT
      l_59_4(l_59_3 == true)
   else
      BFLOG(SYSERROR, "***** Can't locate ZTAdoptionMgr! *****")
   end
end

resetAdoptChance = function(l_60_arg0)
   local l_60_1 = string.find(l_60_arg0, "_Adult_M")
   if l_60_1 == nil then
      l_60_arg0 = l_60_arg0 .. "_Adult_M"
   end
   local l_60_2 = queryObject("ZTAdoptionMgr")
   if l_60_2 ~= nil then
      local l_60_3 = l_60_2:ZT_HALVE_SPECIES_ADOPTPANEL_MULTIPLIER(l_60_arg0)
      local l_60_4 = BFASSERT
      l_60_4(l_60_3 == true)
   else
      BFLOG(SYSERROR, "***** Can't locate ZTAdoptionMgr! *****")
   end
end

startFlash = function()
   BFLOG("Flash started")
   showUI("Screen Flash", true)
   showUI("Screen Flash Opaque", true)
   playSound("powersurge")
   return 0
end

stopFlash = function()
   BFLOG("Flash stopped")
   showUI("Screen Flash Opaque", false)
   showUI("Screen Flash", false)
   return 0
end

enableEyedropper = function()
   local l_63_0 = queryObject("ZTMode")
   if l_63_0 then
      l_63_0:sendMessage("ZT_SETMODE", "mode_selection")
      l_63_0:sendMessage("ZT_ENABLE_TUTORIAL_EYEDROPPER", false)
   end
end

disableEyedropper = function()
   local l_64_0 = queryObject("ZTMode")
   if l_64_0 then
      l_64_0:sendMessage("ZT_SETMODE", "mode_selection")
      l_64_0:sendMessage("ZT_ENABLE_TUTORIAL_EYEDROPPER", true)
   end
end

disableAllPanelButtons = function(l_65_arg0)
   local l_65_1 = getComponent
   local l_65_2 = {"Fence Panel", l_65_arg0}
   l_65_1 = l_65_1(l_65_2)
   if l_65_1 ~= nil then
      l_65_2(l_65_1)
      l_65_2 = l_65_1:UI_DISABLE
   end
   l_65_2 = getComponent
   local l_65_3 = {"Animal Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Guest Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Enrichment Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Food Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Tree Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Plant Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Rocks Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Scenery Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Commerce Building Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Building Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Dino Recovery Building Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Breeding Center Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Donation Box Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Trash Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Keeper Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"MW Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Educator Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Path Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Crate Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Egg Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Station Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Vehicle Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Crated entity Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Show Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Trainer Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Tank Filter Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"MC Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Training Area Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Entertainer Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Cloning Center Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Fossil Education Center Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
   l_65_2 = getComponent
   l_65_3 = {"Staff Info", l_65_arg0}
   l_65_2 = l_65_2(l_65_3)
   l_65_1 = l_65_2
   if l_65_1 ~= nil then
      l_65_2, l_65_3 = l_65_1:UI_DISABLE, l_65_1
      l_65_2(l_65_3)
   end
end

getCurrentModeName = function()
   local l_66_0 = queryObject("ZTMode")
   if l_66_0 then
      local l_66_1 = l_66_0:sendMessage("ZT_GET_CURRENT_MODE_NAME")
      BFLOG("current mode is : " .. l_66_1)
      return l_66_1
   end
end

isCurrentMode = function(l_67_arg0)
   local l_67_1 = queryObject("ZTMode")
   if l_67_1 then
      local l_67_2 = l_67_1:sendMessage("ZT_GET_CURRENT_MODE_NAME")
      BFLOG("mode we want is : " .. l_67_arg0)
      BFLOG("current mode is : " .. l_67_2)
      if l_67_arg0 == l_67_2 then
         return true
      end
   end
   return false
end

coverUndoButton = function()
   local l_68_0 = getComponent
   local l_68_1 = {"undo back"}
   l_68_0 = l_68_0(l_68_1)
   if l_68_0 ~= nil then
      l_68_1(l_68_0)
      l_68_1 = l_68_0:UI_SHOW
   end
end

disableSaveGameButton = function()
   local l_69_0 = getComponent
   local l_69_1 = {"save current game", "save_button"}
   l_69_0 = l_69_0(l_69_1)
   if l_69_0 ~= nil then
      l_69_1(l_69_0)
      l_69_1 = l_69_0:UI_DISABLE
   end
end

disableAnimalOperations = function()
   local l_70_0 = findTypeDirect("animal")
   local l_70_1 = table.getn(l_70_0)
   BFLOG("Disabling adoption, release, and crate for " .. l_70_1 .. " animals.")
   for l_70_2 = 1, l_70_1 do
      local l_70_5 = resolveTable(l_70_0[l_70_2].value)
      if l_70_5 ~= nil then
         l_70_5:BFG_SET_ATTR_BOOLEAN("b_showAdopt", false)
         l_70_5:BFG_SET_ATTR_BOOLEAN("b_showRelease", false)
         l_70_5:BFG_SET_ATTR_BOOLEAN("b_showCrate", false)
      end
   end
end


