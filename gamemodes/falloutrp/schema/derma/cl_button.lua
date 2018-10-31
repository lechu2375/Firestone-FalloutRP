AddCSLuaFile()

local BUTTON = {}

function BUTTON:Init()
  self.dark = Color(15, 72, 34,215)
  self.light = Color(17,255,31)
  self:SetFont("FS_Main")
  self:SetContentAlignment(5)
end

function BUTTON:Paint(w, h)
    if self:IsHovered() then
      self:SetColor(Color(0,0,0))
      draw.RoundedBox(0,0,0,w,h,Color(19, 255, 23))
    else
      self:SetColor(Color(19, 255, 23))
      draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
    end
end

function BUTTON:OnCursorEntered()
  surface.PlaySound("fs_ui/ui_menu_focus.wav")
end

function BUTTON:OnFocus()
  surface.PlaySound("fs_ui/ui_menu_focus.wav")
end



vgui.Register("FS_Button", BUTTON, "DButton")
