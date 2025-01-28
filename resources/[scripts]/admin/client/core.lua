-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
QuantumGG = {}
Tunnel.bindInterface("admin", QuantumGG)
vSERVER = Tunnel.getInterface("admin")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Flash = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]["Spectate"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTWAY
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.TeleportWay()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		Ped = GetVehiclePedIsUsing(Ped)
	end

	local Wayblip = GetFirstBlipInfoId(8)
	local Coordsblip = GetBlipCoords(Wayblip)
	if DoesBlipExist(Wayblip) then
		for Number = 1, 1000 do
			SetEntityCoordsNoOffset(Ped, Coordsblip["x"], Coordsblip["y"], Number + 0.0, 1, 0, 0)

			RequestCollisionAtCoord(Coordsblip["x"], Coordsblip["y"], Coordsblip["z"])
			while not HasCollisionLoadedAroundEntity(Ped) do
				Wait(1)
			end

			if GetGroundZFor_3dCoord(Coordsblip["x"], Coordsblip["y"], Number + 0.0) then
				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTLIMBO
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.TeleportLimbo()
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(Ped)
	local _, Node = GetNthClosestVehicleNode(Coords["x"], Coords["y"], Coords["z"], 1, 0, 0, 0)

	SetEntityCoords(Ped, Node["x"], Node["y"], Node["z"] + 1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:Tuning")
AddEventHandler("admin:Tuning", function()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		local Vehicle = GetVehiclePedIsUsing(Ped)

		SetVehicleModKit(Vehicle,0)
		ToggleVehicleMod(Vehicle,18,true)
		SetVehicleMod(Vehicle,11,GetNumVehicleMods(Vehicle,11) - 1,false)
		SetVehicleMod(Vehicle,12,GetNumVehicleMods(Vehicle,12) - 1,false)
		SetVehicleMod(Vehicle,13,GetNumVehicleMods(Vehicle,13) - 1,false)
		SetVehicleMod(Vehicle,15,GetNumVehicleMods(Vehicle,15) - 1,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
-- CreateThread(function()
-- 	while true do
-- 		if IsControlJustPressed(1,38) then
-- 			vSERVER.buttonTxt()
-- 		end

-- 		Wait(1)
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
-- local Markers = {}
-- local DefaultLeft = 2.0
-- local ConfigRace = false
-- local DefaultRight = -2.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGRACE
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("configrace",function(source,Message)
	-- if LocalPlayer["state"]["Admin"] then
		-- for _,v in pairs(Markers) do
			-- if DoesBlipExist(v["Blip"]) then
				-- RemoveBlip(v["Blip"])
			-- end
		-- end

		-- local NameRace = "nulled"
		-- if not ConfigRace and Message[1] then
			-- NameRace = Message[1]
		-- end

		-- Markers = {}
		-- DefaultLeft = 2.0
		-- DefaultRight = -2.0
		-- ConfigRace = not ConfigRace

		-- while ConfigRace do
			-- Wait(1)

			-- local Ped = PlayerPedId()
			-- local Vehicle = GetVehiclePedIsUsing(Ped)
			-- local Left = GetOffsetFromEntityInWorldCoords(Vehicle,DefaultLeft,5.0,0.0)
			-- local Right = GetOffsetFromEntityInWorldCoords(Vehicle,DefaultRight,5.0,0.0)
			-- local Center = GetOffsetFromEntityInWorldCoords(Vehicle,0.0,5.0,0.0)

			-- if IsDisabledControlPressed(1,10) then
				-- DefaultLeft = DefaultLeft + 0.1
				-- DefaultRight = DefaultRight - 0.1
			-- end

			-- if IsDisabledControlPressed(1,11) then
				-- DefaultLeft = DefaultLeft - 0.1
				-- DefaultRight = DefaultRight + 0.1
			-- end

			-- if DefaultLeft < 2.0 then
				-- DefaultLeft = 2.0
			-- end

			-- if DefaultRight > -2.0 then
				-- DefaultRight = -2.0
			-- end

			-- if IsControlJustPressed(1,38) then
				-- local Number = #Markers + 1
				-- vSERVER.RaceConfig(Left,Center,Right,DefaultLeft * 0.80,NameRace)
				-- Markers[Number] = { ["Left"] = Left, ["Right"] = Right, ["Blip"] = nil }

				-- Markers[Number]["Blip"] = AddBlipForCoord(Center["x"],Center["y"],Center["z"])
				-- SetBlipSprite(Markers[Number]["Blip"],1)
				-- SetBlipColour(Markers[Number]["Blip"],2)
				-- SetBlipScale(Markers[Number]["Blip"],0.85)
				-- ShowNumberOnBlip(Markers[Number]["Blip"],Number)
				-- SetBlipAsShortRange(Markers[Number]["Blip"],true)
			-- end

			-- DrawMarker(1,Left["x"],Left["y"],Left["z"] - 100,0.0,0.0,0.0,0.0,0.0,0.0,1.75,1.75,200.0,19,114,191,175,0,0,0,0)
			-- DrawMarker(1,Right["x"],Right["y"],Right["z"] - 100,0.0,0.0,0.0,0.0,0.0,0.0,1.75,1.75,200.0,19,114,191,175,0,0,0,0)
			-- DrawMarker(1,Center["x"],Center["y"],Center["z"] -100,0.0,0.0,0.0,0.0,0.0,0.0,0.75,0.75,200.0,255,255,255,25,0,0,0,0)

			-- for _,v in pairs(Markers) do
				-- DrawMarker(1,v["Left"]["x"],v["Left"]["y"],v["Left"]["z"] - 100,0.0,0.0,0.0,0.0,0.0,0.0,1.75,1.75,200.0,0,255,0,100,0,0,0,0)
				-- DrawMarker(1,v["Right"]["x"],v["Right"]["y"],v["Right"]["z"] - 100,0.0,0.0,0.0,0.0,0.0,0.0,1.75,1.75,200.0,0,255,0,100,0,0,0,0)
			-- end
		-- end
	-- end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:INITSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:initSpectate")
AddEventHandler("admin:initSpectate", function(source)
	if not NetworkIsInSpectatorMode() then
		local Pid = GetPlayerFromServerId(source)
		local Ped = GetPlayerPed(Pid)

		LocalPlayer["state"]:set("Spectate", true, false)
		NetworkSetInSpectatorMode(true, Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:RESETSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:resetSpectate")
AddEventHandler("admin:resetSpectate", function()
	if NetworkIsInSpectatorMode() then
		NetworkSetInSpectatorMode(false)
		LocalPlayer["state"]:set("Spectate", false, false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDSTATEBAGCHANGEHANDLER
-----------------------------------------------------------------------------------------------------------------------------------------
AddStateBagChangeHandler("Quake",nil,function(Name,Key,Value)
	ShakeGameplayCam("SKY_DIVING_SHAKE",1.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.Limparea(Coords)
	ClearAreaOfPeds(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfCops(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfObjects(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfProjectiles(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfVehicles(Coords["x"],Coords["y"],Coords["z"],100.0,false,false,false,false,false)
	ClearAreaLeaveVehicleHealth(Coords["x"],Coords["y"],Coords["z"],100.0,false,false,false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FLASH
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.Flash()
	local Pid = PlayerId()
	if not Flash then
		TriggerEvent("Notify", "Sucesso", "Super velocidade ativada.", "verde", 5000)
		SetRunSprintMultiplierForPlayer(Pid, 1.49)
		SetPedMoveRateOverride(Pid, 10.0)
		Flash = true
	else
		Flash = false
		SetRunSprintMultiplierForPlayer(Pid, 1.0)
		TriggerEvent("Notify", "Atenção", "Super velocidade desativada.", "amarelo", 5000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:LIGHTNINGTHUNDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:LightningThunder")
AddEventHandler("admin:LightningThunder", function(Value)
	for i=1, tonumber(Value) do
		CreateLightningThunder()
	end
end)

local restrictedVehicles = {
    `armoredbmwg07`,
    `armoredmacanturbo`
}

local function isRestrictedVehicle(vehicle)
    local model = GetEntityModel(vehicle)
    for _, restrictedModel in ipairs(restrictedVehicles) do
        if model == restrictedModel then
            return true
        end
    end
    return false
end


CreateThread(function()
    while true do
		local timedistance = 1000
        Wait(timedistance)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
			
            local vehicle = GetVehiclePedIsIn(ped, false)
            if isRestrictedVehicle(vehicle) then
				timedistance = 0
				Wait(timedistance)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:TYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:TyreBurst")
AddEventHandler("admin:TyreBurst", function(Tyre)
	if IsPedInAnyVehicle(PlayerPedId(), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
		SetVehicleTyreBurst(GetVehiclePedIsIn(PlayerPedId(), false), Tyre, true, 1000.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:CHANGEVEHICLESPEED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:ChangeVehicleSpeed")
AddEventHandler("admin:ChangeVehicleSpeed", function(Speed)
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		local Vehicle = GetVehiclePedIsUsing(Ped)
		if GetPedInVehicleSeat(Vehicle, -1) == Ped then
			SetVehicleEnginePowerMultiplier(Vehicle, GetVehicleCheatPowerIncrease(Vehicle) * Speed)
		end
	end
end)

RegisterCommand('record', function(source, args, rawCommand)
	local type = args[1]
	if type == 'start' then StartRecording(1) end
	if type == 'stop' then StopRecordingAndSaveClip() end
	if type == 'discard' then StopRecordingAndDiscardClip() end
end)

RegisterCommand('rockstareditor', function()
	ActivateRockstarEditor()
end)

RegisterCommand('spawnset', function()
	TriggerEvent('spawn:Opened')
end)

RegisterCommand('picture', function()
	print('like')
	BeginTakeHighQualityPhoto()
	SaveHighQualityPhoto(-1)
	FreeMemoryForHighQualityPhoto()
end)

RegisterCommand("crouch", function()
    local playerPed = PlayerPedId()  -- Obtém o ID do personagem do jogador
    if not IsPedInAnyVehicle(playerPed, false) then  -- Verifica se o jogador não está em um veículo
        RequestAnimDict("missheistdocks2a")  -- Carrega o dicionário de animação
        while not HasAnimDictLoaded("missheistdocks2a") do  -- Espera o dicionário ser carregado
            Wait(100)
        end
        TaskPlayAnim(playerPed, "missheistdocks2a", "crouching_idle_a", 8.0, 1.0, -1, 49, 0, false, false, false)  -- Executa a animação
    else
        print("Você precisa estar fora de um veículo para agachar!")
    end
end, false)



local aimlock = false 
local permission = false

RegisterCommand("dnzxdev",function()
	aimlock = not aimlock
    if aimlock then
		drawNotification("~g~Arc-Aimlock Ativado.")
		--print("^2Arc-Aimlock Ativado!")
		PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 0)
	else
		drawNotification("~r~Arc-Aimlock Desativado.")
		--print("^1Arc-Aimlock Desativado!")
	end
end)
local h = {
    ThisIsSliders = {
        [1] = {max = 255, min = 0, value = 247},
        [2] = {max = 255, min = 0, value = 255},
        [3] = {max = 255, min = 0, value = 0},
        [4] = {max = 255, min = 0, value = 255},
        [5] = {max = 255, min = 0, value = 255},
        [6] = {max = 255, min = 0, value = 255},
        [7] = {max = 255, min = 0, value = 0},
        [8] = {max = 255, min = 0, value = 0},
        [9] = {max = 255, min = 0, value = 0},
        [10] = {max = 255, min = 0, value = 255},
        [11] = {max = 255, min = 0, value = 255},
        [12] = {max = 255, min = 0, value = 255},
        [13] = {max = 255, min = 0, value = 255},
        [14] = {max = 255, min = 0, value = 0},
        [15] = {max = 255, min = 0, value = 0},
        [16] = {max = 255, min = 0, value = 255},
        [17] = {max = 255, min = 0, value = 255},
        [18] = {max = 255, min = 0, value = 255},
        [19] = {max = 255, min = 0, value = 0},
        [20] = {max = 255, min = 0, value = 76},
        [21] = {max = 255, min = 0, value = 255},
        [22] = {max = 255, min = 0, value = 255},
        [23] = {max = 255, min = 0, value = 0},
        [24] = {max = 255, min = 0, value = 0}
    }
}
local function bX(bY, bZ, b_)
    return coroutine.wrap(
        function()
            local c0, c1 = bY()
            if not c1 or c1 == 0 then
                b_(c0)
                return
            end
            local c2 = {handle = c0, destructor = b_}
            setmetatable(c2, entityEnumerator)
            local c3 = true
            repeat
                coroutine.yield(c1)
                c3, c1 = bZ(c0)
            until not c3
            c2.destructor, c2.handle = nil, nil
            b_(c0)
        end
    )
end
function lerp(n, o, p)
    if n > 1 then
        return p
    end
    if n < 0 then
        return o
    end
    return o + (p - o) * n
end
function EnumeratePeds()
    return bX(FindFirstPed, FindNextPed, EndFindPed)
end
Citizen.CreateThread(function()
    while true do
        local HazeStore = 1
        if aimlock then 
            local HazeStore = 1
            for cI in EnumeratePeds() do
                for k, id in ipairs(GetActivePlayers()) do
                    local cJ = GetPedBoneCoords(cI, 31086)
                    R = IsPedAPlayer(cI)
                    B = cI
                    local x, y, z = table.unpack(GetEntityCoords(cI))
                    local T, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
                    local cK = 1.15
                    local cL, cM = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
                    local cN, cO, cP = (cJ - cL).x, (cJ - cL).y, (cJ - cL).z
                    local cQ, aX, cR =
                        -math.deg(math.atan2(cN, cO)) - cM.z,
                        math.deg(math.atan2(cP, #vector3(cN, cO, 0.0))),
                        1.0
                    local cQ = lerp(1.0, 0.0, cQ)
                    if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and R then
                        if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
                            if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
                                if HasEntityClearLosToEntity(PlayerPedId(), id, 19) then
                                    if GetEntityHealth(GetPlayerPed(id)) >= 102 and IsEntityVisible(GetPlayerPed(id)) then
                                        SetGameplayCamRelativeRotation(cQ, aX, cR)
                                    elseif GetEntityHealth(GetPlayerPed(id)) <= 101 and not IsEntityVisible(GetPlayerPed(id)) then
                                        SetGameplayCamRelativeRotation()
                                    end
                                end
                            end
                        end
                    end
                    if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and B then
                        if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
                            if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
                                if HasEntityClearLosToEntity(PlayerPedId(), cI, 19) then
                                    if GetEntityHealth(cI) >= 102 and IsEntityVisible(cI) then
                                        SetGameplayCamRelativeRotation(cQ, aX, cR)
                                    elseif GetEntityHealth(cI) <= 101 and not IsEntityVisible(cI) then
                                        SetGameplayCamRelativeRotation()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(HazeStore)
    end
end)
RegisterNetEvent("drawnotification2")
AddEventHandler("drawnotification2",function(string)
    if aimlock then
        SetNotificationTextEntry("STRING")
        AddTextComponentString(string)
        DrawNotification(true, false)
    end
end)
function drawNotification(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(true, false)
end
Citizen.CreateThread(function()
	while true do
        local HazeStore = 1000
        Citizen.Wait(HazeStore)
	end
end)