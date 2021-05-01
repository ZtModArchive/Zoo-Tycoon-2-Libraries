function HyenaStripedGiftYoung(args)
	if args ~= nil then
		local firstarg = args[1]
		if firstarg ~= nil then
		    local subjecthandle = firstarg.value
		    if subjecthandle ~= nil then
				local subject = resolveTable(subjecthandle)
				if subject ~= nil then
   					local thisObject = {}
	   				thisObject.physObj = "mainObj"	   			
					local torsoName = subject:BFG_GET_ATTR_STRING("s_Torso")	   				   				
	   				
	   				thisObject.material = torsoName
	   				thisObject.layer = "decal0"
	   				thisObject.image = "entities/objects/Items/Gifts/HyenaStriped_Gift_Young.dds"
	   				subject:BFG_SET_TEXTURE(thisObject)
				else
					LUALOG(SYSERROR, "couldn't resolve subject entity pointer")
				end
			else
				LUALOG(SYSERROR, "couldn't resolve subject handle")
			end
		else
			LUALOG(SYSERROR, "couldn't parse first argument")
		end
	end
	
	return "complete"
end
