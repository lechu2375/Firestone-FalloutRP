FACTION.name = "Legion Cezara"
FACTION.desc = "Ave Cezar!"
FACTION.isDefault = false
FACTION.color = Color(214, 48, 49)
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
FACTION.isGloballyRecognized = true
FACTION.pay = 30
FACTION_LEGION = FACTION.index
FACTION.permissions = {}
FACTION.rangi = { 
    "Rekrut",
    "Weteran",
    "Starszy Weteran",
    "Zwiadowca",
    "Młodszy Decanus",
    "Decanus",
    "Starszy Decanus",
    "Centurion",
    "Legat",
    "Cezar",
    "Frumentarii",
    "Vexillarius",
    "Pretorianin",
    "Kowal",
    "Instruktor"
}

FACTION.permissions["Cezar"] = {
    invite = true,
    awans = true,
    dowodca = true,
    vault = true
}
FACTION.permissions["Legat"] = {
    invite = true,
    awans = true,
    vault = true
}
FACTION.permissions["Centurion"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Decanus"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Starszy Decanus"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Vexillarius"] = {
    invite = true,
    awans = true
}
