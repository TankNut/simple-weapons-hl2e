AddCSLuaFile()

DEFINE_BASECLASS("simple_base_scoped")

SWEP.Base = "simple_base_scoped"

SWEP.PrintName = "HE Crossbow"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 3

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_crossbow_he.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_crossbow_he.mdl")

SWEP.HoldType = "ar2"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "SMG1_Grenade",

	ClipSize = 1,
	DefaultClip = 3,

	Damage = 120,
	Delay = 0.75,

	Recoil = {
		MinAng = Angle(2, -0.3, 0),
		MaxAng = Angle(3, 0.3, 0),
		Punch = 0.2,
		Ratio = 0.4
	},

	Reload = {
		Sound = "Weapon_Crossbow.Reload"
	}
}

SWEP.ScopeZoom = 4.5

SWEP.NPCData = {
	Burst = {1, 1},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay, SWEP.Primary.Delay * 2}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_crossbow_he", title = "Simple Weapons: " .. SWEP.PrintName})

function SWEP:EmitFireSound()
	self:EmitSound("Weapon_Crossbow.Single")
	self:EmitSound("Weapon_Crossbow.BoltFly")
end

function SWEP:FireWeapon()
	local ply = self:GetOwner()

	self:EmitFireSound()

	self:SendTranslatedWeaponAnim(ACT_VM_PRIMARYATTACK)

	ply:SetAnimation(PLAYER_ATTACK1)

	if SERVER then
		local ent = ents.Create("simple_ent_hl2e_bolt_he")

		local ang = self:GetShootDir():Angle() - Angle(2, 0, 0)
		local dir = ang:Forward()

		ent:SetPos(ply:GetShootPos())
		ent:SetAngles(ang)

		ent:SetOwner(ply)

		ent:SetVelocity(dir * 2500)

		ent:Spawn()
		ent:Activate()
	end
end

function SWEP:TranslateWeaponAnim(act)
	if self:Clip1() == 0 and act == ACT_VM_IDLE then
		return ACT_VM_FIDGET
	end

	return act
end
