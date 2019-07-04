Firestone = Firestone or {}
Firestone.FNS = Firestone.FNS or {}
FNS = Firestone.FNS or {}
Firestone.FNS.Locations = Firestone.FNS.Locations or {}
Firestone.FNS.Locations.Spawned = Firestone.FNS.Locations.Spawned or {} --tabela do zapisywania npctów, do uniknięcia pętli ents.getall
Firestone.FNS.SS = Firestone.FNS.SS or {}


   






--[[
Miejscówki =
["Nazwa_miejscówki"] = { --Nazwa spawnpointa
    ["npctable"] = {
        [1] = klasa_npc --każdy npc wpisany
        [2] = klasa_npc
    }
    ["postable"] = {
        [1] = pozycja --pozycja, pierwszy wpis odpowiada pierwszemu wpisowi z npc tabeli.
        [2] = pozycja
    }
    ["radius"] = promień --promień kuli w której będzie skrypt szukał graczy
    ["time"] = sekundy --Co ile sekund ma nastąpić sprawdzenie czy npc żyją, jeśli nie to je respi


}

Pojedyńcze npc=
["unikalna_nazwa"] = {
    ["nc"] = klasa_npc
    ["pos"] = pozycja
    ["time"] = sekundy
    ["radius"] = promień
    ["fibv"] ={Wektor1,Wektor2} -- jesli chcemy 
}
]]




