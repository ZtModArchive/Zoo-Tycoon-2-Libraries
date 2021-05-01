include("scenario/scripts/tutorial.lua")
local l_0_0
local l_0_1
local l_0_2
l_0_2 = {x = 384, y = 200}
l_0_1 = {rulename = nil, panelPosition = l_0_2, heading = "Tutoriallabels:T1", body = nil, completion = "tutorial1:tutorial1_welcome", completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"scenariogoals"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = nil, heading = "tutorial1:goalpanelheading", body = "tutorial1:opengoalpanel", completion = nil, completiontextposition = nil, image = "scenariogoals", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {x = 384, y = 300}
l_0_2 = {x = 384, y = 200}
l_0_2 = {"goals layout", "close"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = nil, panelPosition = l_0_2, heading = "tutorial1:closegoalpanelheading", body = "tutorial1:closegoalpanel", completion = "tutorial1:opengoalpanelcompleted", completiontextposition = l_0_2, image = "scenariogoals", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {x = 384, y = 200}
l_0_2 = {x = 384, y = 200}
l_0_1 = {rulename = "scrollmap", panelPosition = l_0_2, heading = "tutorial1:cameracontrolscrollheading", body = "tutorial1:cameracontolscroll", completion = "tutorial1:cameracontolscrollcompleted", completiontextposition = l_0_2, image = nil, ring = nil, ringsize = nil}
l_0_2 = {"rotate background"}
l_0_2 = {w = 45, h = 90}
l_0_1 = {rulename = "zoommap", panelPosition = nil, heading = "tutorial1:cameracontrolzoomheading", body = "tutorial1:cameracontolzoom", completion = "tutorial1:cameracontolzoomcompleted", completiontextposition = nil, image = "zoom", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"rotate background"}
l_0_2 = {w = 105, h = 65}
l_0_1 = {rulename = "rotatemap", panelPosition = nil, heading = "tutorial1:cameracontrolrotateheading", body = "tutorial1:cameracontolrotate", completion = "tutorial1:cameracontolrotatecompleted", completiontextposition = nil, image = "rotate", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"firstperson"}
l_0_2 = {w = 70, h = 67}
l_0_1 = {rulename = "firstperson", panelPosition = nil, heading = "tutorial1:guestmodeheading", body = "tutorial1:guestmode", completion = "tutorial1:guestmodecompleted", completiontextposition = nil, image = "firstperson", ring = l_0_2, ringsize = l_0_2}
l_0_1 = {rulename = "superstaff", panelPosition = nil, heading = "tutorial1:superstaffheading", body = "tutorial1:superstaff", completion = "tutorial1:superstaffcompleted", completiontextposition = nil, image = nil, ring = nil}
l_0_2 = {"photo"}
l_0_2 = {w = 70, h = 67}
l_0_1 = {rulename = "photosafarimode", panelPosition = nil, heading = "tutorial1:photosafariheading", body = "tutorial1:photosafari", completion = "tutorial1:photosafaricompleted", completiontextposition = nil, image = "photosafari", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"overhead"}
l_0_2 = {w = 70, h = 67}
l_0_1 = {rulename = "returntooverheadmap", panelPosition = nil, heading = "tutorial1:overheadmapheading", body = "tutorial1:overheadmap", completion = nil, completiontextposition = nil, image = "overhead", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"overviewmap"}
l_0_2 = {w = 70, h = 67}
l_0_1 = {rulename = "mapoverview", panelPosition = nil, heading = "tutorial1:overviewmapheading", body = "tutorial1:overviewmap", completion = "tutorial1:overviewmapcompleted", completiontextposition = nil, image = "overviewmap", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {"overview", "return"}
l_0_2 = {w = 70, h = 67}
l_0_1 = {rulename = "mapoverviewclose", panelPosition = nil, heading = "tutorial1:overviewmapheading", body = "tutorial1:overviewmapclose", completion = nil, completiontextposition = nil, image = "overviewmap", ring = l_0_2, ringsize = l_0_2}
l_0_2 = {x = 384, y = 200}
l_0_1 = {rulename = "openzoopedia", panelPosition = l_0_2, heading = "tutorial1:zoopediaheading", body = "tutorial1:zoopedia", completion = nil, completiontextposition = nil, image = nil, ring = nil, ringsize = nil}
l_0_2 = {x = 384, y = 300}
l_0_2 = {"zoopedia layout", "return"}
l_0_2 = {w = 70, h = 70}
l_0_1 = {rulename = "closezoopedia", panelPosition = l_0_2, heading = "tutorial1:zoopediacloseheading", body = "tutorial1:zoopediaclose", completion = "tutorial1:zoopediaclosecompleted", completiontextposition = nil, image = "zoopedia", ring = l_0_2, ringsize = l_0_2}
ruledata, l_0_0 = l_0_0, {welcome1 = l_0_1, opengoals = l_0_1, closegoals = l_0_1, scrollmap = l_0_1, zoommap = l_0_1, rotatemap = l_0_1, firstperson = l_0_1, superstaff = l_0_1, photosafarimode = l_0_1, returntooverheadmap = l_0_1, mapoverview = l_0_1, mapoverviewclose = l_0_1, openzoopedia = l_0_1, closezoopedia = l_0_1}
l_0_0 = function(l_1_arg0)
   if disabletutorial1UIelements ~= nil then
      return 0
   end
   local l_1_1 = countType("frontgate_df")
   if l_1_1 <= 0 then
      return 0
   end
   local l_1_2 = queryObject("BFScenarioMgr")
   if l_1_2 == nil then
      return 0
   end
   setMaxFame(100)
   l_1_2:UI_DISABLE("filter_maximize")
   l_1_2:UI_DISABLE("Buy Animal Tab")
   l_1_2:UI_DISABLE("Adopt Animal Tab")
   l_1_2:UI_DISABLE("open zoo toggle button")
   l_1_2:UI_DISABLE("Primary Game Button Pointers")
   l_1_2:UI_DISABLE("Main Game Buttons")
   l_1_2:UI_DISABLE("Selection Buttons")
   l_1_2:UI_DISABLE("Zoom and Rotate")
   l_1_2:UI_DISABLE("multinfo button")
   l_1_2:UI_DISABLE("Zoofinance")
   l_1_2:UI_DISABLE("undo")
   l_1_2:UI_DISABLE("Photo Album")
   l_1_2:UI_DISABLE("delete")
   l_1_2:UI_DISABLE("Buy Area Container")
   l_1_2:UI_DISABLE("minimize")
   l_1_2:UI_DISABLE("awards")
   l_1_2:UI_DISABLE("TextButton Save")
   l_1_2:UI_DISABLE("TextButton Save Hover")
   l_1_2:UI_DISABLE("TextButton Load")
   l_1_2:UI_DISABLE("TextButton Load Hover")
   l_1_2:UI_HIDE("exit with save option")
   l_1_2:UI_SHOW("exit no save option")
   l_1_2:UI_HIDE("firstperson")
   l_1_2:UI_HIDE("photo")
   disabletutorial1UIelements = 1
   local l_1_3 = queryObject("UIRoot")
   if l_1_3 ~= nil then
      local l_1_4 = l_1_3:UI_GET_CHILD("Introduction tab")
      if l_1_4 then
         l_1_4:UI_ACTIVATE_OFF()
         l_1_4:UI_ACTIVATE_ON()
      end
      local l_1_5 = l_1_3:UI_GET_CHILD("goalpanel")
      if l_1_5 then
         l_1_5:ZT_AUTOPOPULATE_LIST()
      end
      local l_1_6 = l_1_3:UI_GET_CHILD("MainGUI")
      if l_1_6 then
         local l_1_7 = l_1_6:UI_GET_CHILD("animals")
         if l_1_7 then
            l_1_7:UI_ACTIVATE_ON()
         end
         local l_1_8 = l_1_6:UI_GET_CHILD("Animal Enrichment Tab")
         if l_1_8 then
            l_1_8:UI_ACTIVATE_ON()
         end
         if l_1_7 then
            l_1_7:UI_ACTIVATE_OFF()
         end
      end
      local l_1_7 = l_1_3:UI_GET_CHILD("Fence Tab")
      if l_1_7 ~= nil then
         l_1_7:UI_ACTIVATE_ON()
      end
   end
   return 1
end

setinitialtutorialstate = l_0_0
l_0_0 = function()
   initTutorialRuleInfo(ruledata.welcome1)
   return 1
end

welcome1 = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

welcome1success = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.opengoals)
      if ruledata.opengoals.rulename then
         showRule(ruledata.opengoals.rulename)
      end
   end
   if isVisibleByName("goalpanel") == true then
      return 1
   end
   return 0
end

opengoals = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

opengoalssuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.closegoals)
   end
   if isVisibleByName("goalpanel") == false then
      return 1
   end
   return 0
end

closegoals = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

closegoalssuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.scrollmap)
      showUI("Edge Arrow Layout", true)
      local l_8_0 = queryObject("UIRoot")
      if l_8_0 ~= nil then
         local l_8_1 = l_8_0:UI_GET_CHILD("Edge Arrow Layout")
         if l_8_1 ~= nil then
            l_8_1:UI_RAISE()
         end
      end
   end
   if scrollmap_oldx == nil then
      scrollmap_oldx = getCameraX()
      scrollmap_oldy = getCameraY()
   else
      local l_8_0 = getCameraX()
      local l_8_1 = getCameraY()
      if scrollmap_oldx + 5 < l_8_0 or l_8_0 < scrollmap_oldx - 5 then
         return 1
      end
      if scrollmap_oldy + 5 < l_8_1 or l_8_1 < scrollmap_oldy - 5 then
         return 1
      end
   end
   return 0
