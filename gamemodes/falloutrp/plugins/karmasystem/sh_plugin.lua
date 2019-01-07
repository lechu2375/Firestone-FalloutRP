PLUGIN.name = "Karma System"
PLUGIN.author = "Lechu"
PLUGIN.desc = "System na karme"



function PLUGIN:OnNPCKilled(npc,attacker)
    if !attacker:IsPlayer() then return end
	local character = attacker:getChar()
		if !character:getData("karma") then
			character:setData("karma", 1)
		end
	attacker:PrintMessage(3,"Zabito NPC.")
	attacker:PrintMessage(3,tostring(character:getData("karma")))
	character:setData("karma", character:getData("karma")+1)
end




