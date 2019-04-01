local PANEL = FindMetaTable("Panel")

function PANEL:AddIndicator( part, pos1, pos2, pos3, pos4)
    local char = LocalPlayer():getChar()
    local damageIndicator = self:Add("DPanel")
    damageIndicator:SetSize(ScrH() * 0.01, ScrH() * 0.01)
    damageIndicator:SetPos(pos1, pos2)
    damageIndicator:SetZPos(9999)
    damageIndicator.Paint = function(self, w, h)
        local state = char:getData("BodyPart."..part)
        if state < 25 then
            color = Color(234, 32, 39)
         elseif state < 50 then
             color = Color(230, 126, 34)
         elseif state < 75 then
            color = Color(241, 196, 15)
        else
            color = Color(17,255,31)
        end
    draw.RoundedBox(100, 0, 0, w, h, color)
    end

    local hpText = self:Add("DLabel")
    hpText:SetSize(70,24)
    hpText:SetPos(pos3 - hpText:GetWide()/5, pos4)
    hpText:SetZPos(9999)
    hpText:SetFont("FS_Side_Small")
    hpText.Think = function()
        local state = char:getData("BodyPart."..part)
        hpText:SetText(state.."/"..100)
    end
end