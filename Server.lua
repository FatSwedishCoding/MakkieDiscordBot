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
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- Error Check
if DiscordWebhookSystemInfos == nil and DiscordWebhookKillinglogs == nil and DiscordWebhookKillinglogs1 == nil and DiscordWebhookChat == nil then
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
if DiscordWebhookKillinglogs == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Killing Log" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookKillinglogs, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Killing Log" webhook non-existent!\n\n')
		end
	end)
end

if DiscordWebhookChat == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Chat" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookChat, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Chat" webhook non-existent!\n\n')
		end
	end)
end
	
-- System Info
PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**FiveM server webhook started**'}), { ['Content-Type'] = 'application/json' })


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
	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. firstname .. ' ' .. lastname .. ' öppnade admin Meny Quick' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	
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
	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. firstname .. ' ' .. lastname .. ' öppnade admin Meny ALL' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
	
end)


-- kolla om nån öppnar jail meny
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
	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'AbuseWarning' .. ' ' .. firstname .. ' ' .. lastname .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

	OpenJailMenu()
end)

-- Visar om nån använder jail meny, "även poliser"
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
	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'AbuseWarning' .. ' ' .. firstname .. ' ' .. lastname .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'AbuseWarning' .. ' ' .. firstname .. ' ' .. lastname .. ' öppnade polismeny ' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	


	jailTime = newJailTime

	Cutscene()
end)


-- kollar om nån tar pengar från bankrånet.
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
	
TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'BANKRÅN' .. ' ' .. firstname .. ' ' .. lastname .. ' rånade banken på ' .. money  .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'BANKRÅN' .. ' ' .. firstname .. ' ' .. lastname .. ' rånade banken på ' .. money  .. 'kr' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    	

end)


-- Kollar om nån lägger in pengar i företag
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
	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'FÖRETAGIN' .. ' ' .. firstname .. ' ' .. lastname .. ' la in ' .. amount ..'' ..'kr till ' .. society .. ' kassan'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'FÖRETAGIN' .. ' ' .. firstname .. ' ' .. lastname .. ' la in ' .. amount ..'' ..'kr till ' .. society .. 'kassan'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

--Kollar om nån tar ut pengar ur företag
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
	
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'FÖRETAGUT' .. ' ' .. firstname .. ' ' .. lastname .. ' tog ut ' .. amount ..'' ..'kr från ' .. society .. ' kassan' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	    
	TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'FÖRETAGUT' .. ' ' .. firstname .. ' ' .. lastname .. ' tog ut ' .. amount ..'' ..'kr från ' .. society .. 'kassan'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- Kollar om mekko tar ut grejor ur stash
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
  
	local identifier = GetPlayerIdentifiers(source)[1]
	
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
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'MEKKOUT' .. ' ' .. firstname .. ' ' .. lastname .. ' tog ut x' .. count .. ' ' .. itemName.. ' ' ..'från MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName,'MEKKOUT' .. ' ' .. firstname .. ' ' .. lastname .. ' tog ut x' .. count .. ' ' .. itemName.. ' ' ..'från MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)	

end)

