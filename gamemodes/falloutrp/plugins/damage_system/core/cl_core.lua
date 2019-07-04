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
    infoHolder:SetPos(10,30)
    infoHolder.Paint = function(self, w, h)
      draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
    end
    local lw = infoHolder:GetWide()
    local lh = infoHolder:GetTall()
    infoHolder:AddIndicator("Head", lw/2, lh * 0.12, lw/2, 0)
    infoHolder:AddIndicator("Chest", lw/2-5, lh * 0.4, lw/2-5, lh * 0.45)
    infoHolder:AddIndicator("LeftArm", lw * 0.2, lh * 0.35, lw*0.2, lh * 0.45)
    infoHolder:AddIndicator("RightArm", lw * 0.8, lh * 0.35, lw*0.8, lh * 0.45)
    infoHolder:AddIndicator("LeftLeg", lw * 0.325, lh * 0.7, lw*0.3, lh * 0.825)
     infoHolder:AddIndicator("RightLeg", lw * 0.625, lh * 0.7, lw*0.65, lh * 0.825)

    local boyImg = infoHolder:Add("DImage")
    boyImg:SetSize( infoHolder:GetWide() , infoHolder:GetTall() * 0.8)
    boyImg:SetPos(0, infoHolder:GetTall()*0.04)
    boyImg:SetImage("fs_damagesystem/vault_boy.png")

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
    if char then
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
        if (char:getData("FS.Bleeding") or 0) > 0 then
            if IsValid(basePanel) then
                bleedingHolder:SetVisible(true)
            end
        end
        if (char:getData("FS.Bleeding") or 0) <= 0 || !LocalPlayer():Alive() then
            if IsValid(basePanel) then
                bleedingHolder:SetVisible(false)
            end
        end
        // low headhp/hp effects
        local tab = {
            ["$pp_colour_colour"] = (0.3 + ((char:getData("BodyPart.Head") or 100) + LocalPlayer():Health())/400), 
            ["$pp_colour_contrast"] = 0.8,
        }

        if (char:getData("BodyPart.Head")or 100) <= 60 || LocalPlayer():Health() <= 20 then
            hook.Add("RenderScreenspaceEffects", "Firestone.MotionBlur", function()
                DrawMotionBlur((0.3 + ((char:getData("BodyPart.Head") or 100) + LocalPlayer():Health())/2000), 0.8, 0.01 )
                DrawColorModify(tab)  
            end)
        else
            hook.Remove("RenderScreenspaceEffects", "Firestone.MotionBlur")
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
    if pIsVisible then return end
    draw.NoTexture()
     surface.SetDrawColor( 17,255,31 )
     surface.DrawPoly( trujkont_zycia_outline )
     --
    surface.SetDrawColor( 15, 72, 34 )
    surface.DrawPoly( trujkont_zycia )
    draw.SimpleText("F4", "FS_Side_Small", 2, ScrH()/2-10, Color(17,255,31))
end