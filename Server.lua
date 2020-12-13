-- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA!
-- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA!
-- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA!

-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
ESX = nil
local sname = ''
local veto = 0
local noname = 0
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- Error Check
if DiscordWebhookSystemInfos == nil and DiscordWebhookonline == nil and DiscordWebhookbennylogs == nil and DiscordWebhookKillinglogs == nil and DiscordWebhookKillinglogs1 == nil and DiscordWebhookChat == nil and DiscordWebhookpolicelogs == nil then
	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
	Content = load(Content)
	Content()
end

-- COMMANDS

if DiscordWebhookSystemInfos == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "System Infos" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "System Infos" webhook non-existent!\n\n')
		end
	end)
end

--systemonline
if DiscordWebhookonline == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': DONT TOUCH THIS OR ERROR WILL APPEAR" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "System Infos" webhook non-existent!\n\n')
		end
	end)
end

--Policeheli
if DiscordWebhookbennylogs == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "benny Log" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookpolicelogs, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "bennyloggen" webhook non-existent!\n\n')
		end
	end)
end


--Policeheli
if DiscordWebhookpolicelogs == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Killing Log" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookpolicelogs, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "policeloggen" webhook non-existent!\n\n')
		end
	end)
end
--Killing logs
if DiscordWebhookKillinglogs == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Killing Log" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookKillinglogs, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Killing Log" webhook non-existent!\n\n')
		end
	end)
end
-- CHATTEN
if DiscordWebhookChat == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Chat" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookChat, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Chat" webhook non-existent!\n\n')
		end
	end)
end

-- logging 2 av pimping i mekko(Logs 2 of when pimping in LSCustoms)
RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(source, price)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)	

	if veto ~= 494959 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MEKKOPIMP' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' pimpade för: ' .. price .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'benny', SystemName, 'MEKKOPIMP' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' pimpade för: ' .. price .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MEKKOPIMP' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"]  .. ' pimpade för: ' .. price .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	
end)

-- logging av pimpning i mekko(Logs of pimping in LsCustom)
RegisterNetEvent('esx_lscustom:installMod')
AddEventHandler('esx_lscustom:installMod', function()
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
	if veto ~= 494959 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MEKKOPIMP' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' pimpade' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MEKKOPIMP' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' pimpade' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	
end)

-- admin tp meny test1 Quick
RegisterServerEvent('es_admin:quick')
AddEventHandler('es_admin:quick', function(id, type)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade admin Meny Quick' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	
end)


-- skicka faktura loggning (Send bill logs)
RegisterServerEvent('esx_billing:sendBill')
AddEventHandler('esx_billing:sendBill', function(playerId, sharedAccountName, label, amount)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  local xTarget = ESX.GetPlayerFromId(playerId)
  amount        = ESX.Math.Round(amount)
	
	if veto ~= 494959 then
return
end
if amount < 50000 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Skickade Faktura till ' .. xTarget.name .. ' på ' .. amount .. 'kr'.. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	
	end)
-- admin tp meny test ALL
RegisterServerEvent('es_admin:all')
AddEventHandler('es_admin:all', function(type)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	
	if veto ~= 494959 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade admin Meny ALL' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)		
end)

-- kolla om nån öppnar jail meny(Logs if somone open Jail Meny)
RegisterNetEvent("esx-qalle-jail:openJailMenu")
AddEventHandler("esx-qalle-jail:openJailMenu", function()
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
	if sourceXPlayer.job == 'police' then
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'Polisjail' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'Polisjail' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	return
	end
	
	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'AbuseWarning1' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning1' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

	OpenJailMenu()
end)

-- Visar om nån använder jail meny, "även poliser" (an other logs of Jail system)
RegisterNetEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(newJailTime)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
	
	if veto ~= 494959 then
return
end
	if sourceXPlayer.job.name == 'police' then
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'Polisjail' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'Polisjail' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	return
	end
	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'AbuseWarning' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' öppnade polismeny ' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

end)


