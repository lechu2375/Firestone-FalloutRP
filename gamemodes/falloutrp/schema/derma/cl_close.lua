AddCSLuaFile()

local BUTTON = {}

function BUTTON:Init()
  self.dark = Color(15, 72, 34,215)
  self.light = Color(17,255,31)
  self:SetColor(self.light)
  self:SetText("X")
  self:SetSize(20,20)
end

function BUTTON:Paint(w, h)
  draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
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



vgui.Register("FS_Close", BUTTON, "DButton")
