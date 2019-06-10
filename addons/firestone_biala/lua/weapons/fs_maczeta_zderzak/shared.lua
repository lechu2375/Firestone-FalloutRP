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


if (CLIENT) then
SWEP.VElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/machete.mdl", bone = "LeadPipe", rel = "", pos = Vector(-.5, 0.518, -9), angle = Angle(0, -164.805, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["model"] = { type = "Model", model = "models/halokiller38/fallout/weapons/melee/machete.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 0.518, 2.596), angle = Angle(0, 36.234, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


end
SWEP.PrintName = "Maczeta ze zderzaka"

SWEP.ViewModel			= "models/weapons/tfa_nmrih/v_me_hatchet.mdl" --Viewmodel path
SWEP.ViewModelFOV = 70

SWEP.WorldModel			= "models/f_anm.mdl" --Viewmodel path
SWEP.HoldType = "melee"
SWEP.DefaultHoldType = "melee"
SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -5,
        Right = 2,
        Forward = 3.5,
        },
        Ang = {
        Up = -1,
        Right = 5,
        Forward = 178
        },
		Scale = 1.0
}

SWEP.Primary.Sound = ""--Sound("Weapon_Melee.HatchetLight")
SWEP.Secondary.Sound = ""--Sound("Weapon_Melee.HatchetHeavy")

SWEP.MoveSpeed = 0.975
SWEP.IronSightsMoveSpeed  = SWEP.MoveSpeed

SWEP.InspectPos = Vector(15.069, -15.437, 5.85)
SWEP.InspectAng = Vector(30.03, 43.618, 40.874)

SWEP.Primary.Reach = 65
SWEP.Primary.RPM = 80
SWEP.Primary.SoundDelay = 0.1
SWEP.Primary.Delay = 0.25
SWEP.Primary.Damage = 60

SWEP.Secondary.RPM = 45 -- Delay = 60/RPM, this is only AFTER you release your heavy attack
SWEP.Secondary.Damage = 100
SWEP.Secondary.Reach = 65
SWEP.Secondary.SoundDelay = 0.05
SWEP.Secondary.Delay = 0.25

SWEP.Secondary.BashDamage = 24
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = 54
SWEP.Secondary.BashDamageType = DMG_CLUB

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.254, 0.09), angle = Angle(15.968, -11.193, 1.437) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.552, 4.526, 0) },
	["Thumb04"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6, 0, 0) },
	["Maglite"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, -30), angle = Angle(0, 0, 0) },
    ["LeadPipe"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
    
}