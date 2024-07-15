-- QBCore = exports['qb-core']:GetCoreObject()

-- QBCore.Commands.Add('slimjim', 'Open a locked vehicle (Government)', {}, false, function(source)
--     TriggerClientEvent('slimjim:client:unlock', source)
-- end)

-- RegisterNetEvent('slimjim:server:unlock', function(player, veh)
--     local src = source
--     TriggerClientEvent("slimjim:client:unlock", source)
-- end)

QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('slimjim', 'Open a locked vehicle (Government)', {}, false, function(source)
    TriggerClientEvent('slimjim:client:unlock', source)
end)