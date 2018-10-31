local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "FrX"

DamageSys = DamageSys or {}
DamageSys.BodyParts = {
    {"Head", "Glowa"}, 
    {"Chest", "Klatka"}, 
    {"Stomach", "Brzuch"},
    {"Right Arm", "Prawa reka"},
    {"Left Arm", "Lewa reka"},
    {"Right Leg", "Prawa noga"},
    {"Left Leg", "Lewa noga"}
}

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."wounds", true, true)