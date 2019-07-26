local PLUGIN = PLUGIN

PLUGIN.name = "Prime Module"
PLUGIN.author = "Lechu2375"




function IsPrime(client)
    if table.HasValue({"prime", "early_supporter","superadmin"}, client:GetNWInt("usergroup")) then 
        return true
    else
        return false 
    end
end


function PLUGIN:GetMaxPlayerCharacter(client)
    if IsPrime(client) then 
        return nut.config.get("maxChars") + 1
    end
end


local PLAYER = FindMetaTable("Player")

function PLAYER:IsPrime()
    if table.HasValue({"prime", "early_supporter","superadmin"}, self:GetNWInt("usergroup")) then 
        return true
    else
        return false
    end
    
 end

function PLAYER:IsEarlySupporter()
   if table.HasValue({"early_supporter","superadmin"}, self:GetNWInt("usergroup")) then
        return true
   else
        return false
    end
end







