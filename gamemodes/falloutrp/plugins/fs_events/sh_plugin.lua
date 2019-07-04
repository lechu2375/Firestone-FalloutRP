local PLUGIN = PLUGIN
PLUGIN.name = "Event System"
PLUGIN.author = "Lechu2375"
local dir = PLUGIN.folder.."/"


if SERVER then
    Firestone = Firestone or {}
    Firestone.FSE = Firestone.FSE or {}
    FSE = Firestone.FSE or {}
    FSE.EventsTable = FSE.EventsTable or {}
    FSE.Time = 3600 
end
nut.util.includeDir(dir.."/core", true, true)
if CLIENT then
    net.Receive("FSEventSoundPlay", function()
        surface.PlaySound("fs_ui/ui_wildwasteland.wav")
    end)
end

