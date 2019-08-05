do
    local playerMeta = FindMetaTable("Player")
    function playerMeta:getDescColor()
        if self:IsPrime() then
            return Color(251, 197, 49) 
        else 
            return color_white
        end
    end

    function playerMeta:IsPrime()
        if table.HasValue({"prime", "early_supporter","superadmin"}, client:GetNWString("usergroup")) then 
            return true
        else 
            return false 
        end
    end
end