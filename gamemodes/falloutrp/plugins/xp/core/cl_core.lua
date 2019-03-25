if !CLIENT then return end

local PLUGIN = PLUGIN

net.Receive("FS:ShowXP", function()
    local oldXP, newXP = net.ReadInt(16), net.ReadInt(16)
    local plyXP = LocalPlayer():GetNeededXP()

    local oldXpPercent = math.Round( oldXP/plyXP * 300 )
    local newXpPercent = math.Round( newXP/plyXP * 300 ) 

    local barLerp = oldXpPercent

    local basePanel = vgui.Create("DPanel")
    basePanel:SetSize( 300, 40 )
    basePanel:SetPos( ScrW()/40, ScrH() * 0.75 - basePanel:GetTall()/2 )
    basePanel:SetAlpha( 0 )
    basePanel:AlphaTo( 255, 1, 0, function() basePanel:AlphaTo( 0, 1, 5, function() basePanel:Remove() end) end)
    basePanel.Paint = function( self, w, h )
        surface.SetDrawColor( 17,255,31 )
        surface.DrawRect( 30, 8, w, 3 )
        surface.DrawRect( 30, 0, 3, 8 )
        surface.DrawRect( self:GetWide() - 3, 0, 3, 8 )
        draw.SimpleText("XP", "FS_Main_Bold", 0, 0, Color(17,255,31))
    end

    local xpBar = basePanel:Add("DPanel")
    xpBar:SetSize( oldXpPercent , 8 )
    xpBar:SetPos( 30, 0 )
    local TimerDlaZjebow = CurTime()+1
    xpBar.Think = function( self )
        if !( CurTime() > TimerDlaZjebow ) then return end
        barLerp = Lerp( FrameTime(), barLerp, newXpPercent )
        self:SetSize( barLerp, 8 )
    end
    xpBar.Paint = function( self, w, h )
        surface.DrawRect(0, 0, w, h)
    end

    local xpText = basePanel:Add("DLabel")
    xpText:SetFont("FS_Main")
    xpText:SetColor( Color( 17, 255, 31 ) )
    xpText:SetText("+"..newXP-oldXP)
    xpText:SizeToContents()
    xpText:SetPos( basePanel:GetWide() - xpText:GetWide(), 10 )


end)
