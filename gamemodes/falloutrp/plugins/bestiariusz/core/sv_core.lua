util.AddNetworkString("FS:BestiariuszADD")

function PLUGIN:OnNPCKilled(npc,attacker,inflictor)
    if attacker:IsPlayer() then
        net.Start("FS:BestiariuszADD")
        net.WriteString(npc:GetClass())
        net.Send(attacker)
    end
end
