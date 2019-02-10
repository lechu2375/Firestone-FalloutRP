local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:BW(intLength)
    if self:GetBW() then return end
    if self:GetNWBool("wasBW") then return end
    self:SetNWBool("BW", true)
    self:SetNWBool("wasBW", true)
    self.BWCurtime = CurTime()
    self.BWTime = intLength
    self:setRagdolled(true, intLength)
end

function PLAYER:GetBW()
    return self:GetNWBool("BW", false)
end