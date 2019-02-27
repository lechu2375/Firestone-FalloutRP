local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "FrX & Djuk"

DamageSys = DamageSys or {}
DamageSys.BodyParts = { // potem se przerób na same valuesy!!
  [1] = {
    name = "Head",
  },
  [2] = {
    name = "Chest",
  },
  [3] = {
    name = "Stomach",
  },
  [4] = {
    name = "Right Arm",
  },
  [5] = {
    name = "Left Arm",
  },
  [6] = {
    name = "Right Leg",
  },
  [7] = {
    name = "Left Leg",
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
    if !target then return end
    target:HealParts()
    target:Notify( ply:Nick().." uleczył cię." )
    ply:Notify("Gracz "..target:Nick().." został uleczony.")
	end
})