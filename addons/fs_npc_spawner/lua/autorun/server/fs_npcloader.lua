include("fnscore/fns_spawner.lua")
include("fnscore/fns_locations.lua")
include("fnscore/fns_singlespawns.lua")

Firestone = Firestone or {}
FNS = Firestone.FNS or {}
Firestone.FNS = Firestone.FNS or {}
Firestone.FNS.Locations = Firestone.FNS.Locations or {}
Firestone.FNS.SS= Firestone.FNS.SS or {}

--[[
Miejscówki ={
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


}} 


["NPC"] = pos
]]
