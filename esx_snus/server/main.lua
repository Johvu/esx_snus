ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('snus', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('snus')
	
		if lighter.count > 0 then
			xPlayer.removeInventoryItem('kiekko', -1)
			TriggerClientEvent('esx_snus:startsmoke', source)
		else
			TriggerClientEvent('esx:showNotification', source, ('you dont have snus'))
		end
end)
