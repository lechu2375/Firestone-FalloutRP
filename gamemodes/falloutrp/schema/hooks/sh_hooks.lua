function SCHEMA:GetDisplayedName(speaker, chat)
    local char = speaker:getChar()
    local str = char:getName()
    local inv = char:getInv()
    if not inv then return str end
    local items = inv:getItems()
    if items then
        for k, v in pairs(items) do
            if v.mask  and v:getData("equip") then
                str = speaker:GetNWString("NName")
                break
            end
        end
    end
    return str
end 


function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)
    local char = client:getChar()
    if not char then return end
    local inv = char:getInv()
    if not inv then return end
    local itms = inv:getItems()
	if itms then
		for k, v in pairs(itms) do
			if v.pa and v:getData("equip") then
				client:EmitSound("fs_armor/fs_power_0"..math.random(1, 6)..".wav", volume * 320)
                return true
			end
   		end
	end
end 

local character = nut.meta.character

function character:HasPAEquipped()
    local itms = self:getInv():getItems()
    local pa = false
	if itms then
		for k, v in pairs(itms) do
			if v.pa and v:getData("equip") then
                pa = true
			end
   		end
	end
    return pa
end




