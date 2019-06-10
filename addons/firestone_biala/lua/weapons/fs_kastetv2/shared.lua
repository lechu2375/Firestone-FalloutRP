SWEP.Base = "tfa_nmrimelee_base"
SWEP.Category = "Firestone Ręczne"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.AnimSequences = {
	attack_quick = "Attack_Quick",
	attack_quick2 = "Attack_Quick2",
	charge_begin = "Attack_Charge_Begin",
	charge_loop = "Attack_Charge_Idle",
	charge_end = "Attack_Charge_End"
}
SWEP.VElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/brassknuckles.mdl", bone = "SphereGizmo02", rel = "", pos = Vector(3.635, -0.7, -0.9), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/brassknuckles.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4, 1.557, 0.518), angle = Angle(0, 0, 80), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.PrintName = "Kastet"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_me_fists.mdl" --Viewmodel path
SWEP.ViewModelFOV = 65

SWEP.WorldModel			= "models/f_anm.mdl" --Viewmodel path
SWEP.HoldType = "fist"
SWEP.DefaultHoldType = "fist"
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

SWEP.Primary.Sound = Sound("Weapon_Crowbar.Single")
SWEP.Secondary.Sound = Sound("Weapon_Crowbar.Single")

SWEP.MoveSpeed = 1
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.VMPos = Vector(0,0,0)
SWEP.VMAng = Vector(0,0,0)

SWEP.InspectPos = Vector(0, -13.266, -16.08)
SWEP.InspectAng = Vector(70, 0, -0.704)

SWEP.Primary.Blunt = true
SWEP.Primary.Damage = 30
SWEP.Primary.Reach = 36
SWEP.Primary.RPM = 100
SWEP.Primary.SoundDelay = 0.15
SWEP.Primary.Delay = 0.05
SWEP.Primary.Window = 0.1

SWEP.Secondary.Blunt = true
SWEP.Secondary.RPM = 80 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 60
SWEP.Secondary.Reach = 36	
SWEP.Secondary.SoundDelay = 0.1
SWEP.Secondary.Delay = 0.15

SWEP.Secondary.BashDamage = 20
SWEP.Secondary.BashDelay = 0.2
SWEP.Secondary.BashLength = 40