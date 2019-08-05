PLUGIN.name = "Biznes block"
PLUGIN.author = "Lechu2375"


function PLUGIN:CanPlayerUseBusiness(client, uniqueID)
    if not client:IsAdmin() then 
        return false 
    else
        return true
    end

end