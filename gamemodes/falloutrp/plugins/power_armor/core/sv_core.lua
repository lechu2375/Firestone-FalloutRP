local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

local sounds = {
    "fs_power_01",
    "fs_power_02",
    "fs_power_03",
    "fs_power_04",
    "fs_power_05",
    "fs_power_06"
}

for _, v in ipairs(sounds) do
    util.PrecacheSound(v)
end

function PLAYER:SetPowerArmor(bState)
    if bState == true then 
        self:SetNWBool("Firestone.PowerArmor", true)
    else
        self:SetNWBool("Firestone.PowerArmor", false)
    end
end

function PLAYER:GetPowerArmor()
    return self:GetNWBool("Firestone.PowerArmor")
end

function PLUGIN:PlayerSpawn(ply)
    if ply:GetPowerArmor() == true then 
        ply:AddArmor(100)
    end
end

function PLUGIN:PlayerFootstep(ply, pos, foot, sound, volume, rf)
    if ply:GetPowerArmor() == true then 
        ply:EmitSound("fs_armor/fs_power_0"..math.random(1, 6)..".wav", 125, 100, 1, CHAN_AUTO)
        return true
    else
        return false
    end
end
