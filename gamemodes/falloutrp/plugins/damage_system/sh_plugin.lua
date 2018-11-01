local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "FrX & Djuk"

DamageSys = DamageSys or {}
DamageSys.BodyParts = {
  [1] = {
    name = "Head",
    xPos = 145,
    yPos = 65,
    textPos = 15,
  },
  [2] = {
    name = "Chest",
    xPos = 140,
    yPos = 150,
    textPos = 160,
  },
  [3] = {
    name = "Stomach",
    xPos = 140,
    yPos = 210,
    textPos = 220,
  },
  [4] = {
    name = "Right Arm",
    xPos = 50,
    yPos = 152,
    textPos = 185,
  },
  [5] = {
    name = "Left Arm",
    xPos = 240,
    yPos = 155,
    textPos = 185,
  },
  [6] = {
    name = "Right Leg",
    xPos = 90,
    yPos = 300,
    textPos = 330,
  },
  [7] = {
    name = "Left Leg",
    xPos = 190,
    yPos = 300,
    textPos = 330,
  },
}
DamageSys.BleedingInterval = 3

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."wounds", true, true)
