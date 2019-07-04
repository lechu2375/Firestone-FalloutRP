FACTION.name = "Republika Nowej Kalifornii"
FACTION.desc = "Kolejny dzień w dostatku, dzięki demokracji!"
FACTION.isDefault = false
FACTION.color = Color(240, 147, 43)
FACTION.weapons = {""} 
FACTION.models = {
	"models/player/ncr/hub/female_01.mdl",
    "models/player/ncr/hub/female_04.mdl",
    "models/player/ncr/hub/female_07.mdl",
    "models/player/ncr/hub/female_ghoul.mdl",
    "models/player/ncr/hub/ncr_01.mdl",
    "models/player/ncr/hub/ncr_05.mdl",
    "models/player/ncr/hub/ncr_09.mdl",
    "models/player/ncr/hub/ncr_ghoul.mdl"
}
FACTION.isGloballyRecognized = true
FACTION.pay = 2
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
    awans = true,
}
FACTION.permissions["Generał"] = {
    invite = true,
    awans = true,
    dowodca = true
}
FACTION.permissions["Generał Dywizji"] = {
    invite = true,
    awans = true,
    dowodca = true
}