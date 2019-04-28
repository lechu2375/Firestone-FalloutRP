PLUGIN.name = "System frakcji"
PLUGIN.author = "Lechu2375"
PLUGIN.desc = "Rozwija funkcjonalność frakcji."
local chuj = PLUGIN.folder
nut.util.include("sv_frakcje.lua")
nut.util.include("cl_frakcje.lua")
nut.util.includeDir(chuj.."/frakcje")
nut.flag.add("o", "Uprawnienia oficera we frakcji.")
TABELA_RANG = {}



function SetRank(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID],false,player.GetAll())
    char:getPlayer():Notify("Twoja ranga została zmieniona na "..char:getData("ranga"))
    local charid = tonumber(char:getID())
    TABELA_RANG[charid] = char:getData("ranga")
end

function getPermissions(char)
    if char then
        if nut.faction.indices[char:getFaction()].permissions then
            return nut.faction.indices[char:getFaction()].permissions[char:getData("ranga")] --zwracam tabele
        else
            print("Get_Permissions dla "..char:getName().." nie powiodla sie, ranga nie posiada uprawnien lub tabela jest zle skonfigurowana.")
            local tabelka = {}
            return tabelka
        end
    end
end







nut.command.add("jakaranga", {
	adminOnly = true,
	syntax = "<nazwa typa>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			client:PrintMessage(HUD_PRINTTALK,"Ranga postaci "..target:getChar():getName().." to: "..target:getChar():getData("ranga"))
		end
	end
})

nut.command.add("awans", {
	adminOnly = false,
	syntax = "<postac> <numer rangi>",
	onRun = function(client, arguments)
	local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(target) and target:getChar() then
			local char = target:getChar()
			local uprawnienia = getPermissions(client:getChar()) 
			local nowa_ranga = nut.faction.indices[char:getFaction()].rangi[tonumber(arguments[2])]
			local pos1 = client:GetPos()
			local pos2 = char:getPlayer():GetPos()
			if uprawnienia.awans and math.Distance(pos1.x, pos1.y, pos2.x, pos2.x)<100 then
				client:Notify("Awansowałeś postać "..char:getName().." na: "..nowa_ranga)
				SetRank(char,id)
			elseif math.Distance(pos1.x, pos1.y, pos2.x, pos2.x)>100 then
				client:Notify("Stoisz za daleko od gracza, którego chcesz awansować")
			elseif IsValid(uprawnienia.awans) == false then
				client:Notify("Nie posiadasz uprawnień by awansować.")
			end
		end
	end
})

nut.command.add("adminawans", {
	adminOnly = false,
	syntax = "<postac> <numer rangi>",
	onRun = function(client, arguments)
	local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(target) and target:getChar() then
			local char = target:getChar()
			local frakcja = char:getFaction()
			local id = tonumber(arguments[2])
			local nowa_ranga = nut.faction.indices[frakcja].rangi[id]
			client:Notify("Awansowałeś postać "..char:getName().." na: "..nowa_ranga)
			SetRank(char,id)
		end
	end
})

nut.command.add("spisrang", {
	adminOnly = true,
	syntax = "<brak, komenda wyświetla wszystkie rangi z frakcji postaci>",
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
	adminOnly = true,
	syntax = "<brak, komenda wyświetla uprawnienia twojej postaci>",
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