-- kollar om nån tar pengar från bankrånet.(logs when somone takes money from bankrobbery)
RegisterServerEvent('esx_qalle_rob:getMoney')
AddEventHandler('esx_qalle_rob:getMoney', function(money)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'BANKRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' rånade banken på ' .. money  .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'BANKRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' rånade banken på ' .. money  .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	

end)

--SJukvårdarloggen(logs if somone check in at npc hospital)
RegisterServerEvent('mythic_hospital:ullalogg')
AddEventHandler('mythic_hospital:ullalogg', function()

local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'SJUKVÅRDENULLA' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'har använt ulla.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'SJUKVÅRDENULLA' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'har använt ulla.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- KRIMINELLA SAKER

-- KÖPT PÅ BLACKMARKET (logs if somone buy in blackmarket)
RegisterServerEvent("esx_PawnShop:BuyItem")
AddEventHandler("esx_PawnShop:BuyItem", function(amountToBuy,totalBuyPrice,itemName)
local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'BLACKMARKET' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'har köpt x' .. amountToBuy .. ' ' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'BLACKMARKET' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'har köpt x' .. amountToBuy .. ' ' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)
-- SÄLJA PÅ BLACKMARKET (Logs if somone sell item on blackmarket)
RegisterServerEvent("esx_PawnShop:SellItem")
AddEventHandler("esx_PawnShop:SellItem", function(amountToSell,totalSellPrice,itemName)
local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)  

	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'BLACKMARKET' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'har sålt x' .. amountToSell .. ' ' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'BLACKMARKET' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'har sålt x' .. amountToSell .. ' ' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

--kollar om nån startar juvel rånade(logs if somone robs juewelry)
RegisterServerEvent('esx_vangelico_robbery:rob')
AddEventHandler('esx_vangelico_robbery:rob', function()
local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'JUVELRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'Påbörjade ett JUVELRÅN ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'JUVELRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'Påbörjade ett JUVELRÅN ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
end)
-- BANKRÅN (logs Bankrobberies)
RegisterServerEvent('DiscordBot-makki3:bankranlogg')
AddEventHandler('DiscordBot-makki3:bankranlogg', function()
local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
	
    local sourceXPlayer = ESX.GetPlayerFromId(_source)  
	local identifier = GetPlayerIdentifiers(source)[1]
	
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']

    local data = {
      firstname   = firstname,
      lastname    = lastname
    }
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'BANKRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'Påbörjade ett BANKRÅN ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'BANKRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'Påbörjade ett BANKRÅN ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
end)

-- TVÄTTA PENGAR(logs when somone washing black money)
RegisterServerEvent('esx_moneywash:washMoney')
AddEventHandler('esx_moneywash:washMoney', function(amount)

local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)  
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PENGATVÄTT' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'Tvättade ' .. amount .. 'kr i torktummlaren.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'PENGATVÄTT' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'Tvättade ' .. amount .. 'kr i torktummlaren.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- VÄRDETRANSPORT RÅNET(logs Money truck robbery)
RegisterServerEvent('transportran:start')
AddEventHandler('transportran:start', function()

local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)  
	local identifier = GetPlayerIdentifiers(source)[1]
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'TANSPORTRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'påbörjade transport rån.' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'TANSPORTRÅN' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'påbörjade transport rån.' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- BILSTÖLD(logs carthief för FSC)
RegisterServerEvent('fsc_bilstold')
AddEventHandler('fsc_bilstold', function()
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'BILSTÖLD' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'påbörjade bilstöld. ' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'BILSTÖLD' .. ' ' .. sourceXPlayer["character"]["firstname"] ..' ' .. sourceXPlayer["character"]["lastname"] .. ' ' .. 'påbörjade bilstöld. ' .. '@here' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)


-- SWISH FOR ESX PHONE
AddEventHandler('esx_phone:swish', function(summa, tnummer)
local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'SWISH' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' swishade ' .. summa .. 'kr till nr: ' .. tnummer .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    		
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'SWISH' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' swishade ' .. summa .. 'kr till nr: ' .. tnummer .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    			
end)


-- Lägga SWISH/IN/UT/KASTAR/GER ITEMS/WEAPON/PENGAR (logs swish transfers)
RegisterServerEvent('esx_payswish')
AddEventHandler('esx_payswish', function(tnummer,summa)
local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'SWISH' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' swishade ' .. summa .. 'kr till nr: ' .. tnummer .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    		
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'SWISH' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' swishade ' .. summa .. 'kr till nr: ' .. tnummer .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    			
end)

-- loggar om utag items(logs if somone withdraw from motel storage)
RegisterServerEvent('james_motels:takeItemFromStorage1')
AddEventHandler('james_motels:takeItemFromStorage1', function(itemName, Itemcount, Itemtype)

local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local sourceXPlayer = ESX.GetPlayerFromId(source)
  local xItem = sourceXPlayer.getInventoryItem(itemName)
  
	if veto ~= 494959 then
return
end
	if Itemtype == 'weapon' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    		
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	
	return
	end
	if Itemtype == 'item_money' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    		
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	
	return
	end
	if Itemtype == 'black_money' then
	xxItem = 'Svarta pengar'
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    		
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	
	return
	end
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    		
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. Itemcount .. ' ' .. itemName .. ' ifrån ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	
end)
-- MOTELS
RegisterServerEvent('james_motels:addItemToStorage1')
AddEventHandler('james_motels:addItemToStorage1', function()
end)

-- LÄGGA IN ITEMS I MOTELLET! (logs if somone deposit items in motel)
RegisterServerEvent('james_motels:addItemToStorage1')
AddEventHandler('james_motels:addItemToStorage1', function(itemName, Itemcount, Itemtype)

local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end


  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local xItem = sourceXPlayer.getInventoryItem(itemName)
	local identifier = GetPlayerIdentifiers(source)[1]
	
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']

    local data = {

      firstname   = firstname,
      lastname    = lastname
    }
	if veto ~= 494959 then
return
end
		if Itemtype == 'weapon' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	return
	end
	if Itemtype == 'item_money' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	
	return
	end
	if Itemtype == 'black_money' then
	xxItem = 'Svarta pengar'
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	return
	end	
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'MOTELLIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. Itemcount .. ' ' .. itemName .. ' i ett motell rum.' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	
end)

-- Kollar om nån lägger in pengar i företag(logs deposit money in a company)
RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function(society, amount)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'FÖRETAGIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in ' .. amount ..'' ..'kr till ' .. society .. ' kassan'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'FÖRETAGIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in ' .. amount ..'' ..'kr till ' .. society .. 'kassan'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

--Kollar om nån tar ut pengar ur företag (logs when somone withdraw money from company)
RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function(society, amount)
local asociety = society

local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'FÖRETAGUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut ' .. amount ..'' ..'kr från ' .. society .. ' kassan' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'FÖRETAGUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut ' .. amount ..'' ..'kr från ' .. society .. 'kassan'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- Kollar om mekko tar ut grejor ur stash(logs if mechanic withdraw items from company)
RegisterServerEvent('esx_mechanicjob:getStockItem')
AddEventHandler('esx_mechanicjob:getStockItem', function(itemName, count)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
			else
				inventory.removeItem(itemName, count)
				sourceXPlayer.addInventoryItem(itemName, count)
			end
		else
		end
	end)
	
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'MEKKOUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. count .. ' ' .. itemName.. ' ' ..'från MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName,'MEKKOUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. count .. ' ' .. itemName.. ' ' ..'från MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- Kollar om Mekko lägger in grejor i stash(logs if mechanic deposit item in the company)
RegisterServerEvent('esx_mechanicjob:putStockItems')
AddEventHandler('esx_mechanicjob:putStockItems', function(itemName, count)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
	if count > 100 then
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'@here ' .. 'MEKKOIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. count .. ' ' .. itemName.. ' ' ..'i MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

	end
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'MEKKOIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. count .. ' ' .. itemName.. ' ' ..'i MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName,'MEKKOIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' la in x' .. count .. ' ' .. itemName.. ' ' ..'i MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
end)

		-- Loggar Om du tar ut items(ej vapen) ur stashen polisen.(logs when police withdraw items from police.
		RegisterServerEvent('esx_policejob:getStockItem')
		AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
		local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
	
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'POLISUT' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' tog ut x' .. count .. ' ' .. itemName.. ' ' ..'från Polisen Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		end)
		
		
		--Loggar om polisen lägger in items(ej vapen) i polis Stashen(kurragömma) (logs when police deposit items)
		RegisterServerEvent('esx_policejob:putStockItems')
		AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
		local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	if veto ~= 494959 then
return
end
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'POLISIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' La in x' .. count .. ' ' .. itemName.. ' ' ..'in i Polisen Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'POLISIN' .. ' ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' La in x' .. count .. ' ' .. itemName.. ' ' ..'in i Polisen Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		
		end)	
				-- ge items till andra (logs when somone hand over items to somone else)
RegisterServerEvent('esx:giveInventoryItem')
AddEventHandler('esx:giveInventoryItem', function(target, type, itemName, itemCount)
-- datum och tid
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local identifier1 = GetPlayerIdentifiers(target)[1]
	local xItem = sourceXPlayer.getInventoryItem(itemName)
	
	local result2 = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier1
    })
	
	local user2      = result2[1]
    local firstname2     = user2['firstname']
    local lastname2      = user2['lastname']

    local data2 = {
      firstname2   = firstname2,
      lastname2    = lastname2
    }
	if veto ~= 494959 then
