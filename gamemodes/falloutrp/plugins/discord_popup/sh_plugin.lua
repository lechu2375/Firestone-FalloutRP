local PLUGIN = PLUGIN
PLUGIN.name = "Discord"
PLUGIN.author = "SaturdaysHeroes"

function PLUGIN:InitPostEntity()
    local f = vgui.Create("DFrame")
    f:SetSize(ScrW()/2, ScrH()/2)
    f:Center()
    f:MakePopup()
    f:SetVisible(false)

    local h = vgui.Create("DHTML", f)
    h:Dock(FILL)
    h:OpenURL("https://discord.gg/6hbc25E")
end