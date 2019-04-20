ESX               = nil

local tiempo = 15000 -- 1000 ms = 1s
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

-----

RegisterNetEvent('esx_nuuska:startsmoke')
AddEventHandler('esx_nuuska:startsmoke', function(source)
	IdleAnimation()
end)

function IdleAnimation()
	local playerPed = GetPlayerPed(-1)
	-- animations
	Citizen.CreateThread(function()
		TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_AA_SMOKE?", 0, true)   
		SetPedIsDrunk(GetPlayerPed(-1), true)
		ShakeGameplayCam("DRUNK_SHAKE", 1.0)
		SetPedConfigFlag(GetPlayerPed(-1), 100, true)
		SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0)    
		SetTimecycleModifier("REDMIST_blend")
		ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
	Wait(10000)   
		SetTimecycleModifier("")
		SetTransitionTimecycleModifier("")
		StopGameplayCamShaking()
		

if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then
	RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
		Citizen.Wait(0)
	end
end

-- made by johvu