end

scrollmap = l_0_0
l_0_0 = function()
   showUI("Edge Arrow Layout", false)
   tutorialgoalcompleted()
   return 1
end

scrollmapsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.zoommap)
      local l_10_0 = queryObject("BFScenarioMgr")
      if l_10_0 then
         l_10_0:UI_ENABLE("Zoom In")
         l_10_0:UI_ENABLE("Zoom Out")
      end
   end
   if zoommap_old == nil then
      zoommap_old = getCameraZoom()
      BFLOG(SYSTRACE, "ZoomOld: " .. zoommap_old .. ".")
   else
      local l_10_0 = getCameraZoom()
      BFLOG(SYSTRACE, "Zoom: " .. l_10_0 .. ".")
      if zoommap_old + 1 < l_10_0 or l_10_0 < zoommap_old - 1 then
         return 1
      end
   end
   return 0
end

zoommap = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

zoommapsuccess = l_0_0
l_0_0 = function(l_12_arg0)
   local l_12_1 = queryObject("ZTWorldMgr")
   local l_12_2 = 0
   if l_12_1 ~= nil then
      l_12_2 = l_12_1:BFG_GET_CAMERA_YAW()
   end
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.rotatemap)
      local l_12_3 = queryObject("BFScenarioMgr")
      if l_12_3 then
         l_12_3:UI_ENABLE("Rotate Left")
         l_12_3:UI_ENABLE("Rotate Right")
      end
      l_12_arg0.rotation = l_12_2
   end
   if l_12_arg0.rotation ~= l_12_2 then
      return 1
   end
   return 0
