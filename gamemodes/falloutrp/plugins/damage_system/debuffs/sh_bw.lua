local PLAYER = FindMetaTable("Player")

function PLAYER:BW(intLength)
    local char = self:getChar()
    self.BWCurTime = CurTime()
    self.BWTime = intLength
    self:setRagdolled(true, intLength)
    char:setData("Firestone.BW", true)
end

function PLAYER:GetBW()
    local char = self:getChar()
    return char:getData("Firestone.BW")
end