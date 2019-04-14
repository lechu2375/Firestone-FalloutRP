print("SV FRAKCJE LOADED :)")

TABELA_RANG = {}
print("testowe printowanie tabeli z rangami...")
PrintTable(TABELA_RANG)

function PLUGIN:OnCharCreated(client, id) 
    local frakcja = id:getFaction()
    local spis_frakcji = nut.faction.indices
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then
        SetRank(id,1)
    end
end

function SetRank(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID],false,player.GetAll())
    char:getPlayer():Notify("Twoja ranga została zmieniona na: "..GetRank(char))
    local charid = char:getID()
    TABELA_RANG[charid] = GetRank(char)
end

function PLUGIN:CharacterLoaded(id)
    TABELA_RANG[id] = GetRank(id)
end


