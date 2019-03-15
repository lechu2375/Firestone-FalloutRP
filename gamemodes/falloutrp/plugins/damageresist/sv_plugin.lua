local PLUGIN = PLUGIN

function PLUGIN:EntityTakeDamage(target,dmg)
    if  target:IsPlayer()  then 
        print(dmg:GetDamageType())
        if table.HasValue(damagetype, dmg:GetDamageType()) then
            local char = target:getChar()
			local dt = char:getData("dt") or 0
			local dr = char:getData("dr") or 0
				if (dmg:GetDamage()>dt) then
					dmg:SetDamage(dmg:GetDamage*dr)
				end
				else if (dmg:GetDamage()<dt) then 
					dmg:SetDamage(0)
					dmg:SetDamageForce(dmg:GetDamageForce()+dmg:GetDamageForce()*0.2)
				end
        end
    end
end
