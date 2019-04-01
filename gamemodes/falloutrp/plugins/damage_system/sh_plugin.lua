local PLUGIN = PLUGIN
PLUGIN.name = "Damage System"
PLUGIN.author = "Djuk"

DamageSys = DamageSys or {}
DamageSys.BodyParts = {
  [1] = {
    name = "Head",
    hitgroup = HITGROUP_HEAD,
    damageScale = 2,
  },
  [2] = {
    name = "Chest",
    hitgroup = HITGROUP_CHEST,
    damageScale = 1.25,
  },
  [3] = {
    name = "Stomach",
    hitgroup = HITGROUP_STOMACH,
    damageScale = 1,
  },
  [4] = {
    name = "RightArm",
    hitgroup = HITGROUP_RIGHTARM,
    damageScale = 0.5,
  },
  [5] = {
    name = "LeftArm",
    hitgroup = HITGROUP_LEFTARM,
    damageScale = 0.5,
  },
  [6] = {
    name = "RightLeg",
    hitgroup = HITGROUP_RIGHTLEG,
    damageScale = 0.75,    
  },
  [7] = {
    name = "LeftLeg",
    hitgroup = HITGROUP_LEFTLEG,
    damageScale = 0.75,    
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

nut.config.add("bleedingTimer", 3, "Co ile sekund jest zabieranie HP?", nil, {
	form = "Float",
	data = {min=1, max=10},
	category = "Firestone Foundation - Damage System"
})

nut.config.add("bleedingDamage", 6, "HP zabierane co kilka sekund", nil, {
	form = "Float",
	data = {min=1, max=20},
	category = "Firestone Foundation - Damage System"
})
