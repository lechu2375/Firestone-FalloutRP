AddCSLuaFile()

local BUTTON = {}

function BUTTON:Init()
  self.dark = Color(15, 72, 34,215)
  self.light = Color(17,255,31)
  self:SetFont("FS_Main")
  self.active = false
end

function BUTTON:Paint(w, h)
  surface.SetDrawColor(17,255,31)
  if self:IsHovered() or self.active then
    surface.DrawRect(0, 0, w, h)
    self:SetColor(Color(0,0,0))
  else
    surface.DrawOutlinedRect(0, 0, w, h)
    self:SetColor(Color(17,255,31))
  end
end

function BUTTON:OnCursorEntered()
  surface.PlaySound("fs_ui/ui_menu_focus.wav")
end

function BUTTON:OnFocus()
  surface.PlaySound("fs_ui/ui_menu_focus.wav")
end

function BUTTON:DoClick()
  surface.PlaySound("fs_ui/ui_menu_ok.wav")
end



vgui.Register("FS_Button_SLD", BUTTON, "DButton")