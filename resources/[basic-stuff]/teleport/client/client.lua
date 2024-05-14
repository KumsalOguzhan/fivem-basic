RegisterCommand('tp', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a user id.' }
        })
        return
    end

    TriggerServerEvent('teleport:tp', targetId)
end)

RegisterCommand('summon', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a user id.' }
        })
        return
    end

    TriggerServerEvent('teleport:summon', targetId)
end)

RegisterNetEvent('teleport:teleport', function(targetCoord)
    local playerPed = PlayerPedId()

    SetEntityCoords(playerPed, targetCoord)
end)
