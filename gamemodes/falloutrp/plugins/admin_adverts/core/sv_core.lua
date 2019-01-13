if !SERVER then return end
local PLUGIN = PLUGIN

util.AddNetworkString("FS_RunAdvert")

nut.command.add("ogloszenie", {
	syntax = "<treść>",
	adminOnly = true,
	onRun = function(ply, arg)
    local cd = false
    if ply:GetUserGroup() != "superadmin" then return "Brak uprawnień!" end
      net.Start("FS_RunAdvert")
        net.WriteString(string.upper( arg[1] )) 
      net.Broadcast()
      cd = true
      timer.Simple(30 + 1, function() cd = false end)
	end
})