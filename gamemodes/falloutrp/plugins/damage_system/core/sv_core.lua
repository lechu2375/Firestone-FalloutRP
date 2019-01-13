local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:DamageBodyPart(strBodypPart, intDmg)
   self:SetNWInt("Firestone."..strBodypPart.."Health", self:GetNWInt("Firestone."..strBodypPart.."Health", 100) - math.Clamp(intDmg, 0, self:GetNWInt("Firestone."..strBodypPart.."Health", 100))) 
end

function PLAYER:GetBodyPartHealth(strBodyPart)
   local BodyPartHP = self:GetNWInt("Firestone."..strBodyPart.."Health", 100)
    if BodyPartHP != nil then 
         return BodyPartHP
     else
         return 100
     end
end

function PLAYER:HealBodyPart(strBodyPart, intAmount)
    local BodyPartHP = self:GetNWInt("Firestone."..strBodyPart.."Health", 100)
    if BodyPartHP >= 100 then return end 
    if intAmount + BodyPartHP <= 100 then
        self:SetNWInt("Firestone."..strBodyPart.."Health", BodyPartHP + intAmount)
    else
        self:SetNWInt("Firestone."..strBodyPart.."Health", 100)
    end
end

function PLUGIN:ScalePlayerDamage(ply, hitgroup, dmginfo)
    local bodypart
    
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
    
    if ply:GetPowerArmor() && ply:GetArmor() != nil && ply:GetArmor() != 0 then
        ply:DamageBodyPart(bodypart, math.Round(dmginfo:GetDamage()*5 - ply:GetArmor()))
        ply:RemoveArmor(math.Round(dmginfo:GetDamage()*5))
    elseif ply:GetArmor() != nil && ply:GetArmor() != 0 then 
        ply:DamageBodyPart(bodypart, math.Round(dmginfo:GetDamage()*5 - ply:GetArmor()))
        ply:RemoveArmor(math.Round(dmginfo:GetDamage()*5))
        ply:ApplyBleeding(math.Round(math.random(dmginfo:GetDamage()/2 - ply:GetArmor(), dmginfo:GetDamage() - ply:GetArmor())))
    else
        ply:DamageBodyPart(bodypart, math.Round(dmginfo:GetDamage()*5))
        ply:ApplyBleeding(math.Round(math.random(dmginfo:GetDamage()/2, dmginfo:GetDamage())))
    end
    if ply:IsBleeding() && !ply.WasNotified then
        ply:Notify("W wyniku postrzalu zaczales krwawic!")
        ply.WasNotified = true
    end

    local LeftLegHealth, RightLegHealth = ply:GetBodyPartHealth("Left Leg"), ply:GetBodyPartHealth("Right Leg")
    if LeftLegHealth <= 10 || RightLegHealth <= 10 || (LeftLegHealth + RightLegHealth) <= 50 then
        v.WasRagdolled = false
    end
end

function PLUGIN:EntityTakeDamage(ply, dmginfo)
    local bodyparts = {"Right Leg", "Left Leg"}
    if ply:IsPlayer() && IsValid(ply) then
	    local LeftLegHealth, RightLegHealth = ply:GetBodyPartHealth("Left Leg"), ply:GetBodyPartHealth("Right Leg")
	    if dmginfo:IsFallDamage() then
	        for _, v in ipairs(bodyparts) do
	            if ply:GetPowerArmor() && ply:GetArmor() != nil && ply:GetArmor() != 0 then
	                ply:DamageBodyPart(v, math.Round(math.random(dmginfo:GetDamage()/1.5, dmginfo:GetDamage()*1.5) - ply:GetArmor()))
	            else
	                ply:DamageBodyPart(v, math.Round(math.random(dmginfo:GetDamage()/1.5, dmginfo:GetDamage()*1.5)))
	            end
	        end
	        if LeftLegHealth <= 10 || RightLegHealth <= 10 || (LeftLegHealth + RightLegHealth) <= 50 then
	            ply.WasRagdolled = false
	        end
	    end        
    end
end

function PLUGIN:PlayerDeath(ply) -- potrzebne, bo po śmierci gracza ma się wyświetlać hp kończyn, aż do respawnu.
    ply.WasRagdolled = true
    ply:setRagdolled(false)
end

function PLUGIN:PlayerSpawn(ply) 
    for i, v in ipairs(DamageSys.BodyParts) do 
        ply:SetNWInt("Firestone."..v.name.."Health", 100)
        ply:SetNWInt("Firestone.Bleeding", 0)
    end
    ply.WasNotified = false
    ply.WasRagdolled = false
end

function PLUGIN:Think()
    for _, v in ipairs(player.GetAll()) do
        if v:IsBleeding() then
            if CurTime() > v.BleedingTimer + DamageSys.BleedingInterval then
                v.BleedingTimer = CurTime()
                v:TakeDamage(1, v, nil)
                v:SetNWInt("Firestone.Bleeding", v:GetBleeding() - 1)
            end
        else v.WasNotified = false
        end
        
        if v:GetBodyPartHealth("Right Leg") < 100 || v:GetBodyPartHealth("Left Leg") < 100 then
            local LeftLegHealth, RightLegHealth = v:GetBodyPartHealth("Left Leg"), v:GetBodyPartHealth("Right Leg")
            v:SetWalkSpeed(math.Clamp((LeftLegHealth + RightLegHealth) - 30, 7, 130))
            v:SetRunSpeed(math.Clamp((LeftLegHealth + RightLegHealth + 60), 7, 240))
            if LeftLegHealth <= 10 || RightLegHealth <= 10 || (LeftLegHealth + RightLegHealth) <= 50 then
                if !v.WasRagdolled then
                    v:setRagdolled(true)
                    v.WasRagdolled = true
                end
            else
                v:setRagdolled(false)
                v.WasRagdolled = false
            end
        end
    end
end
