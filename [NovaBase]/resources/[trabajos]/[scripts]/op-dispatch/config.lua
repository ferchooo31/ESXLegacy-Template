Config = {}
Config.Sound = true -- Enable/Disable dispatch sounds
Config.Framework = 'ESX' -- 'ESX' or 'QBCore'
Config.Locale = 'es' -- Language
Config.ShootingAlerts = true -- Enable/Disable Shooting alerts
Config.ShootingCooldown = 30 -- Seconds
Config.BlipDeletion = 30 -- Seconds

Config.CommandShow = {
    command = 'alertas',
    description = 'Abrir centro de alertas'
}

Config.VehicleRob = {
    command = 'vehrob',
    description = 'Vehículo robado'
}

Config.CommandPanic = {
    command = 'panico',
    description = 'Botón del pánico'
}

Config.CommandClear = {
    command = 'cls',
    description = 'Borrar Alertas'
}

Config.Jobs = {'police', 'ambulance'}

Config.AllowedJobs = {
    ["police"] = {
        name = 'police',
        label = 'LSPD',
        command = 'entorno',
        descriptcommand = 'Envia un aviso a la LSPD',
        panic = true
    },
    ["ambulance"] = {
        name = 'ambulance',
        label = 'EMS',
        command = 'auxilio',
        descriptcommand = 'Envia un mensaje de auxilio a los EMS',
        panic = false
    }
}
