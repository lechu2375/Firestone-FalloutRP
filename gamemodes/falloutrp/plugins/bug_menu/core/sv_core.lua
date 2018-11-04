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

net.Receive("fs_bug_info", function(len, ply)
    local problem = net.ReadString()
    local priority = net.ReadString(p)

    local priority_color 
    local priority_name

    if priority == "1" then 
        priority_color = 6729778
        priority_name = "Niski"
    end

    if priority == "2" then 
        priority_color = 16753920
        priority_name = "Średni"
    end

    if priority == "3" then 
        priority_color = 10824234
        priority_name = "Wysoki"
    end


    local payload = {
        embeds = {
            {
                author = {
                    name = "Zgłaszający",
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
                    url = "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/43/4396047dea902e3538d281a47d1742ebc1c6ad87_full.jpg"
                },

                color = priority_color
            }
        }
    }

    http.Post(PLUGIN.WebhookURL, {payload_json = util.TableToJSON(payload)})
    
end)

