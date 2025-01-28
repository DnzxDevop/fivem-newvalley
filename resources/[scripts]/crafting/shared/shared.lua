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

		for Item,v in pairs(v["List"]) do
			local Number = #ItemList[Shop] + 1

			ItemList[Shop][Number] = {
				["name"] = ItemName(Item),
				["weight"] = ItemWeight(Item),
				["index"] = ItemIndex(Item),
				["rarity"] = ItemRarity(Item),
				["economy"] = ItemEconomy(Item),
				["desc"] = ItemDescription(Item),
				["price"] = v["Amount"],
				["required"] = {},
				["key"] = Item
			}

			for Index,Amount in pairs(v["Required"]) do
				local Rarity = ItemRarity(Index)
				ItemList[Shop][Number]["required"][#ItemList[Shop][Number]["required"] + 1] = "<"..Rarity..">"..Dotted(Amount).."x "..ItemName(Index).."</"..Rarity..">"
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATION
-----------------------------------------------------------------------------------------------------------------------------------------
Location = {
	{
		["Coords"] = vec3(1272.51,-1713.05,54.63),
		["Mode"] = "Lester",
		["Circle"] = 0.1
	},{
		["Coords"] = vec3(949.69,-957.4,39.83),
		["Mode"] = "Mecanico",
		["Circle"] = 0.1
	},{
		["Coords"] = vec3(174.99,-1323.47,29.65),
		["Mode"] = "PawnShop",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(1694.05,3754.65,35.03),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(249.53,-45.32,70.27),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(845.85,-1029.52,28.53),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(-329.97,6078.46,31.8),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(-665.72,-939.37,22.14),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(-1308.88,-389.88,37.03),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(-1117.69,2693.2,18.9),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(2571.39,298.41,109.06),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(-3169.59,1082.95,21.18),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(469.44,-1980.07,4.16),
		["Mode"] = "CorleoneTuning",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(17.37,-1109.71,30.12),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(813.63,-2153.2,29.96),
		["Mode"] = "Ammunation",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(-172.89,6381.32,31.48),
		["Mode"] = "Pharmacy",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(1690.07,3581.68,35.62),
		["Mode"] = "Pharmacy",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(114.49,-5.03,67.82),
		["Mode"] = "Pharmacy",
		["Circle"] = 0.5
	},{
		["Coords"] = vec3(1110.8,-2008.75,31.43),
		["Mode"] = "Furnace",
		["Circle"] = 0.1
	},{
		["Coords"] = vec3(-275.9,238.04,90.57),
		["Mode"] = "FoodRestaurante",
		["Circle"] = 1
	},{
		["Coords"] = vec3(-273.25,238.15,90.57),
		["Mode"] = "DrinkRestaurante",
		["Circle"] = 1
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
List = {
	["FoodRestaurante"] = {
		["Permission"] = nil,
		["List"] = {
			["nigirizushi"] = {
				["Amount"] = 3,
				["Required"] = {
					["dollar"] = 90
				}
			},
			["sushi"] = {
				["Amount"] = 2,
				["Required"] = {
					["dollar"] = 110
				}
			},
			["cupcake"] = {
				["Amount"] = 3,
				["Required"] = {
					["dollar"] = 105
				}
			},
			["applelove"] = {
				["Amount"] = 2,
				["Required"] = {
					["dollar"] = 90
				}
			},
			["cookies"] = {
				["Amount"] = 3,
				["Required"] = {
					["dollar"] = 70
				}
			},
			["hamburger2"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 95
				}
			},
			["hamburger3"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 100
				}
			},
			["pizzamozzarella"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 125
				}
			},
			["pizzabanana"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 135
				}
			},
			["pizzachocolate"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			}
		}
	},
	["DrinkRestaurante"] = {
		["Permission"] = nil,
		["List"] = {
			["milkshake"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["cappuccino"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["passionjuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["tangejuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["orangejuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["applejuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["grapejuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["lemonjuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["bananajuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["acerolajuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["strawberryjuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["blueberryjuice"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			},
			["coffeemilk"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 130
				}
			}
		}
	},
	["Furnace"] = {
		["List"] = {
			["plastic"] = {
				["Amount"] = 25,
				["Required"] = {
					["emptybottle"] = 3,
					["WEAPON_PETROLCAN_AMMO"] = 4500
				}
			},
			["glass"] = {
				["Amount"] = 5,
				["Required"] = {
					["sand"] = 1
				}
			},
			["latex"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 5,
					["emptybottle"] = 1
				}
			},
			["rubber"] = {
				["Amount"] = 20,
				["Required"] = {
					["latex"] = 1
				}
			},
			["aluminum"] = {
				["Amount"] = 5,
				["Required"] = {
					["bauxite"] = 1
				}
			},
			["copper"] = {
				["Amount"] = 5,
				["Required"] = {
					["chalcopyrite"] = 1
				}
			}
		}
	},
	["Pharmacy"] = {
		["List"] = {
			["medkit"] = {
				["Amount"] = 1,
				["Required"] = {
					["saline"] = 1,
					["acetone"] = 1,
					["alcohol"] = 1,
					["dollar"] = 275
				}
			},
			["bandage"] = {
				["Amount"] = 1,
				["Required"] = {
					["saline"] = 1,
					["alcohol"] = 1,
					["dollar"] = 75
				}
			},
			["gauze"] = {
				["Amount"] = 1,
				["Required"] = {
					["alcohol"] = 1,
					["dollar"] = 25
				}
			},
			["analgesic"] = {
				["Amount"] = 1,
				["Required"] = {
					["saline"] = 1,
					["dollar"] = 65
				}
			}
		}
	},
	["Ammunation"] = {
		["List"] = {
			["WEAPON_HATCHET"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 1,
					["aluminum"] = 75
				}
			},
			["WEAPON_BAT"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 1,
					["aluminum"] = 75
				}
			},
			["WEAPON_BATTLEAXE"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 1,
					["aluminum"] = 75
				}
			},
			["WEAPON_CROWBAR"] = {
				["Amount"] = 1,
				["Required"] = {
					["aluminum"] = 75
				}
			},
			["WEAPON_SWITCHBLADE"] = {
				["Amount"] = 1,
				["Required"] = {
					["aluminum"] = 75
				}
			},
			["WEAPON_GOLFCLUB"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 10,
					["aluminum"] = 65
				}
			},
			["WEAPON_HAMMER"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 1,
					["aluminum"] = 75
				}
			},
			["WEAPON_MACHETE"] = {
				["Amount"] = 1,
				["Required"] = {
					["aluminum"] = 75
				}
			},
			["WEAPON_POOLCUE"] = {
				["Amount"] = 1,
				["Required"] = {
					["plastic"] = 10,
					["aluminum"] = 70
				}
			},
			["WEAPON_STONE_HATCHET"] = {
				["Amount"] = 1,
				["Required"] = {
					["woodlog"] = 5,
					["aluminum"] = 70
				}
			},
			["WEAPON_WRENCH"] = {
				["Amount"] = 1,
				["Required"] = {
					["aluminum"] = 75
				}
			},
			["WEAPON_KNUCKLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["aluminum"] = 75
				}
			},
			["WEAPON_FLASHLIGHT"] = {
				["Amount"] = 1,
				["Required"] = {
					["plastic"] = 10,
					["aluminum"] = 70
				}
			}
		}
	},
	["PawnShop"] = {
		["List"] = {
			["scotchtape"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 70
				}
			},
			["insulatingtape"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 85
				}
			},
			["rammemory"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 565
				}
			},
			["powersupply"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 715
				}
			},
			["processorfan"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 485
				}
			},
			["processor"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 1075
				}
			},
			["screws"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 70
				}
			},
			["screwnuts"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 70
				}
			},
			["videocard"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 6325
				}
			},
			["ssddrive"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 265
				}
			},
			["safependrive"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 4975
				}
			},
			["powercable"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 335
				}
			},
			["electroniccomponents"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 575
				}
			},
			["batteryaa"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 335
				}
			},
			["batteryaaplus"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 415
				}
			},
			["goldnecklace"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 925
				}
			},
			["silverchain"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 625
				}
			},
			["horsefigurine"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 3625
				}
			},
			["toothpaste"] = {
				["Amount"] = 1,
				["Required"] = {
					["dollar"] = 265
				}
			}
		}
	},
	["CorleoneTuning"] = {
		["List"] = {
			["toolbox"] = {
				["Amount"] = 1,
				["Required"] = {
					["screws"] = 1,
					["screwnuts"] = 1,
					["rubber"] = 50,
					["copper"] = 15,
					["aluminum"] = 15
				}
			},
			["plate"] = {
				["Amount"] = 1,
				["Required"] = {
					["copper"] = 45,
					["aluminum"] = 45
				}
			},
			["nitro"] = {
				["Amount"] = 1,
				["Required"] = {
					["scotchtape"] = 1,
					["insulatingtape"] = 1,
					["screws"] = 1,
					["screwnuts"] = 1,
					["glass"] = 125,
					["copper"] = 50,
					["aluminum"] = 50
				}
			}
		}
	},
	["pistol_bench"] = {
		["List"] = {
			["WEAPON_PISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 3,
					["glass"] = 120,
					["rubber"] = 120,
					["plastic"] = 120,
					["copper"] = 75,
					["aluminum"] = 75
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 3,
					["glass"] = 135,
					["rubber"] = 135,
					["plastic"] = 135,
					["copper"] = 75,
					["aluminum"] = 75
				}
			},
			["WEAPON_HEAVYPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 175,
					["rubber"] = 175,
					["plastic"] = 175,
					["copper"] = 100,
					["aluminum"] = 100
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 3,
					["glass"] = 100,
					["rubber"] = 100,
					["plastic"] = 75,
					["copper"] = 65,
					["aluminum"] = 65
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 3,
					["glass"] = 110,
					["rubber"] = 110,
					["plastic"] = 110,
					["copper"] = 75,
					["aluminum"] = 75
				}
			},
			["WEAPON_VINTAGEPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 3,
					["glass"] = 100,
					["rubber"] = 100,
					["plastic"] = 100,
					["copper"] = 50,
					["aluminum"] = 50
				}
			},
			["WEAPON_PISTOL50"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 175,
					["rubber"] = 175,
					["plastic"] = 175,
					["copper"] = 100,
					["aluminum"] = 100
				}
			},
			["WEAPON_COMBATPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["pistolbody"] = 1,
					["weaponparts"] = 3,
					["glass"] = 135,
					["rubber"] = 135,
					["plastic"] = 135,
					["copper"] = 75,
					["aluminum"] = 75
				}
			}
		}
	},
	["smg_bench"] = {
		["List"] = {
			["WEAPON_APPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["smgbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 90,
					["rubber"] = 90,
					["plastic"] = 90,
					["copper"] = 60,
					["aluminum"] = 60
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["smgbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 90,
					["rubber"] = 90,
					["plastic"] = 90,
					["copper"] = 100,
					["aluminum"] = 100
				}
			},
			["WEAPON_MICROSMG"] = {
				["Amount"] = 1,
				["Required"] = {
					["smgbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 130,
					["rubber"] = 130,
					["plastic"] = 130,
					["copper"] = 90,
					["aluminum"] = 90
				}
			},
			["WEAPON_MINISMG"] = {
				["Amount"] = 1,
				["Required"] = {
					["smgbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 155,
					["rubber"] = 155,
					["plastic"] = 155,
					["copper"] = 90,
					["aluminum"] = 90
				}
			},
			["WEAPON_SMG_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["smgbody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 165,
					["rubber"] = 165,
					["plastic"] = 165,
					["copper"] = 125,
					["aluminum"] = 125
				}
			}
		}
	},
	["rifle_bench"] = {
		["List"] = {
			["WEAPON_SAWNOFFSHOTGUN"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 5,
					["glass"] = 175,
					["rubber"] = 175,
					["plastic"] = 175,
					["copper"] = 100,
					["aluminum"] = 100
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 8,
					["glass"] = 190,
					["rubber"] = 190,
					["plastic"] = 120,
					["copper"] = 90,
					["aluminum"] = 90
				}
			},
			["WEAPON_CARBINERIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 180,
					["rubber"] = 180,
					["plastic"] = 180,
					["copper"] = 150,
					["aluminum"] = 150
				}
			},
			["WEAPON_CARBINERIFLE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 195,
					["rubber"] = 195,
					["plastic"] = 180,
					["copper"] = 120,
					["aluminum"] = 120
				}
			},
			["WEAPON_ADVANCEDRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 178,
					["rubber"] = 178,
					["plastic"] = 178,
					["copper"] = 150,
					["aluminum"] = 150
				}
			},
			["WEAPON_BULLPUPRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 180,
					["rubber"] = 180,
					["plastic"] = 160,
					["copper"] = 130,
					["aluminum"] = 130
				}
			},
			["WEAPON_BULLPUPRIFLE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 180,
					["rubber"] = 180,
					["plastic"] = 160,
					["copper"] = 130,
					["aluminum"] = 130
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 180,
					["rubber"] = 180,
					["plastic"] = 160,
					["copper"] = 130,
					["aluminum"] = 130
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 180,
					["rubber"] = 180,
					["plastic"] = 160,
					["copper"] = 130,
					["aluminum"] = 130
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["riflebody"] = 1,
					["weaponparts"] = 10,
					["glass"] = 425,
					["rubber"] = 425,
					["plastic"] = 425,
					["copper"] = 425,
					["aluminum"] = 300
				}
			}
		}
	},
	["blueprint_bench"] = {
		["List"] = {
			["blueprint_WEAPON_ADVANCEDRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_COMPACTRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_CROWBAR"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_ATTACH_GRIP"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SAWNOFFSHOTGUN"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_MICROSMG"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_FLASHLIGHT"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_HEAVYRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_ASSAULTRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_MUSKET"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_WRENCH"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_BULLPUPRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_GOLFCLUB"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_BAT"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_ATTACH_MAGAZINE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_MACHETE"] ={
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_ASSAULTRIFLE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_HEAVYPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_CARBINERIFLE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_KNUCKLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_ATTACH_FLASHLIGHT"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_STONE_HATCHET"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SWITCHBLADE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_HATCHET"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_PISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SNSPISTOL_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_ATTACH_SILENCER"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SPECIALCARBINE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_PISTOL50"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_MINISMG"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_TACTICALRIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SNSPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_GUSENBERG"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_ASSAULTSMG"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SMG_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SMG"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_PUMPSHOTGUN_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_PUMPSHOTGUN"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SPECIALCARBINE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_BULLPUPRIFLE_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_CARBINERIFLE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_ATTACH_CROSSHAIR"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_MACHINEPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_APPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_PISTOL_MK2"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_SMOKEGRENADE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_MOLOTOV"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_HAMMER"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_COMBATPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_NIGHTSTICK"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_BATTLEAXE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_POOLCUE"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			},
			["blueprint_WEAPON_VINTAGEPISTOL"] = {
				["Amount"] = 1,
				["Required"] = {
					["blueprint_fragment"] = 15
				}
			}
		}
	},
	["drugs_bench"] = {
		["List"] = {
			["cocaine"] = {
				["Amount"] = 10,
				["Required"] = {
					["coke"] = 10
				}
			},
			["cokesack"] = {
				["Amount"] = 1,
				["Required"] = {
					["cocaine"] = 10
				}
			},
			["joint"] = {
				["Amount"] = 10,
				["Required"] = {
					["weed"] = 10
				}
			},
			["weedsack"] = {
				["Amount"] = 1,
				["Required"] = {
					["joint"] = 10
				}
			},
			["meth"] = {
				["Amount"] = 10,
				["Required"] = {
					["metadone"] = 7,
					["codeine"] = 8,
					["amphetamine"] = 9,
				}
			},
			["methsack"] = {
				["Amount"] = 1,
				["Required"] = {
					["meth"] = 10
				}
			},
			["crack"] = {
				["Amount"] = 1,
				["Required"] = {
					["metadone"] = 6,
					["codeine"] = 8,
					["amphetamine"] = 9,
				}
			},
			["heroin"] = {
				["Amount"] = 1,
				["Required"] = {
					["metadone"] = 6,
					["codeine"] = 8,
					["amphetamine"] = 9,
				}
			}
		}
	},
	["Lester"] = {
		["List"] = {
			["vest"] = {
				["Amount"] = 1,
				["Required"] = {
					["tarp"] = 3,
					["sheetmetal"] = 3,
					["roadsigns"] = 3,
					["copper"] = 15,
					["aluminum"] = 15
				}
			},
			["repairkit01"] = {
				["Amount"] = 1,
				["Required"] = {
					["sheetmetal"] = 1,
					["roadsigns"] = 1,
					["scotchtape"] = 1,
					["copper"] = 12,
					["aluminum"] = 12
				}
			},
			["repairkit02"] = {
				["Amount"] = 1,
				["Required"] = {
					["sheetmetal"] = 1,
					["roadsigns"] = 1,
					["scotchtape"] = 1,
					["copper"] = 35,
					["aluminum"] = 35
				}
			},
			["repairkit03"] = {
				["Amount"] = 1,
				["Required"] = {
					["sheetmetal"] = 2,
					["roadsigns"] = 2,
					["scotchtape"] = 2,
					["copper"] = 90,
					["aluminum"] = 90
				}
			},
			["repairkit04"] = {
				["Amount"] = 1,
				["Required"] = {
					["sheetmetal"] = 2,
					["roadsigns"] = 2,
					["scotchtape"] = 2,
					["copper"] = 200,
					["aluminum"] = 200
				}
			},
			["races"] = {
				["Amount"] = 1,
				["Required"] = {
					["dirtydollar"] = 425
				}
			},
			["lockpick"] = {
				["Amount"] = 1,
				["Required"] = {
					["copper"] = 30,
					["aluminum"] = 30,
					["sheetmetal"] = 1
				}
			},
			["dismantle"] = {
				["Amount"] = 1,
				["Required"] = {
					["dirtydollar"] = 1225
				}
			},
			["handcuff"] = {
				["Amount"] = 1,
				["Required"] = {
					["copper"] = 60,
					["aluminum"] = 60
				}
			},
			["hood"] = {
				["Amount"] = 1,
				["Required"] = {
					["tarp"] = 2,
					["rubber"] = 100
				}
			},
			["blocksignal"] = {
				["Amount"] = 1,
				["Required"] = {
					["plastic"] = 85
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["Amount"] = 10,
				["Required"] = {
					["dollar"] = 675,
				}
			},
			["WEAPON_PISTOL_AMMO"] = {
				["Amount"] = 30,
				["Required"] = {
					["dollar"] = 800,
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["Amount"] = 30,
				["Required"] = {
					["dollar"] = 100,
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["Amount"] = 30,
				["Required"] = {
					["dollar"] = 1400,
				}
			},
			["ATTACH_FLASHLIGHT"] = {
				["Amount"] = 1,
				["Required"] = {
					["scotchtape"] = 1,
					["insulatingtape"] = 1,
					["batteryaa"] = 1,
					["batteryaaplus"] = 1,
					["glass"] = 75,
					["plastic"] = 75
				}
			},
			["ATTACH_CROSSHAIR"] = {
				["Amount"] = 1,
				["Required"] = {
					["scotchtape"] = 1,
					["insulatingtape"] = 1,
					["batteryaa"] = 1,
					["batteryaaplus"] = 1,
					["glass"] = 95,
					["plastic"] = 95,
					["copper"] = 25
				}
			},
			["ATTACH_SILENCER"] = {
				["Amount"] = 1,
				["Required"] = {
					["scotchtape"] = 5,
					["insulatingtape"] = 5,
					["water"] = 1,
					["toothpaste"] = 1,
					["plastic"] = 200,
					["copper"] = 200
				}
			},
			["ATTACH_MAGAZINE"] = {
				["Amount"] = 1,
				["Required"] = {
					["scotchtape"] = 1,
					["insulatingtape"] = 1,
					["rubber"] = 95,
					["plastic"] = 95,
					["aluminum"] = 25
				}
			},
			["ATTACH_GRIP"] = {
				["Amount"] = 1,
				["Required"] = {
					["scotchtape"] = 1,
					["insulatingtape"] = 1,
					["electroniccomponents"] = 1,
					["rubber"] = 65,
					["plastic"] = 65
				}
			}
		}
	}
}