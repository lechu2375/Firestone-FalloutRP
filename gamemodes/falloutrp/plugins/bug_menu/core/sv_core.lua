if !SERVER then return end 

local PLUGIN = PLUGIN 

util.AddNetworkString("fs_bug_ui")
util.AddNetworkString("fs_bug_info")

function PLUGIN:PlayerSay(ply, text)
    if (string.lower(text) == "!bug") then 
        net.Start("fs_bug_ui")
        net.Send(ply)
        return ""
    end
end

local function GetAvatar(sid64)
    http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=034C7BA8AE239DD4E7FF5CC0E3FB6E8B&steamids="..sid64, function(body, len, headers, code)
        local tbl = util.JSONToTable(body)
        avatar_url = tbl.response.players[1].avatarfull
    end)
    return avatar_url
end

local function GetUserName(sid64)
        http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=034C7BA8AE239DD4E7FF5CC0E3FB6E8B&steamids="..sid64, function(body, len, headers, code)
        local tbl = util.JSONToTable(body)
        steam_name = tbl.response.players[1].personaname
    end)
    return steam_name
end

net.Receive("fs_bug_info", function(len, ply)
    local problem = net.ReadString()
    local priority = net.ReadInt(p)

    local priority_color 
    local priority_name

    if priority == 1 then 
        priority_color = 6729778
        priority_name = "Niski"
    end

    if priority == 2 then 
        priority_color = 16753920
        priority_name = "Średni"
    end

    if priority == 3 then 
        priority_color = 10824234
        priority_name = "Wysoki"
    end


    local payload = {
        embeds = {
            {
                author = {
                    name = GetUserName(ply:SteamID64()),
                    url = "https://steamcommunity.com/profiles/"..ply:SteamID64().."/",
                },

                fields = {
                    {
                        name = "Dane",
                        value = "Nick: "..ply:Nick().."\n Steam ID: "..ply:SteamID64().."\n Ranga: "..ply:GetUserGroup().."",
                        inline = false,
                    },
                    {
                        name = "Opis",
                        value = problem,
                        inline = false,
                    },
                    {
                        name = "Priorytet",
                        value = priority_name,
                        inline = false,
                    },
                },

                thumbnail = {
                    url = GetAvatar(ply:SteamID64())
                },

                color = priority_color
            }
        }
    }

    http.Post(PLUGIN.WebhookURL, {payload_json = util.TableToJSON(payload)})
    
end)

