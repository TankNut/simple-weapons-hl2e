AddCSLuaFile()

SWEP.Base = "simple_base"

SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.PrintName = "AR1 PDW"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 2

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_ar1.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_ar1.mdl")

SWEP.HoldType = "smg"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = -1

SWEP.Primary = {
	Ammo = "AR2",

	ClipSize = 30,
	DefaultClip = 60,

	Damage = 18,
	Delay = 60 / 700,
	BurstDelay = 60 / 850,
	BurstEndDelay = 0.3,

	Range = 500,
	Accuracy = 12,

	RangeModifier = 0.89,

	Recoil = {
		MinAng = Angle(0.6, -0.4, 0),
		MaxAng = Angle(0.7, 0.4, 0),
		Punch = 0.3,
		Ratio = 0.4
	},

	Sound = "NPC_FloorTurret.Shoot",
	TracerName = "AR2Tracer"
}

SWEP.ViewOffset = Vector(0, 0, -0.5)

function SWEP:AlternateAttack()
	self.Primary.Automatic = false

	self:SetFiremode(self:GetFiremode() == -1 and 3 or -1)

	self:EmitSound("Weapon_SMG1.Special1")
end

function SWEP:DoImpactEffect(tr, dmgtype)
	if tr.HitSky then
		return
	end

	if not game.SinglePlayer() and IsFirstTimePredicted() then
		return
	end

	local effect = EffectData()

	effect:SetOrigin(tr.HitPos + tr.HitNormal)
	effect:SetNormal(tr.HitNormal)

	util.Effect("AR2Impact", effect)
end
