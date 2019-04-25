if !SERVER then return end 
local PLUGIN = PLUGIN

function PLUGIN:PlayerLoadedChar( ply )
    local char = ply:getChar()
    if char:getData("chartime") == nil then
        char:setData("chartime", 1)
        char:save()
    end

    if timer.Exists("CharTimer") then return end
    timer.Create("CharTimer", 5, 0, function()
        for _,ply in pairs(player.GetAll()) do
            local char = ply:getChar()
            if !char then return end
            char:setData("chartime", char:getData("chartime") + 5)
            char:save()
        end
    end)
end