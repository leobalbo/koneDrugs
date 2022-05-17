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
Tunnel.bindInterface(GetCurrentResourceName(),kn)
knServer = Tunnel.getInterface(GetCurrentResourceName())
-------------------------------------------------------------------------------------------------------------------
-- Variables
-------------------------------------------------------------------------------------------------------------------
local sleep = 999
local service = false
local coordsRandom = math.random(#config.routs)
-------------------------------------------------------------------------------------------------------------------
-- MAIN THREAD
-------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        -- MARKER
        for k,v in pairs(config.startLocation) do
            for k2,v2 in pairs(v) do
                if k2 == "coords" then
                    local pedDistance = #(pedCoords-v2)
                    if pedDistance <= 15 and not service then
                        sleep = 4
                        DrawMarker(23, v2, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 255, 0, 0, 2, 0)
                        if pedDistance <= 1.5 then
                            DrawMarker(23, v2, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 255, 0, 0, 2, 0)
                            if IsControlJustPressed(0, 38) then
                                if kone == "koneDrugs" then
                                    service = true
                                    initService()
                                    makeBlips()
                                else
                                    print("Você foi pegou tetando fazer batota!")
                                end
                            end
                        end

                    end
                end
            end
        end
        Wait(sleep)
    end
end)
-------------------------------------------------------------------------------------------------------------------
-- MAIN FUNCTION
-------------------------------------------------------------------------------------------------------------------
function initService()
    CreateThread(function()
        while service do
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local pedDistance = #(pedCoords-config.routs[coordsRandom])
            if pedDistance <= 20 then
                sleep = 4
                DrawText3D(config.routs[coordsRandom].x,config.routs[coordsRandom].y,config.routs[coordsRandom].z, "~g~E~w~ Coletar")
                if pedDistance <= 3 then
                    DrawMarker(23, config.routs[coordsRandom], 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 255, 0, 0, 2, 0)
                    if pedDistance <= 1.5 then
                        DrawMarker(23, config.routs[coordsRandom], 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 255, 0, 0, 2, 0)
                        if IsControlJustPressed(0, 38) then
                            coordsRandom = math.random(#config.routs)
                            knServer.payment()
                            makeBlips()
                        end
                    end
                end
            end
            if IsControlJustPressed(0,192) then
                service = false
            end
            Wait(sleep)
        end
    end)
end
-------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------------------------------
function makeBlips()
	if DoesBlipExist(CheckBlip) then
		RemoveBlip(CheckBlip)
		CheckBlip = nil
	end
	CheckBlip = AddBlipForCoord(config.routs[coordsRandom].x,config.routs[coordsRandom].y,config.routs[coordsRandom].z)
	SetBlipSprite(CheckBlip,51)
	SetBlipAsShortRange(CheckBlip,true)
	SetBlipScale(CheckBlip,0.6)
	SetBlipColour(CheckBlip,50)
	SetBlipRoute(CheckBlip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega")
	EndTextCommandSetBlipName(CheckBlip)
end
function DrawText3D(x,y,z,text)
	SetTextFont(4)
	SetTextCentre(1)
	SetTextEntry("STRING")
	SetTextScale(0.40,0.40)
	SetTextColour(255,255,255,150)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z,0)
	DrawText(0.0,0.0)
	local factor = (string.len(text) / 450) + 0.01
	DrawRect(0.0,0.0125,factor,0.03,38,42,56,200)
	ClearDrawOrigin()
end