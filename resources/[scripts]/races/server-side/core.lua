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
Creative = {}
Tunnel.bindInterface("races", Creative)

vRP.Prepare("races/Result","SELECT * FROM races WHERE Race = @Race AND Passport = @Passport")
vRP.Prepare("races/Ranking","SELECT * FROM races WHERE Race = @Race ORDER BY Points ASC LIMIT 5")
vRP.Prepare("races/TopFive","SELECT * FROM races WHERE Race = @Race ORDER BY Points ASC LIMIT 1 OFFSET 4")
vRP.Prepare("races/Records","UPDATE races SET Points = @Points, Vehicle = @Vehicle WHERE Race = @Race AND Passport = @Passport")
vRP.Prepare("races/Insert","INSERT INTO races(Race,Passport,Name,Vehicle,Points) VALUES(@Race,@Passport,@Name,@Vehicle,@Points)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Payments = {}
local Cooldowns = {}
local ActiveRaces = {}
local Participants = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISH
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Finish(Mode, Route, Points)
    local source = source
    local Passport = vRP.Passport(source)
    local Identity = vRP.Identity(Passport)
    local VehicleName = vRPC.VehicleName(source)
    if not Passport then return end

    local RaceKey = Mode .. ":" .. Route
    Points = Points and Points > 1000 and math.floor(Points / 1000) or 0

    if ActiveRaces[RaceKey] and ActiveRaces[RaceKey]?[Passport] then
        ActiveRaces[RaceKey][Passport] = nil
        if next(ActiveRaces[RaceKey]) == nil then
            GlobalState[RaceKey] = nil
        end
    end

    if Payments[Passport] then
        Payments[Passport] = nil

        local RouteData = Races[Mode]["Routes"][Route]
        if not RouteData then return end

        local Query = vRP.Query("races/Result", { Race = Mode, Passport = Passport })
        local Action = Query[1] and "Records" or "Insert"

        if Points > 0 then
            vRP.Query("races/"..Action, {
                Race = Mode,
                Passport = Passport,
                Name = Identity["Name"] .. " " .. Identity["Lastname"],
                Vehicle = VehicleName,
                Points = parseInt(Points)
            })
        end

        vRP.GenerateItem(Passport, PaymentItem, RouteData["Payment"], true)
        TriggerEvent("blipsystem:Exit", source)

        local Ranking = Creative.Ranking(Mode, Route)
        if Ranking[1] and Ranking[1]["Passport"] == Passport then
            vRP.GenerateItem(Passport, TrophyItem, 1, true)
            TriggerClientEvent("Notify",source,"Sucesso","Parabéns, você está em primeiro lugar na corrida!","verde",25000)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- START
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Start(Mode, Route)
    local source = source
    local Passport = vRP.Passport(source)
    if not Passport then return false end

    local RaceKey = Mode .. ":" .. Route
    Cooldowns[RaceKey] = Cooldowns[RaceKey] or {}

    if Cooldowns[RaceKey]?[Passport] and os.time() < Cooldowns[RaceKey]?[Passport] then
        local Time = Cooldowns[RaceKey]?[Passport] - os.time()
        return false
    end

    if not vRP.TakeItem(Passport, TicketItem, 200, true) then
        local ItemName = ItemName(TicketItem)
        return false
    end

    Cooldowns[RaceKey][Passport] = os.time() + 60
    Payments[Passport] = true
    GlobalState[RaceKey] = true
    ActiveRaces[RaceKey] = ActiveRaces[RaceKey] or {}
    ActiveRaces[RaceKey][Passport] = true

    TriggerClientEvent("races:Start", source, Mode, Route)
    local RaceData = Races[Mode]
    local RouteData = RaceData["Routes"][Route]
    return RouteData["Time"] or 60
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- RANKING
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Ranking(Mode, Route)
    local Query = vRP.Query("races/Ranking", { Race = Mode })
    local Ranking = {}

    for k, v in ipairs(Query) do
        Ranking[#Ranking + 1] = {
            Name = v['Name'],
            Vehicle = v['Vehicle'],
            Time = v['Points'],
			Passport = v['Passport']
        }
    end

    return Ranking
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.GlobalState(Mode, Route)
	local source = source
	local RaceName = Mode .. ":" .. Route
    if Races[Mode] and Races[Mode]["Global"] and not GlobalState[RaceName] then
        GlobalState[RaceName] = true
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Cancel()
    local source = source
    local Passport = vRP.Passport(source)
    if not Passport then return end

    for RaceKey, Participants in pairs(ActiveRaces) do
        if Participants[Passport] then
            Participants[Passport] = nil
            if next(Participants) == nil then
                GlobalState[RaceKey] = nil
            end
        end
    end

    Payments[Passport] = nil
    TriggerEvent("blipsystem:Exit", source)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport, source)
    Creative.Cancel(source)
end)