ITEM.name = "Medical/Repair Kit"
ITEM.category = "Medical"
ITEM.desc = "A large medical kit strapped with running repair tools."
ITEM.model = "models/Items/HealthKit.mdl"
ITEM.price = 0
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 100, 300)) --#100how much it heals, #300how much the max heal is.
	end
}