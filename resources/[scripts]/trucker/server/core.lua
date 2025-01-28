-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
QuantumGG = {}
Tunnel.bindInterface("trucker",QuantumGG)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Drops = {
	{ ["Item"] = "plastic", ["Chance"] = 75, ["Min"] = 225, ["Max"] = 275, ["Addition"] = 0.050 },
	{ ["Item"] = "glass", ["Chance"] = 75, ["Min"] = 225, ["Max"] = 275, ["Addition"] = 0.050 },
	{ ["Item"] = "rubber", ["Chance"] = 75, ["Min"] = 225, ["Max"] = 275, ["Addition"] = 0.050 },
	{ ["Item"] = "aluminum", ["Chance"] = 25, ["Min"] = 175, ["Max"] = 200, ["Addition"] = 0.025 },
	{ ["Item"] = "copper", ["Chance"] = 25, ["Min"] = 175, ["Max"] = 200, ["Addition"] = 0.025 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.Payment()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		Active[Passport] = true

		local Coords = vRP.GetEntityCoords(source)
		if not vRPC.LastVehicle(source,"packer") or #(Coords - vec3(1256.59,-3239.63,5.17)) > 25 then
			exports["discord"]:Embed("Hackers","**Passaporte:** "..Passport.."\n**Função:** Payment do Trucker",0xa3c846,source)
		end

		local GainExperience = 15
		local Result = RandPercentage(Drops)
		local Experience,Level = vRP.GetExperience(Passport,"Trucker")
		local Valuation = 3500


		if vRP.UserPremium(Passport) then
			local Bonification = 0.05
			local Hierarchy = vRP.LevelPremium(source)

			if Hierarchy == 1 then
				Bonification = 0.300
			elseif Hierarchy == 2 then
				Bonification = 0.250
			elseif Hierarchy == 3 then
				Bonification = 0.200
			elseif Hierarchy == 4 then
				Bonification = 0.175
			elseif Hierarchy == 5 then
				Bonification = 0.150
			elseif Hierarchy == 6 then
				Bonification = 0.125
			elseif Hierarchy == 7 then
				Bonification = 0.100
			elseif Hierarchy == 8 then
				Bonification = 0.075
			end
			

			GainExperience = GainExperience + 10
			Valuation = Valuation + Valuation * Bonification
		end

		
			vRP.GenerateItem(Passport,'dollar',Valuation,true)

			TriggerClientEvent("Notify",source,"Mochila Sobrecarregada","Sua recompensa caiu no chão.","roxo",5000)
			exports["inventory"]:Drops(Passport,source,"dollar",Valuation)
		end

		vRP.UpgradeStress(Passport,10)

		Active[Passport] = nil
	end
