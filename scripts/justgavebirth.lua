-- this is a mess as it does not decode properly with any known decoder due to nested functions


include("scenario/scripts/entity.lua")

function incrementBreedingCentersBirthCount()
   BFLOG("incrementBreedingCentersBirthCount")
   local l_1_0 = findType("ConservationBreedingCenter_end")
   if l_1_0 ~= nil then
      for l_1_1 = 1, table.getn(l_1_0) do
         local l_1_4 = resolveTable(l_1_0[l_1_1].value)
         local l_1_5 = l_1_4:BFG_GET_ATTR_FLOAT("f_TotalEndangeredBirths") + 1
         BFLOG(l_1_5)
         local l_1_6, l_1_7 = l_1_4:BFG_SET_ATTR_FLOAT, l_1_4
         local l_1_8 = {"f_TotalEndangeredBirths", l_1_5}
         l_1_6(l_1_7, l_1_8)
      end
   end
end


function justgavebirth(l_2_arg0)
   if l_2_arg0 ~= nil then
      LUALOG("justgavebirth -- args is " .. table.getn(l_2_arg0) .. " elements")
      local l_2_1 = l_2_arg0[1]
      if l_2_1 ~= nil then
         local l_2_2 = l_2_1.value
         if l_2_2 ~= nil then
            local l_2_3 = resolveTable(l_2_2)
            do
               if l_2_3 ~= nil then
                  local l_2_4 = l_2_3:sendMessage("BFAI_GET_RELATED_ENTITY", "mother")
                  do
                     if l_2_4 ~= nil then
                        LUALOG("justgavebirth -- got grandMM")
                     end
                     grandMF = l_2_3:sendMessage("BFAI_GET_RELATED_ENTITY", "father")
                     if grandMF ~= nil then
                        LUALOG("justgavebirth -- got grandMF")
                     end
                     local l_2_5, l_2_6, l_2_7 = nil, nil, nil
                     local l_2_8 = l_2_3:sendMessage("BFAI_GET_RELATED_ENTITIES", "mate")
                     if l_2_8 ~= nil and type(l_2_8) == "table" then
                        LUALOG("justgavebirth -- found " .. table.getn(l_2_8) .. " mates")
                        -- local l_2_9 = table.foreachi
						

3 2 0 7
function justgavebirth
local reg3 = reg1.value
local resolveTable = resolveTable(reg3)
if resolveTable ~= None then
        LUALOG(justgavebirth -- setting father - mate)
        local resolveTable = resolveTable:sendMessage(BFAI_GET_RELATED_ENTITY, mother)
        if resolveTable ~= None then
                LUALOG(justgavebirth -- got grandFM)
                local resolveTable = resolveTable:sendMessage(BFAI_GET_RELATED_ENTITY, father)
                if resolveTable ~= None then
                        LUALOG(justgavebirth -- got grandFF)
                        return
                else
                        return
                end
        else
                local resolveTable = resolveTable:sendMessage(BFAI_GET_RELATED_ENTITY, father)
                if resolveTable ~= None then
                        LUALOG(justgavebirth -- got grandFF)
                        return
                else
                        return
                end
        end
else
        return
end
2 2 0 8
local reg3 = reg1.value
local resolveTable = resolveTable(reg3)
local upval0 = upval0:sendMessage(BFAI_GET_RELATED_ENTITY, father)
upval0 = upval0
if newfather ~= None then
        LUALOG(justgavebirth -- got newfather)
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
else
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
end
2 2 0 8
local reg3 = reg1.value
local resolveTable = resolveTable(reg3)
local upval0 = upval0:sendMessage(BFAI_GET_RELATED_ENTITY, father)
upval0 = upval0
if newfather ~= None then
        LUALOG(justgavebirth -- got newfather)
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
else
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
end
2 2 0 8
local reg3 = reg1.value
local resolveTable = resolveTable(reg3)
local upval0 = upval0:sendMessage(BFAI_GET_RELATED_ENTITY, father)
upval0 = upval0
if newfather ~= None then
        LUALOG(justgavebirth -- got newfather)
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
else
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
end
2 2 0 8
local reg3 = reg1.value
local resolveTable = resolveTable(reg3)
local upval0 = upval0:sendMessage(BFAI_GET_RELATED_ENTITY, father)
upval0 = upval0
if newfather ~= None then
        LUALOG(justgavebirth -- got newfather)
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
else
        if resolveTable ~= None then
                if resolveTable ~= upval0 then
                        if upval1 == newfather then
                                local upval1 = {}
                                upval1.relation = sibling
                                upval1.target = resolveTable
                                upval0:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                upval1.target = upval0
                                resolveTable:sendMessage(BFAI_ADD_RELATIONSHIP, upval1)
                                return
                        else
                                return
                        end
                else
                        return
                end
        else
                return
        end
end