CreateThread(function()
    for k in pairs(Config.Shops) do
        for i = 1, #Config.Shops[k]['ShowroomVehicles'] do
            local model = GetHashKey(Config.Shops[k]['ShowroomVehicles'][i].defaultVehicle)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            local veh = CreateVehicle(model, Config.Shops[k]['ShowroomVehicles'][i].coords.x, Config.Shops[k]['ShowroomVehicles'][i].coords.y, Config.Shops[k]['ShowroomVehicles'][i].coords.z, false, false)
            SetModelAsNoLongerNeeded(model)
            SetVehicleOnGroundProperly(veh)
            SetEntityInvincible(veh, true)
            SetVehicleDirtLevel(veh, 0.0)
            SetVehicleDoorsLocked(veh, 3)
            SetEntityHeading(veh, Config.Shops[k]['ShowroomVehicles'][i].coords.w)
            FreezeEntityPosition(veh, true)
            SetVehicleNumberPlateText(veh, 'BUY ME')
            -- if Config.UsingTarget then createVehZones(k, veh) end
        end
        -- if not Config.UsingTarget then createVehZones(k) end
    end
end)
