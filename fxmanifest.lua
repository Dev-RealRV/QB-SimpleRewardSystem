fx_version 'cerulean'
game 'gta5'

description 'QB-SimpleRewardSystem'
version '1.0.0'

client_scripts {
    'client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

lua54 'yes'
