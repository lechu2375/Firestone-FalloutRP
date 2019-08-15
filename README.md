# Firestone Foundation - FalloutRP
Firestone Foundation to rozpoczęty w paźdzeriniku 2018r. projekt za inicjatywą Lecha mający na celu stworzenie najlepszego w Polsce serwera opartego o serię gier Fallout. Projekt w całości działa na silnku Nutscript, jest on jednak wspomagany autorskimi skryptami oraz innowacyjnymi rozwiązaniami. Projekt jest aktualnie w  fazie Beta podczas której nasz zespół aktywnie pracuje nad wprowadzaniem nowych mechanik oraz  udoskonalaniem starych.
 
### Informacje
- Discord Serwera: https://discord.gg/vgfGyEs
- GitHub Nutscripta: https://github.com/rebel1324/NutScript
- Dokumentacja Nutscripta: https://nutscript.miraheze.org/wiki/Main_Page

### Dokumentacja
```lua 
Biblioteka Interfejsu
vgui.Create("FS_Button") -- Potem uzupełnie
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

_ Biblioteka Funkcjonalności _
PLAYER:Notify(text) -- Wysyła powiadomienie 
FS_Convert(time) -- Zmienia jednostkę czasu (sekundy) na ładną date (string)

_ Biblioteka Systemu Obrażeń _
PLAYER:DamageBodyPart(strBodypPart, intDmg) -- Uszkadza daną część ciała
PLAYER:GetBodyPartHealth(strBodyPart) -- Uzyskuje dane (int) o stanie części ciała
PLAYER:HealBodyPart(strBodyPart, intAmount) -- Leczy daną część ciała o daną wartość
PLAYER:ApplyBleeding(intAmount) -- Ustawia krwawienie
PLAYER:GetBleeding() -- Uzyskuje dane (int) o krwawieniu
PLAYER:IsBleeding() -- Uzyskuje dane (boolean) o krwawieniu
PLAYER:SetArmor(intAmount) -- Ustawia pancerz
PLAYER:GetArmor() -- Uzyskuje dane (int) o pancerzu
PLAYER:AddArmor(intAmount) -- Dodaje pancerz
PLAYER:RemoveArmor(intAmount) -- Usuwa pancerz
PLAYER:BW(intLength) -- Ustawia stan bw
PLAYER:GetBW() -- Uzyskuje dane (boolean) o bw

_Biblioteka Power Armoru_ -- Proszę uzupełnić
PLAYER:SetPowerArmor(bState)
PLAYER:GetPowerArmor()

_Biblioteka systemu XP_
PLAYER:AddXP(intAmount)
PLAYER:SetXP(intAmount)
PLAYER:RemoveXP(intAmount)
PLAYER:GetXP()

_Biblioteka systemu frakcji_
 getPermissions(char) Returnuje tabelę z uprawnieniami
 SetRank(char,rankID,caller) 
```
### Credits
- Djuk (Lead Developer)
- Lechu (Developer, Mapper)
- FrX (Wydalony Developer)
- SaturdaysHeroes (Wydalony Developer)
