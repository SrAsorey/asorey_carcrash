local Config = Config
local lang = Config.Lang
local translations = Config.Translations

local screenEffectTime = Config.ScreenEffectTime
local minImpactSpeed = Config.MinImpactSpeed
local crashSpeedThreshold = Config.CrashSpeedThreshold

local function getTranslation(lang)
    return translations[lang]
end

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local initialSpeed = GetEntitySpeed(vehicle) * 3.6

            if HasEntityCollidedWithAnything(vehicle) then
                Wait(200)

                local currentSpeed = GetEntitySpeed(vehicle) * 3.6

                if initialSpeed > minImpactSpeed and currentSpeed < initialSpeed * crashSpeedThreshold then
                    TriggerEvent('asorey_carcrash:CrashEffect', vehicle)
                    Wait(5000)
                end
            end
        end
    end
end)

RegisterNetEvent('asorey_carcrash:CrashEffect', function(vehicle)
    DoScreenFadeOut(0)
    FreezeEntityPosition(PlayerPedId(), true)
    DisableAllControlActions(0)

    notify(getTranslation(lang), 'error')

    if vehicle and DoesEntityExist(vehicle) then
        local currentEngineHealth = GetVehicleEngineHealth(vehicle)
        SetVehicleEngineHealth(vehicle, currentEngineHealth - 250)
    end

    Wait(screenEffectTime)

    DoScreenFadeIn(500)
    FreezeEntityPosition(PlayerPedId(), false)
    EnableAllControlActions(0)
end)
