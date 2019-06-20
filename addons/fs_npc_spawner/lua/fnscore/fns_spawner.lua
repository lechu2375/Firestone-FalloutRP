


function FNS.CheckLocation(stringLocation)
    if Firestone.FNS.Locations[stringLocation] then 
        local location = Firestone.FNS.Locations[stringLocation]
        if location.fibv then --jeśli jest tabela z wektorami do find in box
            if location.fibv[1] and location.fibv[2] then --wtedy sprawdzamy czy ktoś z graczy jest w równoległoboku
                local entsTable = ents.FindInBox(location.fibv[1], location.fibv[2]) 
                for k,v in pairs(entsTable) do
                    if v:IsPlayer() then
                        print("[FNS LOG][Box]Can't spawn npc in "..stringLocation.." location, someone is there.")
                    return end
                end
            end      
        elseif location.radius then
            local entsTable = ents.FindInSphere(location.postable[1], location.radius)
            for k,v in pairs(entsTable) do
                if v:IsPlayer() then
                    print("[FNS LOG][Sphere] Can't spawn npc in "..stringLocation.." location, someone is there.")
                return end
            end
        else
            print("[FNS LOG] Find in box vectors does not exists same as radius! Skipping entities check.")
        end
        local npcinfo = list.Get("NPC")
        for k,v in pairs(location.npctable) do
            if Firestone.FNS.Locations.Spawned[stringLocation][k] then 
                continue 
            end 
            local npc = ents.Create(v)
            local pos = location.postable[k]
            npc:SetPos(pos)
            npc:Spawn() 
            npc:SetVar("FNSlocation",stringLocation)
            npc:SetVar("FNSque",k)
            if npcinfo[v] then
                if npcinfo[v].Weapons then
                    npc:Give(table.Random(npcinfo[v].Weapons))
                end
            end
            Firestone.FNS.Locations.Spawned[stringLocation][k] = npc
            print("[FNS LOG] Spawned "..v.." at",pos,"with",npc:GetActiveWeapon())
        end
    end
end



function FNS.CheckSS(stringUniqeName)
    local ss = Firestone.FNS.SS[stringUniqeName]
    if ss then   
        if ss.spawned then return end
        if ss.fibv then --jeśli jest tabela z wektorami do find in box
            if ss.fibv[1] and ss.fibv[2] then --wtedy sprawdzamy czy ktoś z graczy jest w równoległoboku
                local entsTable = ents.FindInBox(ss.fibv[1], ss.fibv[2]) 
                for k,v in pairs(entsTable) do
                    if v:IsPlayer() then
                        print("[FNS LOG][Box]Can't spawn npc in "..stringUniqeName.." location, someone is there.")
                    return end
                end
            end      
        elseif ss.radius then
            local entsTable = ents.FindInSphere(ss.pos, ss.radius)
            for k,v in pairs(entsTable) do
                if v:IsPlayer() then
                    print("[FNS LOG][Sphere] Can't spawn npc in "..stringUniqeName.." location, someone is there.")
                return end
            end
        else
            print("[FNS LOG] Find in box vectors does not exists same as radius! Skipping entities check.")
        end
            local npc = ents.Create(ss.nc)
            local pos = ss.pos
            local npcinfo = list.Get("NPC")
            npc:SetPos(pos)
            npc:Spawn() 
            ss.spawned = true
            npc:SetVar("FNSSUname",stringUniqeName)
            if npcinfo[ss.nc] then
                if npcinfo[ss.nc].Weapons then
                    npc:Give(table.Random(npcinfo[v].Weapons))
                end
            end
            print("[FNS LOG] Spawned "..ss.nc.." at",pos,"with",npc:GetActiveWeapon())
    end
end

 