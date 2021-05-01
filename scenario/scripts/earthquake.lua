QuakeStartTime = 0
CameraZoom = 0
local l_0_0
CameraInitialPos, l_0_0 = l_0_0, {x = 0, y = 0, z = 6}
l_0_0 = 0.5
Zoom_Frequency = l_0_0
l_0_0 = 2
Zoom_Amplitude = l_0_0
l_0_0 = 5.6
Zoom_Dropoff = l_0_0
l_0_0 = 85
Pan_Frequency = l_0_0
l_0_0 = 1.5
Pan_Amplitude = l_0_0
l_0_0 = 5.6
Pan_Dropoff = l_0_0
l_0_0 = function()
   local l_1_0 = queryObject("ZTWorldMgr")
   if l_1_0 == nil then
      return 
   end
   QuakeStartTime = l_1_0:ZT_GET_REAL_TIME()
   CameraZoom = l_1_0:BFG_GET_CAMERA_ZOOM()
   CameraInitialPos.x = l_1_0:BFG_GET_CAMERA_X()
   CameraInitialPos.y = l_1_0:BFG_GET_CAMERA_Y()
end

runQuake = l_0_0
l_0_0 = function()
   local l_2_0 = queryObject("ZTWorldMgr")
   local l_2_1 = queryObject("ZTMode")
   if l_2_0 == nil or l_2_1 == nil then
      return 
   end
   local l_2_2 = l_2_0:ZT_GET_REAL_TIME() - QuakeStartTime
   --[[ DECOMPILER ERROR 466: Confused while interpreting a jump as a 'while' ]]
end

updateQuake = l_0_0

