# Firestone Foundation - FalloutRP
Firestone Foundation to rozpoczęty w paźdzeriniku 2018r. projekt za inicjatywą Lecha mający na celu stworzenie najlepszego w Polsce serwera opartego o serię gier Fallout. Projekt w całości działa na silnku Nutscript, jest on jednak wspomagany autorskimi skryptami oraz innowacyjnymi rozwiązaniami. Projekt jest aktualnie w  fazie Beta podczas której nasz zespół aktywnie pracuje nad wprowadzaniem nowych mechanik oraz  udoskonalaniem starych.
 
### Informacje
- Discord Serwera: https://discord.gg/vgfGyEs
- GitHub Nutscripta: https://github.com/rebel1324/NutScript
- Dokumentacja Nutscripta: https://nutscript.miraheze.org/wiki/Main_Page

### Dokumentacja
```lua 

_Biblioteka Interfejsu_
vgui.Create("FS_Button") -- Zwyczajny przycisk, bez obramowania
vgui.Create("FS_Button_S") -- Zwyczajny przycisk, z obramowaniem (2px)
vgui.Create("FS_Button_SL") -- Zwyczajny przycisk, z obramowaniem (1px)
vgui.Create("FS_Button_SLD") -- Przycisk z obramowaniem, który po aktywowaniu zachowuje kolor
vgui.Create("FS_Label") -- Standardowy tekst w stylu Fallout'a
vgui.Create("FS_PanelH") -- Standardowy panel w stylu Fallout'a z paskami na górze i dole
vgui.Create("FS_PanelV") -- Standardowy panel w stylu Fallout'a z paskami po bokach
vgui.Create("FS_TextEntry") -- Standardowy Text Entry w stylu Fallout'a
vgui.Create("FS_Blur") -- Blur w tle

_Metatable do użycia_
PANEL:ShowXButton(bool) -- Ustawia widoczność przycisku do zamknięcia

_Biblioteka Funkcjonalności_
PLAYER:Notify(text) -- Wysyła powiadomienie 
FS.Util.ConvertTime(time) -- Zmienia jednostkę czasu (sekundy) na ładną date (string)

_Biblioteka Systemu Obrażeń_
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

_Biblioteka Power Armoru_ -- Do zrobienia
PLAYER:SetPowerArmor(bState)
PLAYER:GetPowerArmor()

_Biblioteka systemu XP_ -- Do zrobienia
PLAYER:AddXP(intAmount)
PLAYER:SetXP(intAmount)
PLAYER:RemoveXP(intAmount)
PLAYER:GetXP()

_Biblioteka systemu frakcji_ -- Do zrobienia
PLAYER:SetRank(ply, rankInt) -- Ustawia rangę frakcyjną gracza

```
### Credits
- Djuk (Programista)
- Lechu (Programista, Mapper)
- FrX (Wydalony Programista)
- SaturdaysHeroes (Wydalony Programista)
