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
    local problem = string.gsub(net.ReadString(), "@", "")
    local priority = net.ReadInt(3)

    if string.len(problem) < 10 then
      ply:Notify("Minimalna ilosc znakow wynosi 10!", 5)
      return
    end

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
                    name = ply:SteamName(),
                    url = "https://steamcommunity.com/profiles/"..ply:SteamID64().."/",
                },

                fields = {
                    {
                        name = "Dane",
                        value = "Nick: "..ply:Nick().."\nSteam ID: "..ply:SteamID64().."\n Ranga: "..ply:GetUserGroup().."",
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
                    url = "http://api.saturdaysheroes.me/gmod/savatar/index.php/steamProfileByID?id="..ply:SteamID64()
                },

                color = priority_color
            }
        }
    }

    http.Post(PLUGIN.WebhookURL, {payload_json = util.TableToJSON(payload)})
    ply:Notify("Otrzymalismy zgloszenie, dziekujemy!", 5)

end)
