if CLIENT then 
    function SCHEMA:GetDisplayedName(speaker, chat)
        local char = speaker:getChar()
        local items = char:getInv():getItems()
        local str = char:getName()
            for k, v in pairs(items) do
                if v.mask  and v:getData("equip") then
                    str = speaker:GetNWString("NName")
                    break
                end
            end
        return str
    end 
end