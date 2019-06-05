local PLUGIN = PLUGIN

PLUGIN.name = "Prime Module"
PLUGIN.author = "Lechu2375"
nut.util.include("sv_prime.lua")

local PLAYER = FindMetaTable("Player")

function PLAYER:IsPrime()
    if table.HasValue({"prime", "early_supporter"}, self:GetNWInt("usergroup")) then 
        return true
    else
        return false 
    end
end

function PLUGIN:GetMaxPlayerCharacter(client)
    if client:IsPrime() then 
        return nut.config.get("maxChars") + 1
    end
end

function PLUGIN:CanPlayerUseChar(client,char)
    if client then
        
    end
end




