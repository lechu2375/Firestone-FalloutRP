hook.Add("OnNPCKilled","FNS_tableManager", function(npc)
        local var = npc:GetVar("FNSlocation") --sprawdzamy stringa z lokacją
        if Firestone.FNS.Locations.Spawned[var] then --jeśli jest taka lokacja
                local var2 = npc:GetVar("FNSque") --to pobieramy kolejność npcta w tabeli
                Firestone.FNS.Locations.Spawned[var][var2] = false -- zabity więc false dajemy
        end
end)

hook.Add("EntityRemoved","FNS_tableManagerS", function(ent) 
        if ent:IsNPC() then
                local var = ent:GetVar("FNSlocation")
                if Firestone.FNS.Locations.Spawned[var] then
                        local var2 = ent:GetVar("FNSque")
                        Firestone.FNS.Locations.Spawned[var][var2] = false
                end
        end
end)
--[[Przy niektórych ustawieniach npctów VJ hook OnNPCKilled nie jest w ogóle callowany, dlatego
powtarzamy go drugi raz]]









