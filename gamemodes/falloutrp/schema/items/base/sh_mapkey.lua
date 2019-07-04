ITEM.name = "Klucz Hexatektronalny do drzwi"
ITEM.model = "models/pocketmedpac/pocketmedpac.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "Używany do otwierania i zamykania drzwi o wyższym standardzie bezpieczeństwa"
ITEM.category = "MapKey"




ITEM.functions.usef = { -- sorry, for name order.
	name = "Użyj",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:CreatedByMap() and (target:GetClass()=="func_button")) then
            if target:GetName()=="bos_bunkier_drzwi_11" then
            target:Fire("Lock","",0)
			return true
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
