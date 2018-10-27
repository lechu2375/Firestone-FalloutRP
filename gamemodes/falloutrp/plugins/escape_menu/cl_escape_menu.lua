
PLUGIN:TextColor = Color(255,185,70)
PLUGIN:WindowBg = Color(0,0,0,150)
PLUGIN:HoverBorder = Color(195,140,50)
PLUGIN:HoverBg = Color(255,185,70,10)
PLUGIN:ColorBlur = Color(0,0,0,255)

PLUGIN:BgChangeSlideTime = 10
PLUGIN:BgImg = "gamemodes/sandbox/backgrounds/1.jpg"

PLUGIN:ContentURL = "http://google.com/"
PLUGIN:WebsiteURL = "http://google.com/"

PLUGIN:AddButton({
	Name = "Resume",
	Click = function()
		Menu:Remove()
	end
})

PLUGIN:AddButton({
	Name = "Option",
	Click = function()
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
		RunConsoleCommand("gamemenucommand", "openoptionsdialog")
		RunConsoleCommand("gameui_activate")
	end
})

PLUGIN:AddButton({
	Name = "Content",
	Click = function()
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
		gui.OpenURL( PLUGIN:ContentURL )
	end
})

PLUGIN:AddButton({
	Name = "Website",
	Click = function()
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
		gui.OpenURL( PLUGIN:WebsiteURL )
	end
})

PLUGIN:AddButton({
	Name = "Reconnect",
	Click = function( ply )
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
		PLUGIN:ReConMenu()
	end
})

PLUGIN:AddButton({
	Name = "Exit",
	Click = function()
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
		PLUGIN:ExitMenu()
	end
})

if !CLIENT then return end 

function PLUGIN:Background()

	if ( !BgSlideOn ) then
		local Bg = 'materials/bg/'..math.random(1,35)..'.jpg'
		PLUGIN:BgImg = Bg
		BgSlideOn = true;
		BgChangeTime = CurTime() + PLUGIN:BgChangeSlideTime
	end
	
	Materials(PLUGIN:BgImg, 0, 0, ScrW(), ScrH())
end

hook.Add('Think', 'testbg', function()
	if (BgSlideOn == true) then
		if CurTime() > BgChangeTime then 
			local Bg = 'materials/fsc_esc/'..math.random(1,35)..'.jpg'
			PLUGIN:BgImg = Bg
			BgChangeTime = CurTime() + PLUGIN:BgChangeSlideTime
		end
	end
end)

local fonttext = "Arial"

	surface.CreateFont( "text",
	{
		font      = fonttext,
		size      = 24,
		weight    = -1,
	}

 )
	surface.CreateFont( "text_blur",
	{
		font      = fonttext,
		size      = 24,
		weight    = -1,
		underline = 0,
		additive  = false,
		outline = false,
		blursize = 6
	}

 )

surface.CreateFont( "text_big",
	{
		font      = fonttext,
		size      = 72,
		weight    = -1,
	}

 )
	surface.CreateFont( "text_blur_big",
	{
		font      = fonttext,
		size      = 72,
		weight    = -1,
		underline = 0,
		additive  = false,
		outline = false,
		blursize = 10
	}

 )

local function Materials( mat, x, y, w, h )
	surface.SetDrawColor( Color(255,255,255,255) )
	surface.SetMaterial( Material( mat ) )
	surface.DrawTexturedRect( x, y, w, h)
end

local function DrawBox( x, y, w, h, col )
	surface.SetDrawColor(col)
	surface.DrawRect(x, y, w, h)
end

local function TextBlur(text, x, y, col, colblur, pos)
	for i=1,9 do
		draw.SimpleText(text, "text_blur", x, y, colblur, pos)
	end
	draw.SimpleText(text, "text", x, y, col, pos)
end

local function TextBlurBig(text, x, y, col, colblur, pos)
	for i=1,9 do
			draw.SimpleText(text, "text_blur_big", x, y, colblur, pos)
	end
	draw.SimpleText(text, "text_big", x, y, col, pos)
end

