local PLUGIN = PLUGIN
PLUGIN.name = "NPC Spawner"
PLUGIN.author = "Lechu2375"
local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."/core", true, true)

if SERVER then
    Firestone = Firestone or {}
    Firestone.FNS = Firestone.FNS or {}
    FNS = Firestone.FNS or {}
    Firestone.FNS.Locations = Firestone.FNS.Locations or {}
    Firestone.FNS.Locations.Spawned = Firestone.FNS.Locations.Spawned or {} 
    Firestone.FNS.SS = Firestone.FNS.SS or {}

     for k,v in pairs(Firestone.FNS.Locations) do
        if not Firestone.FNS.Locations.Spawned[k] then
            print("[FNS LOG] Setting up required table...")
            Firestone.FNS.Locations.Spawned[k] = {}
        end
        if not timer.Exists("FNS_Timer"..k) then
            if Firestone.FNS.Locations[k].time then
                print("[FNS LOG] Creating missing timer for "..k.." location")
                timer.Create("FNS_Timer"..k, Firestone.FNS.Locations[k].time,0, function()
                    Firestone.FNS.CheckLocation(k)
                end)
            end
        end
    end


    for k,v in pairs(Firestone.FNS.SS) do
        if not timer.Exists("FNS_Timer"..k) then
            if v.time then
                timer.Create("FNS_Timer"..k, v.time, 0, function()
                    Firestone.FNS.CheckSS(k)
                end)
            end
        end
    end
end