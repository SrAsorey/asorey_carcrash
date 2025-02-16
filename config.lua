Config = {}

Config.Lang = 'es' -- Change this equal to the Language you want to use, add more on Translations if you want
Config.Translations = {
    ['es'] = 'Has sufrido un choque fuerte. Te sientes aturdido.',
    ['en'] = 'You have suffered a severe crash. You feel dizzy.',
    -- Add more translations as needed
}

Config.ScreenEffectTime = 7500 -- Time in milliseconds for the screen effect
Config.MinImpactSpeed = 100.0 -- Minimum impact speed in km/h
Config.CrashSpeedThreshold = 0.5 -- Minimum speed reduction of 50% to trigger the effect
