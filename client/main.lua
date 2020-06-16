
PlayerData                = {}
ESX                             = nil

	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(10)
		end
	
		while ESX.GetPlayerData() == nil do
			Citizen.Wait(10)
		end
	
		  PlayerData = ESX.GetPlayerData()
	end)



RegisterCommand("gpsisaretle", function(source, args, rawCommand)
	Citizen.Wait(500)
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	print(PlayerData.job.name)
	if PlayerData.job and PlayerData.job.name == 'police' or PlayerData.job and PlayerData.job.name == 'ambulance' then 
	
		playerid = tonumber(args[1]) 
		local ped = GetPlayerPed(GetPlayerFromServerId(playerid))
		local pos = GetEntityCoords(ped, true)
	
        SetNewWaypoint(pos.x, pos.y) 
	
		exports.pNotify:SendNotification({text = ' '..playerid..' numaralı gps işaretlendi', type = "success", timeout = 3000, layout = "bottomCenter", queue = "lmao"})


end

end)



	RegisterCommand("gpskaldir", function(source, args, rawCommand)

	SetWaypointOff()
	exports.pNotify:SendNotification({text = "GPS kaldırıldı", type = "success", timeout = 3000, layout = "bottomCenter", queue = "lmao"})

	end)

	