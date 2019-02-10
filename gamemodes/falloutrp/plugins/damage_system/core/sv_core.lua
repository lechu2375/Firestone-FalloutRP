local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:DamageBodyPart(strBodyPart, intDmg)
    local char = self:getChar()
    char:setData("Firestone."..strBodyPart.."Health", char:getData("Firestone."..strBodyPart.."Health") - math.Clamp(intDmg, 0, char:getData("Firestone."..strBodyPart.."Health")))
end

function PLAYER:GetBodyPartHealth(strBodyPart)
    local char = self:getChar()
    if !char then return end
    local BodyPartHP = char:getData("Firestone."..strBodyPart.."Health")
    if BodyPartHP != nil then 
         return BodyPartHP
     else
         return 100
     end
end

function PLAYER:HealBodyPart(strBodyPart, intAmount)
    local char = self:getChar()
    local BodyPartHP = char:getData("Firestone."..strBodyPart.."Health")
    if BodyPartHP >= 100 then return end 
    if intAmount + BodyPartHP <= 100 then
        char:setData("Firestone."..strBodyPart.."Health", BodyPartHP + intAmount)
    else
        char:setData("Firestone."..strBodyPart.."Health", 100)
    end
end

function PLAYER:HealParts()
    for _,v in ipairs(DamageSys.BodyParts) do
        local char = self:getChar()
        char:setData("Firestone."..v.name.."Health", 100)
    end
    self:SetHealth(100)
end

function PLUGIN:ScalePlayerDamage(ply, hitgroup, dmginfo)
    local bodypart
    local char = ply:getChar()

    if !char then return end
    
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

    if !bodypart then return end
    
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
        ply:Notify("W wyniku postrzału zacząłeś krwawić")
        ply.WasNotified = true
    end

    local LeftLegHealth, RightLegHealth = ply:GetBodyPartHealth("Left Leg"), ply:GetBodyPartHealth("Right Leg")
    if LeftLegHealth <= 10 || RightLegHealth <= 10 || (LeftLegHealth + RightLegHealth) <= 50 then
        ply.WasRagdolled = false
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

function PLUGIN:OnCharCreated(ply)
    local char = ply:getChar()
    for i, v in ipairs(DamageSys.BodyParts) do
        char:setData("Firestone."..v.name.."Health", 100)
    end
end

function PLUGIN:PlayerLoadedChar(ply, char, oldchar)
    ply:SetNWInt("Firestone.Bleeding", 0)
    ply.WasNotified = false
    ply.WasRagdolled = false
    ply:SetNWBool("BW", false)
    ply:SetNWBool("wasBW", false)
    for i, v in ipairs(DamageSys.BodyParts) do 
        char:setData("Firestone."..v.name.."Health", 100)
    end
end

function PLUGIN:PlayerDeath(ply) -- potrzebne, bo po śmierci gracza ma się wyświetlać hp kończyn, aż do respawnu.
    local char = ply:getChar()
    ply:SetNWInt("Firestone.Bleeding", 0)
    ply.WasNotified = false
    ply.WasRagdolled = false
    ply:SetNWBool("BW", false)
    ply:SetNWBool("wasBW", false)
    for i, v in ipairs(DamageSys.BodyParts) do 
        char:setData("Firestone."..v.name.."Health", 100)
    end    
end

function PLUGIN:Think()
    for _, v in ipairs(player.GetAll()) do
        local char = v:getChar()
        if char then
            if v:IsBleeding() then
                if CurTime() > v.BleedingTimer + DamageSys.BleedingInterval then
                    v.BleedingTimer = CurTime()
                    v:TakeDamage(1, v, nil)
                    v:SetNWInt("Firestone.Bleeding", v:GetBleeding() - 1)
                end
            else 
                v.WasNotified = false
            end
            
            if v:GetBodyPartHealth("Right Leg") < 100 || v:GetBodyPartHealth("Left Leg") < 100 then
                local LeftLegHealth, RightLegHealth = v:GetBodyPartHealth("Left Leg"), v:GetBodyPartHealth("Right Leg")
                v:SetWalkSpeed(math.Clamp((LeftLegHealth + RightLegHealth) - 30, 7, 130))
                v:SetRunSpeed(math.Clamp((LeftLegHealth + RightLegHealth + 60), 7, 240))
                if LeftLegHealth <= 10 || RightLegHealth <= 10 || (LeftLegHealth + RightLegHealth) <= 50 then
                    if !v.WasRagdolled then
                        v:setRagdolled(true, 5)
                        v.WasRagdolled = true
                    end
                else
                    v.WasRagdolled = false
                end
            end

            if v:Health() <= 20 || v:GetBodyPartHealth("Head") <= 40 || v:GetBodyPartHealth("Chest") <= 30 || v:GetBodyPartHealth("Stomach") <= 20 || (v:GetBodyPartHealth("Head") + v:GetBodyPartHealth("Chest") + v:GetBodyPartHealth("Stomach")) <= 170  then
                v:BW(180)
            end
            if v:GetBW() then
                if CurTime() > v.BWCurtime + v.BWTime then
                    v:SetNWBool("BW", false)
                    v.BWCurtime = CurTime()
                end
            end
        end
    end
end