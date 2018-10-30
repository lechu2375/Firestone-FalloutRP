local PLUGIN = PLUGIN
local pIsVisible = false

--[[ zmienić na panel z biblioteki ]]--
local function ToggleDerma()
    damagesys_frame = vgui.Create("DFrame")
    local frame = damagesys_frame
    frame:SetSize(ScrW() * 0.156, ScrH() * 0.37)
    frame:SetPos(-frame:GetWide(), ScrH()/2 -  frame:GetTall()/2)
    frame:ShowCloseButton(false)
    frame:SetDraggable(false)
    frame:SetTitle("")
    frame:MoveTo(0, ScrH()/2 - frame:GetTall()/2, 0.2, 0, 0.5)
    frame:SetVisible(true)
    frame.Paint = function(s, w, h)
        draw.RoundedBox(1, 0, 0, w, h, Color(50, 50, 50, 200))
    end

    local scroll = vgui.Create("DScrollPanel", frame)
    scroll:SetPos(20, 40)
    scroll:SetSize(frame:GetWide() - 40, frame:GetTall() - 40)

    for i, v in ipairs(DamageSys.BodyParts) do
        local health = LocalPlayer():GetNWInt("Firestone."..v.."Health", 100)
        local panel = vgui.Create("DPanel", scroll)
        panel:SetPos(0, 0)
        panel:Dock(TOP)
        panel:DockMargin(0, 0, 0, 23)
        panel:SetSize(scroll:GetWide(), 30)
        panel:SetPaintBackground(false)
        
        local bodypart = vgui.Create("DLabel", panel)
        bodypart:SetPos(0, 0)
        bodypart:SetFont("FS_Side")
        bodypart:SetColor(Color(255, 255, 255))
        bodypart:SetText(v)
        bodypart:SizeToContents()
        local bar = vgui.Create("DProgress", panel)
        bar:SetPos(110, 5)
        bar:SetSize(health, 20)
        bar.Paint = function(s, w, h)
            draw.RoundedBox(1, 0, 0, w, h, Color(17,255,31))
        end
    end
end

function PLUGIN:Think()
    if input.IsKeyDown(KEY_F2) && !pIsVisible then -- po wciśnięciu F2 wysuwa dermę, jeśli już nie jest wysunięta
        ToggleDerma()
        pIsVisible = true
    elseif !input.IsKeyDown(KEY_F2) && pIsVisible && IsValid(damagesys_frame) then -- kiedy gracz puszcza F2 chowa dermę z animacją
        damagesys_frame:MoveTo(-damagesys_frame:GetWide() - 50, ScrH()/2 - damagesys_frame:GetTall()/2, 0.2, 0, 0.5)
        damagesys_frame:NewAnimation(0, 0.2, 0.5, function()
            damagesys_frame:Remove()
            pIsVisible = false
        end)
    end
end

function PLUGIN:HUDPaint()
    if !pIsVisible then
        draw.SimpleText("F2 - stan części ciała", "FS_Side", ScrW() * 0.005, ScrH()/2)
    end
end