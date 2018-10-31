local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "FrX"
-- table
DamageSys = DamageSys or {}
DamageSys.BodyParts = {
    {"Head", "Głowa"}, 
    {"Chest", "Klatka"}, 
    {"Stomach", "Brzuch"},
    {"Right Arm", "Prawa ręka"},
    {"Left Arm", "Lewa ręka"},
    {"Right Leg", "Prawa noga"},
    {"Left Leg", "Lewa noga"}
}
-- Includes
local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."wounds", true, true)