
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/library"))()
local Window = Library.CreateLib("Fuze Hub", "DarkTheme")

local Credits = Window:NewTab("Credits")
local Credits = Credits:NewSection("Made by Commentuto")

Credits:NewButton("Click to copy the discord link!", "https://discord.gg/5bgkB4dDd9", function()
    setclipboard("https://discord.gg/5bgkB4dDd9")
end)

local AutoFarm = Window:NewTab("AutoFarm")
local AutoFarmSection = AutoFarm:NewSection("AutoFarm")

AutoFarmSection:NewToggle("Auto Collect orbs", "Teleport all the orbs to you", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/autocollect"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/disableautocollect"))()
    end
end)

AutoFarmSection:NewToggle("Auto Redeem Ranks Rewards", "Redeem normal and vip rewards", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/autoredeem.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/disableautoredeem.lua"))()
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
local Webhook = Webhook:NewSection("Discord Notification when Hatch")
local basic = false
local rare = false
local epic = false
local legendary = false
local mythical = false
local exclusive = false

Webhook:NewButton("Click the rarity you want to be notified when you hatch and enter your discord webhook", "click enter to enter the webhook", function()
    print("e")
end)

Webhook:NewToggle("Basic", "Click to get notified when you hatch a Basic Pet", function(state)
    if state then
        basic = true
    else
        basic = false
    end
end)

Webhook:NewToggle("Rare", "Click to get notified when you hatch a Rare Pet", function(state)
    if state then
        rare = true
    else
        rare = false
    end
end)

Webhook:NewToggle("Epic", "Click to get notified when you hatch an Epic Pet", function(state)
    if state then
        epic = true
    else
        epic = false
    end
end)

Webhook:NewToggle("Legendary", "Click to get notified when you hatch a Legendary Pet", function(state)
    if state then
        legendary = true
    else
        legendary = false
    end
end)

Webhook:NewToggle("Mythical", "Click to get notified when you hatch a Mythical Pet", function(state)
    if state then
        mythical = true
    else
        mythical = false
    end
end)

Webhook:NewToggle("Exclusive", "Click to get notified when you hatch an Exclusive Pet", function(state)
    if state then
        exclusive = true
    else
        exclusive = false
    end
end)

Webhook:NewTextBox("Paste your Discord Webhook", "Paste here", function(txt)
	_G.Webhook = txt
	_G.TrackList = {
   	['Basic'] = basic;
	['Rare'] = rare;
	['Epic'] = epic;
	['Legendary'] = legendary;
	['Mythical'] = mythical;
	['Exclusive'] = exclusive;
}
		
	loadstring(game:HttpGet('https://pastebin.com/raw/H9DyZWys'))()
end)
