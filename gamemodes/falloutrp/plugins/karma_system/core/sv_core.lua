if !SERVER then return end 

local PLAYER = FindMetaTable("Player")

function PLAYER:AddKarma(intAmount)
    local char = self:getChar()

    char:setData("karma", char:getData("karma") + intAmount)
end

function PLAYER:RemoveKarma(intAmount)
    local char = self:getChar()

    char:setData("karma", char:getData("karma") - intAmount)
end

function PLAYER:GetKarma()
    local char = self:getChar()

    return char:getData("karma")
end

function PLAYER:LoadKarmaRank()
    local char = self:getChar()

    if char:getData("karma") == nil then 
        char:setData("karma", 0)
    end

    for k, v in ipairs(Firestone.Karma.Ranks) do 
        if char:getData("karma") >= v then 
            char:setData("karma_rank", k)
            break
        end
    end
end

function PLAYER:GetKarmaRank()
    local char = self:getChar()

    return char:getData("karma_rank")
end

function PLUGIN:PlayerDeath(victim, attacker)
    if !attacker:IsPlayer() then return end 

    local action = "Zabojstwo"

    attacker:RemoveKarma(Firestone.Karma.BadActions[action])
    attacker:Notify("Straciles "..Firestone.Karma.BadActions[action].." karmy za "..action)
end

function PLUGIN:OnNPCKilled(attacker)
    if !attacker:IsPlayer() then return end 

    local action = "Zabojstwo"

    attacker:RemoveKarma(Firestone.Karma.BadActions[action])
    attacker:Notify("Straciles "..Firestone.Karma.BadActions[action].." karmy za "..action)
end






