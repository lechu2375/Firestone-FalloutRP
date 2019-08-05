--[[local PLUGIN = PLUGIN

PLUGIN.name = "Prime Module"
PLUGIN.author = "Lechu2375"

nut.util.include("sh_meta.lua")






function PLUGIN:GetMaxPlayerCharacter(client)
    if client:IsPrime() then 
        return nut.config.get("maxChars") + 1
    end
end

function PLUGIN:CanPlayerUseChar(client, char)
    if char:getFaction() == FACTION_ROBOTY or FACTION_PSY then 
        if not client:IsPrime() then
            client:Notify("Nie możesz załadować tej postaci! Nie posiadasz wymaganej rangi Prime.")
            return false
        else
            return true
        end
    end
end

]]-- 