end

rotatemap = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

rotatemapsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.firstperson)
      local l_14_0 = queryObject("BFScenarioMgr")
      if l_14_0 then
         l_14_0:UI_SHOW("firstperson")
      end
   end
   local l_14_0 = queryObject("UIRoot")
   if l_14_0 then
      local l_14_1 = l_14_0:UI_GET_CHILD("Camera Set")
      if l_14_1 then
         local l_14_2 = l_14_1:UI_GET_CHILD("firstperson")
         if l_14_2 then
            if isAlternate(l_14_2) == true then
               return 1
            else
               return 0
            end
         end
      end
   end
   return 0
end

firstperson = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

firstpersonsuccess = l_0_0
l_0_0 = function(l_16_arg0)
   local l_16_1 = 0
   local l_16_2 = findType("trashcontainer")
   local l_16_3 = table.getn(l_16_2)
   for l_16_4 = 1, l_16_3 do
      local l_16_7 = resolveTable(l_16_2[l_16_4].value)
      if l_16_7 ~= nil then
         l_16_1 = l_16_1 + l_16_7:BFG_GET_ATTR_FLOAT("f_TrashLevel")
      end
   end
   local l_16_4 = countType("TrashGround")
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.superstaff)
      l_16_arg0.trashcount = l_16_4
      l_16_arg0.trashcanlevel = l_16_1
      local l_16_5 = queryObject("ZTMode")
      if l_16_5 then
         l_16_5:sendMessage("UI_RBUTTONDOWN")
      end
   end
   if l_16_4 < l_16_arg0.trashcount or l_16_1 < l_16_arg0.trashcanlevel then
      return 1
   end
   if l_16_arg0.trashcanlevel == 0 then
      local l_16_5 = 0
      local l_16_6 = findType("trashcontainer")
      local l_16_7 = table.getn(l_16_6)
      for l_16_8 = 1, l_16_7 do
         local l_16_11 = resolveTable(l_16_6[l_16_8].value)
         if l_16_11 ~= nil then
            l_16_11:BFG_SET_ATTR_FLOAT("f_TrashLevel", 100)
            l_16_5 = l_16_5 + 100
         end
      end
      l_16_arg0.trashcanlevel = l_16_5
      BFLOG(SYSNOTE, "New Trash Level: " .. l_16_arg0.trashcanlevel)
   end
   return 0
