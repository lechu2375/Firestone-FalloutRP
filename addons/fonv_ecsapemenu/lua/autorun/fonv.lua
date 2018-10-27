FalloutEsc = FalloutEsc or {}
FalloutTable = FalloutTable or {}

Esc = Esc or {}

local Menu

local include_sv = (SERVER) and include or function() end
local include_cl = (SERVER) and AddCSLuaFile or include
local include_sh = function(path)
	include_sv(path)
	include_cl(path)
end

include_cl('fonv_escape/escmenu.lua')
include_cl('fonv_escape/escutil.lua')
include_cl('fonv_escape/fonts.lua')
include_cl('fonv_escape/backgrounds.lua')
include_sh('config.lua')