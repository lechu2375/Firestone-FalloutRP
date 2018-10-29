if !CLIENT then return end
resource.AddFile("sound/fs_ui/ui_menu_ok.wav")
resource.AddFile("sound/fs_ui/ui_menu_focus.wav")

scale = ScrH()
local escTable = {}

local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end


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

  mainDerma = vgui.Create("DPanel")
  mainDerma:SetSize(ScrW(),ScrH())
  mainDerma:MakePopup()
  mainDerma.Paint = function( panel, w, h )
    draw.RoundedBox(0,0,0,w,h,Color(0,0,0,50))
    DrawBlur(panel, 6)
  end

	local buttonHolder = mainDerma:Add("DPanel")
	buttonHolder:SetSize(scale*0.22,scale*0.4)
	buttonHolder:SetPos(scale*0.4,scale*0.4)
	buttonHolder.Paint = function( panel, w, h )
		draw.RoundedBox(0,0,0,w,h,Color(15, 72, 34,215))
		surface.SetDrawColor(17,255,31)
		surface.DrawRect(0,buttonHolder:GetTall()-4,buttonHolder:GetWide(),4)
		surface.DrawRect(0,0,buttonHolder:GetWide(),4)
		surface.DrawRect(0,0,4,buttonHolder:GetTall()*0.02)
		surface.DrawRect(buttonHolder:GetWide()-4,0,4,buttonHolder:GetTall()*0.02)
		surface.DrawRect(0,buttonHolder:GetTall()-buttonHolder:GetTall()*0.02,4,buttonHolder:GetTall()*0.02)
		surface.DrawRect(buttonHolder:GetWide()-4,buttonHolder:GetTall()-buttonHolder:GetTall()*0.02,4,buttonHolder:GetTall()*0.02)
	end

  local pos = 7
  for _,v in ipairs(escTable) do
    pos = pos+45
    local f_button = buttonHolder:Add("DButton")
    f_button:SetSize(buttonHolder:GetWide()*0.8,buttonHolder:GetTall()*0.1)
    f_button:SetText(v.Name)
		f_button:SetPos(20,pos)
		f_button:SetFont("FS_Main")
		f_button:SetContentAlignment(5)
    f_button.DoClick = v.Click
		f_button.OnCursorEntered = function()
			surface.PlaySound("fs_ui/ui_menu_focus.wav")
		end
		f_button.Paint = function( button, w, h )
			if f_button:IsHovered() then
				f_button:SetColor(Color(0,0,0))
				draw.RoundedBox(0,0,0,w,h,Color(19, 255, 23))
			else
				f_button:SetColor(Color(19, 255, 23))
				draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
			end
		end
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
	Name = "WZNOW",
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
