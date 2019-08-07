PLUGIN.name = "Item Spawner"
PLUGIN.description = "Dodanie randomowego spawnera itemów"
PLUGIN.author = "Lechu2375"

nut.util.include("sv_spawner.lua")

nut.command.add("addrandomspawn", {
	syntax = "<string item><bool getpos>",
    adminOnly = true,
	onRun = function(client, arguments)
		if (IsValid(client)) then
			local itemInfo = {}
            itemInfo.item = arguments[1]
            if tobool(arguments[2]) then
                itemInfo.pos = client:GetPos()
            end
            FS.ItemSpawner.AddSpawn(itemInfo)
		end
	end
})