bestiariusz = {}
if  not file.Exists("bestiariusz.txt", "DATA") then
    file.Append("bestiariusz.txt") 
	file.Write("bestiariusz.txt", util.TableToJSON({}))  
    print("Stworzono brakujący plik bestiariusza. Ścieżka: DATA/bestiariusz.txt")
    bestiariusz.list = {}
else
    bestiariusz.list = util.JSONToTable(file.Read("bestiariusz.txt", "DATA"))
end

net.Receive("FS:BestiariuszADD", function ()
    local npc = net.ReadString()
    bestiariusz.add(npc)
    PrintTable(bestiariusz.list)
end)

bestiariusz.translate = {
    ["npc_monk"] = "Łysy dziadek",
    ["npc_crow"] = "Wrona"
}

function bestiariusz.add(npc)
    if bestiariusz.list[npc] then
        bestiariusz.list[npc] = bestiariusz.list[npc] + 1
    else
        bestiariusz.list[npc] = 1 
    end
end

function bestiariusz.save()
    file.Write("dogtags.txt", util.TableToJSON(bestiariusz.list)) 
end

timer.Create("bestiariusz.update", 5, 0, function ()
    bestiariusz.save()
)

return bestiariusz
