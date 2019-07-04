FSE.EventsTable["Szpony_Wiatrak"] = {
        msg = "Grupa szponów pojawiła się niedaleko lotniska!",
        func = function()
            local npctable = { --Kolejność klasa,wektor inaczej nie bedzie działało
                [1] = {"npc_vj_fo3_dc_deathclaw",Vector(-11505.764648, 12920.606445, 102.928314)},
                [2] = {"npc_vj_fo3_dc_deathclaw_baby",Vector(-11685.702148, 12528.755859, 136.400528)}
            }
            for k,v in pairs(npctable) do
                local npc = ents.Create(v[1])
                npc:SetPos(v[2])
                npc:SetVar("Event","testowy")
                npc:Spawn()
            end
        end

}


