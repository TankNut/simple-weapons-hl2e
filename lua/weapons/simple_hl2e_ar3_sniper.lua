AddCSLuaFile()

DEFINE_BASECLASS("simple_base_scoped")

SWEP.Base = "simple_base_scoped"

SWEP.PrintName = "AR3 DMR"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 3

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_ar3_sniper.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_ar3_sniper.mdl")

SWEP.HoldType = "smg"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = 0

SWEP.Primary = {
	Ammo = "AR2",
	Cost = 2,

	ClipSize = 20,
	DefaultClip = 40,

	Damage = 32,
	Delay = 60 / 200,

	Range = 2000,
	Accuracy = 12,

	UnscopedRange = 200,
	UnscopedAccuracy = 12,

	RangeModifier = 0.98,

	Recoil = {
		MinAng = Angle(2, -0.6, 0),
		MaxAng = Angle(2.4, 0.6, 0),
		Punch = 0.4,
		Ratio = 0.6
	},

	Sound = "Weapon_AR2.Single",
	TracerName = "AirboatGunTracer"
}

SWEP.ViewOffset = Vector(0, 0, -1)

SWEP.ScopeZoom = 4
SWEP.ScopeSound = "NPC_CombineCamera.Click"

SWEP.NPCData = {
	Burst = {1, 1},
	Delay = SWEP.Primary.Delay,
	Rest = {SWEP.Primary.Delay * 2, SWEP.Primary.Delay * 3}
}

list.Add("NPCUsableWeapons", {class = "simple_hl2e_ar3_sniper", title = "Simple Weapons: " .. SWEP.PrintName})

if SERVER then
	function SWEP:GetNPCBulletSpread(prof)
		return BaseClass.GetNPCBulletSpread(self, prof) * 0.5
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

if CLIENT then
	local scope = Material("gmod/scope")
	local overlay = Material("effects/combine_binocoverlay")

	function SWEP:DrawScope(x, y)
		local screenW = ScrW()
		local screenH = ScrH()

		local h = screenH
		local w = (4 / 3) * h

		local dw = (screenW - w) * 0.5

		surface.SetMaterial(overlay)
		surface.SetDrawColor(255, 255, 255)

		surface.DrawTexturedRect(0, 0, screenW, screenH)

		surface.SetMaterial(scope)
		surface.SetDrawColor(0, 0, 0)

		surface.DrawRect(0, 0, dw, h)
		surface.DrawRect(w + dw, 0, dw, h)

		surface.DrawTexturedRect(dw, 0, w, h)
	end
end
