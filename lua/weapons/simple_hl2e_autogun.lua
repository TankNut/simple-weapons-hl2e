AddCSLuaFile()

simple_weapons.Include("Convars")

DEFINE_BASECLASS("simple_base_scoped")

SWEP.Base = "simple_base_scoped"

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
	Ammo = "AR2",

	ClipSize = 30,
	DefaultClip = 30,

	Damage = 40,
	Delay = 0.3,

	Range = 2000,
	Accuracy = 12,

	RangeModifier = 1,

	Recoil = {
		MinAng = Angle(1.4, -1, 0),
		MaxAng = Angle(1.8, 1, 0),
		Punch = 0.4,
		Ratio = 0.6
	},

	Reload = {
		Time = 1,
		Sound = "NPC_SScanner.DeployMine"
	},

	TracerName = "",
	Sound = "NPC_Combine_Cannon.FireBullet"
}

SWEP.ViewOffset = Vector(0, 4, -4)

SWEP.ScopeZoom = 3
SWEP.ScopeSound = "NPC_CombineCamera.Click"

function SWEP:ConsumeAmmo()
	self:TakePrimaryAmmo(3)
end

function SWEP:TranslateWeaponAnim(act)
	if act == ACT_VM_RELOAD then
		return
	end

	return act
end

function SWEP:ModifyBulletTable(bullet)
	bullet.Callback = function(attacker, tr, dmginfo)
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

if CLIENT then
	local constant = Angle(0, -0.003, 0)

	local function FormatViewModelAttachment(nFOV, vOrigin, bFrom)
		local vEyePos = EyePos()
		local aEyesRot = EyeAngles()
		local vOffset = vOrigin - vEyePos
		local vForward = aEyesRot:Forward()

		local nViewX = math.tan(nFOV * math.pi / 360)

		if (nViewX == 0) then
			vForward:Mul(vForward:Dot(vOffset))
			vEyePos:Add(vForward)

			return vEyePos
		end

		-- FIXME: LocalPlayer():GetFOV() should be replaced with EyeFOV() when it's binded
		local nWorldX = math.tan(LocalPlayer():GetFOV() * math.pi / 360)

		if (nWorldX == 0) then
			vForward:Mul(vForward:Dot(vOffset))
			vEyePos:Add(vForward)

			return vEyePos
		end

		local vRight = aEyesRot:Right()
		local vUp = aEyesRot:Up()

		if (bFrom) then
			local nFactor = nWorldX / nViewX
			vRight:Mul(vRight:Dot(vOffset) * nFactor)
			vUp:Mul(vUp:Dot(vOffset) * nFactor)
		else
			local nFactor = nViewX / nWorldX
			vRight:Mul(vRight:Dot(vOffset) * nFactor)
			vUp:Mul(vUp:Dot(vOffset) * nFactor)
		end

		vForward:Mul(vForward:Dot(vOffset))

		vEyePos:Add(vRight)
		vEyePos:Add(vUp)
		vEyePos:Add(vForward)

		return vEyePos
	end

	local beam = Material("effects/blueblacklargebeam")
	local sprite = CreateMaterial("simple_hl2e_autogun_sprite", "UnlitGeneric", {
		["$basetexture"] = "sprites/blueflare1",
		["$additive"] = 1,
		["$translucent"] = 1,
		["$vertexcolor"] = 1
	})

	function SWEP:DrawBeam(start, endpos)
		local length = start:Distance(endpos)
		local offset = CurTime() * 30

		render.SetMaterial(beam)
		render.StartBeam(2)
			render.AddBeam(start, 5, offset, color_white)
			render.AddBeam(endpos, 5, offset + length / 100, Color(0, 0, 0, 0))
		render.EndBeam()

		render.SetMaterial(sprite)
		render.DrawSprite(start, 30, 30, color_white)
	end

	function SWEP:PreDrawViewModel(vm, wep, ply)
		local att = vm:GetAttachment(1) -- I don't know why but without this the beam effect breaks completely

		if self:GetLowered() or not self:IsReady() then
			return
		end

		local offset = vm:WorldToLocalAngles(att.Ang)

		local diff = offset - constant
		local dir = (vm:GetAngles() + diff + ply:GetViewPunchAngles()):Forward()

		local tr = util.TraceLine({
			start = ply:GetShootPos(),
			endpos = FormatViewModelAttachment(self.ViewModelFOV, ply:GetShootPos() + dir * 56756, true),
			filter = {ply},
			mask = MASK_SHOT
		})

		cam.Start3D()
			cam.IgnoreZ(true)

			self:DrawBeam(att.Pos, tr.HitPos)
		cam.End3D()

		cam.IgnoreZ(true)
	end

	function SWEP:PostDrawTranslucentRenderables()
		if not self:GetOwner():ShouldDrawLocalPlayer() then
			return
		end

		if self:GetLowered() or not self:IsReady() then
			return
		end

		local ply = self:GetOwner()

		local att = self:GetAttachment(1)
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
