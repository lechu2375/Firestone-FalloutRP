

function FNS.CheckLocation(stringLocation)
    if Firestone.FNS.Locations[stringLocation] then 
    end
end

function FNS.CheckSS(stringLocation)
    if Firestone.FNS.SS[stringLocation] then 
        local location = Firestone.FNS.SS[stringLocation]
        local entsTable = ents.FindInSphere(location.postable[1], location.radius)
        for k,v in pairs(entsTable) do
            if v:GetClass() == "Player" then return end
        end
    end
end

--Respimy npc, nw stringa z lokacją i jego indeksem z tabeli lokacji