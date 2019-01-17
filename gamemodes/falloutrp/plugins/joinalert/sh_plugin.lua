local PLUGIN = PLUGIN

PLUGIN.name = "Join Alert"
PLUGIN.author = "Djuk"

function PLUGIN:PlayerConnect( ply )
	PrintMessage( HUD_PRINTTALK, ply.." właśnie dołączył do gry." )
end