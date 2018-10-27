------------------OVERLAY LOGO SIECI-----------------------------
local firestone_overlay = Material( "firestone_overlay.png" )
hook.Add( "HUDPaint", "fs_logo_overlay", function()
	surface.SetDrawColor( 255, 255, 255, 220 )
	surface.SetMaterial( firestone_overlay ) 
	surface.DrawTexturedRect( 0, 0, 350, 100 )
end )
---------------------------------------------------------------------




