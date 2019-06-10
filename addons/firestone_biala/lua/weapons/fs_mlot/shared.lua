SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "Firestone Ręczne"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

if (CLIENT) then
SWEP.WElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/sledgehammer.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 0.319, 9.869), angle = Angle(0, -80, 178.83), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/sledgehammer.mdl", bone = "v_me_sledge", rel = "", pos = Vector(-1.101, 0.619, -25.455), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.ViewModelBoneMods = {
	["v_me_sledge"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
end
SWEP.PrintName = "Młot"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_me_pickaxe.mdl" --Viewmodel path
SWEP.ViewModelFOV = 50

SWEP.WorldModel			= "models/f_anm.mdl" --Viewmodel path
SWEP.HoldType = "melee2"
SWEP.DefaultHoldType = "melee2"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -4.7,
        Right = 1,
        Forward = 0.5,
        },
        Ang = {
        Up = -1,
        Right = 5,
        Forward = 178
        },
		Scale = 1.0
}

SWEP.MoveSpeed = 0.95
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(4.84, 1.424, -3.131)
SWEP.InspectAng = Vector(17.086, 3.938, 14.836)

SWEP.Primary.Damage = 65
SWEP.Secondary.BashDelay = 0.3