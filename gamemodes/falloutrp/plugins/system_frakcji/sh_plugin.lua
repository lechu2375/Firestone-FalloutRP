PLUGIN.name = "System frakcji"
PLUGIN.author = "Djuk & Lechu2375"
PLUGIN.desc = "Rozwija funkcjonalność frakcji."
local dir = PLUGIN.folder.."/"
nut.util.includeDir(dir.."core", true, true)
FS = FS or {}
FS.Factions = FS.Factions or {}

nut.command.add("awans", {
	adminOnly = false,
	syntax = "<nazwa postaci> [numer rangi]",
	onRun = function(caller, args)
		local target = nut.command.findPlayer(caller, args[1])
		if !(target) then return end
		local char, permissions = target:getChar(), caller:GetFactionPermissions()
		local faction, rank = char:getFaction(), tonumber(args[2])
    	if !(nut.faction.indices[faction].rangi) then return end
    	if (permissions.awans == nil) then 
			caller:Notify("Nie masz do tego uprawnień!")
			return
		end
		if (caller == target) and !(permissions.dowodca) then
			caller:Notify("Nie możesz awansować samego siebie!")
			return
		end
		if (rank <= 0) then
			caller:Notify("Podałeś za małe id rangi")
			return
		end
		if rank > #nut.faction.indices[faction].rangi then
			caller:Notify("Podałeś za duże id rangi")
			return
		end
		if (caller:GetPos():Distance(target:GetPos()) > 300) then
			caller:Notify("Stoisz za daleko od gracza, którego chcesz awansować!")
			return
		end
		char:setData("factionRank", nut.faction.indices[faction].rangi[rank], false, player.GetAll())
		target:Notify("Twoja ranga została zmieniona na: "..char:getData("factionRank"))
			caller:Notify("Zmieniono rangę gracza "..target:GetName().." na "..char:getData("factionRank"))	
		end
})

nut.command.add("jakaranga", {
	adminOnly = true,
	syntax = "<nazwa postaci>",
	onRun = function(ply, args)
		local target = nut.command.findPlayer(client, args[1])
		if (IsValid(target) and target:getChar()) then
			ply:ChatPrint("Ranga postaci "..target:getChar():getName().." to: "..target:getChar():getData("factionRank"))
		end
	end
})

nut.command.add("adminawans", {
	adminOnly = true,
	syntax = "<nazwa postaci> [numer rangi]",
	onRun = function(caller, args)
		local target = nut.command.findPlayer(caller, args[1])
		local char = target:getChar()
		local id = tonumber(args[2])
		if !(char) then 
			caller:Notify("Nie znaleziono postaci")
			return
		end
		local faction = char:getFaction()
		if !(nut.faction.indices[faction].rangi) then
			caller:Notify("Ta frakcja nie posiada rang")
			return
		end
		if (id <= 0 or id > #nut.faction.indices[faction].rangi) then
			caller:Notify("Wprowadź poprawny numer rangi.")
			return
		end
		target:SetFactionRank(target:getChar(), id)
		caller:Notify("Zmieniono rangę gracza "..target:GetName().." na "..char:getData("factionRank"))	
	end
})

nut.command.add("spisrang", {
	adminOnly = false,
	syntax = "<brak, komenda wyswietla wszystkie rangi z frakcji postaci>",
	onRun = function(client)
		if IsValid(client) and client:getChar() then
			local char = client:getChar()
			local frakcja = char:getFaction()
			if (nut.faction.indices[frakcja].rangi) then
				client:PrintMessage(HUD_PRINTTALK,"Sprawdź konsolę.")
				for k,v in SortedPairs(nut.faction.indices[frakcja].rangi) do
					client:PrintMessage(HUD_PRINTCONSOLE,(k.."."..v.."\n"))
				end
			else
				client:PrintMessage(HUD_PRINTTALK,"W twojej frakcji nie ma żadnych rang.")
			end
		end
	end
})

nut.command.add("uprawnienia", {
	adminOnly = false,
	syntax = "<brak, komenda wyswietla uprawnienia twojej postaci>",
	onRun = function(client)
		if IsValid(client) and client:getChar() then
			local char = client:getChar()
			local uprawnienia = getPermissions(char)
			if table.Count(uprawnienia) == 0 then 
				client:PrintMessage(HUD_PRINTTALK,"Brak uprawnień")
			else
				local text = ""
				for k,v in pairs(uprawnienia) do
					text = text.." "..k
				end 
				client:PrintMessage(HUD_PRINTTALK,"Posiadasz następujące uprawnienia: "..text)
			end
		end
	end
})


nut.command.add("zapros", {
	adminOnly = false,
	syntax = "<Postać którą chcesz zaprosic do frakcji]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
			FS.Factions.HandleInvite(client, target)
	end
})


nut.command.add("plytransfer", {
	adminOnly = true,
	syntax = "<string name> <string faction>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local name = table.concat(arguments, " ", 2)

		if (IsValid(target) and target:getChar()) then
			local faction = nut.faction.teams[name]

			if (!faction) then
				for k, v in pairs(nut.faction.indices) do
					if (nut.util.stringMatches(v.name, name)) then
						faction = v

						break
					end
				end
			end

			if (faction) then
				target:getChar().vars.faction = faction.uniqueID
				target:getChar():setFaction(faction.index)
				target:SetFactionRank(target:getChar(), 1)

				if (faction.onTransfered) then
					faction:onTransfered(target)
				end

				for k, v in ipairs(player.GetAll()) do
					nut.util.notifyLocalized("cChangeFaction", v, client:Name(), target:Name(), L(faction.name, v))
				end
			else
				return "@invalidFaction"
			end
		end
	end
})


