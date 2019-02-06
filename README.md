# Firestone Foundation - FalloutRP
Firestone Foundation to rozpoczęty w paźdzeriniku 2018r. projekt za inicjatywą Lecha mający na celu stworzenie najlepszego w Polsce serwera opartego o serię gier Fallout. Projekt w całości działa na silnku Nutscript, jest on jednak wspomagany autorskimi skryptami oraz innowacyjnymi rozwiązaniami. Projekt jest aktualnie w fazie Alpha podczas której nasz zespół aktywnie pracuje nad wprowadzaniem nowych mechanik oraz udoskonalaniem starych.

### Informacje
- GitHub: https://github.com/rebel1324/NutScript
- FalloutRP (dla inspiracji): https://github.com/NutScript/falloutrp
- Discord: https://discord.gg/vgfGyEs
- Dokumentacja: https://nutscript.miraheze.org/wiki/Main_Page
- Stara Dokumentacja: https://github.com/Chessnut/NutScript/wiki
- Przykłady wykorzystania funkcji NS: https://github.com/rebel1324/CityRP

### Dokumentacja 
```lua
-- Fallout UI Library 
vgui.Create("FS_Button")
vgui.Create("FS_Button_S")
vgui.Create("FS_Button_ESC")
vgui.Create("FS_Close")
vgui.Create("FS_Label")
vgui.Create("FS_Frame")
vgui.Create("FS_PanelH")
vgui.Create("FS_PanelV")
vgui.Create("FS_Panel")
vgui.Create("FS_TextEntry")
vgui.Create("FS_Blur")

-- Utility Library 
PLAYER:Notify(strText, intLength)
firestone_util_timeconver(time) 

-- Damage System 
PLAYER:DamageBodyPart(strBodypPart, intDmg)
PLAYER:GetBodyPartHealth(strBodyPart)
PLAYER:HealBodyPart(strBodyPart, intAmount)
PLAYER:ApplyBleeding(intAmount)
PLAYER:GetBleeding()
PLAYER:IsBleeding()
PLAYER:SetArmor(intAmount)
PLAYER:GetArmor()
PLAYER:AddArmor(intAmount)
PLAYER:RemoveArmor(intAmount)

-- Power Armor
PLAYER:SetPowerArmor(bState)
PLAYER:GetPowerArmor()

-- Karma System
PLAYER:AddKarma(intAmount)
PLAYER:RemoveKarma(intAmount)
PLAYER:GetKarma()

-- XP System 
PLAYER:AddXP(intAmount)
PLAYER:SetXP(intAmount)
PLAYER:RemoveXP(intAmount)
PLAYER:GetXP()
PLAYER:AddLevel(intAmount)
PLAYER:SetLevel(intAmount)
PLAYER:RemoveXP(intAmount)
PLAYER:GetLevel()
```

### Credits
- SaturdaysHeroes (Lead Developer)
- Djuk (Developer)
- FrX (Developer)
- Lechu (Mapper)
