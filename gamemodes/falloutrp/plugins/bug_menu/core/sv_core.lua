if !SERVER then return end 

local PLUGIN = PLUGIN 

util.AddNetworkString("fs_bug_ui")
util.AddNetworkString("fs_bug_info")

PLUGIN:PlayerSay(ply, text)
    if string.lower(text) == "!bug"
        net.Start("fs_bug_ui")
        net.Send(ply)
    end
end


