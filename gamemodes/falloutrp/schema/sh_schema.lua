SCHEMA.name = "Fallout RolePlay"
SCHEMA.introName = "lecim na Szczecin, pędzim na Będzim."
SCHEMA.author = "Firestone Development Group"
SCHEMA.desc = "Firestone"

nut.util.includeDir("hooks")
nut.util.include("sh_config.lua")

Firestone = {}

nut.currency.set("", "kapsel", "kapsli") 

nut.flag.add("y", "Access to the light runner items.")
nut.flag.add("Y", "Access to the heavy runner items.")
