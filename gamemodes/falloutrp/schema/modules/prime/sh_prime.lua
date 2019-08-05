local playerMeta = FindMetaTable("Player")
  
    function playerMeta:isPrime()
        if table.HasValue({"prime", "early_supporter","superadmin"}, self:GetNWString("usergroup")) then 
            return true
        else 
            return false 
        end
    end

    function playerMeta:isEarlySupporter()
        if table.HasValue({"early_supporter","superadmin"}, self:GetNWString("usergroup")) then
                return true
        else
                return false
        end
    end

    function playerMeta:getDescColor()
        if IsPrime(self) then
            return Color(251, 197, 49) 
        else 
            return color_white
        end
    end


function IsPrime(client)
    if not client then return false end
    if client:IsPlayer() and client:IsValid() then  
        if table.HasValue({"prime", "early_supporter","superadmin"}, client:GetNWString("usergroup")) then 
            return true
        else 
            return false 
        end 
    else
        return false 
    end   
end

function IsEarrlySupporter(client)
    if client:IsPlayer() and client:IsValid() then  
        if table.HasValue({"early_supporter","superadmin"}, client:GetNWString("usergroup")) then 
            return true
        else 
            return false 
        end 
    else
        return false 
    end   
end







    function SCHEMA:GetMaxPlayerCharacter(client)
        if IsPrime(client) then 
            return nut.config.get("maxChars") + 1
        else
            return nut.config.get("maxChars")
        end
    end
--[[
    function SCHEMA:CanPlayerUseChar(client, char)
        if char:getFaction() == FACTION_ROBOTY or FACTION_PSY then 
            if not IsPrime(char:getPlayer()) then
                
                --client:Notify("Nie możesz załadować tej postaci! Nie posiadasz wymaganej rangi Prime.")
                return false
            else
                return true
            end
        end
    end]]--








