util.AddNetworkString("tabela_rang")
util.AddNetworkString("FS:FactionInvite")
util.AddNetworkString("FS:FactionInviteD")
util.AddNetworkString("FS:FactionInviteA")
local function SetRank_SV(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID],false,player.GetAll()) 
    char:getPlayer():Notify("Twoja ranga została zmieniona na: "..char:getData("ranga"))
    local charid = tonumber(char:getID())
    TABELA_RANG[charid] = char:getData("ranga")
end


function PLUGIN:OnCharCreated(client, id) 
    local frakcja = id:getFaction()
    local spis_frakcji = nut.faction.indices
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then --Mieszkańcy pustkowia nie mają rang.
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
    local clientID = client:AccountID()
    local targetID = target:AccountID()
    if not getPermissions(clientChar).invite then
        client:Notify("Nie posiadasz uprawnień do zapraszania!")
        return false
    elseif invList[targetID] then
        client:Notify("Gracz już posiada otwarte okno propozycji.")
        return false
    end
    local faction = clientChar:getFaction()
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
    if not invList[id] then return end
    local faction = invList[id][2]  
    invList[id]=nil
end)
--INVITE SYSTEM CODE END
print("SV FRAKCJE LOADED :)")

