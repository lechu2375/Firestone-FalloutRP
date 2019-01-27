local PLUGIN = PLUGIN
PLUGIN.name = "Bug Menu"
PLUGIN.author = "SaturdaysHeroes & Djuk"

PLUGIN.WebhookURL = "https://discordapp.com/api/webhooks/508739433202188335/WJBuEEla0fZegVrfh92PeFCJfxhvm4-zGjJcAXzT_L5-zN-SriTKWC2TusrGdPWQUe35"

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true)

nut.command.add("bugmenu", {
	onRun = function(ply, arg)
        net.Start("FS_RunAdvert")
        net.Start("fs_bug_ui")
        net.Send(ply)
	end
})