QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('slimjim:client:unlock', function()
    local player = QBCore.Functions.GetPlayerData()
    local veh = QBCore.Functions.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(veh)
    print(string.format('Vehicle= %s', tostring(plate)))

    local jobFound = false

    for _, job in ipairs(Config.AllowedJobs) do
        if player.job.name == job and player.job.onduty then
            jobFound = true
            if Config.RequireItemForUnlock then
                local hasItem = QBCore.Functions.HasItem('lockpick')  -- Check if player has the required item
                if not hasItem then
                    QBCore.Functions.Notify("You don't have a lockpick", "error")
                    return
                end
            end

            local ped = PlayerPedId()
            QBCore.Functions.Progressbar("hotwire_vehicle", "Opening vehicle door", 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                flags = 16
            }, {}, {}, function() -- Done
                StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
                ClearPedTasks(ped)
                print('Slimjim Used')
            end, function() -- Cancel
                ClearPedTasks(ped)
                print('Slimjim Cancelled')
            end)
            break
        end
    end

    if not jobFound then
        QBCore.Functions.Notify("You don't have the correct job to use this", "error")
    end
end)