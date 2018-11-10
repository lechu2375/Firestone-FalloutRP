if !SERVER then return end 

local PLAYER = FindMetaTable("Player")

resource.AddFile("models/monstermash/skeletonhand.mdl")
resource.AddFile("models/monstermash/skeleton_final.mdl")
resource.AddFile("models/c_models/c_arms_skeleton.mdl")
resource.AddSingleFile("materials/models/misc/cube_back.png")
resource.AddSingleFile("materials/models/misc/cube_bot.png")
resource.AddSingleFile("materials/models/misc/cube_center.png")
resource.AddSingleFile("materials/models/misc/cube_left.png")
resource.AddSingleFile("materials/models/misc/cube_right.png")
resource.AddSingleFile("materials/nothing.vmt")

function PLAYER:HellKick()
    self:SetNWBool("KickPlayer", true)
    self:SetNWBool("KickPlayerStuff", true)
end

function PLAYER:HellBan()
    self:SetNWBool("BanPlayer", true)
    self:SetNWBool("BanPlayerStuff", true)
end

hook.Add("Think", "SkeletonKickThink", function()
    for k, v in pairs(player.GetAll()) do
        if (v:GetNWBool("KickPlayer") == true || v:GetNWBool("BanPlayer") == true) && v:OnGround() then
            v:SetNoDraw(true)
            if SERVER then
                v:GodEnable(true)
                v:StripWeapons()
                v:SetVelocity( -v:GetVelocity() )
                if v:GetNWBool("KickPlayerStuff") == true || v:GetNWBool("BanPlayerStuff") == true then
                    v:SetNWBool("KickPlayerStuff", false)
                    v:SetNWBool("BanPlayerStuff", false)
                    local ent = ents.Create("sent_hellkick")
                    ent:SetPos(v:GetPos())
                    ent:SetAngles(v:GetAngles())
                    ent:Spawn()
                    ent:Activate()
                    ent:SetNWString("Model", v:GetModel())
                    if v:GetNWBool("KickPlayer") == true then
                        ent:SetNWBool("KickPlayer", v:GetNWBool("KickPlayer"))
                        ent:SetNWEntity("KickPlayerEntity", v)
                        ent:SetNWString("KickPlayerReason", v:GetNWString("KickPlayerReason"))
                    else
                        ent:SetNWBool("BanPlayer", v:GetNWBool("BanPlayer"))
                        ent:SetNWEntity("BanPlayerEntity", v)
                        ent:SetNWInt("BanPlayerTime", v:GetNWInt("BanPlayerTime"))
                    end
                    ent:SetNWInt("KickPlayerSkin", v:GetSkin())
                    ent:SetNWString("KickPlayerMat", v:GetMaterial())
                    ent:SetNWInt("KickPlayerBG1", v:GetBodygroup(1))
                    ent:SetNWInt("KickPlayerBG2", v:GetBodygroup(2))
                    ent:SetNWInt("KickPlayerBG3", v:GetBodygroup(3))
                    ent:SetNWInt("KickPlayerBG4", v:GetBodygroup(4))
                end
            end
        end
    end
end)

hook.Add( "CalcView", "SkeletonKickCalcView", function( ply, pos, angles, fov )
    if (ply:GetNWBool("KickPlayer") == true || ply:GetNWBool("BanPlayer") == true) && ply:GetNoDraw() then
        local view = {}

        view.origin = pos-( angles:Forward()*100 )
        view.angles = angles
        view.fov = fov
        view.drawviewer = true

        return view
    end
end)

hook.Add( "Move", "SkeletonKickMove", function( ply, mv )
    if (ply:GetNWBool("KickPlayer") == true || ply:GetNWBool("BanPlayer") == true) && ply:GetNoDraw() then
        return true
    end
end)