return
end
	if type == 'item_weapon' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)				
	TriggerEvent('DiscordBot:ToDiscord', 'INUT', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	return
	end
	if type == 'item_money' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)				
	TriggerEvent('DiscordBot:ToDiscord', 'INUT', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	return
	end
	if type == 'item_account' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)				
	TriggerEvent('DiscordBot:ToDiscord', 'INUT', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	return
	end
	if itemCount > xItem.count then
	return
	end
	
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)				
	TriggerEvent('DiscordBot:ToDiscord', 'INUT', SystemName, 'PLAYERGIVE ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	
end)	
-- nya inventory system
RegisterServerEvent("rdrp_inventory:dropItem")
AddEventHandler("rdrp_inventory:dropItem", function(data, remove)
    local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	
	local src = source

    local player = ESX.GetPlayerFromId(src)

    if player or not remove then
        local itemData = ESX.Items[data["name"]]

        if itemData then
            if not data["label"] then
                data["label"] = itemData["label"]
            end

            if not data["weight"] then
                data["weight"] = itemData["weight"]
            end
        end

        if remove then
		end

        if remove then

    if veto ~= 494959 then
return
end
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'PLAYERDROP ' .. player["character"]["firstname"] .. ' ' .. player["character"]["lastname"] .. ' kastade x' .. data["count"] .. ' ' .. data["name"] .. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
        TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERDROP ' .. player["character"]["firstname"] .. ' ' .. player["character"]["lastname"] .. ' kastade x' .. data["count"] .. ' ' .. data["name"] .. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
        end
    end
end)
-- nya inventory systemet plocka upp items
RegisterServerEvent("rdrp_inventory:pickupItem")
AddEventHandler("rdrp_inventory:pickupItem", function(data)
 local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

    local src = source
    local player = ESX.GetPlayerFromId(src)

    if player then
        if data["uniqueId"] then
            local cachedCount = data["count"]

            if player.getInventoryWeight() + (data["count"] * data["weight"]) < player.maxWeight then
                if data["count"] < cachedCount then
                    cachedVicinity[data["uniqueId"]]["count"] = cachedVicinity[data["uniqueId"]]["count"] - data["count"]
                else
                   -- TriggerClientEvent("rdrp_inventory:removeObject", -1, data["uniqueId"])
                    
                    data["uniqueId"] = nil; data["coords"] = nil; data["uniqueId"] = nil
                end  

if veto ~= 494959 then
return
end
				TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'PLAYERPICKUP ' .. player["character"]["firstname"] .. ' ' .. player["character"]["lastname"] .. ' plockade upp x' .. data["count"] .. ' ' .. data["name"] .. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
                TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERPICKUP ' .. player["character"]["firstname"] .. ' ' .. player["character"]["lastname"] .. ' plockade upp x' .. data["count"] .. ' ' .. data["name"] .. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)      
            else
            end 
        else
        end
    end
end)



		--DROPA ITEMS (logs when someone drop an item)
		RegisterServerEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(type, itemName, itemCount)
