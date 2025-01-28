-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["cocaine"] = {
		["Timer"] = 15,
		["Percentage"] = 900,
		["Price"] = { ["Min"] = 75, ["Max"] = 100 },
		["Amount"] = { ["Min"] = 2, ["Max"] = 4 }
	},
	["meth"] = {
		["Timer"] = 15,
		["Percentage"] = 900,
		["Price"] = { ["Min"] = 75, ["Max"] = 100 },
		["Amount"] = { ["Min"] = 2, ["Max"] = 4 }
	},
	["joint"] = {
		["Timer"] = 15,
		["Percentage"] = 900,
		["Price"] = { ["Min"] = 75, ["Max"] = 100 },
		["Amount"] = { ["Min"] = 2, ["Max"] = 4 }
	},
	["cokesack"] = {
		["Timer"] = 30,
		["Percentage"] = 725,
		["Price"] = { ["Min"] = 500, ["Max"] = 625 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 1 }
	},
	["methsack"] = {
		["Timer"] = 30,
		["Percentage"] = 725,
		["Price"] = { ["Min"] = 500, ["Max"] = 625 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 1 }
	},
	["weedsack"] = {
		["Timer"] = 30,
		["Percentage"] = 725,
		["Price"] = { ["Min"] = 500, ["Max"] = 625 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 1 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.CheckDrugs()
	local Return = false
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		for Item,v in pairs(List) do
			local Price = math.random(v["Price"]["Min"],v["Price"]["Max"])
			local Amount = math.random(v["Amount"]["Min"],v["Amount"]["Max"])

			if vRP.ConsultItem(Passport,Item,Amount) then
				Drugs[Passport] = { Item,Amount,Price * Amount,v["Percentage"] }
				Return = v["Timer"]

				break
			end
		end
	end

	return Return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.PaymentDrugs()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Drugs[Passport] and vRP.TakeItem(Passport,Drugs[Passport][1],Drugs[Passport][2]) then
		Active[Passport] = true

		local GainExperience = 2
		local Amount = Drugs[Passport][3]
		local Experience,Level = vRP.GetExperience(Passport,"Traffic")
		local Valuation = Amount + Amount * (0.05 * Level)

		if exports["inventory"]:Buffs("Dexterity",Passport) then
			Valuation = Valuation + (Valuation * 0.1)
		end

		if vRP.UserPremium(Passport) then
			local Bonification = 0.050
			local Hierarchy = vRP.LevelPremium(source)

			if Hierarchy == 1 then
				Bonification = 0.100
			elseif Hierarchy == 2 then
				Bonification = 0.075
			end

			GainExperience = GainExperience + 1
			Valuation = Valuation + (Valuation * Bonification)
		end

		TriggerClientEvent("player:Residual",source,"Resíduo de Orgânicos")
		vRP.GenerateItem(Passport,"dirtydollar",Valuation,true)
		vRP.PutExperience(Passport,"Traffic",GainExperience)
		vRP.UpgradeStress(Passport,1)
		local Coords = vRP.GetEntityCoords(source)
		local Permission = vRP.NumPermission('Policia')
		for Passports,Sources in pairs(Permission) do
			async(function()
				TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Venda de Drogas", text = 'Venda de drogas identificada!!', x = Coords["x"], y = Coords["y"], z = Coords["z"], time = "Recebido às " .. os.date("%H:%M"), blipColor = 2 })
			end)
		end

		Active[Passport] = nil
		Drugs[Passport] = nil
	end
end