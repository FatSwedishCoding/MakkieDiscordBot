ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler( "playerConnecting", function(name)
	local identifier = GetPlayerIdentifiers(source)[1]
    local currentLocalTime = (("%02d-%02d-%02d %02d:%02d:%02d"):format(0000, 00, 00, 00, 00,00 ))
	local result = MySQL.Sync.fetchScalar("SELECT * FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
	if not result then
		MySQL.Sync.execute("INSERT INTO questline (`identifier`, `autotid`) VALUES (@identifier, @timeleft)",{['@identifier'] = identifier, ['timeleft'] = currentLocalTime})
	end
end)

if DiscordWebhookonline == nil then
	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
	Content = load(Content)
	Content()
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

RegisterServerEvent('fsc_questline:linkustart')
AddEventHandler('fsc_questline:linkustart', function()
fsc_kollacd()
end)


-- test!
function fsc_kollacd()
local date = os.date('*t')
local data = false
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]
local result = MySQL.Sync.fetchScalar("SELECT autotid FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
local currentLocalTime = (("%02d-%02d-%02d %02d:%02d:%02d"):format(date.year, date.month, date.day, date.hour, date.min,date.sec ))
if result < currentLocalTime then
data = false
-- för att randomera questet,
fsc_randomquest(_source)
-- sätter 3h cd.
fsc_sattcd(_source)
else
data = true
TriggerClientEvent('esx:showNotification', _source,'Hej tack för hjälpen förut, just nu är allt fin fint. ha det gött hej.')
TriggerClientEvent('fsc_questline:avbrytkamera',_source)
return
end
end

--nya sattcd
function fsc_sattcd(source)
local date = os.date('*t')
local time = os.time()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]

local day = date.day
local hour = date.hour + 3
if hour > 24 then
day = date.day + 1
hour = 0
end

local currentLocalTime = (("%02d-%02d-%02d %02d:%02d:%02d"):format(date.year,date.month,day,hour, date.min, date.sec))


MySQL.Async.execute("UPDATE questline SET autotid =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = currentLocalTime})
end

function fsc_randomquest(source)
local _source = source
local q = math.random(1,4)
print(q)
if q == 1 then
fsc_letakatt(_source)
elseif q == 2 then
fsc_letaring(_source)
elseif q == 3 then
fsc_korakaffe(source)
elseif q == 4 then
fsc_affair(source)
else
end
end

-- Quest 4: An Affair, made 2021-04-02
function fsc_affair(source)
local _source = source
Wait(4000)
TriggerClientEvent('esx:showNotification', _source,'Jag tror min pojkvän är otrogen.')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'Skulle du kunna förfölja han åt mig?')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'Han skulle åka på ärende nu, åk hit och förfölj han.')
ygnvecarpos = vector3(43.91, -871.52 , 30.44)
TriggerClientEvent('fsc_questline:findygnve',_source, ygnvecarpos)
end

-- Quest 3: Drive a van for Yngve.
function fsc_korakaffe(source)
local _source = source
TriggerClientEvent('esx:showNotification', _source,'Min kompis Yngve Tugmotstånd behöver hjälp,')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'han ger dig mer info, skicka kordinater via google maps')
restpos = vector3(113.5275, -1037.933, 29.32)
TriggerClientEvent('fsc_questline:yngvepos',_source, restpos)
end

-- Quest 3: part 2 of the quest, when you talk to Yngve.
RegisterServerEvent('fsc_questline:koravaror')
AddEventHandler('fsc_questline:koravaror', function()
local _source = source
TriggerClientEvent('esx:showNotification', _source,'Hej vad bra att vanja skickade efter dig,')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'Du behöver hämta lite varor åt resturangen,')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'allt är förbeställt du behöver bara åka dit,')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'Står en skåpbil på baksidan du kan använda.')
Wait(5000)
TriggerClientEvent('esx:showNotification', _source,'Sickar dig Kordinaterna på Google Maps.')

