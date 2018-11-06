local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

DamageSys.BleedingInterval = 3
DamageSys.BleedingBodyParts = DamageSys.BleedingBodyParts or {}

function PLAYER:ApplyBleeding(intAmount, strBodyPart)
    self:SetNWInt("Firestone."..strBodyPart..".Bleeding", self:GetNWInt("Firestone."..strBodyPart..".Bleeding", 0) + intAmount)
    if !table.HasValue(DamageSys.BleedingBodyParts, strBodyPart) then
        table.insert(DamageSys.BleedingBodyParts, strBodyPart)
    end
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
