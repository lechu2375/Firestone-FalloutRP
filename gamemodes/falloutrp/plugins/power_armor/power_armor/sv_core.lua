local PLAYER = FindMetaTable("Player")

function PLAYER:SetPowerArmor(bState)
    if bState == true then 
        self:SetPData("Firestone.PowerArmor", true)
    else
        self:SetPData("Firestone.PowerArmor", false)
    end
end