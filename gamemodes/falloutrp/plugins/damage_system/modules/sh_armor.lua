local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:SetArmor(intAmount)
    self:SetNWInt("Firestone.Armor", intAmount)
end

function PLAYER:GetArmor()
    return self:GetNWInt("Firestone.Armor")
end

function PLAYER:AddArmor(intAmount)
    self:SetNWInt("Firestone.Armor", self:GetNWInt("Firestone.Armor") + intAmount)
end

function PLAYER:RemoveArmor(intAmount)
    self:SetNWInt("Firestone.Armor", self:GetNWInt("Firestone.Armor") - intAmount)
end
