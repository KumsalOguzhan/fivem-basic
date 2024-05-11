RegisterNetEvent('teleport:tp', function(targetId)
    local playerId = source

    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Sorry' .. targetId .. 'doesn\t exist.' }
        })
        return
    end

    targetPos = GetEntityCoords(targetPed)

    TriggerClientEvent('teleporter:teleport', playerId, targetPos)
end)
