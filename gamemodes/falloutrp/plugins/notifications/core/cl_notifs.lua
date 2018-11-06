if !CLIENT then return end
scale = ScrH()

surface.CreateFont( "notifFont", {
	font = "Trebuchet24",
	size = 20,
	antialias = true,
} )

function FS_Notif(notifyText,notifyLength)
  local notifLength = string.len(notifyText)
	local notifText = tostring(notifyText)

  local notifyBackground = vgui.Create("FS_PanelH")
  notifyBackground:SetSize(42+notifLength*9,50)
	notifyBackground:SetPos(-400,10)
	notifyBackground:MoveTo( 10, 10, 0.5, 0, 0.5,function()
		timer.Simple(notifyLength,function()
			notifyBackground:MoveTo(-400, 10, 0.5, 0, 0.5, function()
				notifyBackground:Remove()
			end)
		end)
	end)

  local notifyImage = notifyBackground:Add("DImage")
  notifyImage:SetSize(48,48)
  notifyImage:SetPos(10,0)
  notifyImage:SetImage("fs_notifs/vaultboy.png")

  local notifyText = notifyBackground:Add("DLabel")
  notifyText:SetSize(notifyBackground:GetWide()-62,notifyBackground:GetTall())
  notifyText:SetPos(62,0)
  notifyText:SetFont("notifFont")
  notifyText:SetText(notifText)
  notifyText:SetColor(Color(17,255,31))
end

net.Receive("runNotify", function()
	local notifText = net.ReadString()
	FS_Notif(notifText, 3)
end)
