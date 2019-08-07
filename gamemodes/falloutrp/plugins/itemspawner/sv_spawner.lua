FS = FS or {}
FS.ItemSpawner = FS.ItemSpawner or {}
FS.ItemSpawner.Vectors = FS.ItemSpawner.Vectors or {
Vector(-4980.464355, 6492.281738, 178.061661),
Vector(-4685.096680, 6706.563477, 144.031250)
}

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


function FS.ItemSpawner.RandomSpawn()
    if table.IsEmpty(FS.ItemSpawner.SpawnTable) then --jak tabela pusta
        print("[Item Spawner] Add at least one item for spawning.") --to print dla ludzi ze zle jest 
        return false 
    end
    local randomItem = table.Random(FS.ItemSpawner.SpawnTable) --losowa wartosc z tabeli wkoncu
    if istable(randomItem) then -- jak jest tabelom
        nut.item.spawn(randomItem.item,(randomItem.pos or table.Random(FS.ItemSpawner.Vectors)),_,angle_zero,(randomItem.itemData or {}))
    elseif isstring(randomItem) then -- jak jest stringiem to respi item w randomowym miejscu
        nut.item.spawn(randomItem,(table.Random(FS.ItemSpawner.Vectors)+Vector(0,0,20)),_,angle_zero)
    else --jak jakims cudem nwm co to jest to nara
        print("[Item Spawner] Something is wrong with",randomItem)
    end


end




if not FS.ItemSpawner.SpawnTable then FS.ItemSpawner.LoadTable() end
--[[
data = {
    item = stringItem
    pos = Vector(0, 0, 0)
    itemData = {}
} 
OR
data = stringItem
]]--




