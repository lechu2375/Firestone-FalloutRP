local PLUGIN = PLUGIN
local pIsVisible = false
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
    boyImg:SetImage("fs_damagesystem/boy.png")

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
end

local function DrawBleedingUI()
    local BleedingAmount = LocalPlayer():GetNWInt("Firestone.Bleeding", 0)
    if BleedingAmount > 0 then
        draw.RoundedBox(2, 1750, 200, 150, 75, Color(50, 50, 50, 200))
        draw.DrawText("Bleeding: "..BleedingAmount, "FS_Side", 1800, 37, Color(255, 255, 255))
    end
end


function PLUGIN:HUDPaint()
    if !pIsVisible then
        draw.SimpleText("F4 - Stan Postaci", "FS_Main", 10, ScrH()/2)
    end
    DrawBleedingUI()
end