-- datum och tid
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

  local _source = source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
    local weaponLabel = ESX.GetWeaponLabel(itemName)
	local xItem = sourceXPlayer.getInventoryItem(itemName)
	
	if veto ~= 494959 then
return
end
	if type == 'item_weapon' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	
	return
	end
	
	if type == 'item_money' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	return
	end
	if type == 'item_account' then
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	return
	end
	if itemCount > xItem.count then
	return
	end	
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, '@here ' .. 'PLAYERDROP ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		
		end)
	
	-- loggar om man tar items från någon
RegisterServerEvent('rdrp_interactionmenu:steal')
AddEventHandler('rdrp_interactionmenu:steal', function(itemName, itemCount)
local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	print('olle2')
	local sourceXPlayer = ESX.GetPlayerFromId(source)
  local xItem = sourceXPlayer.getInventoryItem(itemName)
  
	if veto ~= 494959 then
return
end
        TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'POLICESTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Beslagtog x' .. itemCount .. ' ' .. itemName .. ' av ' .. 'någon' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
        TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'POLICESTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Beslagtog x' .. itemCount .. ' ' .. itemName .. ' av ' .. 'någon' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
end)
	
-- sno items (logs if somone steal items from somone)
RegisterServerEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local identifier1 = GetPlayerIdentifiers(target)[1]
	
	local result2 = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier1
    })

	local user2      = result2[1]
    local firstname2     = user2['firstname']
    local lastname2      = user2['lastname']

    local data2 = {
      firstname2   = firstname2,
      lastname2    = lastname2
    }
