


function FNS.CheckLocation(stringLocation)
    if Firestone.FNS.Locations[stringLocation] then 
        local location = Firestone.FNS.Locations[stringLocation]
        local entsTable = ents.FindInSphere(location.postable[1], location.radius)
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
            if npcinfo[v].Weapons then
                npc:Give(table.Random(npcinfo[v].Weapons))
            end
            Firestone.FNS.Locations.Spawned[stringLocation][k] = npc
            print("[FNS LOG] Spawned "..v.." at",pos,"with",npc:GetActiveWeapon())
        end
    end
end



function FNS.CheckSS(stringLocation)

end

--Respimy npc, chuj chuj chuj 