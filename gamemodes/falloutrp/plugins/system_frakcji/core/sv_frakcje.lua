util.AddNetworkString("FS.Factions.SendRankTable")
util.AddNetworkString("FS:FactionSendInvite")
util.AddNetworkString("FS:FactionHandleResponse")

local PLAYER = FindMetaTable("Player")
local PLUGIN = PLUGIN
FS = FS or {}
FS.Factions = FS.Factions or {}
FS.Factions.invList = {}

function FS.Factions.HandleInvite(sender, target)
    local senderChar, targetChar = sender:getChar(), target:getChar()
    local senderFaction = senderChar:getFaction()
    local canInvite = sender:GetFactionPermissions().invite
    if (canInvite == nil) then
        sender:Notify("Nie masz do tego uprawnień!")
        return
    end
    for _, v in pairs({FACTION_LEGION, FACTION_RNK, FACTION_BS}) do
        if (target:hasWhitelist(v)) then
            sender:Notify("Gracz należy już do jakiejś frakcji")
            break
        end
    end
    if (target:hasWhitelist(senderFaction)) then
        sender:Notify("Gracz już posiada whiteliste")
        return
    end
    if (FS.Factions.invList[targetChar]) then
        sender:Notify("Gracz posiada otwarte okno zaproszenia")
        return
    end
    sender:Notify("Wysłano zaproszenie")
    FS.Factions.invList[targetChar] = senderFaction
    net.Start("FS:FactionSendInvite")
        net.WriteTable({sender = sender, faction = senderFaction})
    net.Send(target)
end

function PLAYER:SetFactionRank(char, rank)
    local faction = char:getFaction()
    if !(nut.faction.indices[faction].rangi) then return end
    char:setData("factionRank", nut.faction.indices[faction].rangi[rank], false, player.GetAll())
    self:Notify("Twoja ranga została zmieniona na: "..char:getData("factionRank", 0))
end

function FS.Factions.HandleResponse(_, ply)
    local char = ply:getChar()
    local info = net.ReadTable()
    if !(FS.Factions.invList[char]) then
        ply:Kick("Antycheat [ID 1]")
        return
    end
    if (info.accepted) then
		char:setFaction(info.faction)
        ply:SetFactionRank(char, 1)
        ply:setWhitelisted(info.faction, true)
        char:sync()

        info.sender:Notify("Gracz zaakceptował zaproszenie")
        ply:Notify("Zaakceptowałeś zaproszenie")
    else
        info.sender:Notify("Gracz odrzucił zaproszenie")
        ply:Notify("Odrzuciłeś zaproszenie")
    end
    FS.Factions.invList[char] = nil
end
net.Receive("FS:FactionHandleResponse", FS.Factions.HandleResponse)


function PLAYER:GetFactionPermissions()
    local char = self:getChar()
    local faction = char:getFaction()
    if !(nut.faction.indices[faction].permissions) then return {} end 
    if !(nut.faction.indices[faction].permissions[char:GetData("factionRank")]) then return {} end 
    return nut.faction.indices[faction].permissions[char:getData("factionRank")]
end

function PLUGIN:CharacterRestored(char) 
    local rank = char:getData("factionRank")
    FS.Factions.RankTable[char] = rank
end

function PLUGIN:OnCharCreated(ply, char) 
    ply:SetFactionRank(char, 1)
end

function FS.Factions.RankTable()
    FS.Factions.RankTable = {}
    for k, ply in pairs(player.GetAll()) do
        local char = ply:getChar()
        local rank
        if (char) then
            rank = char:getData("factionRank")
        end
        if (rank and char) then
            FS.Factions.RankTable[char.id] = rank
        end
        if (k == #player.GetAll()) then
            net.Start("FS.Factions.SendRankTable")
                net.WriteTable(FS.Factions.RankTable)
            net.Broadcast()
        end
    end
end
timer.Create("Sending Table to client", 1, 0, FS.Factions.RankTable)

concommand.Add("a", function(ply, cmd, args)
    ply:SetFactionRank(ply:getChar(), 1)
end)