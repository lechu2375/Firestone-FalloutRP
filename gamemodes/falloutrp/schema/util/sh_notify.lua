local PLAYER = FindMetaTable("Player")
local notifsOnScreen = {}

if (SERVER) then
    util.AddNetworkString("FS_Notify")
    --
    function PLAYER:Notify(strText)
        net.Start("FS_Notify") 
            net.WriteString(strText)
        net.Send(self)
    end
end

if (CLIENT) then
    net.Receive("FS_Notify", function()
        local noticeString = net.ReadString()
        local notice = vgui.Create("FS_PanelH")
        --
        local noticeText = notice:Add("DLabel")
        noticeText:SetPos(45,15)
        noticeText:SetFont("FS_Notify")
        noticeText:SetText(noticeString)
        noticeText:SizeToContents()
        noticeText:SetColor(Color(17,255,31))
        --
        notice:SetSize(60+noticeText:GetWide(), 50)
	    notice:SetPos(-notice:GetWide()*1.5, 30)
        --
        table.insert(notifsOnScreen, notice)
        --
        local noticeImage = notice:Add("DImage")
        noticeImage:SetSize(8, 30)
        noticeImage:SetPos(20, 10)
        noticeImage:SetImage("fs_notifs/info.png")
        --
        local function showNotice()
            for k, v in ipairs(notifsOnScreen) do
                v:MoveTo(10, 30, 0.5, 0, 0.3, function()
                    surface.PlaySound("buttons/button14.wav")
                    timer.Simple(4, function()
                        if IsValid(v) then
                            v:MoveTo(-v:GetWide()*1.5, 30, 0.5, 0, 0.5, function()
                                v:Remove()
                                table.remove(notifsOnScreen, 1)
                                showNotice()
                            end)
                        end
                    end)
                end)
                break
            end
        end
        --
        showNotice()
    end)
end
