
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fuze Hub", "DarkTheme")

local AutoFarm = Window:NewTab("AutoFarm")
local AutoFarmSection = AutoFarm:NewSection("AutoFarm")

AutoFarmSection:NewToggle("Auto Collect orbs", "Teleport all the orbs to you", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/autocollect"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PoloISFAT/FuzeHub/main/disableautocollect?token=GHSAT0AAAAAAB3CE226JOK3L2JJRELUZEQMY3PZU5Q"))()
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
