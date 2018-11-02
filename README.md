# Firestone Foundation
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
vgui.Create("FS_Panel")
vgui.Create("FS_Button")

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
```

### Credits
- SaturdaysHeroes (Lead Developer)
- Djuk (Developer)
- FrX (Developer)
- Lechu (Mapper)
