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
        local model = client:GetModel()
        if model == "models/fallout/protectron.mdl" or "models/fallout/protectron_factory.mdl" or "models/fallout/eyebot.mdl" or "models/fallout/eyebot_ede.mdl" or "models/fallout/eyebot_edeclone.mdl" then
            return true --chuj nie chcialo mi sie juz tabeli robic bo puzno xd
        end
    
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

local PlayerMeta = FindMetaTable("Player")
function PlayerMeta:IsProtectron()
    local model = self:GetModel()
    local protectrons = {
    ["models/fallout/protectron.mdl"] = true, 
    ["models/fallout/protectron_factory.mdl"] = true
    }
    if protectrons[model] then return true else return false end
end






function SCHEMA:PlayerTick(ply,mv)
    if ply:Alive() and ply:getChar() then
        if mv:GetForwardSpeed()>75 then --75 jednostek/s to prędkość już poruszania się
            ply.delay = ply.delay or CurTime()+1.5
            if CurTime()>(ply.delay) then 
                local model = ply:GetModel()
                if model == "models/fallout/protectron.mdl" or "models/fallout/protectron_factory.mdl" then
                    ply:EmitSound("fs_steps/protectron/npc_robotprotectron_foot_0"..math.random(1, 6)..".wav", 320)
                    ply.delay = CurTime()+1 --opóźnienie, tak by było synchronicznie do kroków
                end
            end 
        end    
            
    end 
end

