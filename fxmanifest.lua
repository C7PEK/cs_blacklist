fx_version 'cerulean'

game 'gta5'

author 'c7pek'
description 'cs_blacklist usuwa pojazdy/item/pedy. https://discord.gg/wtuc73KNDu'
lua54 'yes'
version '1.0'

client_scripts {
	'client/client.lua',
	'config.lua'
}

server_scripts {
	'server/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
	'@es_extended/imports.lua'
}