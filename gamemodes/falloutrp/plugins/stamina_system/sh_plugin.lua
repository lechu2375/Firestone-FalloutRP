local PLUGIN = PLUGIN
PLUGIN.name = "Stamina System"
PLUGIN.author = "Djuk"

local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", "server", true)

nut.config.add("staminaDrainSpeed", 50, "Jak szybko spada kondycja", nil, {
	form = "Float",
	data = {min=10, max=200},
	category = "Firestone Foundation - Stamina"
})

nut.config.add("staminaRestoreSpeed", 40, "Jak szybko odnawia się kondycja", nil, {
	form = "Float",
	data = {min=10, max=200},
	category = "Firestone Foundation - Stamina"
})

nut.config.add("staminaTakenOnJump", 10, "Ile punktów kondycji zabiera skok?", nil, {
	form = "Float",
	data = {min=10, max=100},
	category = "Firestone Foundation - Stamina"
})

nut.config.add("jumpPower", 200, "Jak wysoko skaczemy", nil, {
	form = "Float",
	data = {min=100, max=300},
	category = "Firestone Foundation - Stamina"
})