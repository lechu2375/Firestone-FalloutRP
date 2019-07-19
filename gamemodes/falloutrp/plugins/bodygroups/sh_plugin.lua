PLUGIN.name = "Menu bodygroup"
PLUGIN.author = "Lechu2375"

if CLIENT then 
    local basePANEL = {}
    local choosedrn = 2
    local campos
    local bodygroupChoosed
    local function ChangeViewBone() --Żeby przy pierwszym callowaniu sie nie popsuło
    local bt = {
    [1] = "ValveBiped.Bip01_Head1",
    [2] = "ValveBiped.Bip01_Spine"
    } --tabela z nazwami kości
    choosedrn = choosedrn + 1 
        if choosedrn>2 then choosedrn = 1 end --no mozna sie domyslec kurde, ze jak juz 3 jest to na 1 daje pozdro
        print("focus on",bt[choosedrn])
        return bt[choosedrn] -- zajebisty return, dzwoncie pod 0700
    end


    function basePANEL:Init()
        bodygroupChange = {}
        self:SetSize(ScrW()*.51, ScrH()*.5)
        
        local ModelPanel = self:Add( "DModelPanel" ) --Lepiej dodać niż nowe zrobić bo będzie zablurowane
        ModelPanel:SetPos( 10, 10 )
        ModelPanel:SetSize( self:GetWide()*.45, self:GetTall() )
        ModelPanel:SetModel(( LocalPlayer():GetModel()))
            local bone = ModelPanel.Entity:LookupBone( ChangeViewBone()) or 1
            local lookpos = ModelPanel.Entity:GetBonePosition( bone )
                lookpos:Add( Vector( 0, 0, 2 ) )	-- Move up slightly
                ModelPanel:SetLookAt( lookpos )
                if not campos=="head" then
                    ModelPanel:SetCamPos(lookpos-Vector( -40, 0, 0 ) )
                end
                ModelPanel.Entity:SetEyeTarget(ModelPanel:GetCamPos()+Vector(0,0,1)) --na nas sie bedzie patrzal xd
                campos = campos or "head" --już jest na głowie
        --FOCUS ON BONE
                    local buttonChangeFocus = self:Add("FS_Button") --przycisk zmiany widoku na kość
                    local sizex, sizey = ModelPanel:GetSize()
                    buttonChangeFocus:SetPos((sizex+2),10) --ustawiamy od razu obok dpanelu z modelem
                    buttonChangeFocus:SetSize( self:GetWide()*.15, self:GetTall()*.06 ) --skalowanie
                    buttonChangeFocus:SetText("Widok")
                        function buttonChangeFocus:DoClick()
                            local viewpos = ModelPanel.Entity:GetBonePosition( ModelPanel.Entity:LookupBone(ChangeViewBone()) or 1 )
                            ModelPanel:SetLookAt( viewpos )
                            if bone == "ValveBiped.Bip01_Head1" then
                                if campos == "head" then return end --taki if, żeby jeszcze bardziej nie obniżyło kamery
                                ModelPanel:SetCamPos(lookpos-Vector( -40, 0, 0 ) )
                                campos = "head"
                            elseif not campos =="klata" then -- to samo co wyżej, w razie czego ifik.
                                ModelPanel:SetCamPos(lookpos-Vector( 40, 0, 0 ) )
                                campos = "klata"
                            end
                        end
            --FOCUS ON BONE END
            --ZOOM IN BUTTON
                    local buttonZoomIn = self:Add("FS_Button")
                    local posx, posy = buttonChangeFocus:GetPos()
                    buttonZoomIn:SetPos(posx,(posy+buttonChangeFocus:GetTall())+2)
                    buttonZoomIn:SetSize( buttonChangeFocus:GetSize() )
                    buttonZoomIn:SetText("Przybliż")
                    function buttonZoomIn.DoClick()
                        if ModelPanel:GetCamPos():DistToSqr(ModelPanel.Entity:GetPos())<=5000 then return end
                        ModelPanel:SetCamPos(ModelPanel:GetCamPos()-Vector(0,5,0) )
                        print(ModelPanel:GetCamPos():DistToSqr(ModelPanel.Entity:GetPos()))
                        
                    end

            --ZOOM IN BUTTON END 
            --ZOOM OUT BUTTON
                    local buttonZoomOut = self:Add("FS_Button")
                    local posx, posy = buttonZoomIn:GetPos()
                    buttonZoomOut:SetPos(posx,(posy+buttonZoomIn:GetTall())+2)
                    buttonZoomOut:SetSize( buttonZoomIn:GetSize() )
                    buttonZoomOut:SetText("Oddal")
                    function buttonZoomOut.DoClick()
                        if ModelPanel:GetCamPos():DistToSqr(ModelPanel.Entity:GetPos())>=15000 then return end
                        ModelPanel:SetCamPos(ModelPanel:GetCamPos()+Vector(0,5,0) )
                        print(ModelPanel:GetCamPos():DistToSqr(ModelPanel.Entity:GetPos()))
                        
                    end
            --ZOOM OUT BUTTON END
            --RANDOM ANIMATE
                    local buttonRandomAnim = self:Add("FS_Button")
                    local posx, posy = buttonZoomOut:GetPos()
                    buttonRandomAnim:SetPos(posx,(posy+buttonZoomOut:GetTall())+2)
                    buttonRandomAnim:SetSize( buttonZoomOut:GetSize() )
                    buttonRandomAnim:SetText("Pozycja")
                    function buttonRandomAnim.DoClick() 
                        local _,k = table.Random(ModelPanel.Entity:GetSequenceList())
                        ModelPanel.Entity:ResetSequence(k)
                    end             
            
            --FOCUS ON BONE
                    local bodygroups = LocalPlayer():GetBodyGroups()
                    local bodygroupLabel = self:Add("DLabel") --napisik dodajemy
                    bodygroupLabel:SetText("Bodygroups")
                    bodygroupLabel:SetFont("FS_Side")
                    function bodygroupLabel:Paint(w, h)
                        self:SetColor(Color(19, 255, 23))
                        draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
                    end                   
                    local posx = buttonChangeFocus:GetPos()
                    bodygroupLabel:SetPos(posx+buttonChangeFocus:GetWide(),10)
                    bodygroupLabel:SetSize(((self:GetWide()*.4)),buttonChangeFocus:GetTall()) --kod napisu end
                    local bodygroupFrame = self:Add("DScrollPanel") --dpanel starczy
            --GENEROWANIE PRZYCISKÓW DLA DOSTĘPNYCH BODYGROUPOW
                    local sizex1,sizey1 = bodygroupLabel:GetPos() 
                    bodygroupFrame:SetPos(sizex1+2,sizey1+bodygroupLabel:GetTall())
                    bodygroupFrame:SetSize(bodygroupLabel:GetWide(),200)
                    bodygroupFrame:SetBackgroundColor( COLOR_TEAM_RED )
                    for i,v in ipairs(bodygroups) do --dockujemy przyciski
                        s = bodygroupFrame:Add( "FS_Button_S" )
                        s:SetText(v.name)
                        s:Dock(TOP)
                        s:SetSize(s:GetWide(), s:GetTall()+15)
                        bodygroupFrame.docked = (bodygroupFrame.docked or 0) + 1 --ilość zdockowanych 
                        bodygroupFrame.dockedH = (s:GetTall()+2)
                        if (i==1)  then continue end
                        s:DockMargin( 0, 2, 0, 0 )--margines 2 jedostki, żeby jakoś to wyglądało
                        function s:DoClick()
                            bodygroupChange = bodygroups[i]
                            bodygroupChoosed:SetText("Wybrany bodygroup: "..(bodygroupChange.name or "Brak"))
                        end
                         
                        
                    end		
                    bodygroupFrame:SetSize(bodygroupLabel:GetWide()-5,self:GetTall()*0.4)--dostosowywujemy Panel do tego
                --END PRZYCISKI/NAPIS WYBRANY BODYGROUP
                    bodygroupChoosed = ModelPanel:Add("DLabel") --napisik dodajemy z wybranym bodygroupem
                    bodygroupChoosed:SetText("Wybrany bodygroup: "..(bodygroupChange.name or "Brak"))
                    bodygroupChoosed:SetFont("FS_Side")
                    function bodygroupChoosed:Paint(w, h)
                        self:SetColor(Color(19, 255, 23))
                        draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
                    end	
                    bodygroupChoosed:SetPos(bodygroupChoosed:GetPos())
                    bodygroupChoosed:SetSize(self:GetWide()*.7,buttonChangeFocus:GetTall())
                --NAPIS END
                --ZMIANA BODYGROUPA NA NIŻSZY
                    local BodygroupMinus = ModelPanel:Add("FS_Button")
                    local posx, posy = ModelPanel:GetPos()
                    BodygroupMinus:SetPos(posx,ModelPanel:GetTall()/2)
                    BodygroupMinus:SetSize(30,20)
                    BodygroupMinus:SetText("-")
                    function BodygroupMinus.DoClick() 
                        if not bodygroupChange.id then return end
                        if ModelPanel.Entity:GetBodygroup(bodygroupChange.id) == 0 then return end
                        ModelPanel.Entity:SetBodygroup(bodygroupChange.id,(ModelPanel.Entity:GetBodygroup(bodygroupChange.id)-1))
                    end 
                --Zmiana BODYGROUPA NA NIŻSZY END
                --Zmiana BODYGROUPA NA WYŻSZY
                    local BodygroupPlus = ModelPanel:Add("FS_Button")
                    local posx, posy = ModelPanel:GetPos()
                    BodygroupPlus:SetPos(ModelPanel:GetWide()/1.1,ModelPanel:GetTall()/2)
                    BodygroupPlus:SetSize(30,20)
                    BodygroupPlus:SetText("+")
                    function BodygroupPlus.DoClick() 
                        if not bodygroupChange.id then return end
                        ModelPanel.Entity:SetBodygroup(bodygroupChange.id,(ModelPanel.Entity:GetBodygroup(bodygroupChange.id)+1))
                    end 

                        

    end
    vgui.Register("FS_Bodygroup", basePANEL,"FS_PanelH")


    function PLUGIN:CreateMenuButtons(tabs)
        tabs["bodygroup"] = function(panel)
            panel:Add("FS_Bodygroup")
        end
    end
end