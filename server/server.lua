-------------------------------------------------------------------------------------------------------------------
-- VRP
-------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-------------------------------------------------------------------------------------------------------------------
local kone = GetCurrentResourceName()
kn = {}
Tunnel.bindInterface(kone,kn)
knClient = Tunnel.getInterface(kone)

-------------------------------------------------------------------------------------------------------------------
-- Variables
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
-- MAIN FUNCTION
-------------------------------------------------------------------------------------------------------------------
function kn.payment()
    local source = source
    local user_id = vRP.getUserId(source)
    if kone == "koneDrugs" then
        if user_id then
            for k,v in pairs(config.general) do
                for k2,v2 in pairs(v) do
                    if v2["paymentType"] == "item" then
                        local amount = math.random(v2["sellAmountMin"],v2["sellAmountMax"])
                        if vRP.tryGetInventoryItem(user_id, v2["sellItem"], amount) then
                            local value = math.random(v2["paymentAmountMin"],v2["paymentAmountMax"])
                            vRP.giveInventoryItem(user_id,v2["paymentItem"],value)
                            if v2["alertPolice"] then
                                if math.random(100) >= v2["chanceAlert"] then
                                    local ped = GetPlayerPed(source)
                                    local coords = GetEntityCoords(ped)
                                    local policeResult = vRP.getUsersByPermission(config.groupPolice)
                                    for p,d in pairs(policeResult) do
                                        async(function()
                                            TriggerClientEvent("NotifyPush",v,{ code = "QRU", title = "Venda de Drogas", x = coords["x"], y = coords["y"], z = coords["z"], time = "Recebido às "..os.date("%H:%M"), blipColor = 5 })
                                        end)
                                    end
                                end
                            end
                        else
                            print("sem item")
                        end
                    elseif v2["paymentType"] == "money" then
                        local value = math.random(v2["paymentAmountMin"],v2["paymentAmountMax"])
                        vRP.giveBankMoney(user_id,value)
                        if v2["alertPolice"] then
                            if math.random(100) >= v2["chanceAlert"] then
                                local ped = GetPlayerPed(source)
                                local coords = GetEntityCoords(ped)
                                local policeResult = vRP.getUsersByPermission(config.groupPolice)
                                for p,d in pairs(policeResult) do
                                    async(function()
                                        TriggerClientEvent("NotifyPush",v,{ code = "QRU", title = "Venda de Drogas", x = coords["x"], y = coords["y"], z = coords["z"], time = "Recebido às "..os.date("%H:%M"), blipColor = 5 })
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        print("Você foi pego tentando fazer batota!")
    end
end