-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
local Discord = {
	["Connect"] = "https://discordapp.com/api/webhooks/1330999253837025371/RmRcVV5bvUlPZKjGY6BIP4V1a8WO92nRooqHf0TTmOBi4-tYr6ov9j4kOadZza7QuDZx",
	["Disconnect"] = "https://discordapp.com/api/webhooks/1330999297847591067/tkXIinZiMIcewmu2sJgJV5WlmuXngIb5Mx2yt1pJ5sJtdbPyvwgEE_gLW3VlmsdKiC-6",
	["Services"] = "https://discordapp.com/api/webhooks/1330999356723302480/heQeDbUpwuCBBg0O3kpsg25ITvXDy_mYqgVfPombI2nlfwvX-43TLRmDaOlMOwUOHZK6",
	["Salary"] = "https://discordapp.com/api/webhooks/1330999404957536296/sgG5VlerGWG4vguwzJI-I0gRHlXMBTUIBRIPflUdJBuivB_XeHYeGg-LoKRnc4AXA07h",
	["Admin"] = "https://discordapp.com/api/webhooks/1330999466836230218/TnHjFuCRluFgCJgdfQXenVTuFEC3irjlNkWwEt9eLoZuxR4--Kz879vfTJ_2SS4Tslb7",
	["Garages"] = "https://discordapp.com/api/webhooks/1330999515800535040/gAqPE66mFDZb1N9crwn5_JV-cIAYqNEnh55BKCDgKORILCxuNfqntQc8Mb2TuBFs6LuD",
	["Paramedic"] = "https://discordapp.com/api/webhooks/1330999554618691774/5MOc_mUVMTerqzTtqO-SufoE9knwRTAl8QEGqxYtrB1kYv080KdUES4prvMNJznJo8Wz",
	["Payments"] = "https://discordapp.com/api/webhooks/1330999595232133283/lVLTHN9VMtJz4Z5U4RA9oXp4NfzGeX2Sxk-GUQWoBQKeQwxzOb3sjUHg-KeskRqThBHo",
	["Airport"] = "https://discordapp.com/api/webhooks/1330999635770343498/zz6z8ttfSn0BJPx-I-1rpe50l5LbGzkK_WOsj8RJtR77xa7a33j41t12mX2-0rO_HlmA",
	["Deaths"] = "https://discordapp.com/api/webhooks/1330999730381258854/kHTNc9nBoijZrO_PqgmJDQr4JEUxeXSeE0gNm_p4wtj4tMOzBXDiQkwxwgyZCJDbFEgG",
	["Gemstone"] = "https://discordapp.com/api/webhooks/1330999770206048367/v2qm5-uwy9iwG3lai-XYMCOx2EVAXFubLk9XO-5E5Pm7S72DwL4mR8I17C5E1tPVlUlv",
	["Rename"] = "https://discordapp.com/api/webhooks/1330999806314676289/SeNK3-Gt4cDhsGffTJyWCd3XBAtTe3y2SYr2Ie2R232LSzpCK_b2kY13KuoObmdRI9-d",
	["Roles"] = "https://discordapp.com/api/webhooks/1330999849855746079/wZFieihrgcddmHxkvJMIiw1k4ec3Qy-0dyn_eRPinPP9AUUnxffwWsniDZ5hMXRIqrZ0",
	["Skins"] = "https://discordapp.com/api/webhooks/1330999901936418927/wXgUFeJxXMS7GsypYoAsgyPt3N22zQgj1dfhukTzQeMpYFlBQx-eW5sf8m8Lh6pu2I4Y",
	["Marketplace"] = "",
	["Pause"] = "",
	["Boxes"] = "",
	["Hackers"] = "https://discordapp.com/api/webhooks/1330999940926668884/OXrIQxu2y_m-38jB6SjrXKIHxie4F3mFxMH4BQsAbIBX6SLhdS2uvMQcAREgTgnxX2-Z"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMBED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Embed", function(Hook, Message, Color, source)
    local dnzx = '698295371746771019'

    PerformHttpRequest(Discord[Hook], function() end, "POST", json.encode({
        username = ServerName,
        avatar_url = getDiscordAvatar(dnzx),  -- Aqui está a modificação
        embeds = {
            { 
                color = (Color or 0xa3c846), 
                description = Message 
            }
        }
    }), { ["Content-Type"] = "application/json" })

    if source then
        -- Código adicional se necessário
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTENT
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Content",function(Hook,Message)
	PerformHttpRequest(Discord[Hook],function() end,"POST",json.encode({
		username = ServerName,
		content = Message
	}),{ ["Content-Type"] = "application/json" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Webhook",function(Hook)
	return Discord[Hook] or ""
end)

dnzxPrint = function(username,content)
	local dnzx = '698295371746771019'
    exports["discord-screenshot"]:requestClientScreenshotUploadToDiscord(
        GetPlayers()[1],
        {
            username = username,
            avatar_url = getDiscordAvatar(dnzx),
            content = content,
            embeds = {
                {
                    color = 16771584,
                    author = {
                        name = "Dnzx - Screenshots!",
                        icon_url = getDiscordAvatar(dnzx)
                    },
                    title = "Logger."
                }
            }
        },
        30000,
        function(error)
            if error then
                -- Error handling, but no prints
            end
        end
    )
end


function getDiscordAvatar(discordID)
    local url = "https://discord.com/api/v10/users/" .. discordID
    
    local headers = {
        ["Authorization"] = "Bot " .. Config.Bot_Token
    }
    PerformHttpRequest(url, function(statusCode, responseText, headers)
        if statusCode == 200 then
            local userInfo = json.decode(responseText)
            
            if userInfo and userInfo.avatar then
                local avatarUrl = "https://cdn.discordapp.com/avatars/" .. discordID .. "/" .. userInfo.avatar .. ".png"
                --print("Avatar URL: " .. avatarUrl)
                return avatarUrl
            else
                --print("O usuário não tem avatar.")
            end
        else
            --print("Erro ao obter informações do usuário: " .. statusCode)
        end
    end, "GET", "", headers)
end