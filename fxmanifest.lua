fx_version 'cerulean'
game 'gta5'

description 'Interaction'
version '0.1'

client_scripts {
	'client/interaction.lua',
	'client/main.lua'
}

server_scripts {
	'server/main.lua'
}

shared_scripts {
  'shared/config.lua'
}

files {
	"icons/e-icon.png",
	"icons/option.png"
}

lua54 'yes'
