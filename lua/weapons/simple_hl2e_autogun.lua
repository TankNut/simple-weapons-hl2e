AddCSLuaFile()

simple_weapons.Include("Convars")

DEFINE_BASECLASS("simple_base_scoped")

SWEP.Base = "simple_base_scoped"

SWEP.RenderGroup = RENDERGROUP_OPAQUE

SWEP.PrintName = "Portable Autogun"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 4

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_autogun.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_autogun.mdl")

SWEP.HoldType = "rpg"
SWEP.LowerHoldType = "physgun"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "AR2AltFire",

	ClipSize = -1,
	DefaultClip = 3,

	Damage = 120,
	Delay = 1.4,

	Range = 2000,
	Accuracy = 12,

	RangeModifier = 0.9,

	Recoil = {
		MinAng = Angle(1.4, -0.6, 0),
		MaxAng = Angle(1.8, 0.6, 0),
		Punch = 0.6,
		Ratio = 0.2
	},

	TracerName = "",
	Sound = "NPC_Combine_Cannon.FireBullet"
}

SWEP.ViewOffset = Vector(0, 4, -3)

SWEP.ScopeZoom = {2, 6}
SWEP.ScopeSound = "NPC_CombineCamera.Click"

function SWEP:CanPrimaryAttack()
	local ok = BaseClass.CanPrimaryAttack(self)

	if not ok then
		return false
	end

	if InfiniteAmmo:GetInt() == 0 and self:GetOwner():GetAmmoCount(self.Primary.Ammo) < 1 then
		self:EmitSound("buttons/combine_button_locked.wav", 75, 100, 0.7, CHAN_STATIC)

		self:SetNextPrimaryFire(CurTime() + 0.8)

		self.Primary.Automatic = false

		return false
	end

	return true
end

function SWEP:ConsumeAmmo()
	if InfiniteAmmo:GetInt() == 0 then
		self:GetOwner():RemoveAmmo(1, self.Primary.Ammo)
	end
end

function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound)
end

function SWEP:ModifyBulletTable(bullet)
	bullet.Callback = function(attacker, tr, dmginfo)
		dmginfo:SetDamageType(DMG_AIRBOAT + DMG_BLAST)
		dmginfo:ScaleDamage(self:GetDamageFalloff(tr.StartPos:Distance(tr.HitPos)))

		if game.SinglePlayer() then
			self:CallOnClient("DoBeamEffect", tostring(tr.HitPos))
		else
			self:DoBeamEffect(tostring(tr.HitPos))
		end
	end
end

function SWEP:DoBeamEffect(vec)
	util.ParticleTracerEx("Weapon_Combine_Ion_Cannon", self:GetOwner():GetShootPos(), Vector(vec), true, self:EntIndex(), 1)
end

function SWEP:CanReload()
	return false
end

if CLIENT then
	function SWEP:PreDrawViewModel(vm, wep, ply)
		cam.Start3D()
			vm:GetAttachment(1) -- I don't know why but without this the beam effect breaks completely
		cam.End3D()

		cam.IgnoreZ(true)
	end

	function SWEP:CustomAmmoDisplay()
		return {
			Draw = true,
			PrimaryClip = self:GetOwner():GetAmmoCount(self.Primary.Ammo)
		}
	end
end
