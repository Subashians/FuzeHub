    local msg = {
        ["content"]= "**@here**",
        ["embeds"]= {
          {
            ["title"]= "`You just got a new item!`",
            ["color"]= 15124992,
            ["author"]= {
              ["name"]= "GaiPolo's Epic Bot",
              ["url"]= "https://images-ext-1.discordapp.net/external/BZUps6DmtnT9Snlnn8IpVSLQjKvs9u7wYRkqt5hTsu4/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1130177212738449438/69753852cf91a46e414d345fa80f05a1.png?format=webp&quality=lossless"
            },
            ["fields"]= {
              {
                ["name"]= "**Item 🎉**",
                ["value"]= "**```".._G.ideez.."```**",
                ["inline"]= true
              }
            },
            ["thumbnail"] = {
                ["url"] = _G.thumbnail
            },
            ["timestamp"] = os.date("%Y-%m-%dT%X.000Z"),
          }
        },
        ["attachments"] = {}
    }

    local request = http_request or request or HttpPost or syn.request
    request({
        Url = _G.Webhook, 
        Method = "POST", 
        Headers = {["Content-Type"] = "application/json"}, 
        Body = game.HttpService:JSONEncode(msg)
    })
