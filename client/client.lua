ESX = exports["es_extended"]:getSharedObject()

local function isVehicleBlacklisted(model)
    for _, blacklistpojazd in ipairs(Config.ZablokowanePojazdy) do
        if model == GetHashKey(blacklistpojazd) then
            return true
        end
    end
    return false
end

local function isItemBlacklisted(item)
    for _, blacklistPojazd in ipairs(Config.ZablokowanePrzedmioty) do
        if item == blacklistPojazd then
            return true
        end
    end
    return false
end

local function isPedBlacklisted(model)
    for _, blacklistPed in ipairs(Config.ZablokowanePedy) do
        if model == GetHashKey(blacklistPed) then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()
        if playerPed then

            local playerData = ESX.GetPlayerData()

            for _, item in ipairs(playerData.inventory) do
                if item.count > 0 and isItemBlacklisted(item.name) then
                    TriggerServerEvent('cs_blacklist:usunitem', item.name, item.count)

                    lib.notify({
                        title = 'Uwaga!',
                        description = 'Ten Item jest na BlackLiście!',
                        type = 'error',
                        iconAnimation = 'beat',
                        position = 'center-left'
                    })

                end
            end

            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if vehicle ~= 0 and isVehicleBlacklisted(GetEntityModel(vehicle)) then
                DeleteEntity(vehicle)
                
                lib.notify({
                    title = 'Uwaga!',
                    description = 'Ten Pojazd jest na BlackLiście!',
                    type = 'error',
                    iconAnimation = 'beat',
                    position = 'center-left'
                })
                
            end

            if isPedBlacklisted(GetEntityModel(playerPed)) then
                
                lib.notify({
                    title = 'Uwaga!',
                    description = 'Ten Ped jest na BlackLiście!',
                    type = 'error',
                    iconAnimation = 'beat',
                    position = 'center-left'
                })

            end
        end
    end
end)