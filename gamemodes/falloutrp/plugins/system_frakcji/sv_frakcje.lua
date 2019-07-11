util.AddNetworkString("tabela_rang")
util.AddNetworkString("FS:FactionInvite")
util.AddNetworkString("FS:FactionInviteD")
util.AddNetworkString("FS:FactionInviteA")
Firestone.FactionsVault = {} or util.JSONToTable(file.Read("sv_vault.txt"))

for k,v ipairs(nut.faction.indices) do
	if not Firestone.FactionsVault[v] then
		Firestone.FactionsVault[v] = 0
	end
end

function PLUGIN:VaultTransaction(char,data)
	if not getPermissions(char).vault then return false end
	local faction = char:getFaction()
	local vault = Firestone.FactionsVault[faction]
	local transaction = data.transaction
	if transaction.add and data.value <= char:getMoney()then
		
	elseif transaction.withdraw and data.value=<vault then
	
	else 
		return false 
	end
end

local function SetRank_SV(char,rangaID)
    local frakcja = char:getFaction() 
    if nut.faction.indices[frakcja].rangi then
        char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID],false,player.GetAll()) 
        char:getPlayer():Notify("Twoja ranga została zmieniona na: "..char:getData("ranga"))
        local charid = tonumber(char:getID())
        TABELA_RANG[charid] = char:getData("ranga")
    else
        char:setData("ranga","Brak",false,player.GetAll())
    end
end



function PLUGIN:OnCharCreated(client, id) 
    local frakcja = id:getFaction()
    if nut.faction.indices[frakcja].rangi then --Mieszkańcy pustkowia nie mają rang.
        SetRank_SV(id,1)
    end
end

function PLUGIN:CharacterRestored(char) 
    local id = tonumber(char:getID())
    local ranga = char:getData("ranga")
    TABELA_RANG[id] = ranga --Od razu wrzuca do tabeli, żeby każdy gracz odczytał rangę postaci. 
end




timer.Create("tabela_networking", 6, 0, function() --prosty networking, nie w thinku bo sie tak nie robi
    net.Start("tabela_rang")
    net.WriteTable(TABELA_RANG)
    net.Broadcast()
end)
--INVITE SYSTEM CODE


local invList = {}
function PLUGIN:PlayerDisconnected(ply) --Deleting dynamic table if exists
    local id = ply:AccountID()
    if invList[id] then
        invList[id] = nil
    end
end



function factionInvite(client,target)
    local clientChar = client:getChar()
    local targetID = target:AccountID()
    if not getPermissions(clientChar).invite then
        client:Notify("Nie posiadasz uprawnień do zapraszania!")
        return false
    elseif invList[targetID] then
        client:Notify("Gracz już posiada otwarte okno propozycji.")
        return false
    end
    local faction = clientChar:getFaction()
    if target:hasWhitelist(faction) then 
        client:Notify("Ten gracz już posiada whitelistę!")
        return
    end
    local clientID = client:AccountID()
    local infotable = {}
    infotable["inviterName"] = clientChar:getName()
    infotable["faction"] = nut.faction.indices[faction].name
    net.Start("FS:FactionInvite")
        net.WriteTable(infotable)
    net.Send(target)
    invList[targetID] = {
		[1]=clientID,
		[2]=faction
    }
end

net.Receive("FS:FactionInviteD", function(len,ply) --Odrzucenie
    local id = ply:AccountID()
    if not invList[id] then return end
    local c = player.GetByAccountID(invList[id][1])
    c:Notify("Gracz odrzucił zaproszenie.")
    invList[id]=nil
end)
net.Receive("FS:FactionInviteA", function(len,ply) --Akceptacja
    local id = ply:AccountID()
    if not invList[id] then 
        ply:Kick("Client 4 overflowed reliable channel.")
        return
    end 
    local faction = invList[id][2]  
    ply:setWhitelisted(faction, true)
    print("[FACTION LOG]"..os.date("%H:%M:%S - %d/%m/%Y" ,os.time()).." "..ply:Nick().."["..ply:AccountID().."]".." akceptował ofertę whitelisty we frakcji "..nut.faction.indices[faction].name.." wysłaną przez".."["..invList[id][1].."]")
    //Tabela zaproszeń działa na AccountId ponieważ jest mniejsza cyfra, w logach by się trzymać schematu też na tym działamy.
    invList[id]=nil
end)
--INVITE SYSTEM CODE END
print("[FACTION LOG]Faction System Loaded")

