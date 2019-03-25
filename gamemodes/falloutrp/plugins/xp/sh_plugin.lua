local PLUGIN = PLUGIN
PLUGIN.name = "XP"
PLUGIN.author = "SaturdaysHeroes"

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true) 

local PLAYER = FindMetaTable("Player")
local progiXP = { 
    [1] = {
        name = "nowy",
        xp = 100
    },
    [2] = {
        name = "nie nowy",
        xp = 500
    },
    [3] = {
        name = "stary",
        xp = 1000
    },
    [4] = {
        name = "bardziej stary",
        xp = 10000
    },
    [5] = {
        name = "stary bardziej",
        xp = 100000
    }
 }

function PLAYER:GetNeededXP()
    for _,amount in ipairs( progiXP ) do
        local plyXP = self:getChar():getData("xp")
        if amount.xp > plyXP then
            return amount.xp or 9999
        end
    end
end