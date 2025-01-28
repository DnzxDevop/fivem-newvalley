-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
QuantumGG = {}
Tunnel.bindInterface("valley", QuantumGG)
vCLIENT = Tunnel.getInterface("valley")

QuantumGG.CheckEnter = function()
	source = source
	local Id = vRP.Passport(source)
	if Id == 3 or 2 then
		return true
	else
		return false
	end
end