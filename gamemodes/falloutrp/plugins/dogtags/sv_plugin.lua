if !file.Exists("dogtags.txt", "DATA") then --Jesli nie ma pliku to go robi i od razu tabela pusta pozdro
	file.Append("dogtags.txt") 
	local tabl = {}
	file.Write("dogtags.txt", util.TableToJSON(tabl))  
end

local allowed_factions = {FACTION_RNK,FACTION_BS} --w pliku frakcji musi byc na przykład FACTION_BS = FACTION.index
                                                    --Dla tych frakcji będą generowane nieśmiertelniki
dogtagsTable = util.JSONToTable(file.Read( "dogtags.txt", "DATA" ))  

if allowed_factions then
    for k,v in pairs(allowed_factions) do
        if !dogtagsTable.V then
            dogtagsTable.V = {}
        end
    end
end

function getDogtagnNum()
    while dogtagsTable[number] do 
	    number = math.random(1, 6)
	    if !dogtagsTable[number] then 
	        return number
	    end
	end
end

function dogtagsSave()
	file.Write("dogtags.txt", util.TableToJSON(dogtagsTable))
    dogtagsTable = util.JSONToTable(file.Read( "dogdags.txt", "DATA" )) 
end


--[[function PLUGIN:OnCharCreated( ply, char )
    local faction = char:getFaction()
    if table.HasValue(allowed_factions, faction) then
        local dogtagnumber = getDogtagnNum()
        char:setData("dogtag",dogtagnumber) 
        local id = char:getID
        dogtagsTable.faction[id] = dogtagnumber
        print(char:getData("dogtag"))
    end
end]]--

