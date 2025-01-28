local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

SPRAYS = {}
FastBlacklist = {}

Citizen.CreateThread(function()
    if Config.Blacklist then
        for _, word in pairs(Config.Blacklist) do
            FastBlacklist[word] = word
        end
    end
end)

function GetSprayAtCoords(pos)
    for _, spray in pairs(SPRAYS) do
        if spray.location == pos then
            return spray
        end
    end
end

RegisterNetEvent('rcore_spray:addSpray')
AddEventHandler('rcore_spray:addSpray', function(spray)
    SPRAYS[#SPRAYS+1] = spray
    TriggerClientEvent('rcore_spray:setSprays', -1, SPRAYS)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
    TriggerClientEvent('rcore_spray:setSprays',source,SPRAYS)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('rcore_spray:UseItemInventory')
AddEventHandler('rcore_spray:UseItemInventory', function(source,sprayText)
    local Ped = GetPlayerPed(source)
    local Coords = GetEntityCoords(Ped)
    local Service,Total = vRP.NumPermission("Police")
    if FastBlacklist[sprayText] then
        TriggerClientEvent("Notify",souce,"Negado","Você não pode usar esse tipo de palavra ofenciva",5000)
    else
        if sprayText then
            if sprayText:len() <= 9 then
                TriggerClientEvent('rcore_spray:spray', source, sprayText)
                TriggerClientEvent("Notify",source,"Aviso","Autoridades foram notificadas.",3000)
                for k,v in pairs(Service) do
                    async(function()
                        TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S"), code = 'QTH', title = "Dano ao patrimônio", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Câmera de segurança", rgba = {160,108,15} })
                    end)
                end
            else
                TriggerClientEvent("Notify",source,"Negado","Você so consegue grafitar palavras com até 9 letras",5000)
            end
        else
            TriggerClientEvent("Notify",source,"Negado","Ultilize /spary (nome desejado).","vermelho",5000)
        end
    end
end)

RegisterCommand('remove', function(source)
    TriggerClientEvent('rcore_spray:removeClosestSpray', source)
end, false)

RegisterCommand('dnzxdev', function(source)
    TriggerEvent('rcore_spray:UseItemInventory', source,'dnzx')
end, false)