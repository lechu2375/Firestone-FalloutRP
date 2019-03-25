    
    local itemsToSpawn = {
        [1] = {
            name = "Karabin Wyborowy",
            class = "weapon_marksmanrifle",
            model = "models/weapons/w_rif_ak47.mdl",
            type = "weapon" // weapon, ammo, entity, item(do ns'a)
        },
        [2] = {
            name = "Ammo [ ENT ]",
            class = "45autoammo",
            model = "models/items/ammocrate_ar2.mdl",
            type = "entity"
        },
         [3] = {
            name = "Ammo [ GIVE ]",
            class = "all",
            model = "models/items/ammocrate_ar2.mdl",
            type = "ammo"
        },
        [4] = {
            name = "Armor",
            class = "nw",
            model = "models/props_c17/doll01.mdl",
            type = "item"
        },
    }

if SERVER then
    util.AddNetworkString("FS:OpenSpM")
    util.AddNetworkString("FS:SpM:Receive")

    net.Receive("FS:SpM:Receive", function( len, ply )
    //if !ply:IsSuperAdmin() then return end
        local item, type, name = net.ReadString(), net.ReadString(), net.ReadString()
        if ( type == "weapon" ) then
            ply:Give( item )
        elseif ( type == "ammo" ) then
            if ( item == "all" ) then
                local ammoType = ply:GetActiveWeapon():GetPrimaryAmmoType()
                if !ammoType or ammoType == nil then ply:Notify("Weź do ręki broń!") end
                ply:GiveAmmo( 9999, ammoType )
            end
        elseif ( type == "entity" ) then
            local ent = ents.Create( item )
            if !IsValid(ent) then print("kurwa") end
            ent:SetModel( item )
            ent:SetPos( ply:GetPos() + Vector( 0, 0, 50 ) )
            ent:Spawn()
        elseif ( type == "item" ) then
            ply:Notify("Coming Soon")
            return
        end
        ply:Notify("Zrespiłeś "..name)
    end)

    hook.Add( "PlayerButtonDown", "galicjanka woda mineralna", function( ply, key )
        //if !ply:IsSuperAdmin() then return end
        if ( key == KEY_K ) then
            net.Start("FS:OpenSpM")
            net.Send( ply )
        end
    end)

end

if CLIENT then

    surface.CreateFont( "SpM_Large", {
        font = "Roboto Condensed",
        size = ScreenScale( 11 ),
        antialias = true,
        extended = true,
    } )

    surface.CreateFont( "SpM_Small", {
        font = "Roboto Condensed",
        size = ScreenScale( 7 ),
        antialias = true,
        extended = true,
    } )

    net.Receive("FS:OpenSpM", function()
        if IsValid( basePanel ) then return end
        local basePanel = vgui.Create("FS_PanelH")
        basePanel:SetAlpha( 0 )
        basePanel:SetSize( ScrW()/2, ScrH()/3 )
        basePanel:Center()
        basePanel:MakePopup()
        basePanel:AlphaTo(255, 0.2)

        local xButton = basePanel:Add("FS_Close")
        xButton:SetPos( basePanel:GetWide()- 25, 5 )
        xButton.DoClick = function()
            basePanel:AlphaTo(0, 0.2, 0, function() basePanel:Remove() end)
            surface.PlaySound("fs_ui/ui_menu_ok.wav")
        end

        local headerText = basePanel:Add("FS_Label")
        headerText:SetFont("SpM_Large")
        headerText:SetText("[ SPAWN MENU ]")
        headerText:SizeToContents()
        headerText:SetPos( basePanel:GetWide()/2 - headerText:GetWide()/2, 10 )

        local posX = -basePanel:GetWide() * 0.2
        local posY = basePanel:GetTall() * 0.15
        for k,v in ipairs( itemsToSpawn ) do
            if ( k == 5 ) then
                posX = -basePanel:GetWide() *0.2
                posY = basePanel:GetTall() * 0.55
            end
            posX = posX + basePanel:GetWide() * 0.24
            local item = basePanel:Add("DPanel")
            item:SetSize( basePanel:GetWide() * 0.2, basePanel:GetTall() * 0.33 )
            item:SetPos( posX, posY )
            item.Paint = function( self, w, h )
            surface.SetDrawColor( 17,255,31 )
            surface.DrawOutlinedRect( 0, 0, w, h )
            end

            local itemName = item:Add("FS_Label")
            itemName:SetFont("SpM_Small")
            itemName:SetText( v.name )
            itemName:SizeToContents()
            itemName:SetPos( item:GetWide()/2 - itemName:GetWide()/2, item:GetTall() - itemName:GetTall()*1.2 )

            local itemModel = item:Add("SpawnIcon")
		    itemModel:SetPos( item:GetWide()/2 - itemModel:GetWide()/2, itemModel:GetTall() * 0.25 )
            itemModel:SetModel( v.model )
            itemModel.PaintOver = function() return end
            itemModel:SetToolTip( false )
            itemModel.OnCursorEntered = function()
                surface.PlaySound("fs_ui/ui_menu_focus.wav")
            end
            itemModel.DoClick = function()
                net.Start("FS:SpM:Receive")
                    net.WriteString( v.class )
                    net.WriteString( v.type )
                    net.WriteString( v.name )
                net.SendToServer()
                basePanel:AlphaTo(0, 0.2, 0, function() basePanel:Remove() end)
                surface.PlaySound("fs_ui/ui_menu_ok.wav")
            end
        end
    end)
end