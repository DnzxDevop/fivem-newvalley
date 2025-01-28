-----------------------------------------------------------------------------------------------------------------------------------------
-- Quantum Event - onClientResourceStart
-----------------------------------------------------------------------------------------------------------------------------------------
function dnzx()
    TriggerEvent('spawn:Opened')
    Wait(900)
    TriggerEvent('spawn:Opened')
end

RegisterNetEvent("onClientResourceStart")
AddEventHandler("onClientResourceStart", function(Resource)
    
    if Resource ~= 'loading' then
        return 
    end

    DoScreenFadeOut(0)
    DisplayRadar(false)
    ShutdownLoadingScreen()

    ShutdownLoadingScreenNui()
    local spawnOpened = dnzx()
    
    if spawnOpened then
        return true 
    else
        Citizen.Wait(1000)
        dnzx()
        TriggerEvent('spawn:Opened')
    end
end)


