AddCSLuaFile()

SWEP.Base = "simple_base_scoped"

SWEP.PrintName = "Combine Sniper"
SWEP.Category = "Simple Weapons: Half-Life 2 Extended"

SWEP.Slot = 3

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 54

SWEP.ViewModel = Model("models/simple_weapons/weapons/c_cisr.mdl")
SWEP.WorldModel = Model("models/simple_weapons/weapons/w_cisr.mdl")

SWEP.HoldType = "ar2"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = -1

SWEP.Primary = {
	Ammo = "AR2",
	Cost = 5,

	ClipSize = 5,
	DefaultClip = 50,

	Damage = 120,
	Delay = 1,

	Range = 4000,
	Accuracy = 12,

	UnscopedRange = 100,
	UnscopedAccuracy = 12,

	RangeModifier = 0.98,

	Recoil = {
		MinAng = Angle(2, -0.6, 0),
		MaxAng = Angle(2.4, 0.6, 0),
		Punch = 0.4,
		Ratio = 0.6
	},

	Reload = {
		Time = 1.3,
		Sound = "NPC_Sniper.Reload"
	},

	Sound = "NPC_Sniper.FireBullet",
	TracerName = "AirboatGunTracer"
}

SWEP.ScopeZoom = 9
SWEP.ScopeSound = "NPC_CombineCamera.Click"

function SWEP:ModifyBulletTable(bullet)
	bullet.Callback = function(attacker, tr, dmginfo)
		dmginfo:ScaleDamage(self:GetDamageFalloff(tr.StartPos:Distance(tr.HitPos)))

		local dist = tr.StartPos:Distance(tr.HitPos)
		local time = dist / 6000

		timer.Simple(time * 0.5, function()
			sound.Play("NPC_Sniper.SonicBoom", tr.StartPos + tr.Normal * dist * 0.5)
		end)
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
	local constant = Angle(0, -0.001, -0.001)

	local beam = Material("effects/bluelaser1")
	local sprite = Material("effects/blueflare1")

	local beamColor = Color(0, 100, 255)
	local spriteColor = Color(50, 190, 255)

	function SWEP:DoDrawCrosshair(x, y)
		return true
	end

	function SWEP:ShouldDrawBeam()
		if self:GetLowered() or not self:IsReady() then
			return false
		end

		if self:IsEmpty() then
			return false
		end

		if self:GetScopeIndex() == 0 then
			return false
		end

		return true
	end

	function SWEP:DrawBeam(start, endpos, view)
		local length = start:Distance(endpos)
		local width = 1

		if view then
			local const = math.pi / 360

			width = math.tan(self.ViewModelTargetFOV * const) / math.tan(self.ViewModelFOV * const)
		end

		render.SetMaterial(beam)
		render.StartBeam(2)
			render.AddBeam(start, width, 0, beamColor)
			render.AddBeam(endpos, width, length / 819.6, beamColor)
		render.EndBeam()

		render.SetMaterial(sprite)
		render.DrawSprite(endpos, 4, 4, spriteColor)
	end

	function SWEP:PreDrawViewModel(vm, wep, ply)
		if not self:ShouldDrawBeam() then
			return
		end

		local att = vm:GetAttachment(2)

		local offset = vm:WorldToLocalAngles(att.Ang)

		local diff = offset - constant
		local dir = (vm:GetAngles() + diff + ply:GetViewPunchAngles()):Forward()

		local tr = util.TraceLine({
			start = ply:GetShootPos(),
			endpos = simple_weapons.FormatViewModelAttachment(self.ViewModelFOV, ply:GetShootPos() + dir * 56756, true),
			filter = {ply},
			mask = MASK_SHOT
		})

		cam.Start3D()
			cam.IgnoreZ(true)

			self:DrawBeam(att.Pos, tr.HitPos, true)
		cam.End3D()

		cam.IgnoreZ(true)
	end

	function SWEP:PostDrawTranslucentRenderables()
		if not self:GetOwner():ShouldDrawLocalPlayer() then
			return
		end

		if not self:ShouldDrawBeam() then
			return
		end

		local ply = self:GetOwner()

		local att = self:GetAttachment(2)
		local dir = (ply:GetAimVector():Angle() + ply:GetViewPunchAngles()):Forward()

		local tr = util.TraceLine({
			start = ply:GetShootPos(),
			endpos = ply:GetShootPos() + dir * 56756,
			filter = {ply},
			mask = MASK_SHOT
		})

		self:DrawBeam(att.Pos, tr.HitPos)
	end
end
