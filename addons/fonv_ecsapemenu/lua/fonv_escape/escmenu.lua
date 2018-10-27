function Esc.AddBatton( Button )
	FalloutTable[#FalloutTable + 1] = Button
end

function Esc.BaseMenu()
	if IsValid(Menu) and not Menu.Closed then 
		Menu:SetVisible(false) 
		Menu.Closed = true 
		return
	elseif IsValid(Menu) and Menu.Closed then
		Menu:SetVisible(true) 
		Menu.Closed = false 
		return
	end


    Menu = vgui.Create("DPanel")
    	Menu:SetSize( ScrW(), ScrH() )
		Menu:MakePopup()
		Menu.Paint = function(self)
    		Esc.Background()
    	TextBlurBig(GetHostName(), 10, ScrH()/2 - 80, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 3)
    	TextBlur(GAMEMODE.Name, 15, ScrH()/2 - 15, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 3)

    	end

	for k, v in ipairs(FalloutTable) do
    	local Button = vgui.Create("DButton", Menu)
		Button:SetText( "" )
		Button:SetPos(ScrW() - 290, ScrH()/2 - 120 + ((k - 1) * 30))
		Button:SetSize( 280, 30 )
		Button.Paint = function( self )
			DrawBox( 0, 0, Button:GetWide(), Button:GetTall(), self.Hovered and FalloutEsc.HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and FalloutEsc.HoverBorder or Color(0,0,0,0))
			Button:DrawOutlinedRect( 0, 0, Button:GetWide(), Button:GetTall())

			TextBlur(v.Name, 260, 2.5, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 2)
		end
		Button.DoClick = v.Click
    end
end

function Esc.ExitMenu()
	local MenuExit = vgui.Create("DPanel", Menu)
		MenuExit:SetSize(400, 160)
    	MenuExit:Center()
		MenuExit:MakePopup()
		MenuExit.Paint = function(self)
			DrawBox(0, 0, MenuExit:GetWide(), MenuExit:GetTall(), FalloutEsc.WindowBg)
			surface.SetDrawColor( Color(255,180,95) )
			MenuExit:DrawOutlinedRect( 0, 0, MenuExit:GetWide(), MenuExit:GetTall())

			TextBlur("Are you sure you want to quit?", MenuExit:GetWide()/2, 40, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 1)
    end


    local ButtonExit = vgui.Create("DButton", MenuExit)
   		ButtonExit:SetText( "" )
        ButtonExit:SetSize( 100, 30 )
    	ButtonExit:SetPos(40,100)
		ButtonExit.Paint = function(self)
			DrawBox( 0, 0, ButtonExit:GetWide(), ButtonExit:GetTall(), self.Hovered and FalloutEsc.HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and FalloutEsc.HoverBorder or Color(0,0,0,0) )
			ButtonExit:DrawOutlinedRect( 0, 0, ButtonExit:GetWide(), ButtonExit:GetTall())

			TextBlur("Exit", 95, 2.5, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 2)
    	end
        ButtonExit.DoClick = function()
    		RunConsoleCommand("disconnect")
    	end

    local ButtonClose = vgui.Create("DButton", MenuExit)
    	ButtonClose:SetText( "" )
    	ButtonClose:SetSize( 100, 30 )
    	ButtonClose:SetPos(260, 100)
		ButtonClose.Paint = function(self)
			DrawBox( 0, 0, ButtonClose:GetWide(), ButtonClose:GetTall(), self.Hovered and FalloutEsc.HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and FalloutEsc.HoverBorder or Color(0,0,0,0) )
			ButtonClose:DrawOutlinedRect( 0, 0, ButtonClose:GetWide(), ButtonClose:GetTall())

			TextBlur("Cancel", 95, 2.5, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 2)
    	end
    	ButtonClose.DoClick = function()
    		MenuExit:Remove()
    	end

end

function Esc.ReConMenu()
	local ReConMenu = vgui.Create("DPanel", Menu)
		ReConMenu:SetSize(400, 160)
    	ReConMenu:Center()
		ReConMenu:MakePopup()
		ReConMenu.Paint = function(self)
			DrawBox(0, 0, ReConMenu:GetWide(), ReConMenu:GetTall(), FalloutEsc.WindowBg)
			surface.SetDrawColor( Color(255,180,95) )
			ReConMenu:DrawOutlinedRect( 0, 0, ReConMenu:GetWide(), ReConMenu:GetTall())

			TextBlur("Are you sure you want to reconnect?", ReConMenu:GetWide()/2, 40, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 1)
    end


    local ReConMenuYes = vgui.Create("DButton", ReConMenu)
   		ReConMenuYes:SetText( "" )
        ReConMenuYes:SetSize( 100, 30 )
    	ReConMenuYes:SetPos(40,100)
		ReConMenuYes.Paint = function(self)
			DrawBox( 0, 0, ReConMenuYes:GetWide(), ReConMenuYes:GetTall(), self.Hovered and FalloutEsc.HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and FalloutEsc.HoverBorder or Color(0,0,0,0) )
			ReConMenuYes:DrawOutlinedRect( 0, 0, ReConMenuYes:GetWide(), ReConMenuYes:GetTall())

			TextBlur("Yes", 95, 2.5, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 2)
    	end
        ReConMenuYes.DoClick = function()
    		RunConsoleCommand("retry")
    	end

    local ReConMenuClose = vgui.Create("DButton", ReConMenu)
    	ReConMenuClose:SetText( "" )
    	ReConMenuClose:SetSize( 100, 30 )
    	ReConMenuClose:SetPos(260, 100)
		ReConMenuClose.Paint = function(self)
			DrawBox( 0, 0, ReConMenuClose:GetWide(), ReConMenuClose:GetTall(), self.Hovered and FalloutEsc.HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and FalloutEsc.HoverBorder or Color(0,0,0,0) )
			ReConMenuClose:DrawOutlinedRect( 0, 0, ReConMenuClose:GetWide(), ReConMenuClose:GetTall())

			TextBlur("Cancel", 95, 2.5, FalloutEsc.TextColor, FalloutEsc.ColorBlur, 2)
    	end
    	ReConMenuClose.DoClick = function()
    		ReConMenu:Remove()
    	end

end

hook.Add("PreRender", "PreRender", function()
	if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
		if ValidPanel(Menu) then
			gui.HideGameUI()
			Esc.BaseMenu()
		else
			gui.HideGameUI()
			Esc.BaseMenu()
		end
	end
end)