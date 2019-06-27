ITEM.name = "Ultra Stimpak"
ITEM.category = "Medical"
ITEM.desc = "Bardzo silnie działający stimpak, potrafiący nawet wzmocnić na jakiś czas organizm."
ITEM.model = "models/fallout_4/props/ultrastimpak.mdl"
ITEM.price = 225
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 125, 200)) --#100how much it heals, #300how much the max heal is.
	end
}