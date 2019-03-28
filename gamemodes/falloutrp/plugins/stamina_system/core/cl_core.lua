function PLUGIN:PlayerBindPress( ply, bind )
	if ( string.find(bind, "+jump") ) then
		if ( ply:getChar():getVar("stm", 0) <= 10 and ply:GetMoveType() != MOVETYPE_NOCLIP ) then
			return true
		end
	end
end