DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/674055280849322006/L5oRm5stVuTQGB1LeNWxckKBE7bgZmdNygfU-yWUgn5kVBdyWxaZ4hi8eREdQmqhUgHy'
DiscordWebhookinut = 'https://discordapp.com/api/webhooks/673416318984388609/mKs3cvhbKSovMSl1JPC4fVoCmZAy08XgJ787QUUhs_eK4aqjEuJlv_-8tW38ZBdAxm_I'

DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/656443645158752271/76TFnANZtI8lMvMIxOs0bGfN9-Ws8qyF5aiPCIoIC1tGXCv3EfklJcr1-vt2pHpmL7Yh'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/706343792722313229/y_HokWuH-N2pQLkzbErKSbrpQW2JEg49gbUU7bwEYjG6rTRNlucBVKGGN5bVQKSrMPtf'
DiscordWebhookpolicelogs = 'https://discordapp.com/api/webhooks/691432140524486707/w92PTtUn7JgK4eKDglcd9z2Tlfu138TStrQaGf1VdN4xNc_OxpPpwiusEYVNk4WZXumL'

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

