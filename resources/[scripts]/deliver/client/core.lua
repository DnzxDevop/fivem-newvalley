-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vINVENTORY = Tunnel.getInterface("inventory")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blip = nil
local Worked = nil
local Progress = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSERVERSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(List) do
		exports["target"]:AddBoxZone("Lumber",vec3(1961.61,5179.26,47.94),2,2,{
			name = "Conversar",
			heading = 0.0,
		},{
			shop = "Lumber",
			Distance = 1.75,
			options = {
				{
					event = "deliver:Dialog",
					tunnel = "client",
					label = "Conversar"
				}
			}
		})
	end
end)

CreateThread(function()
	for Name,v in pairs(List) do
		exports["target"]:AddBoxZone("Transporter",vec3(264.84,219.91,101.67),1,1,{
			name = "Conversar",
			heading = 0.0,
		},{
			shop = "Trans",
			Distance = 1.75,
			options = {
				{
					event = "deliver:Transporter",
					tunnel = "client",
					label = "Conversar"
				}
			}
		})
	end
end)

AddEventHandler("deliver:Transporter",function()
	exports.dialog:showDialog({
		ped = ped,
		dialog = {
			{
				id = 'initial_lumberman_talk',
				job = 'Transportador',
				name = 'Bernardo',
				text = 'Vamos transportar?',
				buttons = {
					{
						id = 'leave1',
						label = 'Quero Trabalhar!',
						onSelect = function(switchDialog)
						    TriggerEvent('deliver:Init','Transporter')
						end,
						close = true,
					},
					{
						id = 'leave1',
						label = 'Ja estou em serviço, quero finalizar!',
						onSelect = function(switchDialog)
						    TriggerEvent('deliver:Init','Transporter')
						end,
						close = true,
					},
					{
						id = 'leave1',
						label = 'Deixa Pra lá! sou alérgico a CLT.',

						close = true,
					},
				},
			},
			{
				id = 'lumberman_second',
				job = 'Lenhador',
				name = 'Roberto',
				text = 'Para Pegar Toras, compre um machado e derrube as arvores ao lado, utilizando a tecla [ALT]',
				buttons = {
					{
						id = 'leave2',
						label = 'Beleza, Depois que pegar, vou vender!',
						nextDialog = 'lumberman_talk_end',
					},
				},
			},
			{
				id = 'lumberman_talk_end',
				job = 'Lenhador',
				name = 'Roberto',
				text = 'OK, Muito Obrigado!',
				buttons = {
					{
						id = 'end',
						label = 'Terminar Conversa', --end conversation
						close = true,
					},
				},
			},
		}
	})
end)

AddEventHandler("deliver:Dialog",function()
	exports.dialog:showDialog({
		ped = ped,
		dialog = {
			{
				id = 'initial_lumberman_talk',
				job = 'Lenhador',
				name = 'Roberto',
				text = 'Então você gosta de madeira?',
				buttons = {
					{
						id = 'leave1',
						label = 'Quero Vender Toras!',
						onSelect = function(switchDialog)
						    TriggerEvent('deliver:Init','Lumberman')
						end,
						close = true,
					},
					{
						id = 'leave1',
						label = 'Como Pego Toras?',
						nextDialog = 'lumberman_second', 
					},
					{
						id = 'leave1',
						label = 'Ja estou em serviço, quero finalizar!',
						onSelect = function(switchDialog)
						    TriggerEvent('deliver:Init','Lumberman')
						end,
						close = true,
					},
					{
						id = 'leave1',
						label = 'Deixa Pra lá! sou alérgico a CLT.',

						close = true,
					},
				},
			},
			{
				id = 'lumberman_second',
				job = 'Lenhador',
				name = 'Roberto',
				text = 'Para Pegar Toras, compre um machado e derrube as arvores ao lado, utilizando a tecla [ALT]',
				buttons = {
					{
						id = 'leave2',
						label = 'Beleza, Depois que pegar, vou vender!',
						nextDialog = 'lumberman_talk_end',
					},
				},
			},
			{
				id = 'lumberman_talk_end',
				job = 'Lenhador',
				name = 'Roberto',
				text = 'OK, Muito Obrigado!',
				buttons = {
					{
						id = 'end',
						label = 'Terminar Conversa', --end conversation
						close = true,
					},
				},
			},
		}
	})
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVER:INIT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("deliver:Init",function(Service)
	if Locations[Service] then
		if Progress then
			Worked = nil
			Progress = false
			TriggerEvent("Notify","Central de Empregos","Você acaba finalizar sua jornada de trabalho, esperamos que você tenha aprendido bastante hoje.","default",5000)



			if Blip and DoesBlipExist(Blip) then
				RemoveBlip(Blip)
				Blip = nil
			end
		else
			Progress = true
			Worked = Service
			BlipMarkerService()
			TriggerEvent("Notify","Central de Empregos","Você acaba de dar inicio a sua jornada de trabalho","default",5000)



			while Progress do
				local TimeDistance = 999
				local Ped = PlayerPedId()
				if not IsPedInAnyVehicle(Ped) then
					local Coords = GetEntityCoords(Ped)
					local Selected = List[Worked]["Locate"]
					local Distance = #(Coords - Locations[Worked][Selected])

					if Distance <= 10.0 then
						TimeDistance = 1
						SetDrawOrigin(Locations[Worked][Selected]["x"],Locations[Worked][Selected]["y"],Locations[Worked][Selected]["z"])
						DrawSprite("Targets","H",0.0,0.0,0.02,0.02 * GetAspectRatio(false),0.0,255,255,255,255)
						ClearDrawOrigin()

						if Distance <= 1.0 and IsControlJustPressed(1,74) and vINVENTORY.Deliver(Worked) then
							if List[Worked]["Route"] then
								if Selected >= #Locations[Worked] then
									List[Worked]["Locate"] = 1
								else
									List[Worked]["Locate"] = List[Worked]["Locate"] + 1
								end
							else
								local Lasted = List[Worked]["Locate"]

								repeat
									if Lasted == List[Worked]["Locate"] then
										List[Worked]["Locate"] = math.random(#Locations)
									end

									Wait(1)
								until Lasted ~= List[Worked]["Locate"]

								List[Worked]["Locate"] = math.random(#Locations[Worked])
							end

							BlipMarkerService()
						end
					end
				end

				Wait(TimeDistance)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPMARKERSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function BlipMarkerService()
	if Blip and DoesBlipExist(Blip) then
		RemoveBlip(Blip)
		Blip = nil
	end

	if Worked then
		local Selected = List[Worked]["Locate"]
		local Coords = Locations[Worked][Selected]
		Blip = AddBlipForCoord(Coords["x"],Coords["y"],Coords["z"])
		SetBlipSprite(Blip,1)
		SetBlipColour(Blip,77)
		SetBlipScale(Blip,0.5)
		SetBlipRoute(Blip,true)
		SetBlipAsShortRange(Blip,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Entrega")
		EndTextCommandSetBlipName(Blip)
	end
end