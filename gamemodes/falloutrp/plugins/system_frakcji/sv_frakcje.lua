print("SV FRAKCJE LOADED :)")

local function SetRank_SV(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID].name,false,player.GetAll())
    char:getPlayer():Notify("Twoja ranga została zmieniona na: "..char:getData("ranga"))
    local charid = tonumber(char:getID())
    TABELA_RANG[charid] = char:getData("ranga")
end


function PLUGIN:OnCharCreated(client, id) 
    local frakcja = id:getFaction()
    local spis_frakcji = nut.faction.indices
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then
        SetRank_SV(id,1)
    end
end

function PLUGIN:CharacterRestored(char)
    
    local id = tonumber(char:getID())
    TABELA_RANG[id] = char:getData("ranga")

end

util.AddNetworkString( "tabela_rang" )

timer.Create("tabela_networking", 10, 0, function()
    net.Start("tabela_rang")
    net.WriteTable(TABELA_RANG)
    net.Broadcast()
end)