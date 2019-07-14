nut.command.add("wplac", {
	adminOnly = true,
	syntax = "[kwota do wpłacenia na konto frakcji]",
	onRun = function(client, arguments)
		if(IsValid(client) and client:Alive()) then
            local amount = arguments[1]
            local char = client:getChar()
            Firestone.FactionsVault.AddMoney(char,amount)
		end
	end
})