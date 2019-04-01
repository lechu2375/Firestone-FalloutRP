local PLUGIN = PLUGIN
local PLAYER = FindMetaTable("Player")

function PLAYER:BW( time )
    if self:IsBW() then return end
    self:getChar():setData("isBW", true)
    self:setRagdolled(true, time)
    self.Timer = self:GetName().."_Bleeding"

    timer.Create( self.Timer, time, 1, function()
        self:getChar():setData("isBW", false)
    end)
end

function PLAYER:IsBW()
    local char = self:getChar()
    return char:getData("isBW")
end