PLUGIN.name = "Char Time"
PLUGIN.author = "Lechu"
PLUGIN.desc = "Zlicza czas przegrany na postaci."

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true)

nut.command.add("sprawdzczas", {
	syntax = "<gracz>",
	adminOnly = true,
	onRun = function( ply )
	   	local char = ply:getChar()
        print("Czas postaci w sekundach: " .. char:getData("chartime"))
	end
})
