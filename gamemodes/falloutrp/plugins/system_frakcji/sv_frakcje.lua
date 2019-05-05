print("SV FRAKCJE LOADED :)")
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

util.AddNetworkString("tabela_rang")
util.AddNetworkString("FS:FactionInvite")

timer.Create("tabela_networking", 6, 0, function() --prosty networking, nie w thinku bo sie tak nie robi
    net.Start("tabela_rang")
    net.WriteTable(TABELA_RANG)
    net.Broadcast()
end)

