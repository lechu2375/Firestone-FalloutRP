FS = FS or {}
FS.ItemSpawner = FS.ItemSpawner or {}
FS.ItemSpawner.Networking = FS.ItemSpawner.Networking or {}
FS.ItemSpawner.Vectors = FS.ItemSpawner.Vectors or util.JSONToTable(file.Read("FSitemspawnerpos.txt"))
FS.ItemSpawner.Debug = true
FS.ItemSpawner.Loop = 0

util.AddNetworkString("FS.RequestSpawnPos")
nut.command.run(_wypierdolitemy_)
function FS.ItemSpawner.LoadTable()
    if not IsValid(FS.ItemSpawner.SpawnTable) or table.IsEmpty(FS.ItemSpawner.SpawnTable) then
        if not file.Exists("FSitemspawner.txt", "DATA") then
            file.Append("FSitemspawner.txt",util.TableToJSON({}))
        end        
    end
    FS.ItemSpawner.SpawnTable = util.JSONToTable(file.Read("FSitemspawner.txt"))
end

function FS.ItemSpawner.SaveTable()
    if FS.ItemSpawner.SpawnTable and not table.IsEmpty(FS.ItemSpawner.SpawnTable) then
        file.Write("FSitemspawner.txt", util.TableToJSON(FS.ItemSpawner.SpawnTable))
    end
end

function FS.ItemSpawner.AddSpawn(data)
    if istable(data) then --jesli chcemy dodać tabele
        if not data.item then return false end --jesli nie ma sprecyzowanego to nara
        local newTable = {} --nowa tabela do konwersji danych bo tak mi sie podoba
        newTable.item = tostring(data.item) -- w razie czego konwersja do stringa

        if isvector(data.pos) then --jak mamy sprecyzowany spawn wtedy wrzucamy go do tabeli nowej
            newTable.pos = data.pos+Vector(0,0,20) 
        else
            print("[Item Spawner] wrong vector, adding item to random spawn...") --no jak nie to pzodro
        end

        if data.itemData and istable(data.itemData) then --jesli mamy tabele z itemdata n oto wrzucamy jom
            newTable.itemData = data.itemData
        end

        FS.ItemSpawner.SpawnTable[#FS.ItemSpawner.SpawnTable+1] = newTable --dodajemy do tabeli
        FS.ItemSpawner.SaveTable() --fast attack save

    elseif isstring(data) then --jak to po prostu string
        if nut.item.list[data] then --czy jest itemem
            FS.ItemSpawner.SpawnTable[#FS.ItemSpawner.SpawnTable+1] = data --dodanie do tabeli
            FS.ItemSpawner.SaveTable() --zapis
        end
    else
        return false --no jak nie ma ani kurwa tabeli ani stringa to NARA DO JASNEJ kurwy
        --przepraszam za przeklenstwo
    end
end


local pos,found = Vector(0,0,0),{}




function FS.ItemSpawner.RandomSpawn()
    if FS.ItemSpawner.Loop >=(#FS.ItemSpawner.Vectors) then 
        if FS.ItemSpawner.Debug then 
            print("[Item Spawner Debug] Loop too long.")
        end 
        FS.ItemSpawner.Loop = 0
        return false
    end

    if table.IsEmpty(FS.ItemSpawner.SpawnTable) then --jak tabela pusta
        print("[Item Spawner] Add at least one item for spawning.") --to print dla ludzi ze zle jest 
        return false 
    end
    
    local randomItem = table.Random(FS.ItemSpawner.SpawnTable) --losowa wartosc z tabeli wkoncu
    if istable(randomItem) then -- jak jest tabelom
        pos = (randomItem.pos or table.Random(FS.ItemSpawner.Vectors))
        found = ents.FindInSphere(pos, 100)
        for k,v in pairs(found) do
            if v:GetClass() == "nut_item" then
                if FS.ItemSpawner.Debug then
                    print("[Item Spawner Debug] Something is already spawned on choosed position.")
                end
                FS.ItemSpawner.Loop = FS.ItemSpawner.Loop + 1
                FS.ItemSpawner.RandomSpawn()
                return
            end
        end
        nut.item.spawn(randomItem.item,pos,FS.ItemSpawner.DebugSpawn,angle_zero,(randomItem.itemData or {}))
    elseif isstring(randomItem) then -- jak jest stringiem to respi item w randomowym miejscu

        pos = table.Random(FS.ItemSpawner.Vectors)
        found = ents.FindInSphere(pos, 100)
        for k,v in pairs(found) do
            if v:GetClass() == "nut_item" then
                if FS.ItemSpawner.Debug then
                    print("[Item Spawner] Something is already spawned on choosed position.")
                end
                FS.ItemSpawner.Loop = FS.ItemSpawner.Loop + 1
                FS.ItemSpawner.RandomSpawn()
                return
            end
        end       

        nut.item.spawn(randomItem,(pos+Vector(0,0,20)),FS.ItemSpawner.DebugSpawn,angle_zero)
    else --jak jakims cudem nwm co to jest to nara
        print("[Item Spawner] Something is wrong with",randomItem)
    end

  
end

function FS.ItemSpawner.DebugSpawn(item,entity)
    if not FS.ItemSpawner.Debug then return end
    print("[Item Spawner Debug] Spawned ",item.name," Position ",entity:GetPos())
end



if not FS.ItemSpawner.SpawnTable then FS.ItemSpawner.LoadTable() end
if not timer.Exists("FS.ItemSpawner.Timer") then
    timer.Create("FS.ItemSpawner.Timer", nut.config.get("randomItemSpawnTime", 60),0, FS.ItemSpawner.RandomSpawn)
end

function FS.ItemSpawner.Networking.tableConnect()
    local mergedTable = FS.ItemSpawner.Vectors
    for _,v in pairs(FS.ItemSpawner.SpawnTable) do
        if v.pos then 
            mergedTable[#mergedTable+1] = v.pos
        end
    end
    return mergedTable
end

net.Receive("FS.RequestSpawnPos",function( _, pl )
	if ( IsValid( pl ) and pl:IsPlayer() ) then
        if not pl:IsAdmin() then pl:Kick() return end 
        print("net reciv")
        net.Start("FS.RequestSpawnPos")
        net.WriteString(util.TableToJSON(FS.ItemSpawner.Networking.tableConnect()))
        net.Send(pl)
    end
end)


--[[
data = {
    item = stringItem
    pos = Vector(0, 0, 0)
    itemData = {}
} 
OR
data = stringItem
]]--




