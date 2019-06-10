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
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/yaoguiguantlet.mdl", bone = "SphereGizmo02", rel = "", pos = Vector(6.752, -1.558, 0.8), angle = Angle(8.182, 99.35, 178.83), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/yaoguiguantlet.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-0.519, -0.519, 1.557), angle = Angle(-17.532, -92.338, 10.519), size = Vector(1.399, 1.399, 1.399), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.ViewModelBoneMods = {
	["SphereGizmo02"] = { scale = Vector(0.003, 0.003, 0.003), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}



SWEP.PrintName = "Rękawica Yao"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_me_fists.mdl" --Viewmodel path
SWEP.ViewModelFOV = 55

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
SWEP.Primary.Delay = 0.2
SWEP.Primary.Window = 0.2

SWEP.Secondary.Blunt = true
SWEP.Secondary.RPM = 80 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 60
SWEP.Secondary.Reach = 36	
SWEP.Secondary.SoundDelay = 0.1
SWEP.Secondary.Delay = 0.15

SWEP.Secondary.BashDamage = 20
SWEP.Secondary.BashDelay = 0.2
SWEP.Secondary.BashLength = 40