fx_version "bodacious"
game "gta5"
lua54 "yes"

server_scripts {'@vrp/lib/Utils.lua','server/core.lua'}

client_scripts {
	"@vrp/config/Global.lua",
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	"client/*"
}