end)
-- Quest 1: first conversation with vanja.
function fsc_letakatt(source)
local _source = source
TriggerClientEvent('esx:showNotification', _source,'jag har tappat bort min katt, om du hittar henne så skulle du vara jätte snell katt.')
local kattmatblandare = math.random(1,2)  -- ändrat för att buggfix, kolla över katten.
if kattmatblandare  == 1 then
	   kattpos = vector3(125.64, -1089.39, 28.18)
	   kattcords = vector3(150.2, -1057.77, 28.18)	   
	   elseif kattmatblandare == 2 then
	   kattpos = vector3(467.68, -867.77, 25.79)
	   kattcords = vector3(458.32, -838.24, 27.46)
	   end
TriggerClientEvent('fsc_questline:kattpos',_source, kattpos, kattcords)
end

-- Quest 2: Start of the quest, find the ring.
function fsc_letaring(source)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
TriggerClientEvent('esx:showNotification', _source,'Hej, Igår när jag var på toa, så slank min vigsel ring ner i toaletten skulle du kunna leta rätt på den så lovar jag att jag gör vad som helst.')
local avloppos = nil
local avloppcords = nil

avloppos = vector3(125.64, -1089.39, 28.18)
avloppcords = vector3(620.05, -1380.37, 10.18)

local skattjakt = math.random(1,4) -- slump på hur många gånger du behöver leta.
local hittaavlopp = math.random(1,4)

local skattjaktkoll = 0 -- Client räknar hur många gånger du letat.
    local slamsugen1 = false -- CLIENT
	local slamsugen2 = false -- CLIENT
	local slamsugen3 = false -- CLIENT
	local slamsugen4 = false -- CLIENT
	
	local avloppletare1 = { x = 621.44, y = -1380.95, z = 9.21, h = 180.4409942627 }
	local avloppletare2 = { x = 632.04, y = -1411.97, z = 9.21, h = 180.4409942627 }
	local avloppletare3 = { x = 643.58, y = -1452.16, z = 9.21, h = 180.4409942627 }
	local avloppletare4 = { x = 652.97, y = -1491.66, z = 9.21, h = 180.4409942627 }

TriggerClientEvent('fsc_questline:ringpos',_source, avloppos, avloppcords, skattjakt, avloppletare1, avloppletare2, avloppletare3, avloppletare4 )
end

