AddCSLuaFile()

local PANEL = {}

function PANEL:Init()
  self.dark = Color(15, 72, 34,215)
  self.light = Color(17,255,31)
  self:MakePopup()
end

function PANEL:SetTitle(strTitle)
  self.title = string.upper(strTitle)
  surface.SetFont("FS_Main")
  self.textsize = surface.GetTextSize(self.title)
end

function PANEL:Paint(w, h)
  draw.RoundedBox(0, 0, 0, w, h, self.dark)
end

vgui.Register("FS_Panel", PANEL, "DFrame")