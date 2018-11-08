if !CLIENT then return end
resource.AddFile("sound/fs_ui/ui_menu_ok.wav")
resource.AddFile("sound/fs_ui/ui_menu_focus.wav")

scale = ScrH()
local escTable = {}

local function AddFalloutButton( btn )
	escTable[#escTable + 1] = btn
end

local function Toggle()
	if IsValid(mainDerma) and not mainDerma.Closed then
		mainDerma:SetVisible(false)
		mainDerma.Closed = true
    return
  elseif IsValid(mainDerma) and mainDerma.Closed then
    mainDerma:SetVisible(true)
    mainDerma.Closed = false
    return
  end

  mainDerma = vgui.Create("FS_Blur")
  mainDerma:SetSize(ScrW(),ScrH())
  mainDerma:MakePopup()

	local buttonHolder = mainDerma:Add("FS_PanelV")
	buttonHolder:SetSize(scale*0.22,scale*0.4)
	buttonHolder:SetPos(scale*0.4,scale*0.4)

  local pos = 7
  for _,v in ipairs(escTable) do
    pos = pos+45
    local f_button = buttonHolder:Add("FS_Button_ESC")
    f_button:SetSize(buttonHolder:GetWide()*0.8,buttonHolder:GetTall()*0.1)
    f_button:SetText(v.Name)
		f_button:SetPos(20,pos)
    f_button.DoClick = v.Click
  end
end

hook.Add("PreRender", "djuk's lui bag", function()
	if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
		if ValidPanel(mainDerma) then
			gui.HideGameUI()
			Toggle()
		else
			gui.HideGameUI()
			Toggle()
		end
	end
end)

AddFalloutButton({
	Name = "WZNÓW",
	Click = function()
		mainDerma:Remove()
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end
})

AddFalloutButton({
	Name = "OPCJE",
	Click = function()
		mainDerma:Remove()
		RunConsoleCommand("gamemenucommand", "openoptionsdialog")
		RunConsoleCommand("gameui_activate")
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end,
	OnFocus = function()
		surface.PlaySound("fs_ui/ui_menu_focus.wav")
	end
})

AddFalloutButton({
	Name = "SERWERY",
	Click = function()
		mainDerma:Remove()
		RunConsoleCommand("gameui_activate")
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end
})

AddFalloutButton({
	Name = "KOLEKCJA",
	Click = function()
		gui.OpenURL("dozrobienia")
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end
})

AddFalloutButton({
	Name = "STRONA",
	Click = function()
		gui.OpenURL("dozrobienia")
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end
})

AddFalloutButton({
	Name = "RELOGNIJ",
	Click = function()
		RunConsoleCommand("retry")
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end
})

AddFalloutButton({
	Name = "WYJDZ",
	Click = function()
		RunConsoleCommand("disconnect")
		surface.PlaySound("fs_ui/ui_menu_ok.wav")
	end
})
