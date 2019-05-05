
TABELA_RANG_cl = {}

net.Receive("tabela_rang", function()
     TABELA_RANG_cl = net.ReadTable()
end)

net.Receive("FS:FactionInvite", function()
     local recive = net.ReadTable()
     PrintTable(recive)
end)



function PLUGIN:DrawCharInfo(client, character, info)
    local frakcja = client:getChar():getFaction()
    local kolor_frakcji = nut.faction.indices[frakcja].color
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then  
         info[#info + 1] = {TABELA_RANG_cl[tonumber(character:getID())], kolor_frakcji}
    end
end



