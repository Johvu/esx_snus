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

RegisterNetEvent('esx_snus:startuse')
AddEventHandler('esx_snus:startuse', function(source)
    SnusAnim()
	IdleAnimation()
end)

function SnusAnim()
	local animDict = 'anim@mp_player_intcelebrationmale@nose_pick' --
	local animName = 'nose_pick' 
	local playerPed = GetPlayerPed(-1)

	
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 8.0, -8.0, 1111, 1.0, 0, false, false, false)

	Citizen.Wait(1500) 
end

function IdleAnimation()
	local playerPed = GetPlayerPed(-1)

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


	end)
end
