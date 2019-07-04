FACTION.name = "Bractwo Stali"
FACTION.desc = "Ukryta organizacja, chroniąca technologię przed ludźmi."
FACTION.isDefault = false
FACTION.color = Color(104, 109, 224) 
FACTION.weapons = {""} 
FACTION.models = {
	"models/reconarmor/reconarmor_01.mdl",
    "models/reconarmor/reconarmor_02.mdl",
    "models/reconarmor/reconarmor_03.mdl",
    "models/reconarmor/reconarmor_04.mdl",
    "models/reconarmor/reconarmor_05.mdl",
    "models/reconarmor/reconarmor_06.mdl"
    

}
FACTION.isGloballyRecognized = false
FACTION.pay = 5
FACTION_BS = FACTION.index

FACTION.rangi = {
    "Nowicjusz",
    "Kadet",
    "Rycerz",
    "Rycerz Sierżant",
    "Rycerz Kapitan",
    "Starszy Rycerz",
    "Paladyn",
    "Starszy Paladyn",
    "Gwieździsty Paladyn",
    "Wartownik",
    "Starszy",
    "Nowicjusz Skryba",
    "Skryba",
    "Starszy Skryba",
    "Wysoki Skryba"
}
FACTION.permissions = {}

FACTION.permissions["Starszy"] = {
    invite = true,
    awans = true,
    dowodca = true
}
FACTION.permissions["Wysoki skryba"] = {
    invite = true,
    awans = true,
}

FACTION.permissions["Gwieździsty Paladyn"] = {
    invite = true,
    awans = true,
}