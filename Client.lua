local ped = nil
local stuff = {
    inMission = false
	}

-- KANEKI KEN
Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	
    ped = createPed(1561705728, vector3(-1638.4, 200.03, 59.79), 277.53)
    FreezeEntityPosition(ped, true)
	 while true do
        local me = PlayerPedId()
        local sleep = 200
        local distance = GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(ped))
        if distance > 2.5 or stuff.inMission then
            sleep = 200
        else
            sleep = 5
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med %s'):format('Kaneki Ken'))
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
                sleep = 500


TriggerEvent('DiscordBot-makki3:ft')
            end
        end
        Wait(sleep)
    end
	end)
	
	-- TOUKA
	Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	
    ped = createPed(-1211756494, vector3(-1603.12, -1004.04, 12.02), 142.41)
	
    FreezeEntityPosition(ped, true)
	 while true do
        local me = PlayerPedId()
        local sleep = 200
        local distance = GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(ped))
        if distance > 2.5 or stuff.inMission then
            sleep = 200
        else
            sleep = 5
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med %s'):format('Touka Kirishima'))
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
                sleep = 500


TriggerEvent('DiscordBot-makki3:tk')
                -- TriggerEvent('loffe_carthief:startCl')
                --TriggerServerEvent('loffe_carthief:start')
            end
        end
        Wait(sleep)
    end
	end)
	
RegisterNetEvent('DiscordBot-makki3:tk')
AddEventHandler('DiscordBot-makki3:tk', function()

 local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
	
	TriggerEvent('esx:showNotification', 'Hej jag heter Touka Kirishima trevligt att träffas.')
	
    SetCamCoord(cam, vector3(-1637.74, 198.55, 64.65))
    RenderScriptCams(1, 0, 0, 1, 1)

    -- TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.Soundfile, 1.0)

    while cutsceneOver >= GetGameTimer() do
        for i = 0, 31 do
            DisableAllControlActions(i)
        end
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.0, true)
        SetCamFov(cam, GetCamFov(cam)-0.05)
        Wait(5)
    end
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam)
end)

RegisterNetEvent('DiscordBot-makki3:ft')
AddEventHandler('DiscordBot-makki3:ft', function()

 local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
	
	TriggerEvent('esx:showNotification', 'Hej jag heter Ken Kaneki trevligt att träffas.')
	
    SetCamCoord(cam, vector3(-1637.74, 198.55, 64.65))
    RenderScriptCams(1, 0, 0, 1, 1)

    -- TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.Soundfile, 1.0)

    while cutsceneOver >= GetGameTimer() do
        for i = 0, 31 do
            DisableAllControlActions(i)
        end
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.0, true)
        SetCamFov(cam, GetCamFov(cam)-0.05)
        Wait(5)
    end
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam)
end)

Citizen.CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
		Citizen.Wait(0)
		if IsEntityDead(PlayerPedId()) then
			Citizen.Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = WeaponNames[tostring(DeathCauseHash)]

			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
			
			if (Killer == PlayerId()) then
				DeathReason = 'committed suicide'
			elseif (Killer == nil) then
				DeathReason = 'died by slay or npc'
			else
				if IsMelee(DeathCauseHash) then
					DeathReason = 'murdered'
				elseif IsTorch(DeathCauseHash) then
					DeathReason = 'torched'
				elseif IsKnife(DeathCauseHash) then
					DeathReason = 'knifed'
				elseif IsPistol(DeathCauseHash) then
					DeathReason = 'pistoled'
				elseif IsSub(DeathCauseHash) then
					DeathReason = 'riddled'
				elseif IsRifle(DeathCauseHash) then
					DeathReason = 'rifled'
				elseif IsLight(DeathCauseHash) then
					DeathReason = 'machine gunned'
				elseif IsShotgun(DeathCauseHash) then
					DeathReason = 'pulverized'
				elseif IsSniper(DeathCauseHash) then
					DeathReason = 'sniped'
				elseif IsHeavy(DeathCauseHash) then
					DeathReason = 'obliterated'
				elseif IsMinigun(DeathCauseHash) then
					DeathReason = 'shredded'
				elseif IsBomb(DeathCauseHash) then
					DeathReason = 'bombed'
				elseif IsVeh(DeathCauseHash) then
					DeathReason = 'mowed over'
				elseif IsVK(DeathCauseHash) then
					DeathReason = 'flattened'
				else
					DeathReason = 'killed'
				end
			end
			
			if DeathReason == 'committed suicide' or DeathReason == 'died' or DeathReason == 'died by slay or npc' then
				TriggerServerEvent('DiscordBot:PlayerDied', GetPlayerName(PlayerId()) .. ' ' .. DeathReason .. '.', Weapon)
			else
				TriggerServerEvent('DiscordBot:PlayerDied', GetPlayerName(Killer) .. ' ' .. DeathReason .. ' ' .. GetPlayerName(PlayerId()) .. '.', Weapon)
			end
			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil
		end
		while IsEntityDead(PlayerPedId()) do
			Citizen.Wait(0)
		end
	end
