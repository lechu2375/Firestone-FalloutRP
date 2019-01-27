PLUGIN.name = "Char Time"
PLUGIN.author = "Lechu, Djuk"
PLUGIN.desc = "Zlicza czas przegrany na postaci."

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true)

nut.command.add("czasgry", {
	syntax = "<gracz>",
	adminOnly = true,
	onRun = function( ply, arg )
		local target = nut.command.findPlayer(ply, arg[1])
		if !target then return "Nie ma takiego gracza!" end
	   	local char = target:getChar()
        ply:Notify("Gracz "..target:Name().." w grze spedzil "..FS_ConvertTime(char:getData("chartime")))
	end
})
