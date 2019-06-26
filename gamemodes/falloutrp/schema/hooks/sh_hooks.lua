if CLIENT then 
    function SCHEMA:GetDisplayedName(speaker, chat)
        local char = speaker:getChar()
        local items = char:getInv():getItems()
        local str = char:getName()
            for k, v in pairs(items) do
                if v.mask  and v:getData("equip") then
                    str = speaker:GetNWString("NName")
                    break
                end
            end
        return str
    end 
end

function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)
	local itms = client:getChar():getInv():getItems()
	if itms then
		for k, v in pairs(itms) do
			if v.pa and v:getData("equip") then
				client:EmitSound("fs_armor/fs_power_0"..math.random(1, 6)..".wav", volume * 320)
                return true
			end
   		end
	end
end 





