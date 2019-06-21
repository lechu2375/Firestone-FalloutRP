FSE.EventsTable["testowy"] = {
        msg = "Grupa najemników pojawiła się w budynku!",
        func = function()
            local npctable = { --Kolejność klasa,wektor inaczej nie bedzie działało
                [1] = {"npc_vj_fo3_fg_feralghoul_glowing_robco",Vector(-4434.502930, 5090.035645, -31.968750)},
                [2] = {"npc_vj_fo3_rs_bark_scorpion",Vector(-4560.317871, 5601.402832, -31.968750)}
            }
            for k,v in pairs(npctable) do
                local npc = ents.Create(v[1])
                npc:SetPos(v[2])
                npc:SetVar("Event","testowy")
                npc:Spawn()
            end
        end

}


