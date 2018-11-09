if !CLIENT then return end
scale = ScrH()
net.Receive("FS_RunAdvert", function()

  local text = net.ReadString()
  local length = string.len(text)

  local advertPanel = vgui.Create("FS_PanelH")
  advertPanel:SetSize(scale*0.5,35)
  advertPanel:SetPos(ScrW()/2 - advertPanel:GetWide()/2, -50)
  advertPanel:MoveTo(ScrW()/2 - advertPanel:GetWide()/2, 10,0.5,0,-1,function()
    timer.Simple(30, function()
      advertPanel:MoveTo(ScrW()/2-advertPanel:GetWide()/2,-50,0.5,0,-1,function() advertPanel:Remove() end)
    end)
  end)

  local width = advertPanel:GetWide()
  local height = advertPanel:GetTall()

  local advertText = advertPanel:Add("FS_Label")
  advertText:SetText(text)
  advertText:SetSize(width*2,height)
  advertText:SetFont("FS_Main_Small")

  local textPos = -length*10
  advertText.Think = function()
    textPos = textPos+0.4
    advertText:SetPos(textPos,height/2-advertText:GetTall()/2)
    if textPos > width + length then
      textPos = -length*10
    end
  end

end)
