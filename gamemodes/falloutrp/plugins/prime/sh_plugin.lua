local PLUGIN = PLUGIN

PLUGIN.name = "Prime Module"
PLUGIN.author = "SaturdaysHeroes"

function PLUGIN:GetMaxPlayerCharacter(client)
    if table.HasValue({"prime", "early_supporter"}, client:GetNWInt("usergroup")) then 
        return nut.config.get("maxChars") + 1
    end
end
