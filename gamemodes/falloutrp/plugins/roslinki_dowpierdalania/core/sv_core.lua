if !SERVER then return end
 
Firestone = Firestone || {}
Firestone.Plants = Firestone.Plants || {}
Firestone.Plants.LifeTime = 172800
Firestone.Plants.Time = 360 -- Co ile rośliny się pojawiają?
Firestone.Plants.Amount = 1 -- Ile roślin się wtedy pojawia?
Firestone.Plants.Pos = {
    [ 1 ] = {
        pos = Vector( 4946.500000, 8805.593750, 157.781250 ),
        id = "kukurydza"
    },
    [ 2 ] = {
        pos = Vector( 4958.906250, 8800.218750, 132.218750),
        id = "kukurydza"
    },
    [ 3 ] = {
        pos = Vector( 4949.468750, 8793.937500, 118.750000),
        id = "kukurydza"
    },
    [4] = {
        pos = Vector(4960.937500, 9207.031250, 139.531250),
        id = "owocyucca"
    }   
}


local function plantSpawn(_,ent)
    ent:SetMoveType(0)
end

timer.Create( "Firestone.Plants.Spawn", Firestone.Plants.Time, 0, function()
    for i = 0, Firestone.Plants.Amount do
        local random = math.random(1, #Firestone.Plants.Pos)
        local x1 = Firestone.Plants.Pos[random].pos+Vector(-10,-10,-10)
        local x2 = Firestone.Plants.Pos[random].pos+Vector(10,10,10)
        local check = ents.FindInBox(x1,x2)
        for k,v in pairs(check) do
            if v:GetClass() == "nut_item" then
                i = i + 1
                return
            end     
        end
        nut.item.spawn(Firestone.Plants.Pos[random].id, Firestone.Plants.Pos[random].pos, plantSpawn,Angle(0,0,0),{["lifeTime"]=os.time()+Firestone.Plants.LifeTime})
    end
end )







