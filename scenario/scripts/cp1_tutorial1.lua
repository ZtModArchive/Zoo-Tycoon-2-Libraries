
-- lua file for tutorial
include "scenario/scripts/tutorial.lua"
include "scenario/scripts/awards.lua"

--rule data defines locids and images to populate the tutorial panel and goal panel for each rule
--	'rulename' -> the name of the rule do display in the goal panel
--	'panelPosition' -> the location on screen of where the tutorial panel should go. Set to nil to use default position
--	'heading' -> the locid for the heading used in the tutorial panel
--	'body' -> the locid used for the body of text used in the tutorial panel
--	'completion' -> the locid used for tutorial goal completion
--	'image' -> the image used for the tutorial panel. To find the image definitions see data/ui/layout/challenge.xml 
--		and search for a component named 'tutorial image'. This component contains all the image definitions in a 
--		node called 'images'. Use the value in the key field as the parameter to define the image
--	'ring' the rectangle of the area of interest for a given rule.

ruledata = {

	welcome = {
		rulename = nil,
		panelPosition = nil,
		heading = "Tutoriallabels:cp1_T1",
		body = nil,
		completion = "cp1_tutorial1:welcome",
		completiontextposition = nil,
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	openConstruction = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:openConstructionHeading",
		body = "cp1_tutorial1:openConstruction",
		completion = "cp1_tutorial1:openConstructionCompleted",
		image = "construction",
		ring = { "construction" },
		ringsize = { w=70, h=70 }
	},

	selectTransportationTab = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:selectTransportationTabHeading",
		body = "cp1_tutorial1:selectTransportationTab",
		completion = "cp1_tutorial1:selectTransportationTabCompleted",
		image = "TransportationTab",
		ring = {"Transportation Tab"},
		ringsize = { w=70, h=70 }
	},
	
	selectGroundStationBuyButton = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:selectGroundStationBuyButtonHeading",
		body = "cp1_tutorial1:selectGroundStationBuyButton",
		completion = "cp1_tutorial1:selectGroundStationBuyButtonCompleted",
		image = "GroundStation",
		ring = {"Buy Area Tabs", "Transportation Typelist", "GroundStation_end"},
		ringsize = { w=70, h=70 }
	},
	
	placeGroundStation = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:placeGroundStationHeading",
		body = "cp1_tutorial1:placeGroundStation",
		completion = "cp1_tutorial1:placeGroundStationCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	selectGroundTrackBuyButton = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:selectGroundTrackBuyButtonHeading",
		body = "cp1_tutorial1:selectGroundTrackBuyButton",
		completion = "cp1_tutorial1:selectGroundTrackBuyButtonCompleted",
		image = "GroundTrack",
		ring = {"Buy Area Tabs", "Transportation Typelist", "GroundTrack_df"},
		ringsize = { w=70, h=70 }
	},
	
	connectGroundCircuit = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:connectGroundCircuitHeading",
		body = "cp1_tutorial1:connectGroundCircuit",
		completion = "cp1_tutorial1:connectGroundCircuitCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	selectGroundStation = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:selectGroundStationHeading",
		body = "cp1_tutorial1:selectGroundStation",
		completion = "cp1_tutorial1:selectGroundStationCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},


	purchaseVehicles = {
		rulename = nil,
		panelPosition = { x = 750, y = 55 },
		heading = "cp1_tutorial1:purchaseVehiclesHeading",
		body = "cp1_tutorial1:purchaseVehicles",
		completion = "cp1_tutorial1:purchaseVehiclesCompleted",
		image = "SixSeater",
		ring = {"Buy Vehicle"},
		ringsize = { w=70, h=70 }
	},
	
	openConstruction2 = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:openConstruction2Heading",
		body = "cp1_tutorial1:openConstruction2",
		completion = "cp1_tutorial1:openConstruction2Completed",
		image = "construction",
		ring = { "construction" },
		ringsize = { w=70, h=70 }
	},
	
	selectTransportationTab2 = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:selectTransportationTab2Heading",
		body = "cp1_tutorial1:selectTransportationTab2",
		completion = "cp1_tutorial1:selectTransportationTabCompleted2",
		image = "TransportationTab",
		ring = {"Transportation Tab"},
		ringsize = { w=70, h=70 }
	},
	
	selectCrossingGateBuyButton = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:selectCrossingGateBuyButtonHeading",
		body = "cp1_tutorial1:selectCrossingGateBuyButton",
		completion = "cp1_tutorial1:selectCrossingGateBuyButtonCompleted",
		image = "CrossingGate",
		ring = {"CrossingGate_end"},
		ringsize = { w=70, h=70 }
	},

	placeCrossingGate = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:placeCrossingGateHeading",
		body = "cp1_tutorial1:placeCrossingGate",
		completion = "cp1_tutorial1:placeCrossingGateCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	enterFirstPerson = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:enterFirstPersonHeading",
		body = "cp1_tutorial1:enterFirstPerson",
		completion = "cp1_tutorial1:enterFirstPersonCompleted",
		image = "firstperson",
		ring = {"firstperson"},
		ringsize = { w=70, h=70 }
	},
	
	boardVehicle = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:boardVehicleHeading",
		body = "cp1_tutorial1:boardVehicle",
		completion = "cp1_tutorial1:boardVehicleCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	
	changeSeatPosition = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:changeSeatPositionHeading",
		body = "cp1_tutorial1:changeSeatPosition",
		completion = "cp1_tutorial1:changeSeatPositionCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	photoMode = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:photoModeHeading",
		body = "cp1_tutorial1:photoMode",
		completion = "cp1_tutorial1:photoModeCompleted",
		image = "photosafari",
		ring = {"photo"},
		ringsize = { w=70, h=70 }
	},
	
	takePicture = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:takePictureHeading",
		body = "cp1_tutorial1:takePicture",
		completion = "cp1_tutorial1:takePictureCompleted",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
	overheadView = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:overheadViewHeading",
		body = "cp1_tutorial1:overheadView",
		completion = "cp1_tutorial1:overheadViewCompleted",
		image = "overhead",
		ring = {"overhead"},
		ringsize = { w=70, h=70 }
	},
	
	zoostats = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:zoostatsHeading",
		body = "cp1_tutorial1:zoostats",
		completion = "cp1_tutorial1:zoostatsCompleted",
		image = "zoostatus",
		ring = {"Zoofinance"},
		ringsize = { w=70, h=70 }
	},
	
	awards = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:awardsHeading",
		body = "cp1_tutorial1:awards",
		completion = "cp1_tutorial1:awardsCompleted",
		image = "Awards",
		ring = {"awards tab"},
		ringsize = { w=70, h=70 }
	},
	
	persistantAwards = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:persistantAwardsHeading",
		body = "cp1_tutorial1:persistantAwards",
		completion = "cp1_tutorial1:persistantAwardsCompleted",
		image = "PersistantAwards",
		ring = {"persistent game"},
		ringsize = { w=70, h=70 }
	},
	
