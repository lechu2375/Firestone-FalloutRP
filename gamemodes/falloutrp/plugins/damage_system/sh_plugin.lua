local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "FrX & Djuk"

DamageSys = DamageSys or {}
DamageSys.BodyParts = {
  [1] = {
    name = "Head",
    xPos = 143,
    yPos = 60,
    xTextPos = 128,
    yTextPos = 5,
  },
  [2] = {
    name = "Chest",
    xPos = 140,
    yPos = 150,
    xTextPos = 123,
    yTextPos = 165,
  },
  [3] = {
    name = "Stomach",
    xPos = 140,
    yPos = 210,
    xTextPos = 123,
    yTextPos = 225,
  },
  [4] = {
    name = "Right Arm",
    xPos = 55,
    yPos = 148,
    xTextPos = 37,
    yTextPos = 185,

  },
  [5] = {
    name = "Left Arm",
    xPos = 225,
    yPos = 152,
    xTextPos = 210,
    yTextPos = 185,
  },
  [6] = {
    name = "Right Leg",
    xPos = 90,
    yPos = 290,
    xTextPos = 70,
    yTextPos = 330,
  },
  [7] = {
    name = "Left Leg",
    xPos = 180,
    yPos = 290,
    xTextPos = 180,
    yTextPos = 330,
  },
}

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true)
nut.util.includeDir(dir.."modules", true, true)
nut.util.includeDir(dir.."debuffs", true, true)

nut.command.add("ulecz", {
	syntax = "<gracz>",
	adminOnly = true,
	onRun = function( ply, arg )
		local target = nut.command.findPlayer(ply, arg[1])
    target:HealParts()
    ply:Notify("Gracz "..target:Nick().." zostal uleczony")
	end
})