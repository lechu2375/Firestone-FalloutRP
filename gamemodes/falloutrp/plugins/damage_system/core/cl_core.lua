local PLUGIN = PLUGIN
local pIsVisible = false
local isBleedingPanelOnScreen = false
scale = ScrH()

local function ToggleDerma()
    damagesys_frame = vgui.Create("FS_Panel")
    damagesys_frame:SetSize(scale*0.3, scale*0.4)
    damagesys_frame:SetPos(-damagesys_frame:GetWide(),scale/2 - damagesys_frame:GetTall()/2)
    damagesys_frame:MoveTo(20,scale/2 - damagesys_frame:GetTall()/2,0.3)

    local infoHolder = vgui.Create("DPanel", damagesys_frame)
    infoHolder:SetSize(damagesys_frame:GetWide()-20,damagesys_frame:GetTall()-20)
    infoHolder:SetPos(10,10)
    infoHolder.Paint = function(self, w, h)
      draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
    end

    local boyImg = vgui.Create("DImage", infoHolder)
    boyImg:SetSize(320,310)
    boyImg:SetPos(-12,35)
    boyImg:SetImage("fs_damagesystem/vault_boy.png")

    local color = Color(255,255,255)
    local pos = -25

    for _,v in ipairs(DamageSys.BodyParts) do
        pos = pos + 50
        local partIndicator = vgui.Create("DPanel", infoHolder)
        partIndicator:SetSize(12,12)
        partIndicator:SetPos(v.xPos,v.yPos)
        partIndicator.Paint = function(self, w, h)
            local state = LocalPlayer():GetNWInt("Firestone."..v.name.."Health", 100)
            if state < 25 then
                color = Color(234, 32, 39)
            elseif state < 50 then
                color = Color(230, 126, 34)
            elseif state < 75 then
                color = Color(241, 196, 15)
            else
                color = Color(17,255,31)
            end
            draw.RoundedBox(32, 0, 0, w, h, color)
        end

        local hpText = vgui.Create("DLabel", infoHolder)
        hpText:SetSize(70,24)
        hpText:SetPos(v.xPos-17,v.textPos)
        hpText:SetFont("FS_Side_Small")
        hpText.Think = function()
        local state = LocalPlayer():GetNWInt("Firestone."..v.name.."Health", 100)
            hpText:SetText(state.."/"..100)
        end
    end
end

local function DrawBleedingUI()
    damagesys_BleedingFrame = vgui.Create("FS_PanelH")
    damagesys_BleedingFrame:SetSize(160, 40)
    damagesys_BleedingFrame:SetPos(-damagesys_BleedingFrame:GetWide(), scale/2 + 25)
    damagesys_BleedingFrame:MoveTo(10,scale/2 + 25,0.3)

    local text = vgui.Create("DLabel", damagesys_BleedingFrame)
    text:SetPos(40, 10)
    text:SetSize(100, 20)
    text:SetFont("FS_Side_Small")
    text.Think = function()
        text:SetText("Krwawienie: ".. LocalPlayer():GetNWInt("Firestone.Bleeding", 0))
    end

    local icon = vgui.Create("DImage", damagesys_BleedingFrame)
    icon:SetPos(8, 5)
    icon:SetSize(32, 32)
    icon:SetImage("bleeding.png")
end

function PLUGIN:Think()
    if input.IsKeyDown(KEY_F4) && !pIsVisible then
        ToggleDerma()
        pIsVisible = true
    elseif !input.IsKeyDown(KEY_F4) && pIsVisible && IsValid(damagesys_frame) then
        damagesys_frame:MoveTo(-damagesys_frame:GetWide() - 50,scale/2 - damagesys_frame:GetTall()/2, 0.3, 0, 0.5)
        damagesys_frame:NewAnimation(0, 0.3, 0.5, function()
            damagesys_frame:Remove()
            pIsVisible = false
        end)
    end
    if !pIsVisible && !isBleedingPanelOnScreen && LocalPlayer():GetNWInt("Firestone.Bleeding", 0) > 0 then
        DrawBleedingUI()
        isBleedingPanelOnScreen = true
    end
    if pIsVisible || LocalPlayer():GetNWInt("Firestone.Bleeding", 0) <= 0 || !LocalPlayer():Alive() then
        if IsValid(damagesys_BleedingFrame) then
            damagesys_BleedingFrame:Remove()
            isBleedingPanelOnScreen = false
        end
    end
end

function PLUGIN:HUDPaint()
    if !pIsVisible then
        draw.SimpleText("F4 - Stan Postaci", "FS_Main", 10, ScrH()/2)
    end
end

// frx jest walony na dziure bo to zbrodniarz wojenny