--[[
	_RULENAME_ = {
		rulename = nil,
		panelPosition = nil,
		heading = "cp1_tutorial1:_RULENAME_Heading",
		body = "cp1_tutorial1:_RULENAME_",
		completion = "cp1_tutorial1:_RULENAME_Completed",
		image = nil,
		ring = nil,
		ringsize = nil
	},
	
--]]

}

function setinitialtutorialstate(comp)
	
	-- find out if the zoo gate exists.. this is how we know the map is loaded
	if countType("entrance") <= 0 then
		return 0
	end
		
	-- get the scenario manager, if it doesn't exist then get out of here
	local BFScenarioMgr = queryObject("BFScenarioMgr")
	if BFScenarioMgr == nil then
		return 0
	end
	
	-------------------------------------------------------------------
	-- ENABLE CONTENT LIKE THIS
	BFScenarioMgr:BFS_ADD_SCENARIO_OBJECT("GroundStation_end");
	BFScenarioMgr:BFS_ADD_SCENARIO_OBJECT("GroundTrack_df");

	BFScenarioMgr:BFS_ADD_SCENARIO_OBJECT("FourSeater_end");	
	BFScenarioMgr:BFS_ADD_SCENARIO_OBJECT("Fountain");
	BFScenarioMgr:BFS_ADD_SCENARIO_OBJECT("CrossingGate_end");
	-------------------------------------------------------------------	
	
		
	
	local uimgr = queryObject("UIRoot");
	if (uimgr) then
		-- hit the fence tab
		local fencetab = uimgr:UI_GET_CHILD("Fence Tab");
		if fencetab ~= nil then
			fencetab:UI_ACTIVATE_ON();
		end	
	end
				
	-------------------------------------------------------------------
	-- DISABLE UI ELEMENTS LIKE THIS
	-- BFScenarioMgr:UI_DISABLE("component name")
	
	
	setMaxFame(100)
	BFScenarioMgr:UI_DISABLE(" filter_maximize")
	BFScenarioMgr:UI_DISABLE("Buy Animal Tab")
	BFScenarioMgr:UI_DISABLE("Adopt Animal Tab")
	BFScenarioMgr:UI_DISABLE("open zoo toggle button")
	BFScenarioMgr:UI_DISABLE("Primary Game Button Pointers")
	BFScenarioMgr:UI_DISABLE("Main Game Buttons")
	BFScenarioMgr:UI_DISABLE("Selection Buttons")
	BFScenarioMgr:UI_DISABLE("multinfo button")
	BFScenarioMgr:UI_DISABLE("Zoofinance")
	BFScenarioMgr:UI_DISABLE("undo")
	BFScenarioMgr:UI_DISABLE("Photo Album")
	BFScenarioMgr:UI_DISABLE("delete")
	BFScenarioMgr:UI_DISABLE("Buy Area Container")
	BFScenarioMgr:UI_DISABLE("minimize")
	BFScenarioMgr:UI_DISABLE("awards")
	BFScenarioMgr:UI_DISABLE("scenariogoals")
	BFScenarioMgr:UI_DISABLE("Animal Info ToggleSet")
	BFScenarioMgr:UI_DISABLE("PickUp")
	BFScenarioMgr:UI_DISABLE("put up for adoption")
	BFScenarioMgr:UI_DISABLE("release to wild")
	BFScenarioMgr:UI_DISABLE("in game sort button")
	BFScenarioMgr:UI_DISABLE("elevated path lower")
	BFScenarioMgr:UI_DISABLE("elevated path raise")
	BFScenarioMgr:UI_DISABLE("Elevated Path Placement Method")
	BFScenarioMgr:UI_DISABLE("Station Info ToggleSet")
	BFScenarioMgr:UI_DISABLE("zoo status tabs")
	BFScenarioMgr:UI_DISABLE("overviewmap")
	
	BFScenarioMgr:UI_HIDE("firstperson")
	BFScenarioMgr:UI_HIDE("photo")
	

