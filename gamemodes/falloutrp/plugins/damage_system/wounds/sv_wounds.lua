local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:DamageBodyPart(strBodypPart, intDmg)
   self:SetNWInt("Firestone."..strBodypPart.."Health", self:GetNWInt("Firestone."..strBodypPart.."Health", 100) - intDmg) 
end

function PLAYER:GetBodyPartHealth(strBodyPart)
   local BodyPartHP = self:GetNWInt("Firestone."..strBodyPart.."Health")
    if BodyPartHP != nil then 
         return BodyPartHP
     else
         return 100
     end
end

function PLAYER:HealBodyPart(strBodyPart, intAmount)
    local BodyPartHP = self:GetNWInt("Firestone."..strBodyPart.."Health")
    if BodyPartHP >= 100 then return end 
    if intAmount + BodyPartHP <= 100 then
        self:SetNWInt("Firestone."..strBodyPart.."Health", BodyPartHP + intAmount)
    else
        self:SetNWInt("Firestone."..strBodyPart.."Health", 100)
    end
end

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

function PLUGIN:ScalePlayerDamage(ply, hitgroup, dmginfo)
    local bodypart = ""
    
    if  hitgroup == HITGROUP_HEAD then
       dmginfo:ScaleDamage(2)
       bodypart = "Head"
    end
    if hitgroup == HITGROUP_CHEST then
        dmginfo:ScaleDamage(1.25)
        bodypart = "Chest"
    end
    if hitgroup == HITGROUP_STOMACH then
        dmginfo:ScaleDamage(1)
        bodypart = "Stomach"
    end
    if hitgroup == HITGROUP_RIGHTARM then
        dmginfo:ScaleDamage(0.5)
        bodypart = "Right Arm"
    end
    if hitgroup == HITGROUP_LEFTHARM then
        dmginfo:ScaleDamage(0.5)
        bodypart = "Left Arm"
    end
    if hitgroup == HITGROUP_RIGHTLEG then
        dmginfo:ScaleDamage(0.75)
        bodypart = "Right Leg"
    end
    if hitgroup == HITGROUP_LEFTLEG then
        dmginfo:ScaleDamage(0.75)
        bodypart = "Left Leg"
    end
    ply:DamageBodyPart(bodypart, dmginfo:GetDamage()*5)
    ply:ApplyBleeding(math.Round(math.random(dmginfo:GetDamage()/2, dmginfo:GetDamage())))
end

function PLUGIN:PlayerSpawn(ply)
    for i, v in ipairs(DamageSys.BodyParts) do 
        ply:SetNWInt("Firestone."..v[1].."Health", 100)
        ply:SetNWInt("Firestone.Bleeding", 0)
    end
end

function PLUGIN:Think()
    for i, v in ipairs(player.GetAll()) do
        if v:IsBleeding() then
            if CurTime() > v.BleedingTimer + DamageSys.BleedingInterval then
                v.BleedingTimer = CurTime()
                v:TakeDamage(1, v, nil)
                v:SetNWInt("Firestone.Bleeding", v:GetBleeding() - 1)
            end
        end
    end
end