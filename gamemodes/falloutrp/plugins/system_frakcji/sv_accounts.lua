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

function Firestone.FactionsVault.AddMoney(char,amount)
    if not getPermissions(char) then return end
    if not getPermissions(char).vault then char:getPlayer():Notify("Nie posiadasz uprawnień") end
    local amount = math.abs(amount)
    if amount<=0 then return end
    if not char then return end
    if not char:hasMoney(amount) then char:getPlayer():Notify("Nie posiadasz tylu pieniędzy") return end
    local faction = nut.faction.indices[char:getFaction()].uniqueID
    if not Firestone.FactionsVault.Allowed[faction] then char:getPlayer():Notify("Twoja frakcja nie posiada konta") return end
    char:takeMoney(amount)
    Firestone.FactionsVault.FactionData[faction].money = Firestone.FactionsVault.FactionData[faction].money + amount
    Firestone.FactionsVault.Save()
    print("[FV LOG] "..char:getName().." wpłacił "..amount.." na konto frakcji "..faction.."\n Bilans konta: "..Firestone.FactionsVault.FactionData[faction].money)
end
function Firestone.FactionsVault.WithdrawMoney(char,amount)
    if not getPermissions(char) then return end
    if not getPermissions(char).vault then char:getPlayer():Notify("Nie posiadasz uprawnień") return end
    local amount = math.abs(amount)
    if amount<=0 then return end
    if not char then return end
    local faction = nut.faction.indices[char:getFaction()].uniqueID
    if not Firestone.FactionsVault.Allowed[faction] then char:getPlayer():Notify("Twoja frakcja nie posiada konta") return end
    Firestone.FactionsVault.FactionData[faction].money = Firestone.FactionsVault.FactionData[faction].money - amount
    char:giveMoney(amount)
    Firestone.FactionsVault.Save()
    print("[FV LOG] "..char:getName().." wypłacił "..amount.." z konta frakcji "..faction.."\n Bilans konta: "..Firestone.FactionsVault.FactionData[faction].money)
end
function Firestone.FactionsVault.GetBalance(char)
    if not getPermissions(char) then return end
    if not getPermissions(char).vault then return char:getPlayer():Notify("Nie posiadasz uprawnień") end
    if not char then return end
    local faction = nut.faction.indices[char:getFaction()].uniqueID
    if not Firestone.FactionsVault.Allowed[faction] then char:getPlayer():Notify("Twoja frakcja nie posiada konta") return end
    if Firestone.FactionsVault.FactionData[faction].money>0 then return Firestone.FactionsVault.FactionData[faction].money end
end