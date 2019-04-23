PLUGIN.name = "System frakcji"
PLUGIN.author = "Lechu2375"
PLUGIN.desc = "Rozwija funkcjonalność frakcji."
local chuj = PLUGIN.folder
nut.util.include("sv_frakcje.lua")
nut.util.include("cl_frakcje.lua")
nut.util.includeDir(chuj.."/frakcje")

TABELA_RANG = {}

function RankReturn(frakcja,rangaID)
	if istable(nut.faction.indices[frakcja].rangi[rangaID]) then 
		return nut.faction.indices[frakcja].rangi[rangaID].name
	else
		return nut.faction.indices[frakcja].rangi[rangaID]
	end
end

function SetRank(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",RankReturn(char,rangaID),false,player.GetAll())
    char:getPlayer():Notify("Twoja ranga została zmieniona na "..char:getData("ranga"))
    local charid = tonumber(char:getID())
    TABELA_RANG[charid] = char:getData("ranga")
end

function GetRank(char)
	if char then
		return TABELA_RANG[tonumber(char:getID())]
	end
end

function IsOfficer(char)
	if char then
		local frakcja = char:getFaction()
		local ranga = char:getData("ranga")
		for k,v in pairs(nut.faction.indices[frakcja].rangi) do
			if v.name = ranga and v.officer then
				return true
			end
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
			local nowa_ranga = nut.faction.indices[frakcja].rangi[id].name
			client:Notify("Awansowałeś postać "..char:getName().." na: "..nowa_ranga)
			SetRank(char,id)
		end
	end
})

nut.command.add("spisrang", {
	adminOnly = true,
	syntax = "<brak>",
	onRun = function(client)
	local target = nut.command.findPlayer(client, arguments[1])
		if IsValid(client) and client:getChar() then
			local char = client:getChar()
			local frakcja = char:getFaction()
			client:PrintMessage(HUD_PRINTTALK,"Sprawdź konsolę.")
			for k,v in SortedPairs(nut.faction.indices[frakcja].rangi) do
				client:PrintMessage(HUD_PRINTCONSOLE,(k.."."..v.."\n"))
			end
		end
	end
})






