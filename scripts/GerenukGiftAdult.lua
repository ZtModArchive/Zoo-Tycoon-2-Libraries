function GerenukGiftAdult(args)
	if args ~= nil then
		local firstarg = args[1]
		if firstarg ~= nil then
		    local subjecthandle = firstarg.value
		    if subjecthandle ~= nil then
				local subject = resolveTable(subjecthandle)
				if subject ~= nil then
   					local torsoObject = {}
					local torsoName = subject:BFG_GET_ATTR_STRING("s_Torso")	   				   				
	   				torsoObject.physObj = "mainObj"	   			
	   				torsoObject.material = torsoName
	   				torsoObject.layer = "decal0"
	   				torsoObject.image = "entities/objects/Items/Gifts/Gerenuk_Gift.dds"
	   				subject:BFG_SET_TEXTURE(torsoObject)


   					local waistObject = {}
					local waistName = subject:BFG_GET_ATTR_STRING("s_Waist")	
	   				waistObject.physObj = "mainObj"	   			
	   				waistObject.material = waistName
	   				waistObject.layer = "decal0"
	   				waistObject.image = "entities/objects/Items/Gifts/Gerenuk_Gift.dds"
	   				subject:BFG_SET_TEXTURE(waistObject)
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
