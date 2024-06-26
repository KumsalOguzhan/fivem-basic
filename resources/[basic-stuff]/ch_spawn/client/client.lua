local spawnPos = vector3(686.245, 577.950, 130.461)

AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_y_juggalo_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'Partiye hoşgeldin 🎉🎉🎉' }
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

RegisterCommand('char', function(source, args, rawCommand)
    local modelName = args[1]

    if IsModelInCdimage(modelName) and IsModelValid(modelName) then
        RequestModel(modelName)

        while not HasModelLoaded(modelName) do
            Wait(10)
        end

        SetPlayerModel(PlayerId(), modelName)
        SetModelAsNoLongerNeeded(modelName)
    end
end)

RegisterCommand('restart', function(source, args, rawCommand)
    TriggerEvent('onClientGameTypeStart')
end)
