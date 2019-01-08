PLUGIN.name = "Karma System"
PLUGIN.author = "Lechu"
PLUGIN.desc = "System na karme"

nut.flag.add("K", "Sprawdzanie karmy.")

function PLUGIN:OnNPCKilled(npc,attacker)
    if !attacker:IsPlayer() then return 
	end
	local character = attacker:getChar()
		if !character:getData("karma") then
			character:setData("karma", 1)
		end
		character:setData("karma", character:getData("karma")+1)
		attacker:PrintMessage(3,"Zabito NPC.".." Karma: "..tostring(character:getData("karma")))
end




function PLUGIN:PlayerDeath(victim,inflictor,attacker)
	if !attacker:IsPlayer() then return 
	end
	local character = attacker:getChar()
		if !character:getData("karma") then
			character:setData("karma", -10)
		end
		character:setData("karma", character:getData("karma")-10)
		attacker:PrintMessage(3,"Zabito Gracza.".." Karma: "..tostring(character:getData("karma")))
end




nut.command.add("checkkarma", {
	syntax = "<nazwa postaci>",
	adminOnly = true,
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target)) then
			client:PrintMessage(3,(target:getChar():getName()).." Punkty Karmy: "..tostring(target:getChar():GetData("karma")))
		end
	end
})


nut.command.add("checkflags", {
	syntax = "<nazwa postaci>",
	adminOnly = true,
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target)) then
			client:PrintMessage(3,(target:getChar():getName()).." Flagi: "..(target:getChar():getFlags()))
			client:PrintMessage(3 ,"Każda litera odpowiada jednej fladze")
		end
	end
}) 

karma_ranks = {
	["Przyjazny"] = 200,
	["Dobry"] = 100,
	["Neutralny"] = 0,
	["Agresywny"] = -100,
	["Bandyta"] =  -200,
}



