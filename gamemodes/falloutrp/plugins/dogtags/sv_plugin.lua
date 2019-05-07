if !file.Exists("dogtags.txt", "DATA") then --Jesli nie ma pliku to go robi i od razu tabela pusta pozdro
	file.Append("dogtags.txt") 
	local tabl = {}
	file.Write("dogtags.txt", util.TableToJSON(tabl))  
    print("DogTags: Created missing dogtags file for storing table.")
end

local allowed_factions = {
    [FACTION_RNK]=true,
    [FACTION_BS]=true
} --w pliku frakcji musi byc na przykład FACTION_BS = FACTION.index
--Dla tych frakcji będą generowane nieśmiertelniki

dogtagsTable = util.JSONToTable(file.Read( "dogtags.txt", "DATA" ))  --Czytamy plik, JSONA konwertujemy tabele

function getDogtagnNum()
    local number = math.random(342, 2912)
    while dogtagsTable[number] do 
	    number = math.random(342, 2912)
	    if !dogtagsTable[number] then 
	        break
	    end
	end
    return number
end

function dogtagsSave()
	file.Write("dogtags.txt", util.TableToJSON(dogtagsTable))
    print("DogTags: table saved to file.")
end

--[[function dogtagsForce(char,number)

end]]--


function PLUGIN:OnCharCreated( client, id )
    local faction = id:getFaction()
    if allowed_factions[faction] then
        local dogtagnumber = getDogtagnNum()
        id:setData("dogtag",dogtagnumber) 
        dogtagsTable[dogtagnumber] = id:getID() --KEY w tabeli to numer niesmiertelnika, a wartość to ID postaci
        print("Przypisano numer nieśmiertelnika: "..dogtagnumber.." dla postaci "..id:getName())
        dogtagsSave()
        PrintTable(util.JSONToTable(file.Read( "dogtags.txt", "DATA" )))
    end
end
print("DogTags: Plugin loaded.")