end

superstaff = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

superstaffsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.photosafarimode)
      local l_18_0 = queryObject("BFScenarioMgr")
      if l_18_0 then
         l_18_0:UI_SHOW("photo")
      end
   end
   showUI("help2 screen", false)
   local l_18_0 = queryObject("UIRoot")
   if l_18_0 then
      local l_18_1 = l_18_0:UI_GET_CHILD("Camera Set")
      if l_18_1 then
         local l_18_2 = l_18_1:UI_GET_CHILD("photo")
         if l_18_2 then
            if isAlternate(l_18_2) == true then
               return 1
            else
               return 0
            end
         end
      end
   end
   return 0
end

photosafarimode = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

photosafarimodesuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.returntooverheadmap)
      local l_20_0 = queryObject("BFScenarioMgr")
      if l_20_0 then
         l_20_0:UI_ENABLE("overhead")
      end
   end
   local l_20_0 = queryObject("UIRoot")
   if l_20_0 then
      local l_20_1 = l_20_0:UI_GET_CHILD("Camera Set")
      if l_20_1 then
         local l_20_2 = l_20_1:UI_GET_CHILD("overhead")
         if l_20_2 then
            if isAlternate(l_20_2) == true then
               return 1
            else
               return 0
            end
         end
      end
   end
   return 0
end

returntooverheadmap = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

returntooverheadmapsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.mapoverview)
      local l_22_0 = queryObject("BFScenarioMgr")
      if l_22_0 then
         l_22_0:UI_ENABLE("overviewmap")
      end
   end
   local l_22_0 = queryObject("UIRoot")
   if l_22_0 then
      local l_22_1 = l_22_0:UI_GET_CHILD("overview")
      if l_22_1 then
         l_22_1 = l_22_1:UI_GET_CHILD("overview_screen")
         if isNormal(l_22_1) == true then
            return 1
         else
            return 0
         end
      end
   end
   return 0
end

mapoverview = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

mapoverviewsuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.mapoverviewclose)
   end
   if isVisibleByName("overview_screen") == false then
      return 1
   end
   return 0
end

mapoverviewclose = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

mapoverviewclosesuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.openzoopedia)
   end
   local l_26_0 = queryObject("UIRoot")
   if l_26_0 then
      local l_26_1 = l_26_0:UI_GET_CHILD("zoopedia layout")
      if l_26_1 then
         BFLOG("Got layout")
         element = l_26_1:UI_GET_CHILD("ztzoopedia")
         if element then
            BFLOG("Got element")
            if isVisible(element) == true then
               BFLOG("true")
               return 1
            else
               BFLOG("false")
               return 0
            end
         end
      end
   end
   return 0
end

openzoopedia = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

openzoopediasuccess = l_0_0
l_0_0 = function()
   if ruleinitialized == 0 then
      initTutorialRuleInfo(ruledata.closezoopedia)
   end
   if isVisibleByName("ztzoopedia") == false then
      return 1
   end
   return 0
end

closezoopedia = l_0_0
l_0_0 = function()
   tutorialgoalcompleted()
   return 1
end

closezoopediasuccess = l_0_0
l_0_0 = function()
   return 1
end

endscenario = l_0_0
l_0_0 = function()
   setuservar("Tutorial1", "completed")
   showtutorialwin("tutorial1:tutorial_1_complete", "Tutorial2")
   return 1
end

endscenariosuccess = l_0_0

