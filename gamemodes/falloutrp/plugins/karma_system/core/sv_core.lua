if !SERVER then return end 

local PLUGIN = PLUGIN

local PLAYER = FindMetaTable("Player")

function PLAYER:AddKarma(intAmount)
    local char = self:getChar()

    if char:getData("karma") == nil then 
        char:setData("karma", 0)
    end

    char:setData("karma", char:getData("karma")+intAmount)
    char:save()
end

function PLAYER:RemoveKarma(intAmount)
    local char = self:getChar()

    if char:getData("karma") == nil then 
        char:setData("karma", 0)
    end

    char:setData("karma", char:getData("karma")-intAmount)
    char:save()
end

function PLAYER:GetKarma()
    local char = self:getChar()

    if char:getData("karma") == nil then 
        char:setData("karma", 0)
    end

    return char:getData("karma")
end

function PLAYER:LoadKarmaRank()
    local char = self:getChar()

    if char:getData("karma") == nil then 
        char:setData("karma", 0)
    end

    local karma = char:getData("karma")

    if karma >= 200 then 
        char:setData("karma_rank", "Przyjazny")
        self:Notify("Twoja obecna ranga karmy to "..char:getData("karma_rank"))
        return
    end

    if karma >= 100 then 
        char:setData("karma_rank", "Dobry")
        self:Notify("Twoja obecna ranga karmy to "..char:getData("karma_rank"))
        return
    end

    if karma >= 0 then 
        char:setData("karma_rank", "Neutralny")
        self:Notify("Twoja obecna ranga karmy to "..char:getData("karma_rank"))
        return
    end

    if karma >= -100 then 
        char:setData("karma_rank", "Agreswyny")
        self:Notify("Twoja obecna ranga karmy to "..char:getData("karma_rank"))
        return
    end

    if karma >= -200 then 
        char:setData("karma_rank", "Bandyta")
        self:Notify("Twoja obecna ranga karmy to "..char:getData("karma_rank"))
        return
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
    attacker:Notify("Straciłeś "..Firestone.Karma.BadActions[action].." karmy za "..action)
    attacker:LoadKarmaRank()
end

function PLUGIN:OnNPCKilled(npc, attacker)
    if !attacker:IsPlayer() then return end 

    local action = "Zabojstwo"

    attacker:RemoveKarma(Firestone.Karma.BadActions[action])
    attacker:Notify("Straciłeś "..Firestone.Karma.BadActions[action].." karmy za "..action)
    attacker:LoadKarmaRank()
end