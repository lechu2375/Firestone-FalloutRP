local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:SetPowerArmor(bState)
    if bState == true then 
        self:SetNWBool("Firestone.PowerArmor", true)
    else
        self:SetNWBool("Firestone.PowerArmor", false)
    end
end

function PLAYER:GetPowerArmor()
    return self:GetNWBool("Firestone.PowerArmor")
end

function PLUGIN:PlayerSpawn(ply)
    if ply:GetPowerArmor() == true then 
        ply:AddArmor(100)
    end
end
