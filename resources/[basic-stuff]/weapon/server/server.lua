RegisterNetEvent('weapon:giveweapon', function(targetId, weapon, ammo)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Sorry' .. targetId .. 'doesn\t exist.' }
        })
        return
    end

    if weapon == 'all' or weapon == nil then
        local weapons = cfg.weapons

        for hash, wName in pairs(weapons) do
            GiveWeaponToPed(ped, wName, 999, false, false)
        end

        return
    end

    GiveWeaponToPed(targetPed, weapon, ammo)
end)
