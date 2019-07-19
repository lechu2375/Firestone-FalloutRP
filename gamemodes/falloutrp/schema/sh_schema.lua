--------------
--[[ INFO ]]--
--------------
SCHEMA.name = "Fallout Roleplay"
SCHEMA.author = "Firestone Development Team"
SCHEMA.desc = ""

----------------
--[[ GLOBAL ]]--
----------------
Firestone = Firestone or {}
Firestone.API = {}
Firestone.Util = {}
Firestone.LightGreen = Color(15, 72, 34,215)
Firestone.DarkGreen = Color(17,255,31)
Firestone.Blur = Material("pp/blurscreen")
Firestone.License = 'FS7AVM4ikg9A6FS'

------------------
--[[ INCLUDES ]]--
------------------
nut.util.includeDir("modules", nil, true)
nut.util.includeDir("hooks")
nut.util.includeDir("derma")
nut.util.includeDir("api")
nut.util.includeDir("util")
nut.util.include("sh_config.lua")

-----------------------
--[[ CONFIGURATION ]]--
-----------------------
nut.currency.set("K", "kapsel", "kapsli") 