local function PLUGIN:AddButton( Button )
	FalloutTable[#FalloutTable + 1] = Button
end

local function PLUGIN:BaseMenu()
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
    		PLUGIN:Background()
    	TextBlurBig(GetHostName(), 10, ScrH()/2 - 80, PLUGIN:TextColor, PLUGIN:ColorBlur, 3)
    	TextBlur(GAMEMODE.Name, 15, ScrH()/2 - 15, PLUGIN:TextColor, PLUGIN:ColorBlur, 3)

    	end

	for k, v in ipairs(FalloutTable) do
    	local Button = vgui.Create("DButton", Menu)
		Button:SetText( "" )
		Button:SetPos(ScrW() - 290, ScrH()/2 - 120 + ((k - 1) * 30))
		Button:SetSize( 280, 30 )
		Button.Paint = function( self )
			DrawBox( 0, 0, Button:GetWide(), Button:GetTall(), self.Hovered and PLUGIN:HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and PLUGIN:HoverBorder or Color(0,0,0,0))
			Button:DrawOutlinedRect( 0, 0, Button:GetWide(), Button:GetTall())

			TextBlur(v.Name, 260, 2.5, PLUGIN:TextColor, PLUGIN:ColorBlur, 2)
		end
		Button.DoClick = v.Click
    end
end

local function PLUGIN:ExitMenu()
	local MenuExit = vgui.Create("DPanel", Menu)
		MenuExit:SetSize(400, 160)
    	MenuExit:Center()
		MenuExit:MakePopup()
		MenuExit.Paint = function(self)
			DrawBox(0, 0, MenuExit:GetWide(), MenuExit:GetTall(), PLUGIN:WindowBg)
			surface.SetDrawColor( Color(255,180,95) )
			MenuExit:DrawOutlinedRect( 0, 0, MenuExit:GetWide(), MenuExit:GetTall())

			TextBlur("Are you sure you want to quit?", MenuExit:GetWide()/2, 40, PLUGIN:TextColor, PLUGIN:ColorBlur, 1)
    end


    local ButtonExit = vgui.Create("DButton", MenuExit)
   		ButtonExit:SetText( "" )
        ButtonExit:SetSize( 100, 30 )
    	ButtonExit:SetPos(40,100)
		ButtonExit.Paint = function(self)
			DrawBox( 0, 0, ButtonExit:GetWide(), ButtonExit:GetTall(), self.Hovered and PLUGIN:HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and PLUGIN:HoverBorder or Color(0,0,0,0) )
			ButtonExit:DrawOutlinedRect( 0, 0, ButtonExit:GetWide(), ButtonExit:GetTall())

			TextBlur("Exit", 95, 2.5, PLUGIN:TextColor, PLUGIN:ColorBlur, 2)
    	end
        ButtonExit.DoClick = function()
    		RunConsoleCommand("disconnect")
    	end

    local ButtonClose = vgui.Create("DButton", MenuExit)
    	ButtonClose:SetText( "" )
    	ButtonClose:SetSize( 100, 30 )
    	ButtonClose:SetPos(260, 100)
		ButtonClose.Paint = function(self)
			DrawBox( 0, 0, ButtonClose:GetWide(), ButtonClose:GetTall(), self.Hovered and PLUGIN:HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and PLUGIN:HoverBorder or Color(0,0,0,0) )
			ButtonClose:DrawOutlinedRect( 0, 0, ButtonClose:GetWide(), ButtonClose:GetTall())

			TextBlur("Cancel", 95, 2.5, PLUGIN:TextColor, PLUGIN:ColorBlur, 2)
    	end
    	ButtonClose.DoClick = function()
    		MenuExit:Remove()
    	end

end

local function PLUGIN:ReConMenu()
	local ReConMenu = vgui.Create("DPanel", Menu)
		ReConMenu:SetSize(400, 160)
    	ReConMenu:Center()
		ReConMenu:MakePopup()
		ReConMenu.Paint = function(self)
			DrawBox(0, 0, ReConMenu:GetWide(), ReConMenu:GetTall(), PLUGIN:WindowBg)
			surface.SetDrawColor( Color(255,180,95) )
			ReConMenu:DrawOutlinedRect( 0, 0, ReConMenu:GetWide(), ReConMenu:GetTall())

			TextBlur("Are you sure you want to reconnect?", ReConMenu:GetWide()/2, 40, PLUGIN:TextColor, PLUGIN:ColorBlur, 1)
    end


    local ReConMenuYes = vgui.Create("DButton", ReConMenu)
   		ReConMenuYes:SetText( "" )
        ReConMenuYes:SetSize( 100, 30 )
    	ReConMenuYes:SetPos(40,100)
		ReConMenuYes.Paint = function(self)
			DrawBox( 0, 0, ReConMenuYes:GetWide(), ReConMenuYes:GetTall(), self.Hovered and PLUGIN:HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and PLUGIN:HoverBorder or Color(0,0,0,0) )
			ReConMenuYes:DrawOutlinedRect( 0, 0, ReConMenuYes:GetWide(), ReConMenuYes:GetTall())

			TextBlur("Yes", 95, 2.5, PLUGIN:TextColor, PLUGIN:ColorBlur, 2)
    	end
        ReConMenuYes.DoClick = function()
    		RunConsoleCommand("retry")
    	end

    local ReConMenuClose = vgui.Create("DButton", ReConMenu)
    	ReConMenuClose:SetText( "" )
    	ReConMenuClose:SetSize( 100, 30 )
    	ReConMenuClose:SetPos(260, 100)
		ReConMenuClose.Paint = function(self)
			DrawBox( 0, 0, ReConMenuClose:GetWide(), ReConMenuClose:GetTall(), self.Hovered and PLUGIN:HoverBg or Color(0,0,0,0))
			surface.SetDrawColor( self.Hovered and PLUGIN:HoverBorder or Color(0,0,0,0) )
			ReConMenuClose:DrawOutlinedRect( 0, 0, ReConMenuClose:GetWide(), ReConMenuClose:GetTall())

			TextBlur("Cancel", 95, 2.5, PLUGIN:TextColor, PLUGIN:ColorBlur, 2)
    	end
    	ReConMenuClose.DoClick = function()
    		ReConMenu:Remove()
    	end

end

hook.Add("PreRender", "PreRender", function()
	if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
		if ValidPanel(Menu) then
			gui.HideGameUI()
			PLUGIN:BaseMenu()
		else
			gui.HideGameUI()
			PLUGIN:BaseMenu()
		end
	end
end)