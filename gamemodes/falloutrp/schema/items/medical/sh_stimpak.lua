ITEM.name = "Stimpak"
ITEM.category = "Medical"
ITEM.desc = "Stimpak, pozwalający od razu uleczyć w pewnym stopniu rany."
ITEM.model = "models/fallout_4/props/stimpak.mdl"
ITEM.price = 75
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 30, 100)) --#100how much it heals, #300how much the max heal is.
	end
}