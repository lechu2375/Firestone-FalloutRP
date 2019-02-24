if !SERVER then return end 

local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:SetRank(strName)
    local char = self:getChar()

    if !table.HasValue(PLUGIN.Ranks.[char:getFaction()], strName) then print("Error: Specified rank is not in the faction table") return end 

    if strName != nil then 
        char:setData("rank", strName)
    end
end