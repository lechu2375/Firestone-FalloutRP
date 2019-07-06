local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

local function LazyClamp( int )
    return math.Clamp( int, 0, 100 )
end

function PLUGIN:PlayerLoadedChar( ply, char )
    char:setVar("stm", 100)
end

function PLAYER:GetLegsCondition()
    local condition = ( (self:GetBodyPartCondition("RightLeg") or 100) + (self:GetBodyPartCondition("LeftLeg") or 100) )/2 
    return condition
end

function PLUGIN:Think()
    for _,ply in pairs( player.GetAll() ) do
        local char = ply:getChar()
        if ( char == nil or ply:GetMoveType() == MOVETYPE_NOCLIP or !ply:OnGround() ) then return end
        if ( ( ply:KeyDown( IN_FORWARD ) or ply:KeyDown( IN_BACK ) or ply:KeyDown( IN_MOVELEFT ) or ply:KeyDown( IN_MOVERIGHT) ) and ply:KeyDown( IN_SPEED ) and !ply:Crouching() ) then
            if ( char:getVar( "stm" ) > 0 ) then 
                -- Run Speed
                if char:HasPAEquipped() then
                    ply:SetRunSpeed(nut.config.get("walkSpeed")*1.1)
                elseif ply:IsProtectron() then
                    ply:SetRunSpeed(nut.config.get("walkSpeed")*0.5)
                else
                    ply:SetRunSpeed( math.Round( math.Clamp( ( nut.config.get("runSpeed") * math.Clamp( ply:GetLegsCondition()/75, 0.2, 1 ) ) + char:getVar("drugRunInfluence", 0), 150, 400 ) ) ) 
                    -- Take stamina
                    if not ply:IsProtectron() or char:HasPAEquipped() then
                        char:setVar( "stm", LazyClamp( char:getVar("stm") - nut.config.get("staminaDrainSpeed")/100 + char:getAttrib("stamina", 0)/100 ) )
                    end
                end-- Wypierdol sie
                if ( ( math.random( 0, 1000 ) >= 998 ) and ( ply:GetLegsCondition() < 40 ) ) then
                    ply:setRagdolled( true, 3 )
                    ply:Notify("Upadłeś na wskutek połamanej nogi")
                end
            else
             -- If there is no stamina then set run speed to walk speed
                ply:SetRunSpeed( math.Round( math.Clamp( ( nut.config.get("walkSpeed") * math.Clamp( ply:GetLegsCondition()/75, 0.2, 1 ) ) + char:getVar("drugRunInfluence", 0), 100, 250 ) ) )
            end
        else
            -- Restore stamina
            char:setVar( "stm", LazyClamp( char:getVar("stm") + nut.config.get("staminaRestoreSpeed")/100 ) )
        end
            if char:HasPAEquipped() then
                ply:SetWalkSpeed(nut.config.get("walkSpeed")*0.8)
            elseif ply:IsProtectron() then 
                ply:SetWalkSpeed(nut.config.get("walkSpeed")*0.4)
            else
                ply:SetWalkSpeed( math.Round( math.Clamp( ( nut.config.get("walkSpeed") * math.Clamp( ply:GetLegsCondition()/75, 0.2, 1 ) ) + char:getVar("drugRunInfluence", 0), 100, 250 ) ) )
            end
    end
end

function PLUGIN:KeyPress( ply, key )
    local char = ply:getChar()
    if ( char == nil or ply:GetMoveType() == MOVETYPE_NOCLIP or ply:Crouching() or !ply:OnGround() ) then return end
    if ( key == IN_JUMP ) then
        if ( char:getVar( "stm" ) >= 10 ) then 
            -- Jump Power
            ply:SetJumpPower( math.Clamp( nut.config.get("jumpPower") * math.Clamp( ply:GetLegsCondition()/50, 0.5, 1 ), 130, 300 ) )
            -- Take stamina
            char:setVar( "stm", LazyClamp( char:getVar("stm") - nut.config.get("staminaTakenOnJump") + char:getAttrib("stamina", 0)/5 ) )
        end
    end
end
