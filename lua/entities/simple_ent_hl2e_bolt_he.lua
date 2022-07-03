AddCSLuaFile()

simple_weapons.Include("Convars")

ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.AutomaticFrameAdvance = true

ENT.Model = Model("models/simple_weapons/crossbow_bolt_he.mdl")

ENT.Damage = 100

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInitBox(Vector(-0.3, -0.3, -0.3), Vector(0.3, 0.3, 0.3))
		self:SetMoveType(MOVETYPE_FLYGRAVITY, MOVECOLLIDE_FLY_BOUNCE)

		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

		self:SetGravity(0.4)

		local main = ents.Create("env_sprite")

		main:SetPos(self:GetPos())
		main:SetParent(self)
		main:SetKeyValue("model", "sprites/redglow1.vmt")
		main:SetKeyValue("scale", 0.1)
		main:SetKeyValue("GlowProxySize", 4)
		main:SetKeyValue("rendermode", 5)
		main:SetKeyValue("renderamt", 200)
		main:Spawn()
		main:Activate()

		local trail = ents.Create("env_spritetrail")

		trail:SetPos(self:GetPos())
		trail:SetParent(self)
		trail:SetKeyValue("spritename", "sprites/bluelaser1.vmt")
		trail:SetKeyValue("startwidth", 8)
		trail:SetKeyValue("endwidth", 1)
		trail:SetKeyValue("lifetime", 0.5)
		trail:SetKeyValue("rendermode", 5)
		trail:SetKeyValue("rendercolor", "255 0 0")
		trail:Spawn()
		trail:Activate()

		self:DeleteOnRemove(main)
		self:DeleteOnRemove(trail)

		self:EmitSound("Grenade.Blip")
	end
end

function ENT:Think()
	self:SetAngles(self:GetVelocity():Angle())
end

if SERVER then
	function ENT:Touch(ent)
		if bit.band(ent:GetSolidFlags(), FSOLID_VOLUME_CONTENTS + FSOLID_TRIGGER) > 0 then
			local takedamage = ent:GetSaveTable().m_takedamage

			if takedamage == 0 or takedamage == 1 then
				return
			end
		end

		local pos = self:WorldSpaceCenter()

		local explo = ents.Create("env_explosion")
		explo:SetOwner(self:GetOwner())
		explo:SetPos(pos)
		explo:SetKeyValue("iMagnitude", self.Damage * DamageMult:GetFloat())
		explo:SetKeyValue("spawnflags", 32)
		explo:Spawn()
		explo:Activate()
		explo:Fire("Explode")

		SafeRemoveEntity(self)
	end
end
