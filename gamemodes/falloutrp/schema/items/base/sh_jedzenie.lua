ITEM.name = "Jedzenie"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "This is test food."
ITEM.category = "Jedzenie"
ITEM.health = 10
ITEM.lifeTime = 67







function ITEM:getDesc()
	local str = (os.time().."\n"..self:getData("lifeTime"))
	return str
end

ITEM:hook("use", function(item)
	item.player:EmitSound("npc_human_eating_food_chewy_01.wav")
end)

ITEM.eatTable = {
	"Tego nie da się zjeść, lepiej to wyrzuć..",
	"Ouh, nie tykaj tego..",
	"Przeterminowane, nie do zjedzenia.",
	"Termin spożycia tego jedzenia już minął",
}
ITEM.functions.use = {
	name = "Zjedz",
	tip = "",
	icon = "icon16/cup.png",
	onRun = function(item)
		if item.player:Alive() then
		local spawntime = os.time()
		local lifeTime = item:getData("lifeTime")
			if spawntime < lifeTime then
				local maxhp = item.player:GetMaxHealth()
				local hp = item.player:Health()
				local newhp = hp + item.health
				if newhp < maxhp then
					item.player:SetHealth(hp + item.health)
				else
					local toadd = math.Clamp(newhp, hp, maxhp)
					item.player:SetHealth(toadd)
				end
			else
				item.player:Notify(table.Random(item.eatTable))
				item:remove()
				return false
			end	
		end
	end
}