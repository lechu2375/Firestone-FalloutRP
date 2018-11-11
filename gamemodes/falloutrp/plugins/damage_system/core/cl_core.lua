local PLUGIN = PLUGIN
local pIsVisible = false
local isBleedingPanelOnScreen = false
scale = ScrH()

local function ToggleDerma()
    basePanel = vgui.Create("FS_Panel")
    basePanel:SetSize(scale*0.3, scale*0.4)
    basePanel:SetPos(-basePanel:GetWide(),scale/2 - basePanel:GetTall()/2)
    basePanel:MoveTo(20,scale/2 - basePanel:GetTall()/2,0.3)

    local width = basePanel:GetWide()
    local height = basePanel:GetTall()

    local infoHolder = basePanel:Add("DPanel")
    infoHolder:SetSize(width-20,height-20)
    infoHolder:SetPos(10,10)
    infoHolder.Paint = function(self, w, h)
      draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
    end

    local boyImg = infoHolder:Add("DImage")
    boyImg:SetSize(320,310)
    boyImg:SetPos(-12,35)
    boyImg:SetImage("fs_damagesystem/vault_boy.png")

    local color = Color(255,255,255)
    local pos = -25

    for _,v in ipairs(DamageSys.BodyParts) do
        pos = pos + 50
        local partIndicator = infoHolder:Add("DPanel")
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

        local hpText = infoHolder:Add("DLabel")
        hpText:SetSize(70,24)
        hpText:SetPos(v.xPos-17,v.textPos)
        hpText:SetFont("FS_Side_Small")
        hpText.Think = function()
          local state = LocalPlayer():GetNWInt("Firestone."..v.name.."Health", 100)
          hpText:SetText(state.."/"..100)
        end
    end

    bleedingHolder = basePanel:Add("DPanel")
    bleedingHolder:SetSize(width-20,height/10)
    bleedingHolder:SetPos(20,height-height/10-10)
    bleedingHolder.Paint = function(self,w,h)
      surface.SetDrawColor(0,0,0,0)
      surface.DrawRect(0,0,w,h)
    end

    local bleedingText = bleedingHolder:Add("DLabel")
    bleedingText:SetSize(width-40,height/10)
    bleedingText:SetContentAlignment(5)
    bleedingText:SetText("KRWAWISZ")
    bleedingText:SetFont("FS_Main")
    bleedingText.Think = function()
      local pulsingText = math.abs(math.sin( CurTime() * 1.5 ) * 255)
      bleedingText:SetColor(Color(17,255,31,pulsingText))
    end

end

function PLUGIN:Think()
  // toggling
    if input.IsKeyDown(KEY_F4) && !pIsVisible then
        ToggleDerma()
        pIsVisible = true
    elseif !input.IsKeyDown(KEY_F4) && pIsVisible && IsValid(basePanel) then
        basePanel:MoveTo(-basePanel:GetWide() - 50,scale/2 - basePanel:GetTall()/2, 0.3, 0, 0.5)
        basePanel:NewAnimation(0, 0.3, 0.5, function()
            basePanel:Remove()
            pIsVisible = false
        end)
    end
    // bleeding
    if LocalPlayer():GetNWInt("Firestone.Bleeding", 0) > 0 then
      if IsValid(basePanel) then
      bleedingHolder:SetVisible(true)
    end
    end
    if LocalPlayer():GetNWInt("Firestone.Bleeding", 0) <= 0 || !LocalPlayer():Alive() then
        if IsValid(basePanel) then
          bleedingHolder:SetVisible(false)
        end
    end
end

function PLUGIN:HUDPaint()
    if !pIsVisible then
        draw.SimpleText("F4 - Stan Postaci", "FS_Main", 10, ScrH()/2)
    end
end

// frx jest walony na dziure bo to zbrodniarz wojenny
// pandziarz to menel i golemiarz *dabs* esketit :dab:
