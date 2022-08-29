AddCSLuaFile()

simple_weapons.Include("Convars")

SWEP.Base = "simple_base"

SWEP.PrintName = "OICW"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 2

SWEP.Spawnable = true

SWEP.UseHands = false

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/v_oicw.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_oicw.mdl")

SWEP.HoldType = "ar2"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = -1

SWEP.Primary = {
	Ammo = "AR2",

	ClipSize = 30,
	DefaultClip = 60,

	Damage = 20,
	Delay = 60 / 500,

	Range = 700,
	Accuracy = 12,

	RangeModifier = 0.89,

	Recoil = {
		MinAng = Angle(0.8, -0.6, 0),
		MaxAng = Angle(1, 0.6, 0),
		Punch = 0.4,
		Ratio = 0.4
	},

	Sound = "Simple_Weapons_OICW.Single",
	TracerName = "Tracer"
}

SWEP.Secondary = {
	Ammo = "SMG1_Grenade"
}

SWEP.NPCData = {
	Burst = {2, 5},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 5, SWEP.Primary.Delay * 6}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_oicw", title = "Simple Weapons: " .. SWEP.PrintName})

sound.Add({
	name = "Simple_Weapons_OICW.Single",
	channel = CHAN_WEAPON,
	volume = 0.4,
	level = 140,
	pitch = {95, 105},
	sound = {
		")simple_weapons/weapons/oicw/ar1_1.wav",
		")simple_weapons/weapons/oicw/ar1_2.wav",
		")simple_weapons/weapons/oicw/ar1_3.wav"
	}
})

-- ACT_VM_RECOIL support
local transitions = {
	[ACT_VM_PRIMARYATTACK] = ACT_VM_RECOIL1,
	[ACT_VM_RECOIL1] = ACT_VM_RECOIL2,
	[ACT_VM_RECOIL2] = ACT_VM_RECOIL3,
	[ACT_VM_RECOIL3] = ACT_VM_RECOIL3
}

function SWEP:TranslateWeaponAnim(act)
	if act == ACT_VM_PRIMARYATTACK then
		local lookup = transitions[self:GetActivity()]

		if lookup then
			act = lookup
		end
	end

	return act
end

function SWEP:CanAltFire()
	if self:HandleAutoRaise() or self:IsReloading() then
		return false
	end

	if InfiniteAmmo:GetInt() == 0 and self:GetOwner():GetAmmoCount(self.Secondary.Ammo) < 1 then
		self:EmitEmptySound()

		self:SetNextFire(CurTime() + 0.2)

		self.Primary.Automatic = false

		return false
	end

	return true
end

function SWEP:AltFire()
	local ply = self:GetOwner()

	self:TakeSecondaryAmmo(1)

	self:EmitSound("Weapon_SMG1.Double")

	self:SendTranslatedWeaponAnim(ACT_VM_SECONDARYATTACK)

	ply:SetAnimation(PLAYER_ATTACK1)

	if SERVER then
		local ent = ents.Create("simple_ent_hl2e_20mm")

		local ang = ply:GetAimVector():Angle() + ply:GetViewPunchAngles()
		local dir = ang:Forward()

		ent:SetPos(ply:GetShootPos())
		ent:SetAngles(ang)

		ent:SetOwner(ply)

		ent:SetVelocity(dir * 2500)

		ent:Spawn()
		ent:Activate()
	end

	self:ApplyRecoil()

	self.Primary.Automatic = true

	self:SetNextIdle(CurTime() + self:SequenceDuration())
	self:SetNextFire(CurTime() + 0.5)
	self:SetNextAltFire(CurTime() + 1)
end
