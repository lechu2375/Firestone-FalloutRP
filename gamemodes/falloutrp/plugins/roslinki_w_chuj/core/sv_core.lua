if !SERVER then return end
 
Firestone = Firestone || {}
Firestone.Plants = Firestone.Plants || {}

Firestone.Plants.Time = 5 -- Co ile rośliny się pojawiają?
Firestone.Plants.Amount = 1 -- Ile roślin się wtedy pojawia?
Firestone.Plants.Pos = {
    [ 1 ] = {
        pos = Vector( -2686.730469, 9130.890625, 344.425507 ),
        id = "dynia"
    },
    [ 2 ] = {
        pos = Vector( -2686.730469, 9130.890625, 344.425507 ),
        id = "kukurydza"
    },
    [ 3 ] = {
        pos = Vector( -2686.730469, 9130.890625, 344.425507 ),
        id = "papryczka"
    }
}


local function plantSpawn(_,ent)
    ent:SetCollisionGroup(10)
end

timer.Create( "Firestone.Plants.Spawn", Firestone.Plants.Time, 0, function()
    for i = 0, Firestone.Plants.Amount do
        local random = math.random(1, #Firestone.Plants.Pos)
        local x = Firestone.Plants.Pos[random].pos
        local check = ents.FindInBox(x:Add(10,10,10), x:Add(-10,-10,-10))
        for k,v in pairs(check) do
            if v:GetClass() == "nut_item" then
                print("Coś tam jest, return.")
                return
            end
        end
        nut.item.spawn(Firestone.Plants.Pos[random].id, Firestone.Plants.Pos[random].pos, plantSpawn)
    end
end )



