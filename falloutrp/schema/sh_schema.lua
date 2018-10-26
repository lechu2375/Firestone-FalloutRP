SCHEMA.name = "Fallout RolePlay"
SCHEMA.introName = "lecim na Szczecin, pędzim na Będzim."
SCHEMA.author = "aturdays Heroes, FrX, Djuk, Lechu"
SCHEMA.desc = "Firestone"

nut.util.includeDir("hooks")
nut.util.include("sh_config.lua")

nut.currency.set("C", "kapsel", "kapsli") 

nut.flag.add("y", "Access to the light runner items.")
nut.flag.add("Y", "Access to the heavy runner items.")
