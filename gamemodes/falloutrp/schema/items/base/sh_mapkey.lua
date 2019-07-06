ITEM.name = "Klucz z szyfrowaniem 1024 bitowym do drzwi"
ITEM.model = "models/Items/battery.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 10000
ITEM.desc = "Używany do otwierania i zamykania drzwi o wyższym standardzie bezpieczeństwa"
ITEM.category = "MapKey"
ITEM.DoorClass = "func_button"
ITEM.DoorName = "bos_bunkier_drzwi_11"



ITEM.functions.use = { -- sorry, for name order.
	name = "Użyj",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:CreatedByMap() and (target:GetClass()==item.DoorClass)) then
            if target:GetName()==item.DoorName then
				local tab = target:GetSaveTable()
				if tab.m_bLocked then 
            		target:Fire("unlock","",.1)
				else
					target:Fire("lock","",.1)
				end
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
