

function FNS.CheckLocation(stringLocation)
    if Firestone.FNS.Locations[stringLocation] then 
         
        local location = Firestone.FNS.Locations[stringLocation]
        local entsTable = ents.FindInSphere(location.postable[1], location.radius)
        
        for k,v in pairs(entsTable) do
            if v:GetClass() == "Player" then 
                print("Ktoś tam jest")
                return 
            end
        end

        for k,v in pairs(location.npctable) do
            local npc = ents.Create(v)
            npc:SetPos(location.postable[k])
            npc:Spawn() 
            print("[FNS LOG] Spawned "..tostring(v).." at"..location.postable[tonumber(k)])
        end
    end
end

function FNS.CheckSS(stringLocation)

end

--Respimy npc, nw stringa z lokacją i jego indeksem z tabeli lokacji