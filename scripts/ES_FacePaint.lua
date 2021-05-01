ES_FacePaint_M = function(l_1_arg0)
   if l_1_arg0 ~= nil then
      local l_1_1 = l_1_arg0[1]
      if l_1_1 ~= nil then
         local l_1_2 = l_1_1.value
         if l_1_2 ~= nil then
            local l_1_3 = resolveTable(l_1_2)
            if l_1_3 ~= nil then
               local l_1_4 = {}
               l_1_4.physObj = "headObj"
               l_1_4.material = "guest_m_head"
               l_1_4.layer = "decal0"
               math.randomseed(os.time())
               local l_1_5 = math.random(4)
               BFLOG("RANDOMFACE:" .. l_1_5)
               if l_1_5 == 1 then
                  facePaint = "shared/tiger_facepaint.dds"
               elseif l_1_5 == 2 then
                  facePaint = "shared/panda_facepaint.dds"
               elseif l_1_5 == 3 then
                  facePaint = "shared/snowleopard_facepaint.dds"
               elseif l_1_5 == 4 then
                  facePaint = "shared/spectacledbear_facepaint.dds"
               end
               l_1_4.image = facePaint
               l_1_3:BFG_SET_TEXTURE(l_1_4)
            else
               LUALOG(SYSERROR, "couldn't resolve subject entity pointer")
            end
         else
            LUALOG(SYSERROR, "couldn't resolve subject handle")
         end
      else
         LUALOG(SYSERROR, "couldn't parse first argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end

ES_FacePaint_F = function(l_2_arg0)
   if l_2_arg0 ~= nil then
      local l_2_1 = l_2_arg0[1]
      if l_2_1 ~= nil then
         local l_2_2 = l_2_1.value
         if l_2_2 ~= nil then
            local l_2_3 = resolveTable(l_2_2)
            if l_2_3 ~= nil then
               local l_2_4 = {}
               l_2_4.physObj = "headObj"
               l_2_4.material = "guest_f_child_head"
               l_2_4.layer = "decal0"
               math.randomseed(os.time())
               local l_2_5 = math.random(4)
               BFLOG("RANDOMFACE:" .. l_2_5)
               if l_2_5 == 1 then
                  facePaint = "shared/tiger_facepaint.dds"
               elseif l_2_5 == 2 then
                  facePaint = "shared/panda_facepaint.dds"
               elseif l_2_5 == 3 then
                  facePaint = "shared/snowleopard_facepaint.dds"
               elseif l_2_5 == 4 then
                  facePaint = "shared/spectacledbear_facepaint.dds"
               end
               l_2_4.image = facePaint
               l_2_3:BFG_SET_TEXTURE(l_2_4)
            else
               LUALOG(SYSERROR, "couldn't resolve subject entity pointer")
            end
         else
            LUALOG(SYSERROR, "couldn't resolve subject handle")
         end
      else
         LUALOG(SYSERROR, "couldn't parse first argument")
      end
      -- Tried to add an 'end' here but it's incorrect
      -- Tried to add an 'end' here but it's incorrect
   end
   return "complete"
end


