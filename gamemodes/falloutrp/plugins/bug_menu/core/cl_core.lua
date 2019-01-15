if !CLIENT then return end

scale = ScrH()

net.Receive("fs_bug_ui", function()

  local blur = vgui.Create("FS_Blur")
  local mainBugFrame = vgui.Create("FS_Frame")
  mainBugFrame:SetSize(scale*0.3,scale*0.4)
  mainBugFrame:SetPos(ScrW()/2 - mainBugFrame:GetWide()/2 ,ScrH()/2 - mainBugFrame:GetTall()/2 - 100)
  mainBugFrame:MakePopup()
  mainBugFrame:MoveTo(ScrW()/2 - mainBugFrame:GetWide()/2,ScrH()/2 - mainBugFrame:GetTall()/2,0.3)
  local width = mainBugFrame:GetWide()
  local height = mainBugFrame:GetTall()

  local close = mainBugFrame:Add("FS_Close")
  close:SetPos(width-25,5)
  close.DoClick = function()
    mainBugFrame:MoveTo(ScrW()/2 - mainBugFrame:GetWide()/2,ScrH()/2 - mainBugFrame:GetTall()/2 - 100,0.3,0,-1,function() mainBugFrame:Remove() end)
    blur:Remove()
    surface.PlaySound("fs_ui/ui_menu_ok.wav")
  end

  local headerText = mainBugFrame:Add("FS_Label")
  headerText:SetText("MENU ZGLASZANIA BLEDOW")
  headerText:SetSize(width,height*0.4)
  headerText:SetFont("FS_Main")
  headerText:SetContentAlignment(5)
  headerText:SetPos(0,-50)

  local descText = mainBugFrame:Add("FS_Label")
  descText:SetText("OPISZ PROBLEM")
  descText:SetSize(width,height*0.4)
  descText:SetFont("FS_Main")
  descText:SetContentAlignment(5)

  local prText = mainBugFrame:Add("FS_Label")
  prText:SetText("WYBIERZ PRIORYTET")
  prText:SetSize(width,height*1.1)
  prText:SetFont("FS_Main")
  prText:SetContentAlignment(5)

  local prSlider = mainBugFrame:Add("DNumSlider")
  prSlider:SetSize(width*0.8,height*0.1)
  prSlider:SetPos(0,height*0.6)
  prSlider:SetMinMax(1,3)
  prSlider:SetValue(2)
  prSlider:SetDecimals(0)
  prSlider:SetDefaultValue(1)
  prSlider.TextArea:SetTextColor(Color(17,255,31))
  prSlider.TextArea:SetEditable(false)
  prSlider.Slider.Paint = function(self,w ,h)
    draw.RoundedBox(0,0,prSlider:GetTall()/2,w,2,Color(17,255,31))
  end

  local textEntry = mainBugFrame:Add("FS_TextEntry")
  textEntry:SetPos(width*0.1,height*0.27)
  textEntry:SetSize(width*0.8,height*0.2)

  local sendButton = mainBugFrame:Add("FS_Button_S")
  sendButton:SetSize(width*0.5,height*0.1)
  sendButton:SetPos(width*0.5 - sendButton:GetWide()*0.5,height*0.8)
  sendButton:SetText("WYSLIJ")
  sendButton.DoClick = function()
    net.Start("fs_bug_info")
      net.WriteString(tostring(textEntry:GetValue()))
      net.WriteInt(tonumber(prSlider.TextArea:GetValue()), 3)
    net.SendToServer()
    mainBugFrame:MoveTo(ScrW()/2 - mainBugFrame:GetWide()/2,ScrH()/2 - mainBugFrame:GetTall()/2 - 100,0.3,0,-1,function() mainBugFrame:Remove() end)
    blur:Remove()
    surface.PlaySound("fs_ui/ui_menu_ok.wav")
  end

end)
