AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Teleport Destination"
ENT.Category = "Fallout Roleplay"
ENT.Author = "Johnny Guitar"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "UID")
end

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_c17/streetsign005c.mdl")
		self:SetSolid(SOLID_NONE)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetHealth(100)
		self:SetUseType(SIMPLE_USE)
		self:SetUID("DefaultUID")

		local physicsObject = self:GetPhysicsObject();

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
			physicsObject:EnableMotion(true)
		end
	end

	function ENT:Use(client)
		if !client:IsPlayer() then
			return
		end
		
	end
end

