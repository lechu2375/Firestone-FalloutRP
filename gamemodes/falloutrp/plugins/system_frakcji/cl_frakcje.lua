
TABELA_RANG_cl = {}

net.Receive("tabela_rang", function()
     TABELA_RANG_cl = net.ReadTable()
end)



local scale = ScrH()
local function ShowMenu(recive)
    if basePanel then return true end

    local invitor = recive["inviterName"]
    local faction = recive["faction"]


    local basePanel = vgui.Create("FS_PanelH")
    basePanel:SetSize( scale * 0.6, scale * 0.2 )
    basePanel:Center()
    basePanel:MakePopup()
    basePanel:SetAlpha( 0 )
    basePanel:AlphaTo( 255, 0.15 )
    
     local xButton = basePanel:Add("DButton")
    xButton:SetText("X")
    xButton:SetSize( 20, 20 )
    xButton:SetPos( basePanel:GetWide() - 25, 0 )
    xButton:SetColor( Color( 17,255,31 ) )
    xButton.Paint = nil
    xButton.DoClick = function( self, w, h )
        basePanel:AlphaTo( 0, 0.15, 0, function() basePanel:Remove() end )
    end

    local title = basePanel:Add("FS_Label")
    title:SetText("Zaproszenie do frakcji")
    title:SetFont("FS_Main")
    title:SizeToContents()
    title:SetPos( 0, 12 )
    title:CenterHorizontal()

    local header = basePanel:Add("FS_Label")
    header:SetSize( basePanel:GetWide(), basePanel:GetTall() * 0.4 )
    header:SetFont("FS_Main")
    header:SetText(invitor.." zaprasza cię do frakcji: "..faction)
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
        net.Start("FS:FactionInviteA")
        net.SendToServer()
    end

    no = basePanel:Add("FS_Button_S")
    no:SetSize( basePanel:GetWide() * 0.3, basePanel:GetTall() * 0.2 )
    no:SetPos(  basePanel:GetWide() * 0.55, basePanel:GetTall() * 0.7 )
    no:SetFont("FS_Main")
    no:SetText("Odrzuć")
    no.DoClick = function()
        basePanel:AlphaTo( 0, 0.15, 0, function() basePanel:Remove() end )
        net.Start("FS:FactionInviteD")
        net.SendToServer()
    end
end

net.Receive("FS:FactionInvite", function (infoTable)
    local infoTable = net.ReadTable()
    ShowMenu(infoTable)
end)



function PLUGIN:DrawCharInfo(client, character, info)
    local frakcja = client:getChar():getFaction()
    local kolor_frakcji = nut.faction.indices[frakcja].color
    if (nut.faction.indices[frakcja].name ~= "Mieszkaniec Pustkowi") then 
        local rank =  TABELA_RANG_cl[tonumber(character:getID())]
        if rank then
            info[#info + 1] = {rank, kolor_frakcji}
        end
    end
end


