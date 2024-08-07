AddCSLuaFile()

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
	Cost = 3,

	ClipSize = 30,
	DefaultClip = 60,

	Damage = 40,
	Delay = 60 / 120,

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

	Sound = "NPC_Combine_Cannon.FireBullet",
	TracerName = ""
}

SWEP.ViewOffset = Vector(0, 4, -4)

SWEP.ScopeZoom = 3
SWEP.ScopeSound = "Simple_Weapons.CombineScope"

game.AddParticles("particles/weapon_fx.pcf")
PrecacheParticleSystem("Weapon_Combine_Ion_Cannon")

function SWEP:ModifyBulletTable(bullet)
	bullet.Callback = function(attacker, tr, dmginfo)
		dmginfo:ScaleDamage(self:GetDamageFalloff(tr.StartPos:Distance(tr.HitPos)))

		if SERVER then
			net.Start("simple_hl2e_autogun")
				net.WriteEntity(self)
				net.WriteVector(tr.HitPos)
			net.Broadcast()
		end
	end
end

if CLIENT then
	net.Receive("simple_hl2e_autogun", function()
		local ent = net.ReadEntity()

		if not IsValid(ent) or not ent.DoBeamEffect then
			return
		end

		ent:DoBeamEffect(net.ReadVector())
	end)
end

function SWEP:TranslateWeaponAnim(act)
	if act == ACT_VM_RELOAD then
		return
	end

	return act
end

function SWEP:DoBeamEffect(vec)
	util.ParticleTracerEx("Weapon_Combine_Ion_Cannon", self:GetOwner():GetShootPos(), Vector(vec), true, self:EntIndex(), 1)
end

if CLIENT then
	local constant = Angle(0, -0.003, 0)

	local beam = Material("effects/blueblacklargebeam")
	local sprite = CreateMaterial("simple_hl2e_autogun_sprite", "UnlitGeneric", {
		["$basetexture"] = "sprites/blueflare1",
		["$additive"] = 1,
		["$translucent"] = 1,
		["$vertexcolor"] = 1
	})

	function SWEP:ShouldDrawBeam()
		if self:GetLowered() or not self:IsReady() then
			return false
		end

		if self:IsEmpty() or self:IsReloading() then
			return false
		end

		return true
	end

	function SWEP:DrawBeam(start, endpos, view)
		local length = start:Distance(endpos)
		local beamSize = 5
		local spriteSize = 30

		if view then
			local const = math.pi / 360

			beamSize = (math.tan(self.ViewModelTargetFOV * const) / math.tan(self.ViewModelFOV * const)) * 6
			spriteSize = (math.tan(self.ViewModelTargetFOV * const) / math.tan(self.ViewModelFOV * const)) * 30
		end

		render.SetMaterial(beam)
		render.StartBeam(2)
			render.AddBeam(start, beamSize, 0, color_white)
			render.AddBeam(endpos, beamSize, length / 64, Color(0, 0, 0, 0))
		render.EndBeam()

		render.SetMaterial(sprite)
		render.DrawSprite(start, spriteSize, spriteSize, color_white)
	end

	local overlay = Material("effects/combine_binocoverlay")

	function SWEP:DrawScope(x, y)
		surface.SetMaterial(overlay)
		surface.SetDrawColor(255, 255, 255)

		surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
	end

	function SWEP:PreDrawViewModel(vm, wep, ply)
		local att = vm:GetAttachment(1) -- I don't know why but without this the beam effect breaks completely

		if not self:ShouldDrawBeam() then
			return
		end

		local offset = vm:WorldToLocalAngles(att.Ang)

		local diff = offset - constant
		local dir = (vm:GetAngles() + diff + ply:GetViewPunchAngles()):Forward()

		local const = math.pi / 360
		local fov1, fov2 = self.ViewModelTargetFOV, self.ViewModelFOV
		local ratio = math.tan(math.min(fov1, fov2) * const) / math.tan(math.max(fov1, fov2) * const)

		local tr = util.TraceLine({
			start = ply:GetShootPos(),
			endpos = simple_weapons.FormatViewModelAttachment(self.ViewModelFOV * ratio, ply:GetShootPos() + dir * 56756, true),
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
		local ply = self:GetOwner()

		if ply == LocalPlayer() and not ply:ShouldDrawLocalPlayer() then
			return
		end

		if not self:ShouldDrawBeam() then
			return
		end

		local origin = ply:GetShootPos()
		local pos = origin

		local att = self:GetAttachment(1)

		if att then
			pos = att.Pos
		end

		local dir = (ply:GetAimVector():Angle() + ply:GetViewPunchAngles()):Forward()

		local tr = util.TraceLine({
			start = origin,
			endpos = origin + dir * 56756,
			filter = {ply},
			mask = MASK_SHOT
		})

		self:DrawBeam(pos, tr.HitPos)
	end
end
