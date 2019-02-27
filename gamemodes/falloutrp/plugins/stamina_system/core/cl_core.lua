function PLUGIN:PlayerBindPress( ply, bind )
	if ( string.find(bind, "+jump") ) then
		if ( ply:getChar():getVar("stm", 50) <= 10 ) then
			return true
		end
	end
end