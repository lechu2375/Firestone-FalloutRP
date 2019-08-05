local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

local allowedDamageType = {
	[DMG_BULLET] = true,
	[DMG_SLASH] = true,
	[DMG_CLUB] = true,
	[DMG_BUCKSHOT] = true,
	[DMG_SNIPER] = true
}

function PLAYER:GetDamageResist()
	local damageResist = 0
	local char = self:getChar()
    for _, item in pairs(char:getInv():getItems()) do
        if item.reduction  and item:getData("equip") then
            damageResist = damageResist + item.reduction
        end
    end
	return damageResist
end

function PLAYER:GetDamageTreshold()
	local damageTreshold = 0
	local char = self:getChar()
    for _, item in pairs(char:getInv():getItems()) do
        if item.dt  and item:getData("equip") then
            damageTreshold = damageTreshold + item.dt
        end
    end
	return damageTreshold
end

function PLUGIN:EntityTakeDamage(ply, dmg)
	local damageType, damageAmount, newDamage = dmg:GetDamageType(), math.Round(dmg:GetDamage()), 0
	if !ply:IsPlayer() or !allowedDamageType[damageType] then return end -- Sprawdzenie czy to gracz oraz skąd wynika obrażenie
	local damageResist, damageTreshold = ply:GetDamageResist() or 0, ply:GetDamageTreshold() or 0 -- Uzyskanie informacji o defensie gracza
	local newDamage, damageMultiplier = 0, 0 -- Żeby informacje mogły trafić do debugu
	if (damageAmount > damageTreshold) then
		if (damageResist > 0) then
			damageMultiplier = math.Round(damageResist/15, 2) -- Utworzenie mnożnika
			newDamage = math.Round(damageAmount - (damageAmount * damageMultiplier)) -- I zastosowanie go
		else
			newDamage = damageAmount -- A jak nie ma w ogóle defensa to nie zmienia wartości
		end
		dmg:SetDamage(newDamage)
		ply:EmitSound(("physics/metal/metal_solid_impact_bullet"..math.random(1,4)..".wav"))
	else 
		newDamage = math.random(1, 3)
		dmg:SetDamage(newDamage) -- Jeżeli dmg nie przekroczy tresholdu to kilka tam hp spada
	end

	local debugMode = true
	if (debugMode) then -- NO I DEBUG PROSZE PANA ALE TYLKO W KONSOLI ( ͡~ ͜ʖ ͡°)
		print("Informacje o graczu: DR("..damageResist..") DT ("..damageTreshold..")")
		print("Otrzymane obrażenia przed redukcją: "..damageAmount)
		print("Otrzymane obrażenia po redukcji: "..newDamage)
		if (damageMultiplier != 0) then
			print("Zastosowano mnożnik: "..damageMultiplier)
		end
	end
end
