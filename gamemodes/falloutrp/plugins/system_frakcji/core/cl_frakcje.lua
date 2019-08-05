FS = FS or {}
FS.Factions = FS.Factions or {}

net.Receive("FS.Factions.SendRankTable", function()
     FS.Factions.RankTable = net.ReadTable()
end)


local scale = ScrH()
function FS.Factions.ShowInviteMenu()
    local info = net.ReadTable()
    local sender, faction = info.sender:GetName(), nut.faction.indices[info.faction].name

    local basePanel = vgui.Create("FS_PanelH")
    basePanel:SetSize( scale * 0.6, scale * 0.2 )
    basePanel:Center()
    basePanel:MakePopup()
    basePanel:SetAlpha( 0 )
    basePanel:AlphaTo( 255, 0.15 )

    local title = basePanel:Add("FS_Label")
    title:SetText("Zaproszenie do frakcji")
    title:SetFont("FS_Main")
    title:SizeToContents()
    title:SetPos( 0, 12 )
    title:CenterHorizontal()

    local header = basePanel:Add("FS_Label")
    header:SetSize( basePanel:GetWide(), basePanel:GetTall() * 0.4 )
    header:SetFont("FS_Main")
    header:SetText(sender.." zaprasza cię do frakcji: "..faction)
    header:SetPos( 0, basePanel:GetTall()/6 )
    header:CenterHorizontal()
    header:SetContentAlignment( 5 )

    local reg = basePanel:Add("FS_Label")
    reg:SetSize( basePanel:GetWide(), basePanel:GetTall() * 0.4 )
    reg:SetFont("FS_Main")
    reg:SetText("Pamiętaj, że nie możesz być w dwóch frakcjach na raz!")
    reg:SetPos( 0, basePanel:GetTall()/3 )
    reg:SetContentAlignment( 5 )

    yes = basePanel:Add("FS_Button_S")
    yes:SetSize( basePanel:GetWide() * 0.3, basePanel:GetTall() * 0.2 )
    yes:SetPos(  basePanel:GetWide() * 0.15, basePanel:GetTall() * 0.7 )
    yes:SetFont("FS_Main")
    yes:SetText("Akceptuj")
    yes.DoClick = function()
        basePanel:AlphaTo( 0, 0.15, 0, function() basePanel:Remove() end )
        net.Start("FS:FactionHandleResponse")
            net.WriteTable({accepted = true, faction = info.faction, sender = info.sender})
        net.SendToServer()
    end

    no = basePanel:Add("FS_Button_S")
    no:SetSize( basePanel:GetWide() * 0.3, basePanel:GetTall() * 0.2 )
    no:SetPos(  basePanel:GetWide() * 0.55, basePanel:GetTall() * 0.7 )
    no:SetFont("FS_Main")
    no:SetText("Odrzuć")
    no.DoClick = function()
        basePanel:AlphaTo( 0, 0.15, 0, function() basePanel:Remove() end )
        net.Start("FS:FactionHandleResponse")
            net.WriteTable({accepted = false, sender = info.sender})
        net.SendToServer()
    end
end
net.Receive("FS:FactionSendInvite", FS.Factions.ShowInviteMenu)

function PLUGIN:DrawCharInfo(ply, char, infoTable)
    local faction = char:getFaction()
    local factionTable = nut.faction.indices[faction]
    if not factionTable then return end
    if (factionTable.rangi) then 
        local rank =  FS.Factions.RankTable[char.id]
        if (rank) then
            infoTable[#infoTable + 1] = {rank, factionTable.color}
        end
    end
end