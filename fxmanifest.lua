fx_version 'adamant'
game 'gta5'


description 'Discord Bot' 			-- Resource Description

--server_script {						-- Server Scripts
	--'Config.lua',
	--'SERVER/Server.lua',
	--'@mysql-async/lib/MySQL.lua',
--}

server_script { 
     '@mysql-async/lib/MySQL.lua',
     'Server.lua'
 }

client_script {						-- Client Scripts
	'Config.lua',
	'Weapons.lua',
	'Client.lua',
}

