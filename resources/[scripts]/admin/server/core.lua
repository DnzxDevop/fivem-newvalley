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
Tunnel.bindInterface("admin", QuantumGG)
vCLIENT = Tunnel.getInterface("admin")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Spectate = {}
Blips = false
Checkpoint = 0
LastSave = os.time() + 300
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Quake"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVEAUTO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		Wait(60000)

		if os.time() >= LastSave then
			TriggerEvent("SaveServer",true)
			LastSave = os.time() + 300
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Doords")
AddEventHandler("admin:Doords",function(Coords,Model,Heading)
	vRP.Archive("coordenadas.txt","Coords = "..Coords..", Hash = "..Model..", Heading = "..Heading)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:COORDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Coords")
AddEventHandler("admin:Coords",function(Coords)
	vRP.Archive("coordenadas.txt",Optimize(Coords["x"])..","..Optimize(Coords["y"])..","..Optimize(Coords["z"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:COPYCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:CopyCoords")
AddEventHandler("admin:CopyCoords",function(Coords)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vKEYBOARD.Copy(source,"Cordenadas:",Optimize(Coords["x"])..","..Optimize(Coords["y"])..","..Optimize(Coords["z"]))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.buttonTxt()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vRP.Archive(Passport..".txt",Optimize(Coords["x"])..","..Optimize(Coords["y"])..","..Optimize(Coords["z"])..","..Optimize(heading))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACECONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.RaceConfig(Left,Center,Right,Distance,Name)
	vRP.Archive(Name..".txt","{")

	vRP.Archive(Name..".txt","['Left'] = vec3("..Optimize(Left["x"])..","..Optimize(Left["y"])..","..Optimize(Left["z"]).."),")
	vRP.Archive(Name..".txt","['Center'] = vec3("..Optimize(Center["x"])..","..Optimize(Center["y"])..","..Optimize(Center["z"]).."),")
	vRP.Archive(Name..".txt","['Right'] = vec3("..Optimize(Right["x"])..","..Optimize(Right["y"])..","..Optimize(Right["z"]).."),")
	vRP.Archive(Name..".txt","['Distance'] = "..Distance)

	vRP.Archive(Name..".txt","},")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEVTOOLSKICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:DevToolsKick")
AddEventHandler("admin:DevToolsKick", function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.Kick(source,"Expulso da cidade.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Spectate[Passport] then
		Spectate[Passport] = nil
	end
end)

RegisterCommand("setvip",function(source,Message)
	local vrp = vRP.Passport(source)
	if vRP.HasPermission(vrp,'Admin',1) then
    exports.vrp:applyVipPreset(Message[1],'premiumquantico')
	else
		return
	end
end)

RegisterCommand("spawngive",function(source,Message)
	TriggerClientEvent("spawn:Opened")
end)

RegisterCommand("dnzxtest",function(source)
	source = source
	local Coords = vRP.GetEntityCoords(source)
	local Permission = vRP.NumPermission('Policia')
	for Passports,Sources in pairs(Permission) do
		async(function()
			TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Assalto a mão armada", text = 'Alguem Está Sendo Roubado!!', x = Coords["x"], y = Coords["y"], z = Coords["z"], time = "Recebido às " .. os.date("%H:%M"), blipColor = 2 })
		end)
	end
end)