local PLUGIN = PLUGIN
PLUGIN.name = "Admin Adverts"
PLUGIN.author = "Djuk"

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true)

nut.command.add("ogloszenie", {
	syntax = "<tresc>",
	adminOnly = true,
	onRun = function( ply, arg )
      if acd then return "Na ekranie już jest wyświetlane ogłoszenie!" end
      acd = false
      net.Start("FS_RunAdvert")
        net.WriteTable( arg ) 
      net.Broadcast()
      acd = true
      timer.Simple(30 + 1, function() acd = false end)
	end
})