if !CLIENT then return end
local notifsOnScreen = {}

function FS_Notif(notifyText,notifyLength)
	table.insert(notifsOnScreen,"FS_Notify")
  local notifLength = string.len(notifyText)
	local notifText = tostring(notifyText)
	local yPos = #notifsOnScreen * 60 - 40

  local notifyBackground = vgui.Create("FS_PanelH")
  notifyBackground:SetSize(42+notifLength*9,50)
	notifyBackground:SetPos(-400,yPos)
	notifyBackground:MoveTo( 10, yPos, 0.5, 0, 0.5,function()
		timer.Simple(notifyLength,function()
			notifyBackground:MoveTo(-400, yPos, 0.5, 0, 0.5, function()
				notifyBackground:Remove()
					table.RemoveByValue(notifsOnScreen,"FS_Notify")
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
  notifyText:SetFont("FS_Notify")
  notifyText:SetText(notifText)
  notifyText:SetColor(Color(17,255,31))
end

net.Receive("FS_RunNotify", function()
	local notifText = net.ReadString()
	FS_Notif(notifText, 3)
end)
