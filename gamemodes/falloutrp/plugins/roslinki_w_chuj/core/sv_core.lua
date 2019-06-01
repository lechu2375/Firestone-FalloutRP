if !SERVER then return end
 
Firestone = Firestone || {}
Firestone.Plants = Firestone.Plants || {}

Firestone.Plants.Time = 1 -- Co ile rośliny się pojawiają?
Firestone.Plants.Amount = 2 -- Ile roślin się wtedy pojawia?
Firestone.Plants.Pos = {
    [ 1 ] = {
        vector = Vector( 6076.931152, 3760.338867, 74.693886 ),
        ent = "ent"
    }
    [ 2 ] = {
        vector = Vector( 6076.931152, 3760.338867, 74.693886 ),
        ent = "ent"
    }
    [ 3 ] = {
        vector = Vector( 6076.931152, 3760.338867, 74.693886 ),
        ent = "ent"
    }
}

Firestone.Plants.Spawned = {}
timer.Create( "Firestone.Plants.Spawn", Firestone.Plants.Time, 0, function()
    for i = 0, Firestone.Plants.Amount do
        -- Wylosuj vector
        local rand = math.random( 1, #Firestone.Plants.Pos )
        -- Jeżeli vector się nie powtarza to koontynuuj
        if !Firestone.Plants.Spawned[ rand ] then
            -- A teraz dodaj nowy vector do tabeli
            Firestone.Plants.Spawned[ #Firestone.Plants.Spawned + 1 ] = Firestone.Plants.Pos[ rand ].vector
            -- Utwórz krzak i ustaw jego pozycję
            local plant = ents.Create( "fs_plant" )
            plant:SetPos( Firestone.Plants.Pos[ rand ].vector )
            plant:Spawn()
        end
    end
end )