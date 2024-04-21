funnid = _G.rbxid
Asset = tonumber(string.match(funnid, "%d+"))
local Size = "420x420"

local Image = game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds="..Asset.."&returnPolicy=PlaceHolder&size="..Size.."&format=png")

_G.thumbnail = game.HttpService:JSONDecode(Image).data[1].imageUrl
