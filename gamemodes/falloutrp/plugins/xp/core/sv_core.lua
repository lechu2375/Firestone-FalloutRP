if !SERVER then return end 

local PLUGIN = PLUGIN 
local PLAYER = FindMetaTable("Player")

PLUGIN.HourlyBonus = 100

function PLAYER:SetXP(intNumber)
    local char = self:getChar()

    char:setData("xp", intNumber)
    self:Notify("Twoje XP aktualnie wynosi "..intNumber)
end

function PLAYER:AddXP(intAmount, strReason)
    local char = self:getChar()
    
    if self:IsPrime() then 
        char:setData("xp", char:getData("xp") + intAmount * 0.10)
    else
        char:setData("xp", char:getData("xp") + intAmount)
    end
    self:Notify("Otrzymałeś "..intAmount.." XP za "..strReason)
end

function PLAYER:RemoveXP(intAmount)
    local char = self:getChar()

    char:setData("xp", char:getData("xp") - intAmount)
    self:Notify("Straciłeś "..intAmount.." XP!")
end

function PLAYER:GetXP()
    local char = self:getChar()

    return char:getData("xp")
end

function PLUGIN:InitPostEntity()
    timer.Create("Firestone.DailyXP", 3600, 0, function()
        for _, v in pairs(player.GetAll()) do
            v:AddXP(PLUGIN.HourlyBonus, "przeżycie godziny na pustkowiu.")
        end
    end)
end
