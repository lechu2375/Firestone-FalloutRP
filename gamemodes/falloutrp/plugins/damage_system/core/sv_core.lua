local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")
local damageTypes = { DMG_BULLET, DMG_SLASH, DMG_CLUB, DMG_AIRBOAT, DMG_BUCKSHOT, DMG_SNIPER }

-- Player Metatables

function PLAYER:HealParts()
    local char = self:getChar()
    for _,bodyPart in ipairs(DamageSys.BodyParts) do
        char:setData("BodyPart."..bodyPart.name, 100)
    end
    self:SetHealth(100)
    char:save()
end

function PLAYER:GetBodyPartCondition( bodyPart )
    local char = self:getChar()
    if !char then return end
    local condition = char:getData("BodyPart."..bodyPart)
    return condition
end

function PLAYER:DamageBodyPart( bodyPart, dmg )
    local char = self:getChar()
    char:setData( "BodyPart."..bodyPart, math.Clamp( self:GetBodyPartCondition( bodyPart ) - math.Round( dmg ), 0, 100 ) )
    char:save()
end

-- Hooks needed to properly work

function PLUGIN:OnCharCreated( ply, char )
    for _,part in ipairs( DamageSys.BodyParts ) do
        char:setData("BodyPart."..part.name, 100)
    end
    char:setData("FS.Bleeding", 0)
    char:setData("isBW", false)
    char:save()
end

function PLUGIN:PlayerLoadedChar( ply, char )
    char:setVar("nextBleedingNotify", 0)
end

function PLUGIN:ScalePlayerDamage( ply, hitGroup, dmgInfo )
    local bodyPart
    local char = ply:getChar()
    local damageType = dmgInfo:GetDamageType()
            print(damageType)
    if damageTypes[ damageType ] then
        for _,part in ipairs( DamageSys.BodyParts ) do
            if  ( hitGroup == part.hitgroup ) then
                dmgInfo:ScaleDamage( part.damageScale )
                bodyPart = part.name
            end
        end
    end

    if ( CurTime() > char:getVar("nextBleedingNotify") ) then
        ply:Notify("W wyniku postrzału zacząłeś krwawić!")
        char:setVar("nextBleedingNotify", CurTime() + 15)
    end

    ply:DamageBodyPart( bodyPart, dmgInfo:GetDamage() )
    ply:ApplyBleeding( 3 )
end

function PLUGIN:EntityTakeDamage( ply, dmgInfo )
    -- Legs damaging
    if dmgInfo:IsFallDamage() and ply:Alive() then
        for _,bodyPart in ipairs( {"RightLeg", "LeftLeg"} ) do
            ply:DamageBodyPart( bodyPart, math.Round( math.random( dmgInfo:GetDamage()/1.25, dmgInfo:GetDamage()*1.25 ) ) )
        end
    end
end

function PLUGIN:PlayerDeath( ply )
    local char = ply:getChar()
    for i, v in ipairs(DamageSys.BodyParts) do 
        char:setData("BodyPart."..v.name, 100)
    end 
    char:setVar("nextBleedingNotify", 0)
    char:setData("FS.Bleeding", 0)
    char:save()
end

function PLUGIN:Think()
    for _,ply in ipairs( player.GetAll() ) do
        local char = ply:getChar()
        if !char then return end
        -- Legs
        for _,leg in ipairs( {"RightLeg", "LeftLeg"} ) do
            if ply:GetBodyPartCondition( leg ) < 50 then
                char:setVar("brokenLeg", true)
            else 
                char:setVar("brokenLeg", false)
        end

    -- BW [ nie działa ]
        /*
        if char:getData("isBW") then return end
        if char:getData("BodyPart.Head") < 40 or ply:Health() < 20 then
            ply:BW( 10 )
        end
        */
        end
    end

concommand.Add("FS:CheckParts", function( ply )
    for _,part in ipairs(DamageSys.BodyParts) do
        print( "BodyPart."..part.name.." "..ply:getChar():getData("BodyPart."..part.name, 0) )
    end
    print("Bleeding: "..ply:getChar():getData("FS.Bleeding", 1))
end)
--