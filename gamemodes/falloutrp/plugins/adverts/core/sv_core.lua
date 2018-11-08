if !SERVER then return end
local PLUGIN = PLUGIN
util.AddNetworkString("FS_RunAdvert")

function PLUGIN:PlayerSay(ply,text)
  if ply:GetUserGroup() != "superadmin" then return "" end
  if string.sub(text,1,11) == "/ogloszenie" then
    local advertText = string.sub(text,13)
    if string.len(advertText) < 10 then
      ply:ChatPrint("Treść ogłoszenia jest za krótka!")
    else
      net.Start("FS_RunAdvert")
      net.WriteString(string.upper(advertText))
      net.WriteString(string.upper(ply:Nick()))
      net.Broadcast()
    end
    return ""
  end
end)
