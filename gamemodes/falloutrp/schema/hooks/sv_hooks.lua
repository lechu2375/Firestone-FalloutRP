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
	if character:getData("chartime") > 600 then
		client:PrintMessage(HUD_PRINTTALK,"Przegrano na postaci "..FS_ConvertTime(character:getData("chartime")))
	else
		client:PrintMessage(HUD_PRINTTALK,"Dopiero rozpoczęto przygodę na Firestone FalloutRP!")
	end

	
	if not character:getData("ognick") then
		character:setData("ognick", character:getName())
	end

	if  not (character:getData("ognick") == character:getName()) then
		character:setData("ognick", character:getName())
	end 
end


function SCHEMA:PlayerDisconnected(ply)
	local char = ply:getChar()
	if char then
		local items = char:getInv():getItems()
		for k, v in pairs(items) do
			if v.mask == true then
				v:removePart(ply)
			end
		end
		
	end
end
