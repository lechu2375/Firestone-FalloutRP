if !CLIENT then return end

------------------OVERLAY LOGO SIECI---------------------------

resource.AddFile("materials/fs_overlay/firestrone_overlay.png")
local firestone_overlay = Material( "fs_overlay/fs_overlay.png" )
local scale = ScrH()

hook.Add( "HUDPaint", "fs_logo_overlay", function()
	surface.SetDrawColor( 255, 255, 255, 220 )
	surface.SetMaterial( firestone_overlay )
	surface.DrawTexturedRect( ScrW() - scale*0.23, 10, scale*0.23, scale*0.08 )
end )

---------------------------------------------------------------------
