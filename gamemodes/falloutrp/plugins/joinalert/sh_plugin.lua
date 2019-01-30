local PLUGIN = PLUGIN

PLUGIN.name = "Join Alert"
PLUGIN.author = "Djuk"

if SERVER then
	util.AddNetworkString("FS_Connect")
	function PLUGIN:PlayerConnect( ply )
		net.Start("FS_Connect")
			net.WriteString(ply)
		net.Broadcast()
	end
end

if CLIENT then
	net.Receive("FS_Connect", function()
		local ply = net.ReadString()
		chat.AddText( Color(255,255,255), "[ ", Color(39, 174, 96), "+", Color(255,255,255), " ] ", ply )
	end)
end