PLUGIN.name = "System frakcji"
PLUGIN.author = "Lechu2375"
PLUGIN.desc = "Rozwija funkcjonalność frakcji."
local dir = PLUGIN.folder
nut.util.include("sv_frakcje.lua")
nut.util.include("cl_frakcje.lua")
TABELA_RANG = {}



function SetRank(char,rankID,caller)
	local faction = char:getFaction()
	if rankID == 0 then
		return 
	elseif rankID<0 then
		rankID = (rankID*(-1))
	end
	if nut.faction.indices[faction].rangi then

		if rankID > #nut.faction.indices[faction].rangi then
			if caller then
				caller:Notify("Podałeś zbyt duże ID rangi, nie ma tyle rang w tabeli.")
				print("Zbyt duże ID rangi, nie ma takiej rangi w tabeli.")
				return 
			else
				print("Zbyt duże ID rangi, nie ma takiej rangi w tabeli.")
				return 
			end
		end
		local newrank = nut.faction.indices[faction].rangi[rankID]
		char:setData("ranga",newrank,false,player.GetAll())
		char:getPlayer():Notify("Twoja ranga została zmieniona na "..char:getData("ranga"))
		local charid = tonumber(char:getID())
    	TABELA_RANG[charid] = char:getData("ranga")
	else
		return false
	end
end

function getPermissions(char)
    if char then
        if nut.faction.indices[char:getFaction()].permissions then
			if nut.faction.indices[char:getFaction()].permissions[char:getData("ranga")] then

            	return nut.faction.indices[char:getFaction()].permissions[char:getData("ranga")] --zwracam tabele
			
			else
				print("Get_Permissions dla "..char:getName().." nie powiodla sie, ranga nie posiada uprawnien lub tabela jest zle skonfigurowana.")
            	local tabelka = {}
            	return tabelka
			end

        else
            print("Get_Permissions dla "..char:getName().." nie powiodla sie, ranga nie posiada uprawnien lub tabela jest zle skonfigurowana.")
            local tabelka = {}
            return tabelka
        end
    end
end








nut.command.add("jakaranga", {
	adminOnly = true,
	syntax = "<nazwa postaci>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			client:PrintMessage(HUD_PRINTTALK,"Ranga postaci "..target:getChar():getName().." to: "..target:getChar():getData("ranga"))
		end
	end
})

nut.command.add("awans", {
	adminOnly = false,
	syntax = "<postać> [numer rangi]",
	onRun = function(client, arguments)
	local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(target) and target:getChar() then
			local char = target:getChar()
			if not client:getChar():getFaction() == char:getFaction() then return end
			local uprawnienia = getPermissions(client:getChar()) 
			if client == target then --Jeśli nie jest dowódcą nie może sam sie awansować
				if not uprawnienia.dowodca then
					client:Notify("Nie możesz się sam awansować.")
					return
				end
			end
			local nowa_ranga = nut.faction.indices[char:getFaction()].rangi[tonumber(arguments[2])]
			if uprawnienia.awans and client:GetPos():Distance(char:getPlayer():GetPos())<300 then
				local id = tonumber(arguments[2])
				SetRank(char,id,client)
				if nowa_ranga then
					client:Notify("Awansowałeś postać "..char:getName().." na: "..nowa_ranga)
				end
			elseif client:GetPos():Distance(char:getPlayer():GetPos())>300 then
				client:Notify("Stoisz za daleko od gracza, którego chcesz awansować.")
			elseif not IsValid(uprawnienia.awans) then
				client:Notify("Nie posiadasz uprawnień by awansować.")
			end
		end
	end
})

nut.command.add("odleglosc", {
	adminOnly = true,
	syntax = "<postać> ((Mierzy odleglosc pomiedzy twoją postacią a wybraną))",
	onRun = function(client, arguments)
	local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(target) and target:getChar() then
			local char = target:getChar()
			local pos1 = client:GetPos()
			local pos2 = char:getPlayer():GetPos()
			client:Notify(pos1:Distance(pos2))	
		end
	end
})

nut.command.add("adminawans", {
	adminOnly = true,
	syntax = "<postać> [numer rangi]",
	onRun = function(client, arguments)
	local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(target) and target:getChar() then
			local char = target:getChar()
			local frakcja = char:getFaction()
			local id = tonumber(arguments[2])
			if not nut.faction.indices[frakcja].rangi then return end
			if id<=0 then 
				client:Notify("Wprowadź poprawny numer rangi.")
				return
			end
			local nowa_ranga = nut.faction.indices[frakcja].rangi[id]
			if not nowa_ranga then client:Notify("W tamtej frakcji nie ma rang lub podałeś zły numer rangi.") return end
			SetRank(char,id)
			client:Notify("Awansowałeś postać "..char:getName().." na: "..nowa_ranga)
		end
	end
})

nut.command.add("spisrang", {
	adminOnly = true,
	syntax = "<brak, komenda wyswietla wszystkie rangi z frakcji postaci>",
	onRun = function(client)
		if IsValid(client) and client:getChar() then
			local char = client:getChar()
			local frakcja = char:getFaction()
			if nut.faction.indices[frakcja].rangi then
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
				PrintMessage(HUD_PRINTTALK,"Brak uprawnień")
			else
				local text = ""
				for k,v in pairs(uprawnienia) do
					text = text.." "..k
				end 
				PrintMessage(HUD_PRINTTALK,"Posiadasz następujące uprawnienia: "..text)
			end
		end
	end
})


nut.command.add("zapros", {
	adminOnly = false,
	syntax = "<Postać którą chcesz zaprosic do frakcji]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(target) and target:getChar() then
			local perm = getPermissions(client:getChar())
			if not perm.invite then client:Notify("Nie posiadasz do tego uprawnień") return end
			if client then
				if timer.Exists( "CMD_Delay" ) then
						if math.Round(timer.TimeLeft("CMD_Delay")) == 1 then
							client:Notify("Odczekaj sekundę zanim znów zaprosisz gracza.")
						elseif math.Round(timer.TimeLeft("CMD_Delay")) == 0 then
							client:Notify("Spróbuj ponownie zaprosić gracza.")
						else
							client:Notify("Odczekaj "..math.Round(timer.TimeLeft("CMD_Delay")).." sekundy zanim znów zaprosisz gracza.")
						end
					return false
				else	
					timer.Create("CMD_Delay", 5, 0, function()
						timer.Destroy("CMD_Delay")
					end)
				end
			end
			factionInvite(client,target)	
		end
	end
})

