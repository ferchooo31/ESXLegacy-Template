Config.fpsBoosterTypes = {
    [1] = { type = "ulow", name = "Ultra Low", distance = { world = 90, ped = 60, vehicle = 120 }, alpha = { world = 210, ped = 245, vehicle = 255 } },
    [2] = { type = "low", name = "Low", distance = { world = 130, ped = 100, vehicle = 160 }, alpha = { world = 210, ped = 250, vehicle = 255 } },
    [3] = { type = "medium", name = "Medium", distance = { world = 200, ped = 150, vehicle = 250 }, alpha = { world = 245, ped = 255, vehicle = 255 } }
}

Config.visualTimecycles = {
    [1] = { name = "Tunnel (FPS Boost)", modifier = "yell_tunnel_nodirect", icon = "💯" },
    [2] = { name = "Cinema (FPS Boost)", modifier = "cinema", icon = "🎥" },
    [3] = { name = "Life (FPS Boost)", modifier = "LifeInvaderLOD" },
    [4] = { name = "Reduce Distance (FPS Boost)", modifier = "ReduceDrawDistanceMission", icon = "⬇" },
    [5] = { name = "Color Saturation", modifier = "rply_saturation", icon = "✨" },
    [6] = { name = "Graphic Changer", modifier = "MP_Powerplay_blend", extraModifier = "reflection_correct_ambient" },
    [7] = { name = "Improved Lights", modifier = "tunnel" }
}

Config.vehicleLightsSetting = {
    defaultlight = {
        day = { name = "Luces predeterminadas (Day)", defaultValue = 2, min = 0, max = 10000 },
        night = { name = "Luces predeterminadas (Night)", defaultValue = 2, min = 0, max = 10000 }
    },
    headlight = {
        day = { name = "Faros (Day)", defaultValue = 10, min = 0, max = 10000 },
        night = { name = "Faros (Night)", defaultValue = 10, min = 0, max = 10000 }
    },
    taillight = {
        day = { name = "Luces traseras (Day)", defaultValue = 25, min = 0, max = 10000 },
        night = { name = "Luces traseras (Night)", defaultValue = 25, min = 0, max = 10000 }
    },
    indicator = {
        day = { name = "Indicadores (Day)", defaultValue = 10, min = 0, max = 10000 },
        night = { name = "Indicadores (Night)", defaultValue = 10, min = 0, max = 10000 }
    },
    reversinglight = {
        day = { name = "Luces de marcha atrás (Day)", defaultValue = 20, min = 0, max = 10000 },
        night = { name = "Luces de marcha atrás (Night)", defaultValue = 3, min = 0, max = 10000 }
    },
    brakelight = {
        day = { name = "Luces de freno (Day)", defaultValue = 30, min = 0, max = 10000 },
        night = { name = "Luces de freno (Night)", defaultValue = 30, min = 0, max = 10000 }
    },
    middlebrakelight = {
        day = { name = "Luces de freno intermedias (Day)", defaultValue = 30, min = 0, max = 10000 },
        night = { name = "Luces de freno intermedias (Night)", defaultValue = 30, min = 0, max = 10000 }
    },
    extralight = {
        day = { name = "Luces Extra (Day)", defaultValue = 9, min = 0, max = 10000 },
        night = { name = "Luces Extra (Night)", defaultValue = 9, min = 0, max = 10000 }
    }
}

TriggerEvent("chat:addSuggestion", "/"..Config.Command, "configura tus gráficos para un mejor rendimiento")

RegisterCommand(Config.Command, function()
    if Config.Menu == "ox_lib" and lib then
        lib.showMenu(Config.mainMenu)
    elseif Config.Menu == "menuv" and MenuV then
        MenuV:OpenMenu(Config.mainMenu)
    end
end)