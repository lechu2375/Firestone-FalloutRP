function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)
	if (client:isRunning()) then
		if (client:Team() == FACTION_RUN) then
			client:EmitSound("npc/combine_soldier/gear"..math.random(1, 2)..".wav", volume * 220)

			return true
		elseif (client:Team() == FACTION_BOYRUN) then
			client:EmitSound("npc/combine_soldier/gear"..math.random(1, 2)..".wav", volume * 220)

			return true
		end
	end
end

--------------------OVERLAY-------------------------------------------
local firestone_overlay = Material( "firestone_overlay.png" )
hook.Add( "HUDPaint", "example_hookseeses", function()
	surface.SetDrawColor( 255, 255, 255, 220 )
	surface.SetMaterial( firestone_overlay ) 
	surface.DrawTexturedRect( 0, 0, 350, 100 )
end )
----------------------------------------------------------------------




