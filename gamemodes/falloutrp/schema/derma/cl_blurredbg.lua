AddCSLuaFile()

local PANEL = {}

local blur = Material("pp/blurscreen")

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
  draw.RoundedBox(0,0,0,w,h,Color(0,0,0,50))

end

vgui.Register("FS_Blur", PANEL, "DPanel")
