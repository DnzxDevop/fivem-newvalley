-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
QuantumGG = {}
Tunnel.bindInterface("plants",QuantumGG)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
local Plants = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINITOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Consult = vRP.Query("entitydata/GetData",{ Name = "Plants" })
	if Consult[1] then
		Plants = json.decode(Consult[1]["Information"])

		for Index,v in pairs(Plants) do
			if Index and Plants[Index] and Plants[Index]["Timer"] and (os.time() - Plants[Index]["Timer"]) > 3600 then
				Plants[Index] = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLANTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Plants",function(Hash,Coords,Route,Item,Amount)
	repeat
		Selected = GenerateString("DDLLDDLL")
	until Selected and not Plants[Selected]

	Plants[Selected] = {
		["Water"] = 0.0,
		["Hash"] = Hash,
		["Item"] = Item,
		["Route"] = Route,
		["Coords"] = Coords,
		["Timer"] = os.time() + 7200,
		["Amount"] = math.random(Amount["Min"],Amount["Max"])
	}

	TriggerClientEvent("plants:New",-1,Selected,Plants[Selected])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckDeath(source,Number)
	if Number and Plants[Number] and Plants[Number]["Timer"] and (os.time() - Plants[Number]["Timer"]) > 3600 then
		Plants[Number] = nil
		TriggerClientEvent("dynamic:Close",source)
		TriggerClientEvent("plants:Remove",-1,Number)
		TriggerClientEvent("Notify",source,"Horticultura","A plantação apodreceu.","vermelho",5000)

		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLANTS:COLLECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("plants:Collect")
AddEventHandler("plants:Collect",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Plants[Number] and Plants[Number]["Timer"] and not CheckDeath(source,Number) and os.time() >= Plants[Number]["Timer"] then
		local Temporary = Plants[Number]

		Plants[Number] = nil
		Active[Passport] = true
		Player(source)["state"]["Cancel"] = true
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("dynamic:Close",source)
		TriggerClientEvent("Progress",source,"Coletando",10000)
		vRPC.PlayAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		SetTimeout(10000,function()
			local Valuation = Temporary["Amount"]
			if Temporary["Water"] and Valuation then
				Valuation = Valuation + (Valuation * Temporary["Water"])
			end

			if vRP.CheckWeight(Passport,Temporary["Item"],Temporary["Amount"]) then
				vRP.GenerateItem(Passport,Temporary["Item"],Temporary["Amount"],true)
			else
				TriggerClientEvent("Notify",source,"Mochila Sobrecarregada","Sua recompensa caiu no chão.","roxo",5000)
				exports["inventory"]:Drops(Passport,source,Temporary["Item"],Temporary["Amount"])
			end

			TriggerClientEvent("plants:Remove",-1,Number)
			Player(source)["state"]["Buttons"] = false
			Player(source)["state"]["Cancel"] = false
			Active[Passport] = nil
			vRPC.Destroy(source)
		end)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLANTS:CLONING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("plants:Cloning")
AddEventHandler("plants:Cloning",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Plants[Number] and Plants[Number]["Timer"] and not CheckDeath(source,Number) and (Plants[Number]["Timer"] - os.time()) <= 3600 then
		local Temporary = Plants[Number]

		Plants[Number] = nil
		Active[Passport] = true
		Player(source)["state"]["Cancel"] = true
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("dynamic:Close",source)
		TriggerClientEvent("Progress",source,"Coletando",10000)
		vRPC.PlayAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		SetTimeout(10000,function()
			local Valuation = 2
			if Temporary["Water"] and Valuation then
				Valuation = Valuation + (Valuation * Temporary["Water"])
			end

			if vRP.CheckWeight(Passport,Temporary["Item"].."clone",Valuation) then
				vRP.GenerateItem(Passport,Temporary["Item"].."clone",Valuation,true)
			else
				TriggerClientEvent("Notify",source,"Mochila Sobrecarregada","Sua recompensa caiu no chão.","roxo",5000)
				exports["inventory"]:Drops(Passport,source,Temporary["Item"].."clone",Valuation)
			end

			TriggerClientEvent("plants:Remove",-1,Number)
			Player(source)["state"]["Buttons"] = false
			Player(source)["state"]["Cancel"] = false
			Active[Passport] = nil
			vRPC.Destroy(source)
		end)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLANTS:WATER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("plants:Water")
AddEventHandler("plants:Water",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Plants[Number] and Plants[Number]["Timer"] and not CheckDeath(source,Number) and Plants[Number]["Timer"] >= os.time() then
		local Consult = vRP.ConsultItem(Passport,"water",1)
		if Plants[Number]["Water"] < 1.0 and Consult then
			Active[Passport] = true
			Player(source)["state"]["Cancel"] = true
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("dynamic:Close",source)
			TriggerClientEvent("Progress",source,"Coletando",10000)
			vRPC.CreateObjects(source,"weapon@w_sp_jerrycan","fire","prop_wateringcan",1,28422,0.4,0.1,0.0,90.0,180.0,0.0)

			SetTimeout(10000,function()
				if Plants[Number] and Plants[Number]["Water"] < 1.0 and vRP.TakeItem(Passport,Consult["Item"],true) then
					Plants[Number]["Water"] = Plants[Number]["Water"] + 0.20
				end

				Player(source)["state"]["Buttons"] = false
				Player(source)["state"]["Cancel"] = false
				Active[Passport] = nil
				vRPC.Destroy(source)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INFORMATIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function QuantumGG.Informations(Number)
	local source = source
	if Number and Plants[Number] and Plants[Number]["Timer"] and not CheckDeath(source,Number) then
		local Collect = 100
		if (os.time() < Plants[Number]["Timer"]) then
			local Value = (Plants[Number]["Timer"] - os.time())

			Collect = Whole(100 - (Value / 7200) * 100)
		end

		local Cloning = 100
		if (Plants[Number]["Timer"] - os.time()) > 3600 then
			local Value = (Plants[Number]["Timer"] - os.time() - 3600)

			Cloning = Whole(100 - (Value / 3600) * 100)
		end

		return { Collect,Cloning,Plants[Number]["Item"],Plants[Number]["Water"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("plants:Table",source,Plants)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,source)
	if Active[Passport] then
		Active[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVESERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("SaveServer",function()
	vRP.Query("entitydata/SetData",{ Name = "Plants", Information = json.encode(Plants) })
end)