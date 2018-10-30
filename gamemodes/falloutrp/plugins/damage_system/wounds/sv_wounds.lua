local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:DamageBodyPart(bodypart, dmg)
   self:SetNWInt("Firestone."..bodypart.."Health", self:GetNWInt("Firestone."..bodypart.."Health", 100) - dmg) 
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

function PLUGIN:PlayerDeath(victim, inflictor, attacker)
    for i, v in ipairs(DamageSys.BodyParts) do 
        victim:SetNWInt("Firestone."..v.."Health", 100)
    end
end