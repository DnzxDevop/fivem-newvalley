AddEventHandler("centralcart.ready", function()
  local CentralCart = exports[GetCurrentResourceName()]

  CentralCart:registerCommand("setVip", function(Passport, vip)
    exports.vrp:applyVipPreset(Passport,vip)
  end)
end)