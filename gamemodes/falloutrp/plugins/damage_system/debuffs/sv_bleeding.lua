local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

-- Player Metatables

function PLAYER:ApplyBleeding( value ) -- 1 is 3 seconds
    local char = self:getChar()
    char:setData("FS.Bleeding", char:getData("FS.Bleeding") + value)
end

function PLAYER:GetBleeding()
    local char = self:getChar()
    local bleedingTime = char:getData("FS.Bleeding", 1)
    return bleedingTime
end

function PLAYER:IsBleeding()
    if self:GetBleeding() > 0 then
        return true
    else
        return false 
    end
end

-- Hooks needed to work properly

function PLUGIN:InitializedPlugins()
    if timer.Exists("FS:BleedingTimer") then return end
    timer.Create("FS:BleedingTimer", nut.config.get("bleedingTimer"), 0, function()
        for _,ply in ipairs( player.GetAll() ) do
            local char = ply:getChar()
            if !char or !ply:IsBleeding() then return end
            ply:TakeDamage( nut.config.get("bleedingDamage"), "Bleeding" )
            char:setData("FS.Bleeding", char:getData("FS.Bleeding") - 1)
        end
    end)
end

--
