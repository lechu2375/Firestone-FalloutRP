if not file.Exists("sv_vault.txt","DATA") then file.Append("sv_vault.txt","{}") end
Firestone.FactionsVault = {}
Firestone.FactionsVault.FactionData = Firestone.FactionsVault.FactionData or util.JSONToTable(file.Read("sv_vault.txt")) or {}
Firestone.FactionsVault.Allowed = {
    ["bs"] = true,
    ["legion"] = true,
    ["rnk"] = true
}

for k,v in pairs(nut.faction.indices) do
    if (Firestone.FactionsVault.Allowed[v.uniqueID]) and (not Firestone.FactionsVault.FactionData[v.uniqueID]) then
        Firestone.FactionsVault.FactionData[v.uniqueID] = {} 
        Firestone.FactionsVault.FactionData[v.uniqueID]["money"] = 0
    end
end

function Firestone.FactionsVault.Save()
    file.Write("sv_vault.txt", util.TableToJSON(Firestone.FactionsVault.FactionData))
end

function Firestone.FactionsVault.Add(char,amount)
    if not char then return end
    if not char:hasMoney(amount) then return end
    local faction = nut.faction.indices[char:getFaction()][uniqueID]
    if not Firestone.FactionsVault.Allowed.faction then return end

end