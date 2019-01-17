local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_bank")

--Settings--

enableprice = true -- [Keep this true]
--[[  Prices  ]]
local price = 500 --- Regular Price if you change this be sure to change the price in line
local qprice = 2000 -- Premium Price if you change this be sure to change the price in line

--[[ 
	DO NOT EDIT THIS CODE BELOW!
]]

RegisterServerEvent('Civrepair:checkmoney')
AddEventHandler('Civrepair:checkmoney', function()
	local _source = source
	local player = vRP.getUserId({_source})
	local playerMoney = vRP.getMoney({player})		
		if(enableprice == true) then
			if(playerMoney >= price) then
				vRP.tryPayment({player, price})
				TriggerClientEvent('Civrepair:success', _source, price)
				
			else
				moneyleft = price - playerMoney
				TriggerClientEvent('Civrepair:notenoughmoney', _source, moneyleft)
			end
		else
			TriggerClientEvent('Civrepair:free', _source)
		end
end)

RegisterServerEvent('Civrepair:checkmoneypremium')
AddEventHandler('Civrepair:checkmoneypremium', function()
	local _source = source
	local player = vRP.getUserId({_source})
	local playerMoney = vRP.getMoney({player})			
		if(enableprice == true) then
			if(playerMoney >= qprice) then
				vRP.tryPayment({player, qprice})
				TriggerClientEvent('Civrepair:successpremium', _source, qprice)
			else
				moneyleft = qprice - xPlayer.getMoney()
				TriggerClientEvent('Civrepair:notenoughmoneypremium', _source, moneyleft)
			end
		else
			TriggerClientEvent('Civrepair:free', _source)
		end
end)