-- Kollar om Mekko lägger in grejor i stash
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
	if count > 100 then
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'@here ' .. 'MEKKOIN' .. ' ' .. firstname .. ' ' .. lastname .. ' la in x' .. count .. ' ' .. itemName.. ' ' ..'i MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

	end
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'MEKKOIN' .. ' ' .. firstname .. ' ' .. lastname .. ' la in x' .. count .. ' ' .. itemName.. ' ' ..'i MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName,'MEKKOIN' .. ' ' .. firstname .. ' ' .. lastname .. ' la in x' .. count .. ' ' .. itemName.. ' ' ..'i MEKKO Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
end)

		-- Loggar Om du tar ut items(ej vapen) ur stashen polisen.
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
	
	
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName,'POLISUT' .. ' ' .. firstname .. ' ' .. lastname .. ' tog ut x' .. count .. ' ' .. itemName.. ' ' ..'från Polisen Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		end)
		
		
		--Loggar om polisen lägger in items(ej vapen) i polis Stashen(kurragömma)
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
	
	
		TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'POLISIN' .. ' ' .. firstname .. ' ' .. lastname .. ' La in x' .. count .. ' ' .. itemName.. ' ' ..'in i Polisen Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'POLISIN' .. ' ' .. firstname .. ' ' .. lastname .. ' La in x' .. count .. ' ' .. itemName.. ' ' ..'in i Polisen Kurragömma'  .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		
		end)
		-- ge items till andra
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
	local identifier = GetPlayerIdentifiers(source)[1]
	local identifier1 = GetPlayerIdentifiers(target)[1]
	
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })
	local result2 = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier1
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']

    local data = {
      firstname   = firstname,
      lastname    = lastname
    }
	
	local user2      = result2[1]
    local firstname2     = user2['firstname']
    local lastname2      = user2['lastname']

    local data2 = {
      firstname2   = firstname2,
      lastname2    = lastname2
    }
	
	
	TriggerEvent('DiscordBot:ToDiscord', 'INUT', SystemName, 'PLAYERGIVE ' .. firstname .. ' ' .. lastname .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. ' x' .. itemCount .. ' ' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
				
	TriggerEvent('DiscordBot:ToDiscord', 'INUT', inut, 'PLAYERGIVE ' .. sourceXPlayer.name .. ' gav ' .. firstname2 .. ' ' .. lastname2 .. 'x' .. itemCount .. '' .. '' .. itemName .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    	
	
end)	
		--DROPA ITEMS
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
  
	local identifier = GetPlayerIdentifiers(source)[1]
    local weaponLabel = ESX.GetWeaponLabel(itemName)
	
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
	if itemCount == nil or itemCount == 0 then
	itemCount = 1
	elseif itemCount > 100 then
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, '@here ' .. '1PLAYERDROP ' .. firstname .. ' ' .. lastname .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
	return
	end
	TriggerEvent('DiscordBot:ToDiscord', 'inut', SystemName, 'PLAYERDROP ' .. firstname .. ' ' .. lastname .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERDROP ' .. firstname .. ' ' .. lastname .. ' kastade x' .. itemCount .. ' ' .. itemName.. '' .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
		
		end)

-- Spelar loggar in logg
AddEventHandler('playerConnecting', function()
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName, '```css\n' .. 'PLAYERCONNECT ' .. GetPlayerName(source) .. ' connecting\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '```css\n' .. 'PLAYERCONNECT ' .. GetPlayerName(source) .. ' connecting\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

end)

-- Spelar Loggar ut logg
AddEventHandler('playerDropped', function(Reason)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
		
	TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName, '```fix\n' .. 'PLAYERDISCONNECT ' .. GetPlayerName(source) .. ' left (' .. Reason .. ')\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, '```fix\n' .. 'PLAYERDISCONNECT ' .. GetPlayerName(source) .. ' left (' .. Reason .. ')\n```' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false)

end)

-- döds Log
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
	TriggerEvent('DiscordBot:ToDiscord', 'kill', SystemName, 'PLAYERDEATH ' .. Message .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec, 'system', source, false, false)
    TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName, 'PLAYERDEATH ' .. Message .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec, 'system', source, false, false)

end)

-- Chat logg
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
	
TriggerEvent('DiscordBot:ToDiscord', 'chat', SystemName , 'CHAT ' .. firstname .. ' ' .. lastname .. ' ' .. 'använde Command eller skriv:' .. ' ' .. Message .. ' ' .. '\n' .. '' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, '' , Source, false, false)
TriggerEvent('DiscordBot:ToDiscord', 'system', SystemName , 'CHAT ' .. firstname .. ' ' .. lastname .. ' ' .. 'använde Command eller skriv:' .. ' ' .. Message .. ' ' .. '\n' .. '' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, '' , Source, false, false)

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

-- Version Checking down here, better don't touch this
local CurrentVersion = '2.0'
local NewestVersion = '2.0'
local GithubResourceName = 'Makkie DiscordBot'

		print('\n')
		print('##############')
		print('## ' .. GetCurrentResourceName())
		print('##')
		print('## Current Version: ' .. CurrentVersion)
		print('## Newest Version: ' .. CurrentVersion)
		print('##')
		
		if CurrentVersion ~= CurrentVersion then
			print('## Outdated')
			print('## Check the Topic')
			print('## For the newest Version!')
			print('##############')
			print('CHANGES:\n' .. Changes)
		else
			print('## Up to date!')
			print('##############')
		end
		print('\n')