--	--Remove ability to save during tutorials
	BFScenarioMgr:UI_DISABLE("TextButton Save");
	BFScenarioMgr:UI_DISABLE("TextButton Save Hover")
	BFScenarioMgr:UI_DISABLE("TextButton Load")
	BFScenarioMgr:UI_DISABLE("TextButton Load Hover")
	
	BFScenarioMgr:UI_HIDE("exit with save option")
	BFScenarioMgr:UI_SHOW("exit no save option")
	
	-- press the first tab on the station info panel
	local component = getComponent({"Station Buy Vehicle Tab Button"})
	if component ~= nil then
		component:UI_ACTIVATE_ON()
	end
	
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
-- WELCOME
function welcome()	
	initTutorialRuleInfo(ruledata.welcome)
	return 1
end

function welcomeSuccess()	
	tutorialgoalcompleted()
	return 1
end

---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- OPEN CONSTRUCTION PANEL
function openConstruction()
	if (ruleinitialized == 0) then
		--Initialization
		initTutorialRuleInfo(ruledata.openConstruction)
	
		local component = getComponent({"Main Game Buttons","construction"})
		if component ~= nil then 
			component:UI_ENABLE("construction") 
		end
		
	end

	if isAlternateByName("construction") then
		return 1
	end
	
	return 0
