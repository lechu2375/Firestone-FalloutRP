nut.command.add("wplac", {
	adminOnly = true,
	syntax = "[kwota]",
	onRun = function(client, arguments)
		if(IsValid(client) and client:Alive()) then
            local amount = arguments[1]
            amount = math.abs(amount)
            if amount<=0 then return end
            local char = client:getChar()
            if not char then return end
            Firestone.FactionsVault.AddMoney(char,amount)
		end
	end
})
nut.command.add("wyplac", {
	adminOnly = true,
	syntax = "[kwota]",
	onRun = function(client, arguments)
		if(IsValid(client) and client:Alive()) then
            local amount = arguments[1]
            amount = math.abs(amount)
            if amount<=0 then return end
            local char = client:getChar()
            if not char then return end
            Firestone.FactionsVault.WithdrawMoney(char,amount)
		end
	end
})
nut.command.add("bilans", {
	adminOnly = true,
	syntax = "[brak]",
	onRun = function(client)
		if(IsValid(client)) then
            local char = client:getChar()
            if not char then return end
            client:PrintMessage(HUD_PRINTTALK,"Bilans konta frakcyjnego:"..Firestone.FactionsVault.GetBalance(char))
		end
	end
})