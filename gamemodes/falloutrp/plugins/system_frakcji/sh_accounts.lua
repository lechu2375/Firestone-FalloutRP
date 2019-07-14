nut.command.add("wplac", {
	adminOnly = true,
	syntax = "[kwota do wpłacenia na konto frakcji]",
	onRun = function(client, arguments)
		if(IsValid(client) and client:Alive()) then
            local amount = arguments[1]
            amount = math.abs(amount)
            if amount<=0 then return end
            local char = client:getChar()
            if not char then return end
            if not char:hasMoney(amount) then char:Notify("Nie posiadasz tylu pieniędzy") return end
            Firestone.FactionsVault.AddMoney(char,amount)
		end
	end
})