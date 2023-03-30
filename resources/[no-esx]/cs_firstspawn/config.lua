CodeStudio = {}


CodeStudio.useTaxi = true          --Use AI Taxi or Not?
CodeStudio.SpawnPedLoc = vector3(-1044.91, -2750.2, 21.36)    --If not using AI Taxi then set player spawn location 

CodeStudio.Taxi = `taxi`                                     --Taxi Model
CodeStudio.TaxiPlate = 'NOVA'                              --Taxi Number Plate
CodeStudio.TaxiModded = false
CodeStudio.TaxiSpawn = vector4(-1058.48, -2713.28, 20.17, 240.05)       --Taxi First Spawn Location   
CodeStudio.TaxiDestination =  vector4(-236.86, -989.94, 29.15, 164.21)       --Taxi Destination Lcoation 
CodeStudio.SkipToNearestLoc =  vector4(-259.36, -879.85, 30.91, 249.32)        --Taxi Skip Nearest Location to destination



CodeStudio.WelcomeMessage = 'Bienvenid@'
CodeStudio.ReachedMessage = "Llegaste a la ubicación"




function Notify(msg)
    SetNotificationTextEntry('STRING') --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
    AddTextComponentString(msg)  --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
    DrawNotification(0,1)  --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
end