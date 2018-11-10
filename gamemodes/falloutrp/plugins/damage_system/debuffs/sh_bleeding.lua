local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

DamageSys.BleedingInterval = 3

function PLAYER:ApplyBleeding(intAmount)
    self:SetNWInt("Firestone.Bleeding", self:GetNWInt("Firestone.Bleeding", 0) + intAmount)
    self.BleedingTimer = CurTime()
end

function PLAYER:GetBleeding()
    return self:GetNWInt("Firestone.Bleeding", 0)
end

function PLAYER:IsBleeding()
    if self:GetBleeding() > 0 then
        return true
    else
        return false 
    end
end