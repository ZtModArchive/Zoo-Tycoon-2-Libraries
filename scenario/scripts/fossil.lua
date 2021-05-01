isPuzzleComplete = function(l_1_arg0)
   local l_1_1 = queryObject("ZTPuzzleMgr")
   if l_1_1 ~= nil then
      return l_1_1:ZT_IS_PUZZLE_COMPLETE(l_1_arg0)
   end
end

getNumPuzzlesComplete = function()
   local l_2_0 = queryObject("ZTPuzzleMgr")
   if l_2_0 ~= nil then
      return l_2_0:ZT_GET_NUM_PUZZLES_BUILT()
   end
end

getNumPiecesFoundForSpecies = function(l_3_arg0)
   local l_3_1 = queryObject("ZTPuzzleMgr")
   if l_3_1 ~= nil then
      return l_3_1:ZT_GET_NUM_PIECES_FOUND(l_3_arg0)
   end
end

getNumPuzzlesReady = function()
   local l_4_0 = queryObject("ZTPuzzleMgr")
   if l_4_0 ~= nil then
      return l_4_0:ZT_GET_NUM_PUZZLES_READY()
   end
end

getNumAnimalsUnlockedAtResearchLab = function()
   local l_5_0 = queryObject("ZTStatus")
   if l_5_0 ~= nil then
      return l_5_0:ZT_GET_NUM_ANIMALS_UNLOCKED()
   end
end

hasSpeciesBeenUnlockedAtResearchLab = function(l_6_arg0)
   local l_6_1 = queryObject("ZTStatus")
   if l_6_1 ~= nil then
      return l_6_1:ZT_GET_ANIMAL_CREATED(l_6_arg0)
   end
end


