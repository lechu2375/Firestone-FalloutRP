if !SERVER then return end 

local PLUGIN = PLUGIN

if timer.Exists("chartimer") then return end
timer.Create("chartimer", 30, 0, function()
    for _,v in pairs(player.GetAll()) do
    char = v:getChar()
    if !char then return end
        if (!char:getData("chartime") or char:getData("chartime") == nil)  then
            char:setData("chartime", 30)
        else
            char:setData("chartime", char:getData("chartime") + 30)
        end
    end
end)