properties.Add( "getpos", {
	MenuLabel = "#GetPos", -- Name to display on the context menu
	Order = 1, -- The order to display this property relative to other properties
	MenuIcon = "icon16/fire.png", -- The icon to display next to the property

	Filter = function( self, ent, ply ) -- A function that determines whether an entity is valid for this property
		if ( !IsValid( ent ) ) then return false end
		if ( ply:IsAdmin() ) then return true end

	end,
	Action = function( self, ent ) -- The action to perform upon using the property ( Clientside )

		print(ent:GetPos())

	end
} )