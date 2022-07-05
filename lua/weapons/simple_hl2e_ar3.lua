AddCSLuaFile()

DEFINE_BASECLASS("simple_base")

SWEP.Base = "simple_base"

SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.PrintName = "AR3 OISAW"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 2

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_ar3.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_ar3.mdl")

SWEP.HoldType = "smg"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = -1

SWEP.Primary = {
	Ammo = "AR2",

	ClipSize = 90,
	DefaultClip = 180,

	Damage = 24,
	Delay = 60 / 550,

	Range = 600,
	Accuracy = 12,

	RangeModifier = 0.96,

	Recoil = {
		MinAng = Angle(0.6, -0.3, 0),
		MaxAng = Angle(0.8, 0.3, 0),
		Punch = 0.4,
		Ratio = 0.2
	},

	Sound = "NPC_Hunter.FlechetteShootLoop",
	TracerName = "AirboatGunTracer"
}

SWEP.ViewOffset = Vector(0, 0, -0.5)

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	self:NetworkVar("Bool", 4, "IsFiring")
end

function SWEP:OnDeploy()
	BaseClass.OnDeploy(self)

	self:SetIsFiring(false)
end

function SWEP:OnHolster(removing, ply)
	BaseClass.OnHolster(self, removing, ply)

	self:SetIsFiring(false)

	self:StopSound(self.Primary.Sound)
end

function SWEP:EmitFireSound()
	if not self:GetIsFiring() then
		self:EmitSound(self.Primary.Sound)

		self:SetIsFiring(true)
	end
end

function SWEP:Think()
	BaseClass.Think(self)

	if self:GetIsFiring() and CurTime() > self:GetNextPrimaryFire() + engine.TickInterval() then
		self:EmitSound("simple_weapons/tyrant_attackend.wav")
		self:StopSound(self.Primary.Sound)

		self:SetIsFiring(false)
		self:SetNextPrimaryFire(CurTime() + 0.5)
	end
end

function SWEP:SetupMove(ply, mv)
	if self:GetIsFiring() then
		local speed = ply:Crouching() and ply:GetWalkSpeed() * ply:GetCrouchedWalkSpeed() or ply:GetSlowWalkSpeed()

		mv:SetMaxSpeed(speed)
		mv:SetMaxClientSpeed(speed)
	else
		BaseClass.SetupMove(self, ply, mv)
	end
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
