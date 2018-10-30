local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "FrX"
-- table
DamageSys = DamageSys or {}
DamageSys.BodyParts = {"Head", "Chest", "Stomach", "Right Arm", "Left Arm", "Right Leg", "Left Leg"}
-- Includes
local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."wounds", true, true)