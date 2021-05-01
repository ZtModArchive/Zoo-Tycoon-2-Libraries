include("scenario/scripts/misc.lua")
prereq = function(l_1_arg0)
   setPrereqGather(true)
   setAddScenarioSuppression(true)
   local l_1_1 = getChallengeDebugMode()
   turnOnChallengeDebugMode()
   BFLOG(SYSTRACE, "----------------START CHALLENGE PREREQ TEST------------")
   local l_1_2 = queryObject("BFScenarioMgr")
   if l_1_2 then
      l_1_2:BFS_VALIDATEALLCHALLENGES("scenario/scripts/challenge/")
   end
   BFLOG(SYSTRACE, "-----------------END CHALLENGE PREREQ TEST-------------")
   setPrereqGather(false)
   setAddScenarioSuppression(false)
   setChallengeDebugMode(l_1_1)
end


