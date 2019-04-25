PLUGIN.name = "System frakcji"
PLUGIN.author = "Lechu2375"
PLUGIN.desc = "Rozwija funkcjonalność frakcji."
local chuj = PLUGIN.folder
nut.util.include("sv_frakcje.lua")
nut.util.include("cl_frakcje.lua")
nut.util.includeDir(chuj.."/frakcje")

TABELA_RANG = {}



function SetRank(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID],false,player.GetAll())
    char:getPlayer():Notify("Twoja ranga została zmieniona na "..char:getData("ranga"))
    local charid = tonumber(char:getID())
    TABELA_RANG[charid] = char:getData("ranga")
end



function IsOfficer(char)
	if char then
		local frakcja = char:getFaction()
		local ranga = char:getData("ranga")	
		if IsValid(nut.faction.indices[frakcja].oficerowie) then
			if nut.faction.indices[frakcja].oficerowie[ranga] then
				return true
			else
				return false
			end
		else 
			return false
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
	adminOnly = true,
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



nut.command.add("isofficer", {
	adminOnly = true,
	syntax = "<chuj>",
	onRun = function(client)
		if IsValid(client) and client:getChar() then
			local char = client:getChar()
			local frakcja = char:getFaction()
			client:PrintMessage(HUD_PRINTTALK,tostring(IsOfficer(char)))
		end
	end
})

