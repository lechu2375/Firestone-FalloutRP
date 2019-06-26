for i=1,6 do
	util.PrecacheSound("fs_armor/fs_power_0"..i..".wav" )
end

function SCHEMA:PlayerLoadedChar(client, character)
	client:PrintMessage(HUD_PRINTTALK,"Wybrałeś postać "..character:getName())
	if character:getData("chartime") > 600 then
		client:PrintMessage(HUD_PRINTTALK,"Przegrano na postaci "..FS_ConvertTime(character:getData("chartime")))
	else
		client:PrintMessage(HUD_PRINTTALK,"Dopiero rozpoczęto przygodę na Firestone FalloutRP!")
	end
	client:SetNWString("NName","Nieznajomy "..randomskladka())
end




function SCHEMA:OnCharCreated( ply, char )
	char:save()
end

function SCHEMA:invAddItem(item)
	if item and item.category == "Jedzenie" then
		if not item:getData("Call") then
			item:setData("Call",1)
			local time = os.time()
			item:setData("lifeTime",(time+item.lifeTime))
		end	
	end
end

