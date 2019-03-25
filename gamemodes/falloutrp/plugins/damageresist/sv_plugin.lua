local PLUGIN = PLUGIN
local damagetype = 
{DMG_BULLET, --2 To są enumy w komentarzu.
DMG_SLASH, --4
DMG_CLUB, --128
DMG_AIRBOAT, --33554432
DMG_BUCKSHOT, --536870912
DMG_SNIPER} --1073741824

function PLUGIN:EntityTakeDamage(target,dmg)
    if  target:IsPlayer() and table.HasValue( damagetype, dmg:GetDamageType() )  then -- szybki check
		local attacker = dmg:GetAttacker()
		local dr = target:getChar():getData("dr") or 0
		local dt = target:getChar():getData("dt") or 0
		target:PrintMessage(HUD_PRINTTALK, "-------\ndmg Przed redukcją:"..dmg:GetDamage().."\n dmgtype:"..dmg:GetDamageType().."\ndt:"..dt.."\ndr:"..dr.."\n" )
        if table.HasValue( damagetype, dmg:GetDamageType() ) and ( attacker:IsNPC() or attacker:IsPlayer() ) then
        local char = target:getChar()
				local damagetreshold = char:getData("dt") 
				local damageresist = char:getData("dr") 

				if (dmg:GetDamage()>=damagetreshold and ( attacker:IsNPC() or attacker:IsPlayer() )) then
					dmg:SetDamage(dmg:GetDamage()-damagetreshold)
					target:PrintMessage(HUD_PRINTTALK, "dmg po odjęciu:"..dmg:GetDamage())
					--[[Dałem tu tyle ifów ponieważ coś mi się rypało w nich i czytało dmg z damage systemu nawet
			    	może ktoś naprawi, na razie to działa chociaż względem optymalizacji, wiem, że jest to złe rozwiązanie.]]--
				else if (dmg:GetDamage()<damagetreshold and ( attacker:IsNPC() or attacker:IsPlayer() )) then 
					dmg:SetDamage(math.random(0, ( dmg:GetDamage() - ( dmg:GetDamage()*damageresist ) )))
					target:PrintMessage(HUD_PRINTTALK, "dmg po redukcji:"..dmg:GetDamage())
					target:EmitSound(("physics/metal/metal_solid_impact_bullet"..math.random(1,4)..".wav"))
				end 

			end
			
		end
    end
end
