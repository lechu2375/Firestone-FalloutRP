AddCSLuaFile()

local PANEL = {}

local blur = Material("pp/blurscreen")

function PANEL:Init()
  self.dark = Color(15, 72, 34,215)
  self.light = Color(17,255,31)
  self:SetTitle("")
end

function PANEL:SetTitle(strTitle)
  self.title = string.upper(strTitle)
  surface.SetFont("FS_Side")
  self.textsize = surface.GetTextSize(self.title)
end

function PANEL:Paint(w, h)
  local x, y = self:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)
    for i = 1, 1.1 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
  draw.RoundedBox(0, 0, 0, w, h, self.dark)
  surface.SetDrawColor(self.light)
  // Left side
  surface.DrawRect(0,0,4,self:GetTall())
  surface.DrawRect(4,0,self:GetWide()*0.01,4)
  surface.DrawRect(4,self:GetTall()-4,self:GetWide()*0.01,4)
  // Right Side
  surface.DrawRect(self:GetWide()-4,0,4,self:GetTall())
  surface.DrawRect(self:GetWide()-self:GetWide()*0.01-2,0,self:GetWide()*0.01,4)
  surface.DrawRect(self:GetWide()-self:GetWide()*0.01-2,self:GetTall()-4,self:GetWide()*0.01,4)
end

vgui.Register("FS_PanelH", PANEL, "DPanel")
