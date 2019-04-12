function PLUGIN:OnCharCreated(client, id) 
    local frakcja = id:getFaction()
    local spis_frakcji = nut.faction.indices
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then
        print("cos innego niz mieszkaniec pozdro")
        SetRank(id,1)
    end
end

function SetRank(char,rangaID)
    local frakcja = char:getFaction()
    local spis_frakcji = nut.faction.indices 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID] )
    char:getPlayer():Notify("Twoja ranga została zmieniona na: "..char:getData("ranga"))
end