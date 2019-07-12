Firestone.FactionsVault = Firestone.FactionsVault or util.JSONToTable(file.Read("sv_vault.txt")) or {}
Firestone.FactionsVault.Allowed = {
    ["bs"] = true,
    ["legion"] = true,
    ["rnk"] = true
}

for k,v in pairs(nut.faction.indices) do
    if (Firestone.FactionsVault.Allowed[v.uniqueID]) and (not Firestone.FactionsVault[v.uniqueID]) then
        Firestone.FactionsVault[v.uniqueID] = 0
    end
end