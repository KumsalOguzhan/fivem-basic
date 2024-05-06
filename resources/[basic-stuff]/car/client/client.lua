RegisterCommand('car', function(source, args, rawCommand)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Warninig ' .. vehicleName .. ' is not a vehicle' }
        })

        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    local vehicle = CreateVehicle(
        vehicleName,
        pos,
        heading,
        true,
        false
    )

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)

RegisterCommand('randomcar', function(source, args, rawCommand)
    local vehicles = GetAllVehicleModels()
    local veh = vehicles[math.random(1, #vehicles)]

    RequestModel(veh)
    repeat Wait(10) until HasModelLoaded(veh)

    local veh = CreateVehicle(veh, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)

    SetPedIntoVehicle(PlayerPedId(), veh, -1)
    SetModelAsNoLongerNeeded(veh)
end)

-- Shows a notification on the player's screen
-- function ShowNotification(text)
--     SetNotificationTextEntry("STRING")
--     AddTextComponentSubstringPlayerName(text)
--     DrawNotification(false, false)
-- end

-- RegisterCommand('car', function(source, args, rawCommand)
--     local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
--     local veh = args[1]
--     if veh == nil then veh = "adder" end
--     vehiclehash = GetHashKey(veh)
--     RequestModel(vehiclehash)

--     Citizen.CreateThread(function()
--         local waiting = 0
--         while not HasModelLoaded(vehiclehash) do
--             waiting = waiting + 100
--             Citizen.Wait(100)
--             if waiting > 5000 then
--                 ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
--                 break
--             end
--         end
--         CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()) + 90, 1, 0)
--     end)
-- end)
