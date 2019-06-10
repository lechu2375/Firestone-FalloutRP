SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "Firestone Ręczne"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true


if CLIENT then
SWEP.VElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/lilysblade.mdl", bone = "v_me_axe_fire", rel = "", pos = Vector(-0.519, -2.3, -14), angle = Angle(-1.17, -3.507, 5.843), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/lilysblade.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 1.557, 18.181), angle = Angle(0, -115.714, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
end
SWEP.PrintName = "Ostrze ze śmigła latacza"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_me_axe_fire.mdl" --Viewmodel path
SWEP.ViewModelFOV = 70

SWEP.WorldModel			= "models/f_anm.mdl" --Viewmodel path
SWEP.HoldType = "melee2"
SWEP.DefaultHoldType = "melee2"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -6,
        Right = 1,
        Forward = 3,
        },
        Ang = {
        Up = -1,
        Right = -4,
        Forward = 178
        },
		Scale = 1.0
}

SWEP.Primary.Sound = ""--Sound("Weapon_Melee.HatchetLight")
SWEP.Secondary.Sound = ""--Sound("Weapon_Melee.FireaxeHeavy")

SWEP.MoveSpeed = 0.9
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(5.5, 1.424, -3.131)
SWEP.InspectAng = Vector(17.086, 3.938, 14.836)

SWEP.Primary.RPM = 50
SWEP.Primary.Damage = 70
SWEP.Secondary.BashDelay = 0.3
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["Middle04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.212, 1.121, 1.263) },
	["Pinky05"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(11.793, 4.677, 11.218) },
    ["v_me_axe_fire"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }

}