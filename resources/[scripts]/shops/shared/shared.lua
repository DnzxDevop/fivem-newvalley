-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
ItemList = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTARTSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Shop,v in pairs(List) do
		if not ItemList[Shop] then
			ItemList[Shop] = {}
		end

		for Item,Value in pairs(v["List"]) do
			local Number = #ItemList[Shop] + 1

			ItemList[Shop][Number] = {
				["name"] = ItemName(Item),
				["weight"] = ItemWeight(Item),
				["index"] = ItemIndex(Item),
				["rarity"] = ItemRarity(Item),
				["economy"] = ItemEconomy(Item),
				["desc"] = ItemDescription(Item),
				["key"] = Item,
				["price"] = Value
			}
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATION
-----------------------------------------------------------------------------------------------------------------------------------------
Location = {
	{
		["Coords"] = vec3(24.51,-1346.75,29.49),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(2556.77,380.87,108.61),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1147.69,106.65,81.47),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1164.81,-323.61,69.2),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-706.16,-914.55,19.21),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-47.35,-1758.59,29.42),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(372.7,326.89,103.56),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-3242.7,1000.05,12.82),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1728.08,6415.6,35.03),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(549.09,2670.89,42.16),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1959.87,3740.44,32.33),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(2677.65,3279.66,55.23),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1697.32,4923.46,42.06),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-1819.52,793.48,138.08),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1391.62,3605.95,34.98),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-2966.41,391.52,15.05),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-3039.42,584.42,7.9),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1134.32,-983.09,46.4),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(1165.32,2710.79,38.15),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-1486.72,-377.61,40.15),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-1221.48,-907.93,12.32),
		["Mode"] = "Departament",
	},{
		["Coords"] = vec3(-1816.64,-1193.73,14.31),
		["Mode"] = "Fishing"
	},{
		["Coords"] = vec3(-1593.08,5202.9,4.31),
		["Mode"] = "Hunting"
	},{
		["Coords"] = vec3(-1297.78,368.22,67.8),
		["Mode"] = "Paramedico"
	},{
		["Coords"] = vec3(2525.28,-332.83,101.89),
		["Mode"] = "Fbi",
	},{
		["Coords"] = vec3(474.33,-990.77,26.27),
		["Mode"] = "Policia",
	},{
		["Coords"] = vec3(-628.79,-238.7,38.05),
		["Mode"] = "Miners"
	},{
		["Coords"] = vec3(714.07,-961.62,30.4),
		["Mode"] = "Cust",
		["Circle"] = 3.0,
	},{
		["Coords"] = vec3(511.71,-1804.36,28.51),
		["Mode"] = "AmmoBench"
	},{
		["Coords"] = vec3(232.58,-1751.01,29.0),
		["Mode"] = "WeaponBench"
	},{
		["Coords"] = vec3(92.52,-1982.2,20.44),
		["Mode"] = "DrugsBench"
	},{
		["Coords"] = vec3(-28.47,-1429.34,31.34),
		["Mode"] = "DrugsBench"
	},{
		["Coords"] = vec3(348.06,-2069.76,20.91),
		["Mode"] = "DrugsBench"
	},{
		["Coords"] = vec3(179.9,2779.98,45.7),
		["Mode"] = "Clandestine"
	},{
		["Coords"] = vec3(46.7,-1749.71,29.62),
		["Mode"] = "Megamall"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
List = {
	["Departament"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["postit"] = 20,
			["cigarette"] = 15,
			["cellphone"] = 1200,
			["vape"] = 4750,
			["camera"] = 425,
			["binoculars"] = 425,
			["radio"] = 800,
			["lighter"] = 225,
			["emptybottle"] = 15,

			["sugarbox"] = 35,
			["condensedmilk"] = 25,
			["mayonnaise"] = 20,
			["ryebread"] = 20,
			["ricebag"] = 105
		}
	},

	["Cust"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["backpackp"] = 15000,
			["backpackm"] = 25000,
		}
	},
	["WeaponBench"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["smg_bench"] = 100000,
			["rifle_bench"] = 140000,
			["pistol_bench"] = 70000,
		}
	},
	["DrugsBench"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["cokeclone"] = 0000,
			["weedclone"] = 40000,
			["drugs_bench"] = 60000,
		}
	},
	["AmmoBench"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["smg_bench"] = 100000,
			["rifle_bench"] = 140000,
			["pistol_bench"] = 70000,
		}
	},
	["Megamall"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["worm"] = 5,
			["rope"] = 925,
			["scuba"] = 975,
			["notepad"] = 10,
			["suitcase"] = 275,
			["WEAPON_BRICK"] = 25,
			["WEAPON_SHOES"] = 25,
			["alliance"] = 525,
			["GADGET_PARACHUTE"] = 225,
			["axe"] = 1225,
			["pickaxe"] = 1225,
			["fishingrod"] = 1225
		}
	},
	["Clandestine"] = {
		["Mode"] = "Sell",
		["Type"] = "Consume",
		["Item"] = "dirtydollar",
		["List"] = {
			["scotchtape"] = 45,
			["insulatingtape"] = 55,
			["screws"] = 45,
			["screwnuts"] = 45,
			["safependrive"] = 3325,
			["weaponparts"] = 125,
			["rammemory"] = 375,
			["powersupply"] = 475,
			["processorfan"] = 325,
			["processor"] = 725,
			["videocard"] = 4225,
			["ssddrive"] = 525,
			["powercable"] = 225,
			["electroniccomponents"] = 375,
			["techtrash"] = 95,
			["tarp"] = 65,
			["sheetmetal"] = 65,
			["roadsigns"] = 65,
			["explosives"] = 105,
			["sulfuric"] = 75,
			["batteryaa"] = 225,
			["batteryaaplus"] = 275,
			["goldnecklace"] = 625,
			["silverchain"] = 425,
			["horsefigurine"] = 2425,
			["toothpaste"] = 175,
			["races"] = 175,
			["pistolbody"] = 275,
			["smgbody"] = 525,
			["riflebody"] = 975,
			["pager"] = 425
		}
	},
	["Coffee"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["coffeecup"] = 20
		}
	},
	["Soda"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["cola"] = 20,
			["soda"] = 20,
			["water"] = 35
		}
	},
	["Donut"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["donut"] = 15,
			["chocolate"] = 20
		}
	},
	["Hamburger"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["hamburger"] = 25
		}
	},
	["Hotdog"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["hotdog"] = 20
		}
	},
	["Chihuahua"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["hotdog"] = 20,
			["hamburger"] = 25,
			["cola"] = 20,
			["soda"] = 20,
			["water"] = 35
		}
	},
	["Water"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["water"] = 35
		}
	},
	["Cigarette"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["cigarette"] = 15,
			["lighter"] = 225
		}
	},
	["Fuel"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["WEAPON_PETROLCAN"] = 325
		}
	},
	["Paramedico"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["Permission"] = "Paramedico",
		["List"] = {
			["syringe01"] = 45,
			["syringe02"] = 45,
			["syringe03"] = 45,
			["syringe04"] = 45,
			["bandage"] = 115,
			["gauze"] = 75,
			["gdtkit"] = 25,
			["medkit"] = 285,
			["sinkalmy"] = 185,
			["analgesic"] = 65,
			["ritmoneury"] = 235,
			["medicbag"] = 725,
			["adrenaline"] = 3225
		}
	},
	["Hunting"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["boar1star"] = 275,
			["boar2star"] = 300,
			["boar3star"] = 325,
			["deer1star"] = 275,
			["deer2star"] = 300,
			["deer3star"] = 325,
			["coyote1star"] = 275,
			["coyote2star"] = 300,
			["coyote3star"] = 325,
			["mtlion1star"] = 275,
			["mtlion2star"] = 300,
			["mtlion3star"] = 325
		}
	},
	["Fishing"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["sardine"] = 65,
			["smalltrout"] = 65,
			["orangeroughy"] = 65,
			["anchovy"] = 70,
			["catfish"] = 70,
			["herring"] = 75,
			["yellowperch"] = 75,
			["salmon"] = 125,
			["smallshark"] = 250
		}
	},
	["Miners"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["tin_pure"] = 40,
			["lead_pure"] = 40,
			["copper_pure"] = 42,
			["iron_pure"] = 45,
			["gold_pure"] = 50,
			["diamond_pure"] = 50,
			["ruby_pure"] = 60,
			["sapphire_pure"] = 60,
			["emerald_pure"] = 75
		}
	},
	["Fbi"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["Permission"] = "Fbi",
		["List"] = {
			["vest"] = 125,
			["gsrkit"] = 25,
			["gdtkit"] = 25,
			["barrier"] = 25,
			["handcuff"] = 125,
			--["WEAPON_SMG"] = 2600,
			["WEAPON_COMBATPISTOL"] = 1200,
			-- ["WEAPON_TACTICALRIFLE"] = 1800,
			-- ["WEAPON_CARBINERIFLE"] = 1800,
			-- -- ["WEAPON_SMG_AMMO"] = 10,
			-- ["WEAPON_RIFLE_AMMO"] = 10,
			["WEAPON_PISTOL_AMMO"] = 10,
			["spikestrips"] = 275
		}
	},
	["Policia"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["Permission"] = "Policia",
		["List"] = {
			["vest"] = 125,
			["gsrkit"] = 25,
			["gdtkit"] = 25,
			["barrier"] = 25,
			["handcuff"] = 125,
			-- ["WEAPON_SMG"] = 2600,
			["WEAPON_COMBATPISTOL"] = 1200,
			-- ["WEAPON_TACTICALRIFLE"] = 1800,
			-- ["WEAPON_CARBINERIFLE"] = 1800,
			-- ["WEAPON_SMG_AMMO"] = 10,
			-- ["WEAPON_RIFLE_AMMO"] = 10,
			["WEAPON_PISTOL_AMMO"] = 10,
			["spikestrips"] = 275
		}
	}
}