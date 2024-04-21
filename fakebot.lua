if _G.ideez:sub(1, 8) == "rbxid://" then
    -- Extract the id part after "rbxid://"
    local _G.id = rbxIdString:sub(9)
    return _G.id
else
     -- If rbxIdString doesn't start with "rbxid://", return nil
     return nil
end

local Size = "420x420"

local Image = game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds=".._G.id.."&returnPolicy=PlaceHolder&size="..Size.."&format=png")

_G.thumbnail = game.HttpService:JSONDecode(Image).data[1].imageUrl
