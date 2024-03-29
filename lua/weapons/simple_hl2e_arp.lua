AddCSLuaFile()

SWEP.Base = "simple_base"

SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.PrintName = "ARP"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 1

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_arp.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_arp.mdl")

SWEP.HoldType = "pistol"
SWEP.LowerHoldType = "normal"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "AR2",

	ClipSize = 20,
	DefaultClip = 40,

	Damage = 20,
	Delay = 60 / 700,

	Range = 600,
	Accuracy = 12,

	RangeModifier = 0.85,

	Recoil = {
		MinAng = Angle(0.8, -0.4, 0),
		MaxAng = Angle(1, 0.4, 0),
		Punch = 0.2,
		Ratio = 0.4
	},

	Reload = {
		Sound = "Weapon_Pistol.Reload"
	},

	Sound = "NPC_FloorTurret.Shoot",
	TracerName = "AR2Tracer"
}

SWEP.ViewOffset = Vector(0, 0, 0)

SWEP.NPCData = {
	Burst = {2, 3},
	Delay = 0.5,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_arp", title = "Simple Weapons: " .. SWEP.PrintName})

-- Dynamic Weapon Reverb support
SWEP.dwr_customAmmoType = "pistol"

function SWEP:DoImpactEffect(tr, dmgtype)
	self:DoAR2Impact(tr)
end
