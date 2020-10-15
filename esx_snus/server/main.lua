ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('kiekko', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
				TriggerClientEvent('esx_snus:startuse', source)
end)
