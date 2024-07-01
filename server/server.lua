ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('cs_blacklist:usunitem')
AddEventHandler('cs_blacklist:usunitem', function(itemName, itemCount)

    local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.removeInventoryItem(itemName, itemCount)

end)