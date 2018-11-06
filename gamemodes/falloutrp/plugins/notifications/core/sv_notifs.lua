if !SERVER then return end
util.AddNetworkString("runNotify")

function PLUGIN:PlayerSay(ply,text)
  if ply:GetUserGroup() != "superadmin" then return "" end
  if string.sub(text,1,11) == "/ogloszenie" then
    local notifText = string.sub(text,13)
    if string.len(notifText) < 10 then
      ply:ChatPrint("Treść ogłoszenia jest za krótka!")
    else
      net.Start("runNotify")
      net.WriteString(notifText)
      net.Broadcast()
    end
    return ""
  end
end)
