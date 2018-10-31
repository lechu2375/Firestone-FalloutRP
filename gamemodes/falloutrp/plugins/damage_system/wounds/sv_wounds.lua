local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:DamageBodyPart(strBodypPart, intDmg)
   self:SetNWInt("Firestone."..strBodypPart.."Health", self:GetNWInt("Firestone."..strBodypPart.."Health", 100) - intDmg) 
end

function PLAYER:GetBodyPartHealth(strBodyPart)
    return self:GetNWInt("Firestone."..strBodyPart.."Health")
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
    ply:DamageBodyPart(bodypart, dmginfo:GetDamage()*4)
end

function PLUGIN:PlayerSpawn(ply)
    for i, v in ipairs(DamageSys.BodyParts) do 
        ply:SetNWInt("Firestone."..v[1].."Health", 100)
    end
end
