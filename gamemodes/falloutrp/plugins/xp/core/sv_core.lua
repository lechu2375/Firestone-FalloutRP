if !SERVER then return end 

util.AddNetworkString("FS:ShowXP")
local PLUGIN = PLUGIN 
local PLAYER = FindMetaTable("Player")

-- How many XP should players receive per hour?
PLUGIN.HourlyBonus = 100

function PLUGIN:OnCharCreated( ply, char )
    char:setData("xp", 0)
    char:save()
end

function PLAYER:SetXP(intNumber)
    local char = self:getChar()

    char:setData("xp", intNumber)
    char:save()
    self:Notify("Twoje XP aktualnie wynosi "..intNumber)
end

function PLAYER:AddXP(intAmount, strReason)
    local char = self:getChar()
    local oldXP = char:getData("xp")
    char:setData("xp", char:getData("xp") + intAmount)
    char:save()
    local newXP = char:getData("xp")
    self:Notify("Otrzymałeś "..intAmount.." XP za "..strReason)

    net.Start("FS:ShowXP")
    net.WriteInt(oldXP, 16)
    net.WriteInt(newXP, 16)
    net.Send( self )
end

function PLAYER:RemoveXP(intAmount)
    local char = self:getChar()

    char:setData("xp", char:getData("xp") - intAmount)
    char:save()
    self:Notify("Straciłeś "..intAmount.." XP!")
end

function PLAYER:GetXP()
    local char = self:getChar()

    return char:getData("xp")
end

function PLUGIN:InitPostEntity()
    timer.Create("Firestone.DailyXP", 3600, 0, function()
        for _, v in pairs( player.GetAll() ) do
            v:AddXP(PLUGIN.HourlyBonus, "przeżycie godziny na pustkowiu.")
        end
    end)
end

concommand.Add("xp", function( ply )
    ply:AddXP(33, "test")
end)

concommand.Add("xp2", function( ply )
    ply:SetXP(0)
end)

