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



function SCHEMA:PlayerLoadedChar(client, character)
	client:PrintMessage(HUD_PRINTTALK,"Wybrałeś postać "..character:getName())
	client:PrintMessage(HUD_PRINTTALK,"Przegrano na postaci "..firestone_util_timeconvert(character:getData("chartime")))
end