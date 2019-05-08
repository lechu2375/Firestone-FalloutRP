ITEM.name = "Nieśmiertelnik"
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.desc = "Czyste blachy na nieśmiertelnik."
ITEM.category = "Other"

function ITEM:getDesc()
    if self:getData("dogtagnumber") and self:getData("owner") then
        local desc = (self:getData("owner").."\n"..self:getData("dogtagnumber")) 
        return desc
    else
        return self.desc
    end
end