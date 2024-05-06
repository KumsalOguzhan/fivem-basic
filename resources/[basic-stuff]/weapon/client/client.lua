RegisterCommand("weapon", function(source, args, rawCommand)
    local ped = PlayerPedId()

    if args[1] == 'all' or args[1] == nil then
        local weapons = cfg.weapons

        for hash, wName in pairs(weapons) do
            GiveWeaponToPed(ped, wName, 999, false, false)
        end

        return
    end

    local weaponName = args[1]
    local ammo = args[2] or 999

    if not IsWeaponValid(weaponName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Warning ' .. weaponName .. ' is not a weapon' }
        })

        return
    end

    GiveWeaponToPed(ped, weaponName, ammo, false, false)
end)
