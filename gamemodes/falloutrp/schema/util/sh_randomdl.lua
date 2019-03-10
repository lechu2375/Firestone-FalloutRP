function randomskladka(len)
local len = len or 4
    
    local tabelka = { "1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    local char = "" 
            for i=1, len do
                char = char..table.Random(tabelka)
            end
return char
end