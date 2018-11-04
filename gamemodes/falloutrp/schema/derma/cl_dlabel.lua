AddCSLuaFile()

local LABEL = {}

function LABEL:Init()
  self.light = Color(17,255,31)
  self:SetColor(self.light)
end

function LABEL:Paint(w, h)
    if self:IsHovered() then
      self:SetColor(Color(0,0,0))
      draw.RoundedBox(0,0,0,w,h,Color(19, 255, 23))
    else
      self:SetColor(Color(19, 255, 23))
      draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
    end
end



vgui.Register("FS_Label", LABEL, "DLabel")
