------------------OVERLAY LOGO SIECI-----------------------------
resource.AddFile( "materials/fs_overlay/picture.png" 
local firestone_overlay = Material( "fs_overlay/firestone_overlay.png" )
hook.Add( "HUDPaint", "fs_logo_overlay", function()
	surface.SetDrawColor( 255, 255, 255, 220 )
	surface.SetMaterial( firestone_overlay ) 
	surface.DrawTexturedRect( 0, 0, 350, 100 )
end )
---------------------------------------------------------------------




