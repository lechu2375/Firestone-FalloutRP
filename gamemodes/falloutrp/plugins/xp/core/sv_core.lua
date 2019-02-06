if !SERVER then return end 

local PLUGIN = PLUGIN 
local PLAYER = FindMetaTable("Player")

function PLAYER:SetXP(intNumber)
    local char = self:getChar()

    char:setData("xp", intNumber)
end

function PLAYER:AddXP(intAmount)
    local char = self:getChar()

    char:setData("xp", char:getData("xp") + intAmount)
end

function PLAYER:RemoveXP(intAmount)
    local char = self:getChar()

    char:setData("xp", char:getData("xp") - intAmount)
end

function PLAYER:GetXP()
    local char = self:getChar()

    return char:getData("xp")
end