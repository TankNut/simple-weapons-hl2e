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

	Sound = "Simple_Weapons_AR3.Loop",
	TracerName = "AirboatGunTracer"
}

SWEP.ViewOffset = Vector(0, 0, -0.5)

SWEP.NPCData = {
	Burst = {10, 25},
	Delay = SWEP.Primary.Delay,
	Rest = {0.5, 1.5}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_ar3", title = "Simple Weapons: " .. SWEP.PrintName})

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	self:NetworkVar("Bool", "IsFiring")
end

function SWEP:Deploy()
	BaseClass.Deploy(self)

	self:SetIsFiring(false)

	return true
end

function SWEP:Holster()
	self:SetIsFiring(false)
	self:StopSound(self.Primary.Sound)

	return BaseClass.Holster(self)
end

function SWEP:OwnerChanged()
	BaseClass.OwnerChanged(self)

	self:StopSound(self.Primary.Sound)

	local ply = self:GetOwner()

	if IsValid(ply) and ply:IsNPC() then
		hook.Add("Think", self, self.NPCThink)
	else
		hook.Remove("Think", self)
	end
end

function SWEP:OnRemove()
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

	if self:GetIsFiring() and CurTime() > self:GetNextFire() + engine.TickInterval() then
		self:EmitSound("simple_weapons/weapons/tyrant_attackend.wav")
		self:StopSound(self.Primary.Sound)

		self:SetIsFiring(false)
		self:SetNextFire(CurTime() + 0.5)
	end
end

function SWEP:NPCThink()
	if self:GetIsFiring() and CurTime() > self:GetNextFire() + engine.TickInterval() then
		self:EmitSound("simple_weapons/weapons/tyrant_attackend.wav")
		self:StopSound(self.Primary.Sound)

		self:SetIsFiring(false)
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
	self:DoAR2Impact(tr)
end

sound.Add({
	name = "Simple_Weapons_AR3.Loop",
	channel = CHAN_STATIC,
	volume = 1,
	level = 130,
	sound = "^simple_weapons/weapons/hunter_fire_loop3.wav"
})
