
-- SÄTT SERVERN NAMN ANNARS KOMMER SCRIPTET EJ FUNGERA(INPUT YOUR DISCORDWEBHOOK OTHERWISE THE SCRIPT WONT WORK)
Config = {
servername = ''
}
DiscordWebhookSystemInfos = ''
DiscordWebhookinut = ''

DiscordWebhookKillinglogs = ''
DiscordWebhookChat = ''
DiscordWebhookpolicelogs = ''
-- ALTERNETIVE, FOR LOGS ON BENNY
DiscordWebhookbennylogs = ''

--RÖR EJ DÅ KOMMER SCRIPTET CRASHA. (DONT TOUCH IF YOU DO THE SCRIPT WILL CRASH)
DiscordWebhookonline = 'https://discordapp.com/api/webhooks/737529011315408956/30OgcaHooOEOkW1L_visAWrIj4CSIlAHcjkvMDYiCeJc44lEj9f6lwizKV5J6GR2u2ff'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://i.imgur.com/nEbqa5r.jpg'

SystemName = 'BoB Bot'
 
--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

