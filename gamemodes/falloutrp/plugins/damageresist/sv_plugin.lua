local PLUGIN = PLUGIN
local damagetype = 
{
[DMG_BULLET] = true, --2
[DMG_SLASH]= true, --4
[DMG_CLUB]= true, --128
[DMG_AIRBOAT]= true, --33554432
[DMG_BUCKSHOT]= true, --536870912
[DMG_SNIPER]= true} --1073741824

function PLUGIN:GetDr(client)
	local dr = 0.00
	local char = client:getChar()
	local items = char:getInv():getItems()
    for k, v in pairs(items) do
        if v.reduction  and v:getData("equip") then
            dr = dr + v.reduction
        end
    end
	return dr 
end

function PLUGIN:GetDt(client)
	local dt = 0
	local char = client:getChar()
	local items = char:getInv():getItems()
    for k, v in pairs(items) do
        if v.dt  and v:getData("equip") then
            dt = dt + v.dt
        end
    end
	return dt
end


function PLUGIN:EntityTakeDamage(target,dmg)
    if  target:IsPlayer() and damagetype[dmg:GetDamageType()]   then -- szybki check
		local attacker = dmg:GetAttacker()
		local dr = hook.Run("GetDr",target) or 0
		local dt = hook.Run("GetDt",target) or 0
		target:PrintMessage(HUD_PRINTTALK, "-------\ndmg Przed redukcją:"..dmg:GetDamage().."\ndt:"..dt.."\ndr:"..dr.."\n" )
        if damagetype[dmg:GetDamageType()] and ( attacker:IsNPC() or attacker:IsPlayer() ) then
				local damagetreshold = dt 
				local damageresist = dr
				dmg:SetDamage(dmg:GetDamage()*(damageresist/100))
				if (dmg:GetDamage()-damagetreshold)<0 then
					local r = math.random(0, 4)
					if r == 0 then
						dmg:SetDamage(1)
					else
						dmg:SetDamage(0)
					end
					target:EmitSound(("physics/metal/metal_solid_impact_bullet"..math.random(1,4)..".wav"))
					target:PrintMessage(HUD_PRINTTALK, "dmg:"..dmg:GetDamage())
				else 
					dmg:SetDamage(dmg:GetDamage()-damagetreshold)
					target:PrintMessage(HUD_PRINTTALK, "dmg po redukcjidt:"..dmg:GetDamage())
				end	
		end
    end 
end
