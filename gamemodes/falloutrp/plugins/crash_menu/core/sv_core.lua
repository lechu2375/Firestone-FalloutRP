if !SERVER then return end
local PLUGIN = PLUGIN
resource.AddFile("resource/bebasneue.ttf")
util.AddNetworkString("Crash_Check")

net.Receive("Crash_Check", function( len, ply )
    net.Start("Crash_Check")
    net.Send(ply)
end)