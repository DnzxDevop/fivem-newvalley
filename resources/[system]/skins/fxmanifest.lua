fx_version 'adamant'
description 'DX-AC: FiveM AntiCheat '

game 'gta5'

shared_scripts '@vrp/lib/Utils.lua'
client_scripts {
    '@vrp/lib/Utils.lua',
    '@menuv/menuv.lua',
    'configs/client_config.lua',
    'client/*.lua'
}

server_scripts {
    '@vrp/lib/Utils.lua',
    '@oxmysql/lib/MySQL.lua',
    'configs/server_config.lua',
    'server/main.lua'
}

ui_page "html/index.html"

files {
    'html/*.html',
    'html/js/*.js'
}

