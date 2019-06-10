SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "Firestone Ręczne"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true


if CLIENT then 
SWEP.ViewModelBoneMods = {
	["Machete"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/katana.mdl", bone = "Machete", rel = "", pos = Vector(-3.9, -0.5, 0), angle = Angle(90, 97.013, 80), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/katana.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 1.557, 4.8), angle = Angle(0, 80, 180), size = Vector(1, 1.299, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
end
SWEP.PrintName = "Katana"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_me_machete.mdl" --Viewmodel path
SWEP.ViewModelFOV = 60

SWEP.WorldModel			= "models/f_anm.mdl" --Viewmodel path
SWEP.HoldType = "melee2"
SWEP.DefaultHoldType = "melee2"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = 0,
        Right = 0.5,
        Forward = -0.5,
        },
        Ang = {
        Up = -1,
        Right = 5,
        Forward = 178
        },
		Scale = 1.2
}

SWEP.Primary.Sound = Sound("Weapon_Melee.HatchetLight")
SWEP.Secondary.Sound = Sound("Weapon_Melee.HatchetHeavy")

SWEP.MoveSpeed = 0.975
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(3.874, -13.436, 3.969)
SWEP.InspectAng = Vector(-7.27, 41.632, 4.92)

SWEP.Primary.Blunt = false
SWEP.Primary.Damage = 60
SWEP.Primary.Reach = 40
SWEP.Primary.RPM = 100
SWEP.Primary.SoundDelay = 0.15
SWEP.Primary.Delay = 0.3
SWEP.Primary.Window = 0.2

SWEP.Secondary.Blunt = false
SWEP.Secondary.RPM = 80 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 100
SWEP.Secondary.Reach = 45	
SWEP.Secondary.SoundDelay = 0.1
SWEP.Secondary.Delay = 0.3

SWEP.Secondary.BashDamage = 20
SWEP.Secondary.BashDelay = 0.2
SWEP.Secondary.BashLength = 50