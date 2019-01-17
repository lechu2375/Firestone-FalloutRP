local PLUGIN = PLUGIN
local pIsVisible = false
local scale = ScrH()

function PLUGIN:CharacterLoaded()
    char = LocalPlayer():getChar()
end
    
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
    boyImg:SetSize(290,300)
    boyImg:SetPos(0,35)
    boyImg:SetImage("fs_damagesystem/vault_boy.png")

    local color = Color(255,255,255)
    local pos = -25

    for _,v in ipairs(DamageSys.BodyParts) do
        pos = pos + 50
        local partIndicator = infoHolder:Add("DPanel")
        partIndicator:SetSize(12,12)
        partIndicator:SetPos(v.xPos,v.yPos)
        partIndicator.Paint = function(self, w, h)
            local state = char:getData("Firestone."..v.name.."Health")
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
        hpText:SetPos(v.xTextPos,v.yTextPos)
        hpText:SetFont("FS_Side_Small")
        hpText.Think = function()
          local state = char:getData("Firestone."..v.name.."Health")
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
    if !char then return end
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

local trujkont_zycia = {
	{ x = 0, y = ScrH()/2 - 25 },
	{ x = 25, y = ScrH()/2 },
	{ x = 0, y = ScrH()/2 + 25 }
}

local trujkont_zycia_outline = {
	{ x = 0, y = ScrH()/2 - 26 },
	{ x = 26, y = ScrH()/2 },
	{ x = 0, y = ScrH()/2 + 26 }
}

function PLUGIN:HUDPaint()
    if !pIsVisible then
        draw.NoTexture()
        surface.SetDrawColor( 17,255,31 )
        surface.DrawPoly( trujkont_zycia_outline )
        --
        surface.SetDrawColor( 15, 72, 34 )
        surface.DrawPoly( trujkont_zycia )
        draw.SimpleText("F4", "FS_Side_Small", 2, ScrH()/2-10, Color(17,255,31))
    end
end
