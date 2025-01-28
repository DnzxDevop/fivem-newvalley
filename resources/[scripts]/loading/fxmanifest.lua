fx_version "bodacious"
game "gta5"
lua54 "yes"
author "Summerz - Dnzx"
loadscreen "web/index.html"
loadscreen_cursor "yes"
loadscreen_manual_shutdown "yes"

client_scripts {
	"client/*"
}
server_scripts {
	"server/*"
}
shared_scripts {
	"@vrp/config/Global.lua",
	"shared/*"
}
files {
	"web/*",
	"web/**/*"
}
client_export 'OpenSpawn'

