util.AddNetworkString("FS_BodygroupChange")


net.Receive("FS_BodygroupChange", function(len,ply)
    ply.bgdelay = ply.bgdelay or 0
    if ply.bgdelay>CurTime() then return end
    ply.bgdelay = CurTime()+2
local data = net.ReadTable()
    if not isstring(data.bodygroups) then return end
    if tonumber(data.bodygroups)<=0 then return end
    if IsValid(ply) and ply:IsPlayer() then
        if not (data.model == ply:GetModel()) then return end
        ply:SetBodyGroups(data.bodygroups)
    end
end)


function ClearItems()
    for k,v in pairs(ents.FindByClass( "nut_item" )) do 
        
        v:Remove() 
         
    end
end
