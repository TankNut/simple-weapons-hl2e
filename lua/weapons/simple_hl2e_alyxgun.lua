AddCSLuaFile()

DEFINE_BASECLASS("simple_base")

SWEP.Base = "simple_base"

SWEP.PrintName = "Alyx Gun"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 1

SWEP.Spawnable = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/v_alyxgun.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_alyxgun.mdl")

SWEP.HoldType = "pistol"
SWEP.LowerHoldType = "normal"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "Pistol",

	ClipSize = 30,
	DefaultClip = 60,

	Damage = 13,
	Delay = 60 / 600,
	BurstDelay = 60 / 800,
	BurstEndDelay = 60 / 300,

	Range = 750,
	Accuracy = 12,

	RangeModifier = 0.85,

	Recoil = {
		MinAng = Angle(0.8, -0.4, 0),
		MaxAng = Angle(1, 0.4, 0),
		Punch = 0.2,
		Ratio = 0.4
	},

	Reload = {
		Sound = "Simple_Weapons_AlyxGun.Reload"
	},

	TracerName = "Tracer"
}

SWEP.ViewOffset = Vector(0, 0, 1)

SWEP.NPCData = {
	Burst = {3, 3},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_alyxgun", title = "Simple Weapons: " .. SWEP.PrintName})

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	self:AddNetworkVar("Bool", "Deployed")
	self:AddNetworkVar("Float", "DeployStartTime")
	self:AddNetworkVar("Float", "DeployEndTime")
end

function SWEP:CanAltFire()
	if self:IsReloading() then
		return false
	end

	return true
end

function SWEP:AltFire()
	self.Primary.Automatic = false

	self:SetDeployed(not self:GetDeployed())

	local deployed = self:GetDeployed()

	self:SendTranslatedWeaponAnim(deployed and ACT_VM_PULLBACK_HIGH or ACT_VM_PULLBACK_LOW)
	self:EmitSound(deployed and "Simple_Weapons_AlyxGun.Special1" or "Simple_Weapons_AlyxGun.Special2")
	self:SetFiremode(deployed and 3 or 0)

	self:SetDeployStartTime(CurTime())

	if not deployed then
		local holdtype = self.HoldType

		self.HoldType = "pistol"
		self.LowerHoldType = "normal"

		local current = self:GetHoldType()

		if current == holdtype then
			self:SetHoldType(self.HoldType)
		else
			self:SetHoldType(self.LowerHoldType)
		end
	end

	local time = CurTime() + self:SequenceDuration()

	self:SetNextIdle(time)
	self:SetNextFire(time)
	self:SetNextAltFire(time)
end

function SWEP:EmitFireSound()
	self:EmitSound(self:GetDeployed() and "Simple_Weapons_AlyxGun.Burst" or "Simple_Weapons_AlyxGun.Single")
end

local replace = {
	[ACT_VM_PRIMARYATTACK] = ACT_VM_SECONDARYATTACK,
	[ACT_VM_IDLE] = ACT_VM_HITLEFT,
	[ACT_VM_RELOAD] = ACT_VM_FIDGET
}

function SWEP:TranslateWeaponAnim(act)
	if self:GetDeployed() then
		return replace[act] or act
	end

	return act
end

local lerpTime = 0.5

function SWEP:Think()
	BaseClass.Think(self)

	local time = self:GetDeployStartTime()
	local elapsed = CurTime() - time

	if time != 0 then
		if self:GetDeployed() and elapsed > lerpTime * 0.5 and self.HoldType != "smg" then
			local holdtype = self.HoldType

			self.HoldType = "smg"
			self.LowerHoldType = "passive"

			local current = self:GetHoldType()

			if current == holdtype then
				self:SetHoldType(self.HoldType)
			else
				self:SetHoldType(self.LowerHoldType)
			end
		end

		if elapsed >= lerpTime then
			self:SetDeployStartTime(0)
		end
	end
end

if CLIENT then
	function SWEP:DrawWorldModel()
		local deployed = self:GetDeployed()
		local param = deployed and 1 or 0

		local time = self:GetDeployStartTime()

		if time != 0 then
			local elapsed = CurTime() - time

			param = deployed and math.min(elapsed / lerpTime, 1) or math.max(1 - elapsed / lerpTime, 0)
		end

		self:SetPoseParameter("active", param)

		self:SetupBones()
		self:DrawModel()
	end
end

function ENT:OnRestore()
	BaseClass.OnRestore(self)

	self:SetDeployStartTime(0)
	self:SetDeployEndTime(0)
end

sound.Add({
	name = "Simple_Weapons_AlyxGun.Reload",
	channel = CHAN_ITEM,
	volume = 0.5,
	level = 75,
	sound = "simple_weapons/weapons/alyxgun/alyxgun_reload.wav"
})

sound.Add({
	name = "Simple_Weapons_AlyxGun.Single",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 140,
	pitch = {98, 102},
	sound = {
		")simple_weapons/weapons/alyxgun/alyxgun_fire2.wav",
		")simple_weapons/weapons/alyxgun/alyxgun_fire2a.wav",
		")simple_weapons/weapons/alyxgun/alyxgun_fire2b.wav"
	}
})

sound.Add({
	name = "Simple_Weapons_AlyxGun.Special1",
	channel = CHAN_WEAPON,
	volume = 0.7,
	level = 75,
	sound = ")simple_weapons/weapons/alyxgun/alyxgun_switch_burst.wav"
})

sound.Add({
	name = "Simple_Weapons_AlyxGun.Special2",
	channel = CHAN_WEAPON,
	volume = 0.7,
	level = 75,
	sound = ")simple_weapons/weapons/alyxgun/alyxgun_switch_single.wav"
})

sound.Add({
	name = "Simple_Weapons_AlyxGun.Burst",
	channel = CHAN_WEAPON,
	volume = 0.7,
	level = 140,
	pitch = {98, 105},
	sound = "^simple_weapons/weapons/alyxgun/alyxgun_fire3.wav"
})
