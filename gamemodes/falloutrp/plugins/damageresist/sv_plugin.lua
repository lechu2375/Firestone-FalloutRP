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
		target:PrintMessage(HUD_PRINTTALK, "dmg:"..dmg:GetDamage().." dmgtype:"..dmg:GetDamageType() )
		print("--------------------------\n--------------")
        print("dmgtypebezifa:"..dmg:GetDamageType())
		print("dmg:"..dmg:GetDamage())
		print("--------------------------\n--------------")

        if table.HasValue( damagetype, dmg:GetDamageType() ) and ( attacker:IsNPC() or attacker:IsPlayer() ) then
            	local char = target:getChar()
				local damagetreshold = char:getData("dt") 
				local damageresist = char:getData("dr") 

				if (dmg:GetDamage()>=damagetreshold and ( attacker:IsNPC() or attacker:IsPlayer() )) then
					print("pierwszy warunek".."dt:"..char:getData("dt").."dr:"..char:getData("dr"))
					print("dmgtype:"..dmg:GetDamageType())
					target:PrintMessage(HUD_PRINTTALK, "pierwszy warunek." )
					dmg:SetDamage(dmg:GetDamage()*damageresist)
					--[[Dałem tu tyle ifów ponieważ coś mi się rypało w nich i czytało dmg z damage systemu nawet
			    	może ktoś naprawi, na razie to działa chociaż względem optymalizacji, wiem, że jest to złe rozwiązanie.]]--
				else if (dmg:GetDamage()<damagetreshold and ( attacker:IsNPC() or attacker:IsPlayer() )) then 
					print("dmgtype:"..dmg:GetDamageType())
					print("drugi warunek".."dt:"..char:getData("dt").."dr:"..char:getData("dr"))
					target:PrintMessage(HUD_PRINTTALK, "drugi warunek" )
					dmg:SetDamage(0)
				end 
			end
			
		end
    end
end
