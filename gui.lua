
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/library"))()
local Window = Library.CreateLib("Fuze Hub", "DarkTheme")

local AutoFarm = Window:NewTab("AutoFarm")
local AutoFarmSection = AutoFarm:NewSection("AutoFarm")

AutoFarmSection:NewToggle("Auto Collect orbs", "Teleport all the orbs to you", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/autocollect"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/disableautocollect"))()
    end
end)

local Misc = Window:NewTab("Misc")
local Misc = Misc:NewSection("Misc")

Misc:NewSlider("Speed", "Change Player Walkspeed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Misc:NewSlider("Jump", "Change Player JumpPower", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Webhook = Window:NewTab("Webhook")
local Webhook = Webhook:NewSection("Webhook")

Webhook:NewButton("Click the rarity you want to be notified when you hatch and enter your discord webhook", "click enter to enter the webhook", function()
    print("e")
end)

Webhook:NewToggle("ToggleText", "ToggleInfo", function(state)
    if state then
        _G.TrackList = {
   ['Basic'] = true;
    else
        _G.TrackList = {
   ['Basic'] = false;
    end
end)
		
Webhook:NewTextBox("Paste your Discord Webhook", "Paste here", function(txt)
	_G.Webhook = txt
	loadstring(game:HttpGet('https://pastebin.com/raw/H9DyZWys'))()
end)
