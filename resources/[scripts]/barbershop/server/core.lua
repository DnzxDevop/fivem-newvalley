-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
QuantumGG = {}
Tunnel.bindInterface("barbershop", QuantumGG)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.Update(Table,Creation)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.Query("playerdata/SetData",{ Passport = Passport, Name = "Barbershop", Information = json.encode(Table) })

		if Creation then
			vRP.Query("playerdata/SetData",{ Passport = Passport, Name = "Creator", Information = json.encode(1) })
		end
	end
end

QuantumGG.SwitchBucket = function()
	source = source
	local id = vRP.Passport(source)
	local bucket = id + 20
	TriggerEvent("vRP:BucketServer",source,"Enter",bucket)
end

QuantumGG.removeBucket = function()
	source = source
	TriggerEvent("vRP:BucketServer",source,"Exit")
end