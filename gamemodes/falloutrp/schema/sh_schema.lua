--------------
--[[ INFO ]]--
--------------
SCHEMA.name = "Fallout Roleplay"
SCHEMA.author = "Firestone Development"

-----------------------
--[[ GLOBAL TABLES ]]--
-----------------------
Firestone = {}

------------------
--[[ INCLUDES ]]--
------------------
nut.util.includeDir("hooks")
nut.util.includeDir("derma")
nut.util.include("sh_config.lua")

-----------------------
--[[ CONFIGURATION ]]--
-----------------------
nut.currency.set("", "kapsel", "kapsli") 
nut.flag.add("y", "Access to the light runner items.")
nut.flag.add("Y", "Access to the heavy runner items.")
