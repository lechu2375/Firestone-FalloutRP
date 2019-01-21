local PLAYER = FindMetaTable("Player")

function PLAYER:BW(intLength)
    local char = self:getChar()
    self:setRagdolled(true, intLength)
end

-- łeb mnie rozbolał i już mi się nie chce ok