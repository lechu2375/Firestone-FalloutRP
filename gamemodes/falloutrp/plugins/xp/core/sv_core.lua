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

function PLAYER:SetLevel(intNumber)
    local char = self:getChar()

    char:setData("level", intNumber)
end

function PLAYER:AddLevel(intAmount)
    local char = self:getChar()

    char:setData("level", char:getData("level") + intAmount)
end

function PLAYER:RemoveLevel(intAmount)
    local char = self:getChar()

    char:setData("level", char:getData("level") - intAmount)
end

function PLAYER:GetLevel()
    local char = self:getChar()

    return char:getData("level")
end