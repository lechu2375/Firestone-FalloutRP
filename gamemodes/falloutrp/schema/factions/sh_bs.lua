FACTION.name = "Bractwo Stali"
FACTION.desc = "Ukryta organizacja, chroniąca technologię przed ludźmi."
FACTION.isDefault = false
FACTION.color = Color(104, 109, 224) 
FACTION.weapons = {""} 
FACTION.models = {
	"models/visualitygaming/fallout/wastelander1_female_01.mdl",
    "models/visualitygaming/fallout/wastelander1_female_02.mdl",
    "models/visualitygaming/fallout/wastelander1_female_03.mdl",
    "models/visualitygaming/fallout/wastelander1_female_04.mdl",
    "models/visualitygaming/fallout/wastelander1_male_01.mdl",
    "models/visualitygaming/fallout/wastelander1_male_02.mdl",
    "models/visualitygaming/fallout/wastelander1_male_03.mdl",
    "models/visualitygaming/fallout/wastelander1_male_04.mdl",
    "models/visualitygaming/fallout/wastelander2_female_01.mdl",
    "models/visualitygaming/fallout/wastelander2_female_02.mdl",
    "models/visualitygaming/fallout/wastelander2_female_03.mdl",
    "models/visualitygaming/fallout/wastelander2_female_04.mdl",
    "models/visualitygaming/fallout/wastelander2_male_01.mdl",
    "models/visualitygaming/fallout/wastelander2_male_02.mdl",
    "models/visualitygaming/fallout/wastelander2_male_03.mdl",
    "models/visualitygaming/fallout/wastelander2_male_04.mdl",
    "models/visualitygaming/fallout/wastelander3_female_01.mdl",
    "models/visualitygaming/fallout/wastelander3_female_02.mdl",
    "models/visualitygaming/fallout/wastelander3_female_03.mdl",
    "models/visualitygaming/fallout/wastelander3_female_04.mdl",
    "models/visualitygaming/fallout/wastelander3_male_01.mdl",
    "models/visualitygaming/fallout/wastelander3_male_02.mdl",
    "models/visualitygaming/fallout/wastelander3_male_03.mdl",
    "models/visualitygaming/fallout/wastelander3_male_04.mdl"
}
FACTION.isGloballyRecognized = false
FACTION.pay = 1
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
    dowodca = true,
    vault = true
}
FACTION.permissions["Wysoki skryba"] = {
    invite = true,
    awans = true,
    vault = true
}

FACTION.permissions["Gwieździsty Paladyn"] = {
    invite = true,
    awans = true,
    vault = true
}