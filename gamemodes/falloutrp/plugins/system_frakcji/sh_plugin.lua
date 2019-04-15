PLUGIN.name = "System frakcji"
PLUGIN.author = "Lechu2375"
PLUGIN.desc = "Rozwija funkcjonalność frakcji."
local chuj = PLUGIN.folder
nut.util.include("sv_frakcje.lua")
nut.util.includeDir(chuj.."/frakcje")

TABELA_RANG = {}

function SetRank(char,rangaID)
    local frakcja = char:getFaction() 
    char:setData("ranga",nut.faction.indices[frakcja].rangi[rangaID],false,player.GetAll())
    char:getPlayer():Notify("Twoja ranga została zmieniona na: "..char:getData("ranga"))
    local charid = tonumber(char:getID())
    TABELA_RANG[charid] = char:getData("ranga")
	print("Tabela z rangami")
    PrintTable(TABELA_RANG)
end

function GetRank(char)
	if char then
		return TABELA_RANG[tonumber(char:getID())]
	end
end


function PLUGIN:DrawCharInfo(client, character, info)
    local frakcja = client:getChar():getFaction()
    local kolor_frakcji = nut.faction.indices[frakcja].color
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then  
         info[#info + 1] = {GetRank(client:getChar()), kolor_frakcji}
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

nut.command.add("awansuj", {
	adminOnly = true,
	syntax = "<komu> <numer rangi>",
	onRun = function(client, arguments)
		if IsValid(target) and target:getChar() then
			local target = nut.command.findPlayer(client, arguments[1])
			local char = target:getChar()
			local frakcja = char:getFaction()
			local id = tonumber(arguments[2])
			local nowa_ranga = nut.faction.indices[frakcja].rangi[id]
			client:Notify("Awansowałeś postać "..char:getName().." na: "..nowa_ranga)
			SetRank(char,id)
			print("Tabela z rangami")
			PrintTable(TABELA_RANG)
		end
	end
})




