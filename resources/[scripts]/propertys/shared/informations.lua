-----------------------------------------------------------------------------------------------------------------------------------------
-- INFORMATIONS
-----------------------------------------------------------------------------------------------------------------------------------------
Informations = {
	["Emerald"] = {
		["Price"] = 500000,
		["Vault"] = 125,
		["Fridge"] = 35,
		["Gemstone"] = 12000
	},
	["Ruby"] = {
		["Price"] = 750000,
		["Vault"] = 185,
		["Fridge"] = 50,
		["Gemstone"] = 11000
	},
	["Sapphire"] = {
		["Price"] = 1000000,
		["Vault"] = 250,
		["Fridge"] = 65,
		["Gemstone"] = 10500
	},
	["Amethyst"] = {
		["Price"] = 1500000,
		["Vault"] = 375,
		["Fridge"] = 95,
		["Gemstone"] = 10000
	},
	["Amber"] = {
		["Price"] = 2000000,
		["Vault"] = 500,
		["Fridge"] = 125,
		["Gemstone"] = 9500
	},
	["Galpão"] = {
		["Price"] = 250000,
		["Vault"] = 100,
		["Gemstone"] = 8900
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Informations",function()
	local Table = {}

	for Name,v in pairs(Informations) do
		if Name ~= "Galpão" then
			Table[#Table + 1] = Name
		end
	end

	return Table[math.random(#Table)]
end)