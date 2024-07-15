QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('slimjim', 'Open a locked vehicle (Government)', {}, false, function(source)
    TriggerClientEvent('slimjim:client:unlock', source)
end)
