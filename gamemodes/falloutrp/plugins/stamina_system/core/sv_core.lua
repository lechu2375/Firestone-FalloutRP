local PLUGIN = PLUGIN

local function MasnyCiul( int )
    return math.Clamp( int, 0, 100 )
end

function PLUGIN:PlayerLoadedChar( ply, char )
    char:setVar("stm", 100)
end

function PLUGIN:Think()
    for _,ply in pairs( player.GetAll() ) do
        local char = ply:getChar()
        if ( char == nil or ply:GetMoveType() == MOVETYPE_NOCLIP or !ply:OnGround() ) then return end
        if ( ply:KeyDown( IN_FORWARD ) and ply:KeyDown( IN_SPEED ) and !ply:Crouching() ) then
            if ( char:getVar( "stm" ) > 0 ) then 
                ply:SetRunSpeed( 300 + char:getAttrib("stamina", 0) )
                char:setVar( "stm", MasnyCiul( char:getVar("stm") - nut.config.get("staminaDrainSpeed")/100 ) )
            else
                ply:SetRunSpeed( ply:GetWalkSpeed() )
            end
         else
            char:setVar( "stm", MasnyCiul( char:getVar("stm") + nut.config.get("staminaRestoreSpeed")/100 ) )
        end
    end
end

function PLUGIN:KeyPress( ply, key )
    local char = ply:getChar()
    if ( char == nil or ply:GetMoveType() == MOVETYPE_NOCLIP or ply:Crouching() or !ply:OnGround() ) then return end
    if ( key == IN_JUMP ) then
        if ( char:getVar( "stm" ) >= 10 ) then 
            char:setVar( "stm", MasnyCiul( char:getVar("stm") - nut.config.get("staminaTakenOnJump") ) )
        end
    end
end
