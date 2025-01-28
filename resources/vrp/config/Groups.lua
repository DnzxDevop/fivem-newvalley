-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { "Dev", "Head-Manager", "Admin","Moderator","C-Level","Community-Leader","HypeRoleplay","Helper","Streamer" },
		["Service"] = {150000},
		["Client"] = true,
		["Chat"] = false
	},
	["Premium"] = {
		["Parent"] = {
			["Premium"] = true
		},
		["Hierarchy"] = { "Quantico", "Ultra", "Valley","Diamond", "Emerald", "Gold","Silver", "Bronze" },
		["Salary"] = {  6000, 5200, 4500, 3300, 2900, 2350, 2000, 1800 },
		["Service"] = {},
		["Client"] = true,
		["Chat"] = false
	},
	["Som"] = {
		["Parent"] = {
			["Som"] = true
		},
		["Hierarchy"] = { "Som" },
		["Salary"] = { 0 },
		["Service"] = {},
		["Client"] = true,
		["Chat"] = false
	},
	["Policia"] = {
		["Parent"] = {
			["Policia"] = true
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado", "Recruta" },
		["Salary"] = { 4100, 4000, 3500, 3200, 2900, 2700, 2500, 2300, 2100, 1900, 1700, 1500, 1200 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},	
	["Fbi"] = {
		["Parent"] = {
			["Fbi"] = true
		},
		["Hierarchy"] = { "Direção", "Coordenador", "Inspetor-Chefe", "Inspetor", "Policial", "Estagiario" },
		["Salary"] = { 2500, 2250, 2000, 1750, 1500, 1500 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Paramedico"] = {
		["Parent"] = {
			["Paramedico"] = true
		},
		["Hierarchy"] = { "Secretario De Saude","Diretor-Medico", "Chefe De Setor", "Medico Especialista", "Medico","Residente","Enfermeiro","Paramedico" },
		["Salary"] = { 50, 4300, 3500, 3200,2900, 2700, 2500, 2300 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Mecanico"] = {
		["Parent"] = {
			["Mecanico"] = true
		},
		["Hierarchy"] = { "Chefe", "Mecânico", "Borracheiro", "Estagiário" },
		["Salary"] = { 2500, 2250, 2000, 1750 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Restaurante"] = {
		["Parent"] = {
			["Restaurante"] = true
		},
		["Hierarchy"] = { "Chefe", "Supervisor", "Funcionário" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Ballas"] = {
		["Parent"] = {
			["Ballas"] = true
		},
		["Hierarchy"] = { "Líder", "Sub-Líder", "Membro", "Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Crazy"] = {
		["Parent"] = {
			["Crazy"] = true
		},
		["Hierarchy"] = { "Líder-Ilegal" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["CorleoneTuning"] = {
		["Parent"] = {
			["CorleoneTuning"] = true
		},
		["Hierarchy"] = { "Líder", "Sub-Líder", "Membro", "Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Vagos"] = {
		["Parent"] = {
			["Vagos"] = true
		},
		["Hierarchy"] = { "Líder", "Sub-Líder", "Membro", "Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Families"] = {
		["Parent"] = {
			["Families"] = true
		},
		["Hierarchy"] = { "Líder", "Sub-Líder", "Membro", "Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Aztecas"] = {
		["Parent"] = {
			["Aztecas"] = true
		},
		["Hierarchy"] = { "Líder", "Sub-Líder", "Membro", "Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Bloods"] = {
		["Parent"] = {
			["Bloods"] = true
		},
		["Hierarchy"] = { "Líder", "Sub-Líder", "Membro", "Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Chat"] = true
	},
	["Emergencia"] = {
		["Parent"] = {
			["Policia"] = true,
			["Paramedico"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
	["Gangs"] = {
		["Parent"] = {
			["Ballas"] = true,
			["Vagos"] = true,
			["Families"] = true,
			["CorleoneTuning"] = true,
			["Aztecas"] = true,
			["Bloods"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
	["Buff"] = {
		["Parent"] = {
			["Buff"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Salary"] = { 2250 },
		["Service"] = {}
	}
}