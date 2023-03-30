----------------------------------------------------------------------
-- Thanks for supporting AngelicXS Scripts!							--
-- Support can be found at: https://discord.gg/tQYmqm4xNb			--
-- More paid scripts at: https://angelicxs.tebex.io/ 				--
-- More FREE scripts at: https://github.com/GouveiaXS/ 				--
-- Images are provided for new items if you choose to add them 		--
----------------------------------------------------------------------

----------------------------------------------------------------------
--						Main Configuration 							--
--			To configure jobs uniquely see each client file			--
--			for additional config options specific to the job		--
----------------------------------------------------------------------

-- Model info: https://docs.fivem.net/docs/game-references/ped-models/
-- Blip info: https://docs.fivem.net/docs/game-references/blips/

Config = {}

Config.UseESX = true						-- Use ESX Framework
Config.UseQBCore = false						-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.NHInput = false						-- Use NH-Input [https://github.com/nerohiro/nh-keyboard]
Config.NHMenu = false						-- Use NH-Menu [https://github.com/nerohiro/nh-context]
Config.QBInput = false						-- Use QB-Input (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-input]
Config.QBMenu = false						-- Use QB-Menu (Ignored if Config.NHMenu = true) [https://github.com/qbcore-framework/qb-menu]
Config.OXLib = true						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib]  !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!

Config.UseCustomNotify = true				-- Use a custom notification script, must complete event below.
-- Only complete this event if Config.UseCustomNotify is true; mythic_notification provided as an example
RegisterNetEvent('angelicxs-CivilianJobs:CustomNotify')
AddEventHandler('angelicxs-CivilianJobs:CustomNotify', function(message, type)
    --exports.mythic_notify:SendAlert(type, message, 4000)
    TriggerEvent("gs-notify:SendNotification", "", message, 5000, "info")
	Citizen.Wait(1000)
end)

-- Visual Preference
Config.Use3DText = false 					-- Use 3D text for NPC/Job interactions; only turn to false if Config.UseThirdEye is turned on and IS working.
Config.UseThirdEye = true 					-- Enables using a third eye (third eye requires the following arguments debugPoly, useZ, options {event, icon, label}, distance)
Config.ThirdEyeName = 'ox_target' 			-- Name of third eye aplication
Config.UsePedAsJobBoss = true				-- Creates a ped at the interaction location to initiate each job (required if Config.UseThirdEye = true)

-- General Blip Preference
Config.JobBlipSize = 0.7
Config.BlipMarkerColour = 24
Config.BlipRouteColour = 15


-- Rewards Configuration
Config.AccountMoney = 'money' 				-- How you want the job completion to be paid.

-- Usable Item Config
Config.ScubaItemName = 'diving_gear'		-- Name of scuba gear item to put on/take off scuba gear

-- General Configuration
Config.UsePlayerJob = true					-- If true requires the player to have the appropriate job; job uses and names identified next
Config.VehicleSteward = true				-- If true, will not let the player do any more jobs if they have returned a destroyed vehicle (they will need to relog to reset this)
Config.BusJobOn = true						-- If true allows the bus job
Config.BusJobName = 'bus-driver'			-- Name of the bus job, used if Config.UsePlayerJob = true
Config.ForkliftJobOn = true					-- If true allows the forklift job
Config.ForkliftJobName = 'forklift-driver'	-- Name of the forklift job, used if Config.UsePlayerJob = true
Config.TaxiJobOn = false						-- If true allows the taxi job
Config.TaxiJobName = 'taxi-driver'			-- Name of the taxi job, used if Config.UsePlayerJob = true
Config.ScubaJobOn = true					-- If true allows the scuba job
Config.ScubaJobName = 'scuba-diver'			-- Name of the scuba job, used if Config.UsePlayerJob = true
Config.JetSkiJobOn = true					-- If true allows the JetSKi job
Config.JetSkiJobName = 'lifeguard'			-- Name of the JetSKi job, used if Config.UsePlayerJob = true
Config.HeliJobOn = false						-- If true allows the Heli job
Config.HeliJobName = 'heli-driver'			-- Name of the Heli job, used if Config.UsePlayerJob = true
Config.GarbageJobOn = true					-- If true allows the Garbage job
Config.GarbageJobName = 'garbage-driver'	-- Name of the Garbage job, used if Config.UsePlayerJob = true


-- Vehicle Keys and Fuel; set the below event to give the player keys and fuel for the vehicle (if applicable)
RegisterNetEvent('angelicxs-CivilianJobs:VehicleInitation')
AddEventHandler('angelicxs-CivilianJobs:VehicleInitation', function(vehicle)
	-- Example provided:
	TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
    --exports["ps-fuel"]:SetFuel(vehicle, 99)
	exports["LegacyFuel"]:SetFuel(vehicle, 100)
end)

-- Language Configuration
Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'primary'
}

Config.Lang = {
	['request_job_3d'] = 'Presiona ~r~[E]~w~ para cambiar el trabajo.',
	['request_job'] = 'Cambiar Trabajo',
	['request_work_3d'] = 'Presiona ~r~[E]~w~ para solicitar trabajo. \n Presiona ~r~[G]~w~ para regresar el vehículo. \n Presiona ~r~[F]~w~ para saber cómo funciona el trabajo.',
	['request_work'] = 'Solicitar Trabajo',
	['ask_how_to'] = 'Preguntar como funciona el trabajo',
	['wrong_job'] = 'No tienes el trabajo correcto para hacer esto!',
	['at_route_marker'] = 'Has llegado al destino indicado!',
	['vehicle_out'] = 'Ya se le ha proporcionado un vehículo!',
	['gen_how_to'] = 'Presione F8 para ver su consola y leer cómo funciona el trabajo!',
	['vehicle_return_request'] = 'Regresar el vehículo',
	['vehicle_return'] = 'Has devuelto tu vehículo de trabajo!',
	['vehicle_far'] = 'Acerca tu vehículo para devolverlo!',
	['vehicle_not_out'] = 'No tienes un vehículo actualmente fuera!',
	['vehicle_destroyed'] = 'Destruiste nuestro vehículo, les digo a todos en la ciudad y no obtendrás otro hoy.!',
	['vehicle_destroyed_notice'] = 'Destruiste un vehículo de trabajo, vuelve mañana para tener otra oportunidad.!',
	['payment_notice_money'] = 'Has recibido la siguiente cantidad por tu trabajo: $',
	['payment_notice_item'] = 'Has recibido el siguiente item por tu trabajo:',
	['gen_anchor_boat'] = 'Debes estar en un barco para usar este comando.',
	['gen_anchor_boat_activate'] = 'Debe estar en el asiento del conductor para anclar o desanclar un barco.',
	['gen_anchor_boat_off'] = 'Has desfondado el barco.',
	['gen_anchor_boat_on'] = 'Has anclado el barco.',

-- Bus Language
	['bus_how_to'] = 'Conduce a cada lugar marcado en tu ruta y espera a que un pasajero suba o baje. El pago se realiza cuando el pasajero se baja del autobús. Si se salta una parada, debe regresar a ella para recoger/dejar al pasajero.',
	['bus_route_complete'] = 'Ha completado la ruta, regrese a la terminal de autobuses para devolver su vehículo o solicite una nueva ruta!',
	['bus_on_route'] = 'Ya se te ha asignado una ruta, finalizala antes de solicitar una nueva!',
	['bus_start'] = 'Adelante, completa la ruta que te envié.!',
	['bus_get_on'] = 'Un pasajero sube.',
	['bus_get_off'] = 'Un pasajero se está bajando.',

-- Forklift Language
	['forklift_how_to'] = 'Tome la carretilla elevadora del lugar indicado para recoger la paleta, use el teclado numérico 5 y el teclado numérico 8 para bajar/subir las horquillas. Dejar el palet en el camión indicado para el pago.',
	['forklift_start'] = 'Ve a buscar el palet pedido y ponlo en el camión marcado!',
	['forklift_on_job'] = 'No has terminado el pedido actual!',
	['forklift_job_complete'] = 'Has completado el pedido, devuelves la carretilla elevadora o pides un nuevo pedido!',

-- Taxi Language
	['taxi_how_to'] = 'After a period of time you will be provided a fare you can choose to accept or decline, if you decline you will need to wait for another fare to appear. Upon acceptance pick up the indiviudal and drop them off for payment.',
	['taxi_start'] = 'Get out there and drive around, I will send you your first fare soon!',
	['taxi_working'] = 'Get out there and finish some fares!',
	['taxi_menu_header_1'] = 'Incoming Taxi Request:\nName: ',
	['taxi_menu_header_2'] = '\nEstimated Fare: $',
	['taxi_menu_yes'] = 'Accept Fare',
	['taxi_menu_no'] = 'Decline Fare',
	['taxi_get_on'] = 'A passanger is getting on.',
	['taxi_get_off'] = 'A passanger is getting off.',
	['taxi_bring_client'] = 'Bring the customer to their destination!',
	['taxi_fare_accepted'] = 'You accepted the fare, go pick up ',
	['taxi_fare_declined'] = 'You declined the fare, wait for another request!',
	['taxi_route_complete'] = 'You have completed the fare, you will receive another fare when it is available!',

-- Scuba Language
	['scuba_how_to'] = 'Larga explicación aquí',
	['scuba_start'] = 'Ve al área indicada y busca las cajas, ¡asegúrate de tener tu equipo antes de irte! Se detectó la siguiente cantidad de cajas en el área:',
	['scuba_on_job'] = 'Ya tienes un lugar de buceo indicado!',
	['scuba_salvage'] = 'Caja de salvamento',
	['scuba_salvage_3d'] = 'Presiona ~r~[E]~w~ para salvar la caja.',
	['scuba_salvage_complete'] = 'Has salvado con éxito la caja.!',
	['scuba_75'] = 'El tanque de oxígeno está en 75%!',
	['scuba_50'] = 'El tanque de oxígeno está en 50%!',
	['scuba_25'] = 'El tanque de oxígeno está en 25%!',
	['scuba_in_water'] = 'No puedes hacer esto mientras estás en el agua.!',
	
-- Heli Language
	['heli_how_to'] = 'Larga explicación aquí',
	['heli_start'] = 'Ir a recoger la entrega de caja prioritaria y entregarla al cliente!',
	['heli_on_job'] = 'No has terminado el pedido actual!',
	['heli_job_complete'] = 'Ha completado el pedido, regresa al helipuerto y devuelve el helicóptero o solicita un nuevo pedido.!',

-- Lifeguard Language
	['jetski_how_to'] = 'Vaya al lugar indicado para recoger a los civiles que se están ahogando, luego llévelos al salvavidas para salvarlos y recibir el pago.',
	['jetski_start'] = 'Ve a ver esta área, recibimos una llamada diciendo que alguien necesita ayuda!',
	['jetski_on_job'] = 'No ha revisado ese último informe!',
	['jetski_job_complete'] = '¡Los salvaste! Devuelve tu vehículo o consulta más informes hablando con el socorrista.',
	['jetski_help_civ'] = '¡Has encontrado el informe! Deténgase cerca del civil para ayudarlo.!',
	['jetski_return_civ'] = 'Devuelve al civil al salvavidas para asegurarse de que esté bien.!',
	
-- Garbage Language
	['garbage_how_to'] = 'Conduzca a cada lugar marcado para recoger la basura y luego tire la bolsa de basura en el camión. Una vez que se completen todas las paradas, se realizará el pago.',
	['garbage_start'] = 'Sigue la ruta marcada para agarrar la basura y tirarla en el camión.',
	['garbage_on_job'] = 'No ha terminado la ruta actual que tienes asignada!',
	['garbage_search_bin_3D'] = 'Presiona ~r~[E]~w~ para buscar basura.',
	['garbage_search_bin'] = 'Buscar basura',
	['garbage_route_complete'] = 'Ruta completa! ¡Ve al Trash Master para devolver el camión u obtener una nueva ruta!',
	['garbage_get_garbage'] = 'Presiona ~r~[G]~w~ para agarrar la basura.',
	['garbage_put_garbage'] = 'Presiona ~r~[G]~w~ para poner la basura en el camión.',
	['garbage_item_find'] = 'Encontraste un artículo en la basura!',
	['garbage_item_nofind'] = 'No hay nada en la basura.',
	['garbage_in_truck'] = 'La basura ha sido cargada, dirígete al siguiente lugar!',
}

Config.ErrorCodes = {
	['dev'] = 'Please provide the following information to your development team:',
	['001'] = 'The Randomizer function found in the main config failed. List was found to be nil and was called from the following event:',
	['002'] = 'A return/break loop has finished unintentionally. Loop was called from the following event:',
	['003'] = 'Warning, the following model took over one (1) second to load (reference from HashGrabber - main.lua):',
	['004'] = 'An undefined route was asked to be created from the following event:',
	['005'] = 'A second ped spawn has automatically been aborted, requesting eventor:',
	['006'] = 'A second vehicle spawn has automatically been aborted, requesting eventor:',
	['007'] = 'Warning, error dectected see comment for further details, requesting eventor:', -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['008'] = 'A vehicle despawn was attempted without a job NPC spawned',
	['009'] = 'A payment failed to occur! (reference from DistancePayment - main.lua)',  -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['010'] = 'A payment failed to occur! (reference from PaymentFlat - main.lua)',  -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['011'] = 'A payment failed to occur! (reference from PaymentItem - main.lua)',  -- !!!! If you see this error it was most likely triggered by an injector !!!!





}