end

function openConstructionSuccess()	
	tutorialgoalcompleted()
	
	local ZTMode = queryObject("ZTMode")
	if ZTMode ~= nil then
		ZTMode:sendMessage("ZT_SETMODE", "mode_selection")
	end
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT TRANSPORTATION TAB
function selectTransportationTab()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.selectTransportationTab)
		
		local component = getComponent{"Transportation Tab"}
		if component ~= nil then 
			component:UI_ENABLE("Transportation Tab") 
		end
	end
	
	local component = getComponent({"GroundTrack_df"})
		if component ~= nil then 
			component:UI_DISABLE() 
	end
	local component = getComponent({"CrossingGate_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
	if isAlternateByName("Transportation Tab") then
		return 1
	end
	
	return 0
end

function selectTransportationTabSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT GROUND STATION BUY BUTTON
function selectGroundStationBuyButton()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.selectGroundStationBuyButton)
		
		-- deselect the buttons on the buy panel for transportation
		-- so the user must select the ground station buy button
		local component = getComponent({"Buy Area Tabs", "Transportation Typelist"})
		if component ~= nil then
			component:UI_ACTIVATE_OFF()
		end
	end
	
	local component = getComponent({"GroundTrack_df"})
		if component ~= nil then 
			component:UI_DISABLE() 
	end
	local component = getComponent({"CrossingGate_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
	if isAlternateByName("GroundStation_end") then
		return 1
	end
	
	return 0
end

function selectGroundStationBuyButtonSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- PLACE GROUND STATION
function placeGroundStation(comp)
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.placeGroundStation)
		comp.groundStationCount = countType("groundstation")
	
	end
		
	local component = getComponent({"undo"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
	local groundStationCount = countType("groundstation")
	if groundStationCount > comp.groundStationCount then
		return 1
	
	end
	
	return 0
end

function placeGroundStationSuccess()
	tutorialgoalcompleted()
	
	local ZTMode = queryObject("ZTMode")
	if ZTMode ~= nil then
		ZTMode:sendMessage("ZT_SETMODE", "mode_selection")
	end
	
	local component = getComponent({"undo"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
	
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT GROUND TRACK BUY BUTTON
function selectGroundTrackBuyButton()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.selectGroundTrackBuyButton)
	end
	
	local component = getComponent({"undo"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
	local component = getComponent({"GroundTrack_df"})
	if component ~= nil then 
		component:UI_ENABLE() 
	end
	
	component = getComponent({"GroundStation_end"})
		if component ~= nil then 
			component:UI_DISABLE() 
	end
	
	component = getComponent({"CrossingGate_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
		
	if isAlternateByName("GroundTrack_df") then
		return 1
	end
	
	return 0


end

function selectGroundTrackBuyButtonSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--
function connectGroundCircuit(comp)
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.connectGroundCircuit)	
	end
	local component = getComponent({"GroundStation_end"})
		if component ~= nil then 
			component:UI_DISABLE() 
	end
	
	local component = getComponent({"CrossingGate_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
				
		-- we'll complete the rule when we find that some stations on the map is
	-- on a circuit that is closed
	local stations = findTypeDirect("station")
	local stationCount = table.getn(stations)
	for i = 1, stationCount do
		local station = resolveTable(stations[i].value)
		if station ~= nil then
			-- get the circuit attached to the station
			local circuit = station:sendMessage("ZT_GET_CIRCUIT")
			if circuit ~= nil and circuit:ZT_GET_CLOSED_CIRCUIT() then
				
				-- just so the user can't screw this up, disable the undo button...
				component = getComponent({"Primary Game Button Panel", "undo"})
				if component ~= nil then
					component:UI_DISABLE()
				end
				
				-- if we have a valid circuit and it's closed then we're done
				return 1
			
		
			end
		end
	end

	
	return 0

end

function connectGroundCircuitSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT GROUND STATION
function selectGroundStation()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.selectGroundStation)	
		local ZTMode = queryObject("ZTMode")
		if ZTMode ~= nil then
			-- go into selection mode automatically
			ZTMode:sendMessage("ZT_SETMODE", "mode_selection")
		end
		
		local component = getComponent{"Transportation Tab"}
		if component ~= nil then 
			component:UI_DISABLE() 
		end
		
		component = getComponent({"Main Game Buttons", "construction"})
		if component ~= nil then 
			component:UI_DISABLE() 
		end
		
		component = getComponent({"Backgrounds","close"})
		if component ~= nil then 
			component:UI_DISABLE() 
		end

		component = getComponent({"Station Info","zoopedia link"})
		if component ~= nil then
			component:UI_DISABLE() 			
		end

		component = getComponent({"Station Info","Sell"})
		if component ~= nil then
			component:UI_DISABLE() 			
		end

		component = getComponent({"Station Info","change direction"})
		if component ~= nil then
			component:UI_DISABLE() 			
		end

		component = getComponent({"Station Info","Circuit Info ToggleSet"})
		if component ~= nil then
			component:UI_DISABLE() 			
		end
	
		component = getComponent({"Buy Area Tabs", "Transportation Typelist"})
		if component ~= nil then
			component:UI_ACTIVATE_OFF()
		end
	
	end
		local component = getComponent({"GroundTrack_df"})
		if component ~= nil then 
			component:UI_DISABLE() 
		end
		
		component = getComponent({"GroundStation_end"})
		if component ~= nil then 
			component:UI_DISABLE() 
		end
	
		component = getComponent({"CrossingGate_end"})
		if component ~= nil then 
			component:UI_DISABLE() 
		end
		
		local component = getComponent({"undo"})
		if component ~= nil then 
			component:UI_DISABLE() 
		end
	
	local selectedEntity = getSelectedEntity()
	if selectedEntity ~= nil and isEntityKindOf(selectedEntity, "groundstation") then
		return 1
	end
	
	return 0
end

function selectGroundStationSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- PURCHASE 5 VEHICLES
function purchaseVehicles(comp)
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.purchaseVehicles)
		comp.vehicleCount = countType("groundvehicle")
		
	end
	
	--ensure that a ground station is selected
	if not isVisibleByName("Station Info") then
		local ZTMode = queryObject("ZTMode")
		local entities = findType("groundstation")
		local lastIndex = table.getn(entities)
		if entities ~= nil and lastIndex >= 1 and ZTMode ~= nil then
			
			ZTMode:sendMessage("ZT_SET_SELECTED_ENTITY", resolveTable(entities[lastIndex].value))
		end
	end
	
	local component = getComponent({"undo"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
	local vehicleCount = countType("groundvehicle")
	if vehicleCount >= comp.vehicleCount + 5 then
		return 1
	end
	
	return 0
end

function purchaseVehiclesSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- OPEN CONSTRUCTION PANEL 2
function openConstruction2()
	if (ruleinitialized == 0) then
		--Initialization
		initTutorialRuleInfo(ruledata.openConstruction2)
	
				
		local component = getComponent({"Main Game Buttons","construction"})
		if component ~= nil then 
			component:UI_ENABLE("construction") 
		end
	
	end

	if isAlternateByName("construction") then
		return 1
	end
	
	return 0
end

function openConstruction2Success()	
	tutorialgoalcompleted()
	
	local ZTMode = queryObject("ZTMode")
	if ZTMode ~= nil then
		ZTMode:sendMessage("ZT_SETMODE", "mode_selection")
	end
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT TRANSPORTATION TAB 2
function selectTransportationTab2()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.selectTransportationTab2)
	
		local component = getComponent{"Transportation Tab"}
		if component ~= nil then 
			component:UI_ENABLE("Transportation Tab") 
		end
		
		
	end
	
	local component = getComponent{"Transportation Tab"}
	if component ~= nil then 
		component:UI_ENABLE("CrossingGate_end") 
	end
	
	local component = getComponent({"GroundTrack_df"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end

	component = getComponent({"GroundStation_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end	
	
	if isAlternateByName("Transportation Tab") then
		return 1
	end
	
	return 0
end

function selectTransportationTab2Success()
	tutorialgoalcompleted()
	
	local ZTMode = queryObject("ZTMode")
	if ZTMode ~= nil then
		ZTMode:sendMessage("ZT_SETMODE", "mode_selection")
	end
	
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT CROSSING GATE BUY BUTTON
function selectCrossingGateBuyButton()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.selectCrossingGateBuyButton)
	end
	
	local component = getComponent({"GroundTrack_df"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end

	component = getComponent({"GroundStation_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end	
	
	component = getComponent({"CrossingGate_end"})
	if component ~= nil then 
		component:UI_ENABLE() 
	end

	if isAlternateByName("CrossingGate_end") then
		return 1
	end
	
	return 0

end

function selectCrossingGateBuyButtonSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- PLACE A CROSSING GATE
function placeCrossingGate(comp)
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.placeCrossingGate)
		comp.crossingGateCount = countType("crossinggate")
	end
	
	local component = getComponent({"GroundTrack_df"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end

	component = getComponent({"GroundStation_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end	
	
	component = getComponent({"CrossingGate_end"})
	if component ~= nil then 
		component:UI_DISABLE() 
	end
	
			
	local crossingGateCount = countType("crossinggate")
	if crossingGateCount > comp.crossingGateCount then
		return 1
	end
	
	return 0

end

function placeCrossingGateSuccess()
	tutorialgoalcompleted()
	return 1
	
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- ENTER FIRST PERSON
function enterFirstPerson()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.enterFirstPerson)
	
		local component = getComponent{"firstperson"}
		if component ~= nil then 
			component:UI_SHOW()
			component:UI_ENABLE() 
		end
		
		component = getComponent({"Buy Area Tabs", "Transportation Typelist"})
		if component ~= nil then
			component:UI_ACTIVATE_OFF()
		end
	
	end
	
	if isAlternateByName("firstperson") then
		return 1
	end
	
	return 0
end

function enterFirstPersonSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- BOARD VEHICLE
function boardVehicle()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.boardVehicle)
	
	end
	
	local ZTMode = queryObject("ZTMode")
	if ZTMode ~= nil then
		local vehicleSeatIndex = ZTMode:sendMessage("ZT_GET_RIDING_SEAT_INDEX")
		if vehicleSeatIndex ~= nil then
			return 1
		end
	end
	
	return 0
end

function boardVehicleSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- CHANGE SEAT POSITION
function changeSeatPosition(comp)
	local ZTMode = queryObject("ZTMode")
	
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.changeSeatPosition)	
		comp.vehicleSeatIndex = ZTMode:sendMessage("ZT_GET_RIDING_SEAT_INDEX")
	end
	
	vehicleSeatIndex = ZTMode:sendMessage("ZT_GET_RIDING_SEAT_INDEX")
	if vehicleSeatIndex ~= comp.vehicleSeatIndex then
		return 1
	end
	
	return 0
end

function changeSeatPositionSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- GO TO PHOTO MODE
function photoMode()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.photoMode)

		local component = getComponent{"photo"}
		if component ~= nil then 
			component:UI_ENABLE("photo") 
			component:UI_SHOW("photo") 
		end
	
	end
	
	if isAlternateByName("photo") then
		return 1
	end
	
	return 0
end

function photoModeSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE A PICTURE
function takePicture(comp)
	
	local numPics = nil
	local component = getComponent({"Photo Counter"})
	if component ~= nil then
		numPics = component:UI_GET_TEXT()
	end

	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.takePicture)
		comp.numPics = numPics
	end
	
	if comp.numPics ~= numPics then
		return 1
	end
	
	return 0
end

function takePictureSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--  GO BACK TO OVERHEAD VIEW
function overheadView()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.overheadView)
	
		local component = getComponent{"firstperson"}
		if component ~= nil then 
			component:UI_DISABLE("firstperson") 
		end
	
		component = getComponent{"photo"}
		if component ~= nil then 
			component:UI_DISABLE("photo") 
		end
			
		component = getComponent{"overhead"}
		if component ~= nil then 
			component:UI_ENABLE("overhead") 
		end
	
		component = getComponent({"Buy Area Tabs", "Transportation Typelist"})
		if component ~= nil then
			component:UI_ACTIVATE_OFF()
		end
				
		component = getComponent({"Primary Game Button Panel", "Zoofinance"})
		if component ~= nil then 
			component:UI_ENABLE("Zoofinance") 
		end
		component = getComponent{"zoo status","close"}
		if component ~= nil then 
			component:UI_ENABLE("close") 
		end
		
	end
	
	if isAlternateByName("overhead") then
		return 	1
	end
	
	return 0
end

function overheadViewSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- CLICK ON ZOO STATUS PANEL
function zoostats(comp)
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.zoostats)
		local component = getComponent({"zoo status layout", "close"})
		if component ~= nil then
			component:UI_DISABLE()
		end
		
		checkawards(comp)
	end
	
	if isVisibleByName("zoo status layout") then
		return 1
	end
	
	return 0
end

function zoostatsSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- CLICK ON AWARDS PANEL
function awards()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.awards)
	
		local component = getComponent{"awards tab"}
		if component ~= nil then 
			component:UI_ENABLE("awards tab") 
		end
	
	end
	
	local component = getComponent({"tutorial layout"})
	if component ~= nil then
		component:UI_MOVE_TO_FRONT()
	end
	
	if isAlternateByName("awards tab") then
		return 1
	end
	
	return 0
end

function awardsSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- CLICK ON THE PERSISTANT AWARDS ICON
function persistantAwards()
	
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata.persistantAwards)
	
		local component = getComponent{"current game"}
		if component ~= nil then 
			component:UI_DISABLE("current game") 
		end
	
	end
	
	local component = getComponent({"tutorial layout"})
	if component ~= nil then
		component:UI_MOVE_TO_FRONT()
	end
	
	if isAlternateByName("persistent game") then
		return 1
	end
	
	return 0
end

function persistantAwardsSuccess()
	tutorialgoalcompleted()
	return 1
end

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- SCENARION END
function endscenario()
	local component = getComponent({"zoo status layout", "close"})
	if component ~= nil then
		component:UI_ENABLE()
		component:UI_ACTIVATE()
	end
	return 1;
end

function endscenariosuccess()
	setuservar("cp1_tutorial1", "completed");
	showtutorialwin("cp1_tutorial1:tutorial_complete", nil);
	return 1;
end

-------------------------------------------------------------------------------------------------------------------------------------

--[[
----------------------------------------------------------------------------------------------------------------------------------------
--
function _RULENAME_()
	if ruleinitialized == 0 then
		initTutorialRuleInfo(ruledata._RULENAME_)
	end
	
	
	return 0
end

function _RULENAME_Success()
	tutorialgoalcompleted()
	return 1
end
----------------------------------------------------------------------------------------------------------------------------------------

--]]