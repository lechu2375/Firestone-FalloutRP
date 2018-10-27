FalloutEsc.TextColor = Color(255,185,70)
FalloutEsc.WindowBg = Color(0,0,0,150)
FalloutEsc.HoverBorder = Color(195,140,50)
FalloutEsc.HoverBg = Color(255,185,70,10)
FalloutEsc.ColorBlur = Color(0,0,0,255)

FalloutEsc.BgChangeSlideTime = 10
FalloutEsc.BgImg = "gamemodes/sandbox/backgrounds/1.jpg"

FalloutEsc.ContentURL = "http://google.com/"
FalloutEsc.WebsiteURL = "http://google.com/"

Esc.AddBatton({
	Name = "Resume",
	Click = function()
		Menu:Remove()
	end
})

Esc.AddBatton({
	Name = "Option",
	Click = function()
		RunConsoleCommand("gamemenucommand", "openoptionsdialog")
		RunConsoleCommand("gameui_activate")
	end
})

Esc.AddBatton({
	Name = "Content",
	Click = function()
		gui.OpenURL( FalloutEsc.ContentURL )
	end
})

Esc.AddBatton({
	Name = "Website",
	Click = function()
		gui.OpenURL( FalloutEsc.WebsiteURL )
	end
})

Esc.AddBatton({
	Name = "Reconnect",
	Click = function( ply )
		Esc.ReConMenu()
	end
})

Esc.AddBatton({
	Name = "Exit",
	Click = function()
		Esc.ExitMenu()
	end
})