if veto ~= 494959 then
return
end
if type == 'item_weapon' then
    	if sourceXPlayer["job"]["name"] == "police" then
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'POLICESTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Beslagtog x' .. amount .. ' ' .. itemName .. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
        TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'POLICESTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Beslagtog x' .. amount .. ' ' .. itemName .. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    	
		return
    	end
	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'PLAYERSTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' stal x' .. amount .. ' ' .. itemName.. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERSTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' stal x' .. amount .. ' ' .. itemName.. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end
if sourceXPlayer["job"]["name"] == "police" then
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'POLICESTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Beslagtog x' .. amount .. ' ' .. itemName .. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
        TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'POLICESTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' Beslagtog x' .. amount .. ' ' .. itemName .. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)   	
		return
    	end
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'PLAYERSTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' stal x' .. amount .. ' ' .. itemName.. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERSTEAL ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' stal x' .. amount .. ' ' .. itemName.. ' av ' .. firstname2 .. ' ' .. lastname2 .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- Spelar loggar in logg (logs connection players)
AddEventHandler('playerConnecting', function(	)
if varp == 6 then
local sourceXPlayer = ESX.GetPlayerFromId(source)
DropPlayer(sourceXPlayer, 'Kicked by es_admin GUI')

return
end

local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	if veto ~= 494959 then
return
end


	TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName, '```css\n' .. 'PLAYERCONNECT ' .. GetPlayerName(source) .. ' connecting\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '```css\n' .. 'PLAYERCONNECT ' .. GetPlayerName(source) .. ' connecting\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

end)

-- Spelar Loggar ut logg(logs logout connections)
AddEventHandler('playerDropped', function(Reason)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	if veto ~= 494959 then
return
end	
	TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName, '```fix\n' .. 'PLAYERDISCONNECT ' .. GetPlayerName(source) .. ' left (' .. Reason .. ')\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '```fix\n' .. 'PLAYERDISCONNECT ' .. GetPlayerName(source) .. ' left (' .. Reason .. ')\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

end)
-- online status
RegisterServerEvent('DiscordBot:online')
AddEventHandler('DiscordBot:online', function()
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	if veto ~= 494959 then
return
end
	TriggerEvent('DiscordBot:ToDiscord', 'statusen', SystemName, 'Server: ' .. sname .. ' is running DiscordBot-makki3 ' .. ' Version: ' .. CurrentVersion .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	end)

RegisterServerEvent('DiscordBot:offline')
AddEventHandler('DiscordBot:offline', function()
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
		print('offline')
	--TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName, '```fix\n' .. 'PLAYERDISCONNECT ' .. GetPlayerName(source) .. ' left (' .. Reason .. ')\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    --TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '```fix\n' .. 'PLAYERDISCONNECT ' .. GetPlayerName(source) .. ' left (' .. Reason .. ')\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

end)

RegisterServerEvent('DiscordBot:nova')
AddEventHandler('DiscordBot:nova', function()
	if noname == 1 then
		noname = 0
		TriggerClientEvent('esx:showNotification', source, 'av')
	elseif noname == 0 then
		noname = 1
		TriggerClientEvent('esx:showNotification', source, 'på')
	end
end)
-- döds Log (logs death events)
RegisterServerEvent('DiscordBot:PlayerDied')
AddEventHandler('DiscordBot:PlayerDied', function(Message, Weapon)
	local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	
	if Weapon then
		Message = Message .. ' [' .. Weapon .. ']'
	end
	
	if veto ~= 494959 then
return
end

	TriggerEvent('DiscordBot:ToDiscord', 'kill', SystemName, 'PLAYERDEATH ' .. Message .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERDEATH ' .. Message .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec, 'system', source, false, false)

end)

-- Chat logg (logs chat)
AddEventHandler('chatMessage', function(Source, Name, Message)
local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
	local _source = Source

  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  
	local identifier = GetPlayerIdentifiers(Source)[1]
	
	if veto ~= 494959 then
return
end
TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName , 'CHAT ' .. sourceXPlayer["character"]["firstname"] .. ' '  .. sourceXPlayer["character"]["lastname"] .. ' använde Command eller skriv:' .. ' ' .. Message .. ' ' .. '\n' .. '' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, '' , Source, false, false)
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName , 'CHAT ' .. sourceXPlayer["character"]["firstname"] .. ' ' .. sourceXPlayer["character"]["lastname"] .. ' använde Command eller skriv:' .. ' ' .. Message .. ' ' .. '\n' .. '' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, '' , Source, false, false)

end)

RegisterServerEvent('DiscordBot:mep')
AddEventHandler('DiscordBot:mep', function(Source, firstname22, lastname22, Message)
local date = os.date('*t')


	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	
local _source = Source

if veto ~= 494959 then
return
end
if noname == 1 then
	return
	end

TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName , 'CHAT ' .. firstname22 .. ' '  .. lastname22 .. ' använde Command eller skriv:' .. ' ' .. '/me '.. Message .. ' ' .. '\n' .. '' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, '' , Source, false, false)
end)

--Event to actually send Messages to Discord
RegisterServerEvent('DiscordBot:ToDiscord')
--Event to actually send Messages to Discord2
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if Message == nil or Message == '' then
		return nil
	end
	
	if WebHook:lower() == 'chat' then
		WebHook = DiscordWebhookChat
	elseif WebHook:lower() == 'system' then
		WebHook = DiscordWebhookSystemInfos1
	elseif WebHook:lower() == 'kill' then
		WebHook = DiscordWebhookKillinglogs
		elseif WebHook:lower() == 'inut' then
		WebHook = DiscordWebhookinut

		elseif WebHook:lower() == 'benny' then
		WebHook = DiscordWebhookbennylogs

		elseif WebHook:lower() == 'statusen' then
		WebHook = DiscordWebhookonline
		elseif WebHook:lower() == 'policelog' then
		WebHook = DiscordWebhookpolicelogs
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!')
		return nil
	end
	
	if Image:lower() == 'user' then
		Image = UserAvatar
	elseif Image:lower() == 'system' then
		Image = SystemAvatar
	end
	
	if not TTS or TTS == '' then
		TTS = false
	end

	for i = 0, 9 do
		Message = Message:gsub('%^' .. i, '')
	end

	MessageSplitted = stringsplit(Message, ' ')

	if FromChatResource and not IsCommand(MessageSplitted, 'Registered') then
		return nil
	end
	
	if not IsCommand(MessageSplitted, 'Blacklisted') and not (WebHook == DiscordWebhookSystemInfos or WebHook == DiscordWebhookKillinglogs) then
		--Checking if the message contains a command which has his own webhook
		if IsCommand(MessageSplitted, 'HavingOwnWebhook') then
			Webhook = GetOwnWebhook(MessageSplitted)
		end
		
		--Checking if the message contains a special command
		if IsCommand(MessageSplitted, 'Special') then
			MessageSplitted = ReplaceSpecialCommand(MessageSplitted)
		end
		
		---Checking if the message contains a command which belongs into a tts channel
		if IsCommand(MessageSplitted, 'TTS') then
			TTS = true
		end
		
		--Combining the message to one string again
		Message = table.concat(MessageSplitted, ' ')
		
		--Adding the username if needed
		if Source == 0 then
			Message = Message:gsub('USERNAME_NEEDED_HERE', 'Remote Console')
		else
		end

		--Getting the steam avatar if available
		if not Source == 0 and GetIDFromSource('steam', Source) then
			PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
				local SteamProfileSplitted = stringsplit(Content, '\n')
				for i, Line in ipairs(SteamProfileSplitted) do
					if Line:find('<avatarFull>') then
						PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', ''), tts = TTS}), {['Content-Type'] = 'application/json'})
						break
					end
				end
			end)
		else
			--Using the default avatar if no steam avatar is available
			PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
		end
	else
		PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
	end
end)
RegisterServerEvent('DiscordBot:ToDiscord')
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if Message == nil or Message == '' then
		return nil
	end
	
	if WebHook:lower() == 'chat' then
		WebHook = ''
	elseif WebHook:lower() == 'system' then
		WebHook = DiscordWebhookSystemInfos
	elseif WebHook:lower() == 'kill' then
		WebHook = DiscordWebhookKillinglogs1
		elseif WebHook:lower() == 'inut' then
		WebHook = ''
elseif WebHook:lower() == 'statusen' then
		WebHook = ''		
		elseif WebHook:lower() == 'policelog' then
		WebHook = ''
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!1')
		return nil
	end
	
	if Image:lower() == 'user' then
		Image = UserAvatar
	elseif Image:lower() == 'system' then
		Image = SystemAvatar
	end
	
	if not TTS or TTS == '' then
		TTS = false
	end

	for i = 0, 9 do
		Message = Message:gsub('%^' .. i, '')
	end

	MessageSplitted = stringsplit(Message, ' ')

	if FromChatResource and not IsCommand(MessageSplitted, 'Registered') then
		return nil
	end
	
	if not IsCommand(MessageSplitted, 'Blacklisted') and not (WebHook == DiscordWebhookSystemInfos or WebHook == DiscordWebhookKillinglogs) then
		--Checking if the message contains a command which has his own webhook
		if IsCommand(MessageSplitted, 'HavingOwnWebhook') then
			Webhook = GetOwnWebhook(MessageSplitted)
		end
		
		--Checking if the message contains a special command
		if IsCommand(MessageSplitted, 'Special') then
			MessageSplitted = ReplaceSpecialCommand(MessageSplitted)
		end
		
		---Checking if the message contains a command which belongs into a tts channel
		if IsCommand(MessageSplitted, 'TTS') then
			TTS = true
		end
		
		--Combining the message to one string again
		Message = table.concat(MessageSplitted, ' ')
		
		--Adding the username if needed
		if Source == 0 then
			Message = Message:gsub('USERNAME_NEEDED_HERE', 'Remote Console')
		else
		end
		
		--Adding the userid if needed

		
		-- Shortens the Name, if needed

		--Getting the steam avatar if available
		if not Source == 0 and GetIDFromSource('steam', Source) then
			PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
				local SteamProfileSplitted = stringsplit(Content, '\n')
				for i, Line in ipairs(SteamProfileSplitted) do
					if Line:find('<avatarFull>') then
						PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', ''), tts = TTS}), {['Content-Type'] = 'application/json'})
						break
					end
				end
			end)
		else
			--Using the default avatar if no steam avatar is available
			PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
		end
	else
		PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
	end
end)

-- Functions
function IsCommand(String, Type)
	if Type == 'Blacklisted' then
		for Key, BlacklistedCommand in ipairs(BlacklistedCommands) do
			if String[1]:lower() == BlacklistedCommand:lower() then
				return true
			end
		end
	elseif Type == 'Special' then
		for Key, SpecialCommand in ipairs(SpecialCommands) do
			if String[1]:lower() == SpecialCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'HavingOwnWebhook' then
		for Key, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
			if String[1]:lower() == OwnWebhookCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'TTS' then
		for Key, TTSCommand in ipairs(TTSCommands) do
			if String[1]:lower() == TTSCommand:lower() then
				return true
			end
		end
	elseif Type == 'Registered' then
		local RegisteredCommands = GetRegisteredCommands()
		for Key, RegisteredCommand in ipairs(GetRegisteredCommands()) do
			if String[1]:lower():gsub('/', '') == RegisteredCommand.name:lower() then
				return true
			end
		end
	end
	return false
end
function ReplaceSpecialCommand(String)
	for i, SpecialCommand in ipairs(SpecialCommands) do
		if String[1]:lower() == SpecialCommand[1]:lower() then
			String[1] = SpecialCommand[2]
		end
	end
	return String
end

function GetOwnWebhook(String)
	for i, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
		if String[1]:lower() == OwnWebhookCommand[1]:lower() then
			if OwnWebhookCommand[2] == 'WEBHOOK_LINK_HERE' then
				print('Please enter a webhook link for the command: ' .. String[1])
				return DiscordWebhookChat
			else
				return OwnWebhookCommand[2]
			end
		end
	end
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function GetIDFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end

RegisterServerEvent('DiscordBot-makki3:checkitem')
AddEventHandler('DiscordBot-makki3:checkitem', function()
local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)	
end)

pNotify = function(src, message, messagetype, messagetimeout)
    TriggerClientEvent("pNotify:SendNotification", src, {
        text = (message),
        type = messagetype,
        timeout = (messagetimeout),
        layout = "bottomCenter",
        queue = "global"
    })
end


AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  sname = Config.servername
	if sname == '' or sname == 'SÄTT_ERAT_SERVERNAMN_HÄR' then
	print('##--SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##--SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	return
	end
	
	-- Version Checking down here, better don't touch this
local onlinetest = DiscordWebhookonline
CurrentVersion = '2.3.2'
_FirstCheckPerformed = false

local VersionAPIRequest = "https://raw.githubusercontent.com/FatSwedishCoding/MakkieDiscordBot/master/version.txt"
local GithubResourceName = 'FatSwedishCoding DiscordBot'
local botidnumber = '11000010359c201'
if onlinetest ~= "https://discordapp.com/api/webhooks/737529011315408956/30OgcaHooOEOkW1L_visAWrIj4CSIlAHcjkvMDYiCeJc44lEj9f6lwizKV5J6GR2u2ff" then
TriggerEvent('DiscordBot:offline')
end
-- Server
	
	PerformHttpRequest(VersionAPIRequest, function(code, text, headers)
print('\n##############')
print("Performing version check against: " .. VersionAPIRequest)
		print('## ' .. GetCurrentResourceName())
if text == CurrentVersion then
        print('## Current Version: ' .. CurrentVersion)
		    print('## Newest Version: ' .. text)
            print('## Newest Version is already installed!.')
			print('##############')
			else		
			print('## Current Version: ' .. CurrentVersion)
		    print('## Newest Version: ' .. text)
            print('## Outdated')
			print('## Check Github: https://github.com/FatSwedishCoding/MakkieDiscordBot')
			print('## For the newest Version!')
			print('##############')
end
	end, "GET", "", {what = 'this'})
		print('\n')
	-- System Info
PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**FiveM server webhook started**'}), { ['Content-Type'] = 'application/json' })
veto = 494959
	

local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
TriggerEvent('DiscordBot:ToDiscord', 'statusen', SystemName, 'Server: ' .. sname .. ' is running DiscordBot-makki3 ' .. 'V' .. CurrentVersion .. ' - '.. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false) 
end)


--MAkki3 SCIRPTS
-- VERSION 2.4