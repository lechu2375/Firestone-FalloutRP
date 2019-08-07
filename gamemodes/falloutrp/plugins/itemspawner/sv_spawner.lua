FS = FS or {}
FS.ItemSpawner = FS.ItemSpawner or {}
if not FS.ItemSpawner.SpawnTable then FS.ItemSpawner.LoadTable()
function FS.ItemSpawner.LoadTable()
    if not IsValid(FS.ItemSpawner.SpawnTable) or table.IsEmpty(FS.ItemSpawner.SpawnTable) then
        if not file.Exists("FSitemspawner.txt", "DATA") then
            file.Append("FSitemspawner.txt","")
        end        
        FS.ItemSpawner.SpawnTable = util.JSONToTable(file.Read("FSitemspawner.txt"))
    end
end

function FS.ItemSpawner.SaveTable()
    if IsValid(FS.ItemSpawner.SpawnTable) and not table.IsEmpty(FS.ItemSpawner.SpawnTable) then
        file.Write("FSitemspawner.txt", util.TableToJSON(FS.ItemSpawner.SpawnTable))
    end
end

function FS.ItemSpawner.AddSpawn(data)
    if istable(data) then --jesli chcemy dodać tabele
        if not IsValid(data.item) then return false end --jesli nie ma sprecyzowanego to nara
        local newTable = {} --nowa tabela do konwersji danych bo tak mi sie podoba
        newTable.item = tostring(data.item) -- w razie czego konwersja do stringa

        if isvector(data.pos) then --jak mamy sprecyzowany spawn wtedy wrzucamy go do tabeli nowej
            newTable.pos = data.pos 
        else
            print("[Item Spawner] wrong vector, adding item to random spawn...") --no jak nie to pzodro
        end

        if IsValid(data.itemData) and istable(data.itemData) then --jesli mamy tabele z itemdata n oto wrzucamy jom
            newTable.itemData = data.itemData
        end

        FS.ItemSpawner.SpawnTable[#FS.ItemSpawner.SpawnTable+1] = newTable --dodajemy do tabeli
        FS.ItemSpawner.SaveTable() --fast attack save

    elseif isstring(data) then --jak to po prostu string
        if IsValid(nut.item.list[data]) then --czy jest itemem
            FS.ItemSpawner.SpawnTable[#FS.ItemSpawner.SpawnTable+1] = data --dodanie do tabeli
            FS.ItemSpawner.SaveTable() --zapis
        end
    else
        return false --no jak nie ma ani kurwa tabeli ani stringa to NARA DO JASNEJ kurwy
        --przepraszam za przeklenstwo
    end
end

--[[
data = {
    item = stringItem
    pos = Vector(0, 0, 0)
    itemData = {}
} 
OR
data = stringItem
]]--




