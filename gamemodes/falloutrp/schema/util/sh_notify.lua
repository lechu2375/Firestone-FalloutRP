local PLAYER = FindMetaTable("Player")
local notifsOnScreen = {}

if (SERVER) then

    util.AddNetworkString("FS_Notify")

    function PLAYER:Notify(strText, intLength)
        net.Start("FS_Notify")
            net.WriteInt(intLength, 8)
            net.WriteString(strText)
        net.Send(self)
    end

end

if (CLIENT) then

    net.Receive("FS_Notify", function()
        local time = net.ReadInt( 8 )
        local text = net.ReadString()

        table.insert(notifsOnScreen, "FS_Notify")
        local notifLength = string.len(text)
        if string.len(text) < 15 then
          notifLength = notifLength + 2
        end
	      local notifText = tostring(text)
	      local yPos = #notifsOnScreen * 60 - 40

        local notifyBackground = vgui.Create("FS_PanelH")
        notifyBackground:SetSize(60+notifLength*7.7,50)
	      notifyBackground:SetPos(-400,yPos)
	      notifyBackground:MoveTo( 10, yPos, 0.5, 0, 0.5, function()
		    timer.Simple(time, function()
		        notifyBackground:MoveTo(-400, yPos, 0.5, 0, 0.5, function()
		            notifyBackground:Remove()
		            table.RemoveByValue(notifsOnScreen, "FS_Notify")
			    end)
		    end)
	    end)

        local notifyImage = notifyBackground:Add("DImage")
        notifyImage:SetSize(48, 48)
        notifyImage:SetPos(10, 0)
        notifyImage:SetImage("fs_notifs/vaultboy.png")

        local notifyText = notifyBackground:Add("DLabel")
        notifyText:SetPos(62,15)
        notifyText:SetFont("FS_Notify")
        notifyText:SetText(notifText)
        notifyText:SizeToContents()
        notifyText:SetColor(Color(17,255,31))

    end)

end
