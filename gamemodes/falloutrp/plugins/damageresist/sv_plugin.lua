local PLUGIN = PLUGIN
local damagetype =
{DMG_BULLET,DMG_SLASH,DMG_CLUB,DMG_AIRBOAT,DMG_BUCKSHOT,DMG_SNIPER}

function PLUGIN:EntityTakeDamage(target,dmg)
    if  target:IsPlayer()  then 
        print(dmg:GetDamageType())
        if table.HasValue(damagetype, dmg:GetDamageType()) then
            target:Notify("Właśnie dostałeś DEMEJDŻ", 3)
        end
    end
end

