FACTION.name = "Republika Nowej Kalifornii"
FACTION.desc = "Kolejny dzień w dostatku, dzięki demokracji!"
FACTION.isDefault = false
FACTION.color = Color(240, 147, 43)
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
FACTION_RNK = FACTION.index

FACTION.rangi = {
    "Szeregowy",
    "Starszy Szeregowy",
    "Kapral",
    "Sierżant",
    "Starszy Sierżant",
    "Sierżant Sztabowy",
    "Sierżant Major",
    ---Oficerowie---
    "Młodszy Porucznik",
    "Porucznik",
    "Kapitan",
    "Major",
    "Podpułkownik",
    "Pułkownik",
    "Brygadier",
    "Major",
    "Generał Dywizji",
    "Generał",
    ---straznicy--
    "Rekrut",
    "Strażnik",
    "Strażnik Weteran",
    --szefunio--
    "Chief"
}
FACTION.permissions = {}
FACTION.permissions["Chief"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Generał"] = {
    invite = true,
    awans = true,
    dowodca = true,
    vault = true
}
FACTION.permissions["Generał Dywizji"] = {
    invite = true,
    awans = true,
    dowodca = true,
    vault = true,
}
FACTION.permissions["Major"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Brygadier"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Pułkownik"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Podpułkownik"] = {
    invite = true,
    awans = true
}
FACTION.permissions["Kapitan"] = {
    invite = true,
    awans = true
}