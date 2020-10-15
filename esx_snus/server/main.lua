ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('kiekko', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local snus = xPlayer.getInventoryItem('kiekko')
	
		if snus.count > 0 then
			TriggerClientEvent('esx_snus:startuse', source)
		else
			TriggerClientEvent('esx:showNotification', source, ('you dont have snus'))
		end
end)
