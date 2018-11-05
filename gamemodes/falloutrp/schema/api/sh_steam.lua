AddCSLuaFile()

Firestone.API.Steam = Firestone.API.Steam or {}

function Firestone.API.Steam:GetAvatar(sid64)
    http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=034C7BA8AE239DD4E7FF5CC0E3FB6E8B&steamids="..sid64, function(body, len, headers, code)
        local tbl = util.JSONToTable(body)
        avatar_url = tbl.response.players[1].avatarfull
    end)
    return avatar_url
end

function Firestone.API.Steam:GetName(sid64)
        http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=034C7BA8AE239DD4E7FF5CC0E3FB6E8B&steamids="..sid64, function(body, len, headers, code)
        local tbl = util.JSONToTable(body)
        steam_name = tbl.response.players[1].personaname
    end)
    return steam_name
end