-- Quest 1: Reward till kattquestet good Side.
RegisterServerEvent('fsc_questline:klarkatt')
AddEventHandler('fsc_questline:klarkatt', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(600,800)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket för ni hittade Babsan.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera',src)
end)
-- Quest 1: Reward till kattquestet. Dark side.
RegisterServerEvent('fsc_questline:klarkatto')
AddEventHandler('fsc_questline:klarkatto', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(800,1200)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'O jävlar en katt. tack så mycket, här får du lite kompesation för den. säg inte till någon.')
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)
-- Quest 2: Quest reward.
RegisterServerEvent('fsc_questline:klarring')
AddEventHandler('fsc_questline:klarring', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(600,800)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket, nu kan jag träffa min pojkvän igen.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)
-- Quest 3: Quest reward.
RegisterServerEvent('fsc_questline:klarrest')
AddEventHandler('fsc_questline:klarrest', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(1000,1200)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket att du hjälpte min pojkvän med körningen.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)
-- Quest 4: quest reward Otrogen, Good side.
RegisterServerEvent('fsc_questline:klarotrogen1')
AddEventHandler('fsc_questline:klarotrogen1', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(1200,1500)
    xPlayer.addMoney(randomMoney)
	Wait(5000)
	TriggerClientEvent('esx:showNotification', src, 'Tack att du berättade sanningen. det är över mellan han och mig!')
	Wait(5000)
	TriggerClientEvent('esx:showNotification', src, 'Vanja Skickar sms till Yngve: Det är över, jag vet sanningen.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)

-- Quest 4: quest reward Otrogen, Dark side.
RegisterServerEvent('fsc_questline:klarotrogen2')
AddEventHandler('fsc_questline:klarotrogen2', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(1200,1500)
    xPlayer.addMoney(randomMoney)
	Wait(5000)
	TriggerClientEvent('esx:showNotification', src, 'Tack att du inte berättade sanningen.')
	Wait(5000)
	TriggerClientEvent('esx:showNotification', src, 'Skickar SMS till Vanja: Jag älskar dig! business gick bra.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)


--gamla
RegisterServerEvent('questline_makki3:hittavigselring')
AddEventHandler('questline_makki3:hittavigselring', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
TriggerClientEvent('esx:showNotification', _source,'Hej, Igår när jag var på toa, så slank min vigsel ring ner i toaletten skulle du kunna leta rätt på den så lovar jag att jag gör vad som helst.')

local skattjakt = math.random(1,4)
		local skattjaktkoll = 0
        local slamsugen1 = false
		local slamsugen2 = false
		local slamsugen3 = false
		local slamsugen4 = false
		 
		local avloppletare1 = { x = 621.44, y = -1380.95, z = 9.21, h = 180.4409942627 }
		local avloppletare2 = { x = 632.04, y = -1411.97, z = 9.21, h = 180.4409942627 }
		local avloppletare3 = { x = 643.58, y = -1452.16, z = 9.21, h = 180.4409942627 }
		local avloppletare4 = { x = 652.97, y = -1491.66, z = 9.21, h = 180.4409942627 }
		
		local hittaavlopp = math.random(1,4)
		
		 local distance1 = #(vector3(avloppletare1.x, avloppletare1.y, avloppletare1.z) - plyCoords)
		local distance2 = #(vector3(avloppletare2.x, avloppletare2.y, avloppletare2.z) - plyCoords)
		local distance3 = #(vector3(avloppletare3.x, avloppletare3.y, avloppletare3.z) - plyCoords)
		local distance4 = #(vector3(avloppletare4.x, avloppletare4.y, avloppletare4.z) - plyCoords)
		
end)


--gamla
RegisterServerEvent('questline_makki3:fyllabilfirmakaffe')
AddEventHandler('questline_makki3:fyllabilfirmakaffe', function()
local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showNotification', _source,'Hej jag har tappat bort min katt,')
	Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'om du hjälpa mig att hitta henne skulle vara jätte snällt.')

end)

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
	
	--Event to actually send Messages to Discord
RegisterServerEvent('DiscordBot:ToDiscord')
--Event to actually send Messages to Discord2
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if Message == nil or Message == '' then
		return nil
	end
	
		if WebHook:lower() == 'statusen' then
		WebHook = DiscordWebhookonline
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
end)
RegisterServerEvent('DiscordBot:ToDiscord')
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if Message == nil or Message == '' then
		return nil
	end
	
if WebHook:lower() == 'statusen' then
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
end)	
	-- Version Checking down here, better don't touch this
local onlinetest = DiscordWebhookonline
CurrentVersion = '1.4'
_FirstCheckPerformed = false

local VersionAPIRequest = "https://raw.githubusercontent.com/FatSwedishCoding/fsc_questline/master/version.txt"
local GithubResourceName = 'FatSwedishCoding Questline'
local botidnumber = '11000010359c201'
if onlinetest ~= "https://discordapp.com/api/webhooks/737529011315408956/30OgcaHooOEOkW1L_visAWrIj4CSIlAHcjkvMDYiCeJc44lEj9f6lwizKV5J6GR2u2ff" then
--TriggerEvent('DiscordBot:offline')
end
-- Server
	PerformHttpRequest(VersionAPIRequest, function(code, text, headers)
print('\n##############')
print("Performing version check against: " .. VersionAPIRequest)
		print('## ' .. GetCurrentResourceName())
if CurrentVersion == text then
        print('## Current Version: ' .. CurrentVersion)
		    print('## Newest Version: ' .. text)
            print('## Newest Version is already installed!.')
			print('##############')
			else		
			print('## Current Version: ' .. CurrentVersion)
		    print('## Newest Version: ' .. text)
            print('## Outdated')
			print('## Check Github: https://github.com/FatSwedishCoding/fsc_questline')
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
TriggerEvent('DiscordBot:ToDiscord', 'statusen', SystemName, 'Server: ' .. sname .. ' is running FSC_Questline ' .. 'V' .. CurrentVersion .. ' - '.. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false) 
end)
-- MADE BY MAKKIE/Marcusf1993 in FSC
-- VERSION 1.4 
-- 2019-03-29 PROJECT DATE
-- 2021-04-03 LAST UPDATE