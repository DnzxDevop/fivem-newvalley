fx_version "bodacious"
game "gta5"
lua54 "yes"

server_scripts {
	"@vrp/lib/Utils.lua",
	"server/*"
}

shared_scripts {
	"shared/*",
	"@vrp/config/Item.lua",
	"@vrp/config/Vehicle.lua",
	"@vrp/config/Global.lua",
	"@vrp/config/Drops.lua"
}

server_exports { 
	"GetDiscordRoles",
	"GetRoleIdFromRoleName",
	"GetDiscordAvatar",
	"GetDiscordName",
	"GetDiscordEmail",
	"IsDiscordEmailVerified",
	"GetDiscordNickname",
	"GetGuildIcon",
	"GetGuildSplash",
	"GetGuildName",
	"GetGuildDescription",
	"GetGuildMemberCount",
	"GetGuildOnlineMemberCount",
	"GetGuildRoleList",
	"ResetCaches",
	"CheckEqual",
	"SetNickname",
	"SetRoles",
	"AddRole",
	"RemoveRole",
	"ChangeDiscordVoice",
	"ClearCache",
	"FetchRoleID"
} 