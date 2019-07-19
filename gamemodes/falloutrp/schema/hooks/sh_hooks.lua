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


function SCHEMA:PlayerFootstep(client, _, _, _, volume)
    local char = client:getChar()
    if not char then return end
    local inv = char:getInv()
    if not inv then return end
    
    
    if client:IsProtectron() or client:IsEyebot() then --takie sprawdzenie szybsze od metametody wiadomo o co chodziu
        return true 
    end
    
    local itms = inv:getItems()
	if itms then
		for k, v in pairs(itms) do
			if v.pa and v:getData("equip") then
				client:EmitSound("fs_armor/fs_power_0"..math.random(1, 6)..".wav", volume * 320)
                return true
			end
   		end
	end
    return false
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

protectronModels = {
    ["models/fallout/protectron.mdl"] = true,
    ["models/fallout/protectron_factory.mdl"] = true
}
eyebotModels = {
    ["models/fallout/eyebot.mdl"] = true,
    ["models/fallout/eyebot_ede.mdl"] = true,
    ["models/fallout/eyebot_edeclone.mdl"] = true
}

local PlayerMeta = FindMetaTable("Player")
function PlayerMeta:IsProtectron()
    local model = self:GetModel()
    if protectronModels[model] then return true else return false end
end
function PlayerMeta:IsEyebot()
    local model = self:GetModel()
    if eyebotModels[model] then return true else return false end
end


sound.Add( {
	name = "eyebot_movement_lp",
	channel = CHAN_AUTO,
	volume = 0.1,
	level = 40,
	pitch = 100,
	sound = "fs_steps/eyebot/npc_robot_eyebot_movement_lpm.wav"
} )



function SCHEMA:PlayerTick(ply,mv)
    if ply:Alive() and ply:getChar() then
        if mv:GetForwardSpeed()>75 then --75 jednostek/s to prędkość już poruszania się
            ply.sfdelay = ply.sfdelay or CurTime()+1.5
            if CurTime()>(ply.sfdelay) then 
                local model = ply:getChar():getModel()
                if protectronModels[model] then
                    ply:EmitSound("fs_steps/protectron/npc_robotprotectron_foot_0"..math.random(1, 6)..".wav", 320)
                    ply.sfdelay = CurTime()+1 --opóźnienie, tak by było synchronicznie do kroków
                elseif eyebotModels[model] then
                    ply:EmitSound("eyebot_movement_lp")
                    ply.sfdelay = CurTime()+1.4 --opóźnienie, tak by było synchronicznie do kroków
                end
            end 
        end    
            
    end 
end

