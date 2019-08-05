util.AddNetworkString("nutPACSync")
util.AddNetworkString("nutPACPartAdd")
util.AddNetworkString("nutPACPartRemove")
util.AddNetworkString("nutPACPartReset")

local playerMeta = FindMetaTable("Entity")

function playerMeta:getParts()
	return self:getNetVar("parts", {})
end

function playerMeta:syncParts()
	net.Start("nutPACSync")
	net.Send(self)
end
print("PAC LOAD PAC LOAD PAC LOAD PAC LOADPAC LOAD PAC LOADPAC LOAD PAC LOAD\n PAC LOAD PAC LOADPAC LOAD PAC LOAD")
function playerMeta:addPart(partID)
	if (self:getParts()[partID]) then return end
	net.Start("nutPACPartAdd")
		net.WriteEntity(self)
		net.WriteString(partID)
	net.Broadcast()

	local parts = self:getParts()
	parts[partID] = true
	self:setNetVar("parts", parts)
end

function playerMeta:removePart(partID)
	net.Start("nutPACPartRemove")
		net.WriteEntity(self)
		net.WriteString(partID)
	net.Broadcast()

	local parts = self:getParts()
	parts[partID] = nil
	self:setNetVar("parts", parts)
end

function playerMeta:resetParts()
	net.Start("nutPACPartReset")
		net.WriteEntity(self)
	net.Broadcast()
	self:setNetVar("parts", {})
end

function PLUGIN:PostPlayerInitialSpawn(client)
	timer.Simple(1, function()
		client:syncParts()
	end)
end

function PLUGIN:PlayerLoadout(client)
	client:resetParts()
end


