functions = {}


--[[ Dar item para o player ]]
functions.paymentItem = function paymentItem(itemName,amount)
    vRP.giveInventoryItem(user_id, itemName, value)
end

--[[ Dar dinheiro para o player ]]
functions.paymentMoney = function paymentMoney(value)
    vRP.giveBankMoney(user_id, value)
end

--[[ Tentar retirar item do player ]]
functions.getItem = function getItem(itemName,amount)
    vRP.tryGetInventoryItem(user_id, itemName, amount)
end

--[[ Pegar todos player online setada em certa permissão ]]
functions.getUsersByPermission = function getUsersByPermission(permission)
    vRP.getUsersByPermission(permission)
end

functions.notify = function notifyPolice(source)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local policeResult = vRP.getUsersByPermission(config.groupPolice)
    for p,d in pairs(policeResult) do
        async(function()
            TriggerClientEvent("NotifyPush",v,{ code = "QRU", title = "Venda de Drogas", x = coords["x"], y = coords["y"], z = coords["z"], time = "Recebido às "..os.date("%H:%M"), blipColor = 5 })
        end)
    end
end

return functions