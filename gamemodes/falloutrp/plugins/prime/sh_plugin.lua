local PLUGIN = PLUGIN

PLUGIN.name = "Prime Module"
PLUGIN.author = "SaturdaysHeroes"

local PLAYER = FindMetaTable("Player")

function PLUGIN:GetMaxPlayerCharacter(client)
    if table.HasValue({"prime", "early_supporter"}, client:GetNWInt("usergroup")) then 
        return nut.config.get("maxChars") + 1
    end
end

function PLAYER:IsPrime()
    if table.HasValue({"prime", "early_supporter"}, self:GetNWInt("usergroup")) then 
        return true
    else
        return false 
    end
end
