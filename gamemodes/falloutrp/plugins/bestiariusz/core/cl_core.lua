bestiariusz = {}
bestiariusz.list = {}
if  not file.Exists("bestiariusz.txt", "DATA") then
    file.Append("bestiariusz.txt") 
	file.Write("bestiariusz.txt", util.TableToJSON({}))  
    print("Stworzono brakujący plik bestiariusza. Ścieżka: DATA/bestiariusz.txt")
else
    bestiariusz.list = util.JSONToTable(file.Read("bestiariusz.txt", "DATA"))
end

net.Receive("FS:BestiariuszADD", function ()
    local npc = net.ReadString()
    bestiariusz.add(npc)
end)

bestiariusz.translate = {
    ["npc_monk"] = "Łysy dziadek",
    ["npc_crow"] = "Wrona",
    ["npc_metropolice"] = "policjant"
}

function bestiariusz.add(npc)
    if bestiariusz.list[npc] then
        bestiariusz.list[npc] = bestiariusz.list[npc] + 1
    else
        bestiariusz.list[npc] = 1 
    end
end

function bestiariusz.save()
    file.Write("bestiariusz.txt", util.TableToJSON(bestiariusz.list)) 
end

function bestiariusz.getTranslatedList()
local tlist = {}
    for k,v in pairs(bestiariusz.list) do
        if bestiariusz.translate[k] then 
            tlist[bestiariusz.translate[k]]= v
        else
            tlist[k] = v
        end
    end
    return tlist

end

timer.Create("bestiariusz.update", 5, 0, function ()
    bestiariusz.save()
end)




concommand.Add( "bestiariusz", function(  )
	PrintTable(bestiariusz.list)
end )