end)

function IsMelee(Weapon)
	local Weapons = {'WEAPON_UNARMED', 'WEAPON_CROWBAR', 'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_HAMMER', 'WEAPON_NIGHTSTICK'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsTorch(Weapon)
	local Weapons = {'WEAPON_MOLOTOV'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsKnife(Weapon)
	local Weapons = {'WEAPON_DAGGER', 'WEAPON_KNIFE', 'WEAPON_SWITCHBLADE', 'WEAPON_HATCHET', 'WEAPON_BOTTLE'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsPistol(Weapon)
	local Weapons = {'WEAPON_SNSPISTOL', 'WEAPON_HEAVYPISTOL', 'WEAPON_VINTAGEPISTOL', 'WEAPON_PISTOL', 'WEAPON_APPISTOL', 'WEAPON_COMBATPISTOL'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsSub(Weapon)
	local Weapons = {'WEAPON_MICROSMG', 'WEAPON_SMG'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsRifle(Weapon)
	local Weapons = {'WEAPON_CARBINERIFLE', 'WEAPON_MUSKET', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_ASSAULTRIFLE', 'WEAPON_SPECIALCARBINE', 'WEAPON_COMPACTRIFLE', 'WEAPON_BULLPUPRIFLE'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsLight(Weapon)
	local Weapons = {'WEAPON_MG', 'WEAPON_COMBATMG'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsShotgun(Weapon)
	local Weapons = {'WEAPON_BULLPUPSHOTGUN', 'WEAPON_ASSAULTSHOTGUN', 'WEAPON_DBSHOTGUN', 'WEAPON_PUMPSHOTGUN', 'WEAPON_HEAVYSHOTGUN', 'WEAPON_SAWNOFFSHOTGUN'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsSniper(Weapon)
	local Weapons = {'WEAPON_MARKSMANRIFLE', 'WEAPON_SNIPERRIFLE', 'WEAPON_HEAVYSNIPER', 'WEAPON_ASSAULTSNIPER', 'WEAPON_REMOTESNIPER'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsHeavy(Weapon)
	local Weapons = {'WEAPON_GRENADELAUNCHER', 'WEAPON_RPG', 'WEAPON_FLAREGUN', 'WEAPON_HOMINGLAUNCHER', 'WEAPON_FIREWORK', 'VEHICLE_WEAPON_TANK'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsMinigun(Weapon)
	local Weapons = {'WEAPON_MINIGUN'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsBomb(Weapon)
	local Weapons = {'WEAPON_GRENADE', 'WEAPON_PROXMINE', 'WEAPON_EXPLOSION', 'WEAPON_STICKYBOMB'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsVeh(Weapon)
	local Weapons = {'VEHICLE_WEAPON_ROTORS'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsVK(Weapon)
	local Weapons = {'WEAPON_RUN_OVER_BY_CAR', 'WEAPON_RAMMED_BY_CAR'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

createPed = function(hash, coords, heading)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(5) end
    local peds = CreatePed(4, hash, coords, false, false)
    SetEntityHeading(peds, heading)
    SetEntityAsMissionEntity(peds, true, true)
    SetEntityInvincible(peds, true)
    SetPedHearingRange(peds, 0.0)
    SetPedSeeingRange(peds, 0.0)
    SetPedAlertness(peds, 0.0)
    SetBlockingOfNonTemporaryEvents(peds, true)
    SetPedCombatAttributes(peds, 46, true)
    SetPedFleeAttributes(peds, 0, 0)
    return peds
end
