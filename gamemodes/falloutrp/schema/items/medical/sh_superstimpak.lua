ITEM.name = "SuperStimpak"
ITEM.category = "Medical"
ITEM.desc = "Super Stimpak"
ITEM.model = "models/fallout_4/props/superstimpak.mdl"
ITEM.price = 150
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 60, 150)) --#100how much it heals, #300how much the max heal is.
	end
}