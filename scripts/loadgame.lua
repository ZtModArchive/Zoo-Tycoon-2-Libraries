logTime = function(l_1_arg0, l_1_arg1)
   logMessage = string.format("***** %s load time: %.2f seconds *****", l_1_arg0, l_1_arg1)
   LUALOG(SYSNOTE, logMessage)
end

onLoadBegin = function(l_2_arg0)
   startTime = l_2_arg0
   logTime("Start", l_2_arg0)
end

onLoadEnd = function(l_3_arg0)
   logTime("End", l_3_arg0)
   logTime("Elapsed", l_3_arg0 - startTime)
end


