ITEM.name = "Jedzenie"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "This is test food."
ITEM.category = "Jedzenie"
ITEM.health = 10
ITEM.lifeTime = 67





function ITEM:getDesc()
	local lifeTime = self:getData("lifeTime") or os.time()
	local desc = self.desc
	if lifeTime>=os.time() then
		desc = desc.."\n Nadaje się do jedzenia!"
	else
		desc = desc.."\n Nieprzyjemnie pachnie, ale można spróbować to zjeść.."
	end
	return desc
end

ITEM:hook("use", function(item)
	item.player:EmitSound("fs_items/npc_human_eating_food_chewy_01.wav")
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
		local lifeTime = item:getData("lifeTime") or 0
			if spawntime <= lifeTime then
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
				local rand = math.random(0, 3)
				if rand == 3 then
					local maxhp = item.player:GetMaxHealth()
					local hp = item.player:Health()
					local newhp = hp + (item.health*0.3)
					item.player:SetHealth(hp + item.health)
					item.player:Notify("Twój brzuch mimo zepsucia jedzenia postanowił bez problemów przetrawić spożyty posiłek.")
				else
					item.player:Notify(table.Random(item.eatTable))
					local hp = item.player:Health()
					for i=1, 3 do
					local ply = item.player
						timer.Simple(i, function () 
							local hp = ply:Health()
							ply:SetHealth(hp-10)
							ply:ScreenFade(16,Color(113, 128, 147,75),1,0.01)
						end)
					end	
				end 
			end	
		end
	end
}		


