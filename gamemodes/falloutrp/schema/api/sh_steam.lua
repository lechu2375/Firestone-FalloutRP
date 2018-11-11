AddCSLuaFile()

Firestone.API.Steam = Firestone.API.Steam or {}

function Firestone.API.Steam:GetAvatar(sid64)
    local url = "http://api.saturdaysheroes.me/gmod/savatar/index.php/steamProfileByID?id="..sid64
    return url
end
