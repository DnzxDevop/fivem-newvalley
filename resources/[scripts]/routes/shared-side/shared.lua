-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
Config = {
	["Aztecas"] = {
		["Route"] = true, -- false (se a localização de entrega é aleatória)
		["Circle"] = 1.0, -- Tamanho da região do target
		["Wanted"] = 600, -- false (se deseja desativar) | number (quantidade em segundos)
		["Battlepass"] = 2, -- false (se deseja desativar) | number (quantidade em pontos)
		["DebugPoly"] = false, -- true (caso queira ver o tamanho do Circle)
		["Permission"] = 'Aztecas', -- false (Caso não tenha permissão)
		["Mode"] = "Always", -- Always, Init, Never
		["Init"] = vec3(510.48,-1815.38,28.51), -- Coordenada de inicio do emprego (use o comando /postit)
		["Experience"] = {
			["Name"] = "Lumberman", -- Nome da experiência
			["Amount"] = 1 -- Quantidade recebida
		},
		["List"] = {
			{ ["Item"] = "pistolbody", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 },
			{ ["Item"] = "weaponparts", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 3, ["Price"] = 100 },
			{ ["Item"] = "glass", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "rubber", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "plastic", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "copper", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "aluminum", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "smgbody", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 },
			{ ["Item"] = "riflebody", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 }
		},
		["Coords"] = {
			vec3(-513.92,-1019.31,23.47),
			vec3(-1604.18,-832.26,10.08),
			vec3(-536.48,-45.61,42.57),
			vec3(-53.01,79.35,71.62),
			vec3(581.16,139.13,99.48),
			vec3(814.39,-93.48,80.6),
			vec3(1106.93,-355.03,67.01),
			vec3(1070.71,-780.46,58.36),
			vec3(1142.82,-986.58,45.91),
			vec3(1200.55,-1276.6,35.23),
			vec3(967.81,-1829.29,31.24),
			vec3(809.16,-2222.61,29.65),
			vec3(684.61,-2741.62,6.02),
			vec3(263.47,-2506.62,6.45),
			vec3(94.66,-2676.38,6.01),
			vec3(-43.87,-2519.91,7.4),
			vec3(182.93,-2027.68,18.28),
			vec3(-306.86,-2191.84,10.84),
			vec3(-570.95,-1775.95,23.19),
			vec3(-350.03,-1569.9,25.23),
			vec3(-128.36,-1394.12,29.57),
			vec3(67.84,-1399.02,29.37),
			vec3(343.13,-1297.91,32.51),
			vec3(485.92,-1477.41,29.29),
			vec3(139.81,-1337.41,29.21),
			vec3(263.82,-1346.16,31.93),
			vec3(-723.33,-1112.41,10.66),
			vec3(-842.54,-1128.21,7.02),
			vec3(488.46,-898.56,25.94)
		}
	},
	["CorleoneTuning"] = {
		["Route"] = true, -- false (se a localização de entrega é aleatória)
		["Circle"] = 1.0, -- Tamanho da região do target
		["Wanted"] = 600, -- false (se deseja desativar) | number (quantidade em segundos)
		["Battlepass"] = 2, -- false (se deseja desativar) | number (quantidade em pontos)
		["DebugPoly"] = false, -- true (caso queira ver o tamanho do Circle)
		["Permission"] = 'CorleoneTuning', -- false (Caso não tenha permissão)
		["Mode"] = "Always", -- Always, Init, Never
		["Init"] = vec3(464.35,-1995.07,3.96), -- Coordenada de inicio do emprego (use o comando /postit)
		["List"] = {
			{ ["Item"] = "screws", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 },
			{ ["Item"] = "screwnuts", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 3, ["Price"] = 100 },
			{ ["Item"] = "rubber", ["Chance"] = 25, ["Min"] = 15, ["Max"] = 20, ["Price"] = 100 },
			{ ["Item"] = "copper", ["Chance"] = 25, ["Min"] = 15, ["Max"] = 20, ["Price"] = 100 },
			{ ["Item"] = "aluminum", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 20, ["Price"] = 100 },
			{ ["Item"] = "scotchtape", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 20, ["Price"] = 100 },
			{ ["Item"] = "insulatingtape", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 20, ["Price"] = 100 },
			{ ["Item"] = "glass", ["Chance"] = 25, ["Min"] = 80, ["Max"] = 100, ["Price"] = 100 },
		},
		["Coords"] = {
			vec3(-513.92,-1019.31,23.47),
			vec3(-1604.18,-832.26,10.08),
			vec3(-536.48,-45.61,42.57),
			vec3(-53.01,79.35,71.62),
			vec3(581.16,139.13,99.48),
			vec3(814.39,-93.48,80.6),
			vec3(1106.93,-355.03,67.01),
			vec3(1070.71,-780.46,58.36),
			vec3(1142.82,-986.58,45.91),
			vec3(1200.55,-1276.6,35.23),
			vec3(967.81,-1829.29,31.24),
			vec3(809.16,-2222.61,29.65),
			vec3(684.61,-2741.62,6.02),
			vec3(263.47,-2506.62,6.45),
			vec3(94.66,-2676.38,6.01),
			vec3(-43.87,-2519.91,7.4),
			vec3(182.93,-2027.68,18.28),
			vec3(-306.86,-2191.84,10.84),
			vec3(-570.95,-1775.95,23.19),
			vec3(-350.03,-1569.9,25.23),
			vec3(-128.36,-1394.12,29.57),
			vec3(67.84,-1399.02,29.37),
			vec3(343.13,-1297.91,32.51),
			vec3(485.92,-1477.41,29.29),
			vec3(139.81,-1337.41,29.21),
			vec3(263.82,-1346.16,31.93),
			vec3(-723.33,-1112.41,10.66),
			vec3(-842.54,-1128.21,7.02),
			vec3(488.46,-898.56,25.94)
		}
	},
	["Vagos"] = {
		["Route"] = true, -- false (se a localização de entrega é aleatória)
		["Circle"] = 1.0, -- Tamanho da região do target
		["Wanted"] = 600, -- false (se deseja desativar) | number (quantidade em segundos)
		["Battlepass"] = 2, -- false (se deseja desativar) | number (quantidade em pontos)
		["DebugPoly"] = false, -- true (caso queira ver o tamanho do Circle)
		["Permission"] = 'Vagos', -- false (Caso não tenha permissão)
		["Mode"] = "Always", -- Always, Init, Never
		["Init"] = vec3(341.53,-2064.0,20.93), -- Coordenada de inicio do emprego (use o comando /postit)
		["Experience"] = {
			["Name"] = "Lumberman", -- Nome da experiência
			["Amount"] = 1 -- Quantidade recebida
		},
		["List"] = {
			{ ["Item"] = "codeine", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 12, ["Price"] = 100 },
			{ ["Item"] = "amphetamine", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 11, ["Price"] = 100 },
		--	{ ["Item"] = "metadone", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 9, ["Price"] = 100 },
		},
		["Coords"] = {
			vec3(-513.92,-1019.31,23.47),
			vec3(-1604.18,-832.26,10.08),
			vec3(-536.48,-45.61,42.57),
			vec3(-53.01,79.35,71.62),
			vec3(581.16,139.13,99.48),
			vec3(814.39,-93.48,80.6),
			vec3(1106.93,-355.03,67.01),
			vec3(1070.71,-780.46,58.36),
			vec3(1142.82,-986.58,45.91),
			vec3(1200.55,-1276.6,35.23),
			vec3(967.81,-1829.29,31.24),
			vec3(809.16,-2222.61,29.65),
			vec3(684.61,-2741.62,6.02),
			vec3(263.47,-2506.62,6.45),
			vec3(94.66,-2676.38,6.01),
			vec3(-43.87,-2519.91,7.4),
			vec3(182.93,-2027.68,18.28),
			vec3(-306.86,-2191.84,10.84),
			vec3(-570.95,-1775.95,23.19),
			vec3(-350.03,-1569.9,25.23),
			vec3(-128.36,-1394.12,29.57),
			vec3(67.84,-1399.02,29.37),
			vec3(343.13,-1297.91,32.51),
			vec3(485.92,-1477.41,29.29),
			vec3(139.81,-1337.41,29.21),
			vec3(263.82,-1346.16,31.93),
			vec3(-723.33,-1112.41,10.66),
			vec3(-842.54,-1128.21,7.02),
			vec3(488.46,-898.56,25.94)
		}
	},
	["Ballas"] = {
		["Route"] = true, -- false (se a localização de entrega é aleatória)
		["Circle"] = 1.0, -- Tamanho da região do target
		["Wanted"] = 600, -- false (se deseja desativar) | number (quantidade em segundos)
		["Battlepass"] = 2, -- false (se deseja desativar) | number (quantidade em pontos)
		["DebugPoly"] = false, -- true (caso queira ver o tamanho do Circle)
		["Permission"] = 'Ballas', -- false (Caso não tenha permissão)
		["Mode"] = "Always", -- Always, Init, Never
		["Init"] = vec3(3101.77,-1986.76,20.69), -- Coordenada de inicio do emprego (use o comando /postit)
		["Experience"] = {
			["Name"] = "Lumberman", -- Nome da experiência
			["Amount"] = 1 -- Quantidade recebida
		},
		["List"] = {
			{ ["Item"] = "codeine", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 12, ["Price"] = 100 },
			{ ["Item"] = "amphetamine", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 11, ["Price"] = 100 },
			{ ["Item"] = "metadone", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 9, ["Price"] = 100 },
		},
		["Coords"] = {
			vec3(-513.92,-1019.31,23.47),
			vec3(-1604.18,-832.26,10.08),
			vec3(-536.48,-45.61,42.57),
			vec3(-53.01,79.35,71.62),
			vec3(581.16,139.13,99.48),
			vec3(814.39,-93.48,80.6),
			vec3(1106.93,-355.03,67.01),
			vec3(1070.71,-780.46,58.36),
			vec3(1142.82,-986.58,45.91),
			vec3(1200.55,-1276.6,35.23),
			vec3(967.81,-1829.29,31.24),
			vec3(809.16,-2222.61,29.65),
			vec3(684.61,-2741.62,6.02),
			vec3(263.47,-2506.62,6.45),
			vec3(94.66,-2676.38,6.01),
			vec3(-43.87,-2519.91,7.4),
			vec3(182.93,-2027.68,18.28),
			vec3(-306.86,-2191.84,10.84),
			vec3(-570.95,-1775.95,23.19),
			vec3(-350.03,-1569.9,25.23),
			vec3(-128.36,-1394.12,29.57),
			vec3(67.84,-1399.02,29.37),
			vec3(343.13,-1297.91,32.51),
			vec3(485.92,-1477.41,29.29),
			vec3(139.81,-1337.41,29.21),
			vec3(263.82,-1346.16,31.93),
			vec3(-723.33,-1112.41,10.66),
			vec3(-842.54,-1128.21,7.02),
			vec3(488.46,-898.56,25.94)
		}
	},
	["Families"] = {
		["Route"] = true, -- false (se a localização de entrega é aleatória)
		["Circle"] = 1.0, -- Tamanho da região do target
		["Wanted"] = 600, -- false (se deseja desativar) | number (quantidade em segundos)
		["Battlepass"] = 2, -- false (se deseja desativar) | number (quantidade em pontos)
		["DebugPoly"] = false, -- true (caso queira ver o tamanho do Circle)
		["Permission"] = 'Families', -- false (Caso não tenha permissão)
		["Mode"] = "Always", -- Always, Init, Never
		["Init"] = vec3(-33.42,-1430.98,31.49), -- Coordenada de inicio do emprego (use o comando /postit)
		["Experience"] = {
			["Name"] = "Lumberman", -- Nome da experiência
			["Amount"] = 1 -- Quantidade recebida
		},
		["List"] = {
			{ ["Item"] = "codeine", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 12, ["Price"] = 100 },
			{ ["Item"] = "amphetamine", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 11, ["Price"] = 100 },
			{ ["Item"] = "metadone", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 9, ["Price"] = 100 },
		},
		["Coords"] = {
			vec3(-513.92,-1019.31,23.47),
			vec3(-1604.18,-832.26,10.08),
			vec3(-536.48,-45.61,42.57),
			vec3(-53.01,79.35,71.62),
			vec3(581.16,139.13,99.48),
			vec3(814.39,-93.48,80.6),
			vec3(1106.93,-355.03,67.01),
			vec3(1070.71,-780.46,58.36),
			vec3(1142.82,-986.58,45.91),
			vec3(1200.55,-1276.6,35.23),
			vec3(967.81,-1829.29,31.24),
			vec3(809.16,-2222.61,29.65),
			vec3(684.61,-2741.62,6.02),
			vec3(263.47,-2506.62,6.45),
			vec3(94.66,-2676.38,6.01),
			vec3(-43.87,-2519.91,7.4),
			vec3(182.93,-2027.68,18.28),
			vec3(-306.86,-2191.84,10.84),
			vec3(-570.95,-1775.95,23.19),
			vec3(-350.03,-1569.9,25.23),
			vec3(-128.36,-1394.12,29.57),
			vec3(67.84,-1399.02,29.37),
			vec3(343.13,-1297.91,32.51),
			vec3(485.92,-1477.41,29.29),
			vec3(139.81,-1337.41,29.21),
			vec3(263.82,-1346.16,31.93),
			vec3(-723.33,-1112.41,10.66),
			vec3(-842.54,-1128.21,7.02),
			vec3(488.46,-898.56,25.94)
		}
	},
	["Bloods"] = {
		["Route"] = true, -- false (se a localização de entrega é aleatória)
		["Circle"] = 1.0, -- Tamanho da região do target
		["Wanted"] = 600, -- false (se deseja desativar) | number (quantidade em segundos)
		["Battlepass"] = 2, -- false (se deseja desativar) | number (quantidade em pontos)
		["DebugPoly"] = false, -- true (caso queira ver o tamanho do Circle)
		["Permission"] = 'Bloods', -- false (Caso não tenha permissão)
		["Mode"] = "Always", -- Always, Init, Never
		["Init"] = vec3(236.04,-1762.16,29.0), -- Coordenada de inicio do emprego (use o comando /postit)
		["Experience"] = {
			["Name"] = "Lumberman", -- Nome da experiência
			["Amount"] = 1 -- Quantidade recebida
		},
		["List"] = {
			{ ["Item"] = "pistolbody", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 },
			{ ["Item"] = "weaponparts", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 3, ["Price"] = 100 },
			{ ["Item"] = "glass", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "rubber", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "plastic", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "copper", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "aluminum", ["Chance"] = 25, ["Min"] = 5, ["Max"] = 15, ["Price"] = 100 },
			{ ["Item"] = "smgbody", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 },
			{ ["Item"] = "riflebody", ["Chance"] = 25, ["Min"] = 1, ["Max"] = 1, ["Price"] = 100 }
		},
		["Coords"] = {
			vec3(-513.92,-1019.31,23.47),
			vec3(-1604.18,-832.26,10.08),
			vec3(-536.48,-45.61,42.57),
			vec3(-53.01,79.35,71.62),
			vec3(581.16,139.13,99.48),
			vec3(814.39,-93.48,80.6),
			vec3(1106.93,-355.03,67.01),
			vec3(1070.71,-780.46,58.36),
			vec3(1142.82,-986.58,45.91),
			vec3(1200.55,-1276.6,35.23),
			vec3(967.81,-1829.29,31.24),
			vec3(809.16,-2222.61,29.65),
			vec3(684.61,-2741.62,6.02),
			vec3(263.47,-2506.62,6.45),
			vec3(94.66,-2676.38,6.01),
			vec3(-43.87,-2519.91,7.4),
			vec3(182.93,-2027.68,18.28),
			vec3(-306.86,-2191.84,10.84),
			vec3(-570.95,-1775.95,23.19),
			vec3(-350.03,-1569.9,25.23),
			vec3(-128.36,-1394.12,29.57),
			vec3(67.84,-1399.02,29.37),
			vec3(343.13,-1297.91,32.51),
			vec3(485.92,-1477.41,29.29),
			vec3(139.81,-1337.41,29.21),
			vec3(263.82,-1346.16,31.93),
			vec3(-723.33,-1112.41,10.66),
			vec3(-842.54,-1128.21,7.02),
			vec3(488.46,-898.56,25.94)
		}
	},
}