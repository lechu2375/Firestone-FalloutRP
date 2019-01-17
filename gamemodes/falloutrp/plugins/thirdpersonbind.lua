PLUGIN.name = "Thirdperson Bind"
PLUGIN.author = "Lechu"
PLUGIN.desc = "Binduje trzecią osobę na przycisk F2"

if !CLIENT then return end
local PLUGIN = PLUGIN
local state
local cd

function PLUGIN:Think()
	if cd then return end
    if input.IsKeyDown(KEY_F2) then
		cd = true
		if state == 1 then
			RunConsoleCommand("nut_tp_enabled", 0)
			state = 0
		else
			RunConsoleCommand("nut_tp_enabled", 1)
			state = 1
		end
		timer.Simple(0.5, function() cd = false end)
	end
end
