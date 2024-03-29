local Http = game:GetService("HttpService")

writefile("v4config.txt", Http:JSONEncode(Settings))

Http = game:GetService("HttpService")

Settings = Http:JSONDecode(readfile("v4config.txt"))

if not game:IsLoaded() then
    while not game:IsLoaded() do wait(1) end
end

if Settings["Performance"]["Disable 3D Rendering"] then game:GetService("RunService"):Set3dRenderingEnabled(false) end

local totallabelsize = 0

function makelabel()
    local sg = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 0.2, 0)
    label.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize)
    label.BackgroundColor3 = Color3.new(0, 0, 0)
    label.BackgroundTransparency = 0
    label.BorderSizePixel = 0
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.TextWrapped = true
    label.Text = "Label"
    label.Parent = sg
    if not Settings["On Screen Trackers"] then sg.Enabled = false end
    
    label.ClipsDescendants = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = label
    
    totallabelsize = totallabelsize + 0.25
    
    return label
end

local label1 = makelabel()
local label2 = makelabel()
local label3 = makelabel()

label1.Text = "🌟 | Coins Remaining"
label2.Text = "💎 | Gems Earned"
label3.Text = "🕒 | Time Elapsed"

label1.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize + 0.05)
label2.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize + 0.05 + 0.25)
label3.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize + 0.05 + 0.5)
local CoinsLeft = 0
local TimeElapsed = 0
local timer = coroutine.create(function()
    while 1 do
        TimeElapsed = TimeElapsed + 1
        label3.Text = "🕒 | Time Elapsed: " .. TimeElapsed .. "s"

        wait(1)
    end
end)
coroutine.resume(timer)
local coinst = coroutine.create(function()
    while 1 do
        label1.Text = "🌟 | Coins Remaining: " .. CoinsLeft
        wait(1)
    end
end)
coroutine.resume(coinst)

local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"));
while not v1.Loaded do
    game:GetService("RunService").Heartbeat:Wait();
end;
AREATOCHECK = "Mystic Mine"
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
local Fire, Invoke = Network.Fire, Network.Invoke

local old
old = hookfunction(getupvalue(Fire, 1), function(...)
   return true
end)
if Settings["Performance"]["Disable Orb Rendering"] then
	game:GetService("Workspace")["__THINGS"].Orbs.ChildAdded:Connect(function(v)
		pcall(function()
			v.Orb.Enabled = false
		end)
	end)
end
if Settings["Performance"]["Disable Lootbags"] then
	game:GetService("Workspace")["__THINGS"].Lootbags.ChildAdded:Connect(function(v)
		pcall(function()
			v.Transparency = 1
			v.ParticleEmitter:Destroy()
		end)
	end)
end

if Settings["Auto Collect"]["Orbs"] then
	game.Workspace['__THINGS'].Orbs.ChildAdded:Connect(function(v)
		Fire("Claim Orbs", {v.Name})
	end)
end
if Settings["Auto Collect"]["Lootbags"] then
	game.Workspace['__THINGS'].Lootbags.ChildAdded:Connect(function(v)
		Fire("Collect Lootbag", v.Name, v.Position)
	end)
end

Lib = require(game:GetService("ReplicatedStorage").Library)

local StartGems = Lib.Save.Get().Diamonds
function add_suffix(inte)
    local gems = inte
    local gems_formatted

    if gems >= 1000000000000 then  -- if gems are greater than or equal to 1 trillion
        gems_formatted = string.format("%.1ft", gems / 1000000000000)  -- display gems in trillions with one decimal point
    elseif gems >= 1000000000 then  -- if gems are greater than or equal to 1 billion
        gems_formatted = string.format("%.1fb", gems / 1000000000)  -- display gems in billions with one decimal point
    elseif gems >= 1000000 then  -- if gems are greater than or equal to 1 million
        gems_formatted = string.format("%.1fm", gems / 1000000)  -- display gems in millions with one decimal point
    elseif gems >= 1000 then  -- if gems are greater than or equal to 1 thousand
        gems_formatted = string.format("%.1fk", gems / 1000)  -- display gems in thousands with one decimal point
    else  -- if gems are less than 1 thousand
        gems_formatted = tostring(gems)  -- display gems as is
    end

    return gems_formatted
end
local gemc = coroutine.create(function()
    while 1 do
        cg = Lib.Save.Get().Diamonds
        label2.Text = "💎 | Gems Earned: " .. add_suffix(cg - StartGems)

        wait(1)
    end
end)
coroutine.resume(gemc)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local InputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local ContentProvider = game:GetService("ContentProvider")
local banSuccess, banError = pcall(function() 
		local Blunder = require(game:GetService("ReplicatedStorage"):WaitForChild("X", 10):WaitForChild("Blunder", 10):WaitForChild("BlunderList", 10))
		if not Blunder or not Blunder.getAndClear then LocalPlayer:Kick("Error while bypassing the anti-cheat! (Didn't find blunder)") end
 
		local OldGet = Blunder.getAndClear
		setreadonly(Blunder, false)
		local function OutputData(Message)
		   print("-- PET SIM X BLUNDER --")
		   print(Message .. "\n")
		end
 
		Blunder.getAndClear = function(...)
		   local Packet = ...
			for i,v in next, Packet.list do
			   if v.message ~= "PING" then
				   OutputData(v.message)
				   table.remove(Packet.list, i)
			   end
		   end
		   return OldGet(Packet)
		end
 
		setreadonly(Blunder, true)
	end)
 
	if not banSuccess then
		LocalPlayer:Kick("Error while bypassing the anti-cheat! (".. banError ..")")
		return
	end
 
	local Library = require(game:GetService("ReplicatedStorage").Library)
	assert(Library, "Oopps! Library has not been loaded. Maybe try re-joining?") 
	while not Library.Loaded do task.wait() end
 
	Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	Humanoid = Character:WaitForChild("Humanoid")
	HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
 
 
	local bypassSuccess, bypassError = pcall(function()
		if not Library.Network then 
			LocalPlayer:Kick("Network not found, can't bypass!")
		end
 
		if not Library.Network.Invoke or not Library.Network.Fire then
			LocalPlayer:Kick("Network Invoke/Fire was not found! Failed to bypass!")
		end
 
		hookfunction(debug.getupvalue(Library.Network.Invoke, 1), function(...) return true end)
		-- Currently we don't need to hook Fire, since both Invoke/Fire have the same upvalue, this may change in future.
		-- hookfunction(debug.getupvalue(Library.Network.Fire, 1), function(...) return true end)
 
		local originalPlay = Library.Audio.Play
		Library.Audio.Play = function(...) 
			if checkcaller() then
				local audioId, parent, pitch, volume, maxDistance, group, looped, timePosition = unpack({ ... })
				if type(audioId) == "table" then
					audioId = audioId[Random.new():NextInteger(1, #audioId)]
				end
				if not parent then
					warn("Parent cannot be nil", debug.traceback())
					return nil
				end
				if audioId == 0 then return nil end
 
				if type(audioId) == "number" or not string.find(audioId, "rbxassetid://", 1, true) then
					audioId = "rbxassetid://" .. audioId
				end
				if pitch and type(pitch) == "table" then
					pitch = Random.new():NextNumber(unpack(pitch))
				end
				if volume and type(volume) == "table" then
					volume = Random.new():NextNumber(unpack(volume))
				end
				if group then
					local soundGroup = game.SoundService:FindFirstChild(group) or nil
				else
					soundGroup = nil
				end
				if timePosition == nil then
					timePosition = 0
				else
					timePosition = timePosition
				end
				local isGargabe = false
				if not pcall(function() local _ = parent.Parent end) then
					local newParent = parent
					pcall(function()
						newParent = CFrame.new(newParent)
					end)
					parent = Instance.new("Part")
					parent.Anchored = true
					parent.CanCollide = false
					parent.CFrame = newParent
					parent.Size = Vector3.new()
					parent.Transparency = 1
					parent.Parent = workspace:WaitForChild("__DEBRIS")
					isGargabe = true
				end
				local sound = Instance.new("Sound")
				sound.SoundId = audioId
				sound.Name = "sound-" .. audioId
				sound.Pitch = pitch and 1
				sound.Volume = volume and 0.5
				sound.SoundGroup = soundGroup
				sound.Looped = looped and false
				sound.MaxDistance = maxDistance and 100
				sound.TimePosition = timePosition
				sound.RollOffMode = Enum.RollOffMode.Linear
				sound.Parent = parent
				if not require(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("Client")).Settings.SoundsEnabled then
					sound:SetAttribute("CachedVolume", sound.Volume)
					sound.Volume = 0
				end
				sound:Play()
				getfenv(originalPlay).AddToGarbageCollection(sound, isGargabe)
				return sound
			end
 
			return originalPlay(...)
		end
 
	end)
 
	if not bypassSuccess then
		print(bypassError)
		LocalPlayer:Kick("Error while bypassing network, try again or wait for an update!")
		return
	end
 
function FrTeleportToWorld(world, area)
        local Library = require(game:GetService("ReplicatedStorage").Library)
		Library.WorldCmds.Load(world)
		wait(0.25)
		local areaTeleport = Library.WorldCmds.GetMap().Teleports:FindFirstChild(area)
		Library.Signal.Fire("Teleporting")
		task.wait(0.25)
		local Character = game.Players.LocalPlayer.Character
		local Humanoid = Character.Humanoid
		local HumanoidRootPart = Character.HumanoidRootPart
		Character:PivotTo(areaTeleport.CFrame + areaTeleport.CFrame.UpVector * (Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2))
		Library.Network.Fire("Performed Teleport", area)
		task.wait(0.25)
end
function FrTeleportToArea(world, area)
    local areaTeleport = Library.WorldCmds.GetMap().Teleports:FindFirstChild(area)
		local Character = game.Players.LocalPlayer.Character
		local Humanoid = Character.Humanoid
		local HumanoidRootPart = Character.HumanoidRootPart
		Character:PivotTo(areaTeleport.CFrame + areaTeleport.CFrame.UpVector * (Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2))
		Library.Network.Fire("Performed Teleport", area)
 
end

function GetOranges()
    local FruitLib = require(game.ReplicatedStorage.Library.Client.FruitCmds)

    local Fruit = FruitLib.Directory.Orange
    return math.floor(FruitLib.Get(game.Players.LocalPlayer, Fruit))
end

function get_coins_in_area(area)
    local allCoins = Invoke("Get Coins") -- this gets every coin in the world you are in
    local coinsInArea = {} -- Make a blank list that will store all the ids of the coins in the area
    
    for coinid,coindata in pairs(allCoins) do -- Loop through every coin in the world
        if coindata.a == area and not string.find(coindata.n, "Chest") then -- if the area the coin is in is in the area you specify then...
            table.insert(coinsInArea, coinid) -- add the coin id to the coinsinarea table
        end
    end
    return coinsInArea
end

function attack_coin(id, equip)
    local v86 = Invoke("Join Coin", id, equip)
    for v88, v89 in pairs(v86) do
        Fire("Farm Coin", id, v88);
    end
end

function wait_until_broken(id)
    while 1 do
        wait(0.01)
        for i,v in pairs(Invoke("Get Coins")) do
            found = false
            if i == id then
                if #v.petsFarming ~= 0 then
                    found = true
                end
            end
        end
        if not found then break end
    end
end

Invoke("Unequip All Pets")

if Settings["Pet Team"]["Mode"] == "Best" then Invoke("Equip Best Pets") end
if Settings["Pet Team"]["Mode"] == "Manual" then
	local Pets = Lib.Save.Get().Pets
	petstoe = {}
	for i,v in pairs(Pets) do
		if v.nk == Settings["Pet Team"]["Nickname"] then
			table.insert(petstoe, v.uid)
		end
	end
	for i,v in pairs(petstoe) do
		cert = coroutine.create(function()
		Invoke("Equip Pet", v)
		end)
		coroutine.resume(cert)
	end
end

wait(1)

if not isfile("fruitfarmT.txt") then writefile("fruitfarmT.txt", "false") end

if GetOranges() >= Settings["Fruit"]["Max Fruit"] then writefile("fruitfarmT.txt", "false") end


if Settings["Fruit"]["Farm Fruit If Low"] == true then
if GetOranges() <= Settings["Fruit"]["Min Fruit"] or readfile("fruitfarmT.txt") == "true" then
    writefile("fruitfarmT.txt", "true")
    if Settings["Fruit"]["Mode"] == "Pixel Vault" then
        FrTeleportToWorld("Pixel", "Pixel Vault")
        wait(3)
        while 1 do
            wait(1)
            local equipped = {}

            local lib = require(game.ReplicatedStorage.Library)

            p = lib.Save.Get().PetsEquipped

            for petid, petdata in pairs(p) do
            table.insert(equipped, petid)
            end

            local AllCoins = get_coins_in_area("Pixel Vault")

            for i,v in pairs(AllCoins) do
                attack_coin(v, equipped)
                wait(0.05)
                wait_until_broken(i)
            end
            if GetOranges() >= Settings["Fruit"]["Max Fruit"] then
                writefile("fruitfarmT.txt", "false")
                break
            end
        end
    end
    if Settings["Fruit"]["Mode"] == "Server Hop" then
        if not game:IsLoaded() then
    while not game:IsLoaded() do wait(1) end

    wait(5)
end

local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
local Fire, Invoke = Network.Fire, Network.Invoke

-- Hooking the _check function in the module to bypass the anticheat.

local old
old = hookfunction(getupvalue(Fire, 1), function(...)
   return true
end)

local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"));
while not v1.Loaded do
    game:GetService("RunService").Heartbeat:Wait();
end;
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local InputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local ContentProvider = game:GetService("ContentProvider")
local banSuccess, banError = pcall(function() 
		local Blunder = require(game:GetService("ReplicatedStorage"):WaitForChild("X", 10):WaitForChild("Blunder", 10):WaitForChild("BlunderList", 10))
		if not Blunder or not Blunder.getAndClear then LocalPlayer:Kick("Error while bypassing the anti-cheat! (Didn't find blunder)") end
		
		local OldGet = Blunder.getAndClear
		setreadonly(Blunder, false)
		local function OutputData(Message)
		   print("-- PET SIM X BLUNDER --")
		   print(Message .. "\n")
		end
		
		Blunder.getAndClear = function(...)
		   local Packet = ...
			for i,v in next, Packet.list do
			   if v.message ~= "PING" then
				   OutputData(v.message)
				   table.remove(Packet.list, i)
			   end
		   end
		   return OldGet(Packet)
		end
		
		setreadonly(Blunder, true)
	end)

	if not banSuccess then
		LocalPlayer:Kick("Error while bypassing the anti-cheat! (".. banError ..")")
		return
	end
	
	local Library = require(game:GetService("ReplicatedStorage").Library)
	assert(Library, "Oopps! Library has not been loaded. Maybe try re-joining?") 
	while not Library.Loaded do task.wait() end
	
	Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	Humanoid = Character:WaitForChild("Humanoid")
	HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	
	
	local bypassSuccess, bypassError = pcall(function()
		if not Library.Network then 
			LocalPlayer:Kick("Network not found, can't bypass!")
		end
		
		if not Library.Network.Invoke or not Library.Network.Fire then
			LocalPlayer:Kick("Network Invoke/Fire was not found! Failed to bypass!")
		end
		
		hookfunction(debug.getupvalue(Library.Network.Invoke, 1), function(...) return true end)
		-- Currently we don't need to hook Fire, since both Invoke/Fire have the same upvalue, this may change in future.
		-- hookfunction(debug.getupvalue(Library.Network.Fire, 1), function(...) return true end)
		
		local originalPlay = Library.Audio.Play
		Library.Audio.Play = function(...) 
			if checkcaller() then
				local audioId, parent, pitch, volume, maxDistance, group, looped, timePosition = unpack({ ... })
				if type(audioId) == "table" then
					audioId = audioId[Random.new():NextInteger(1, #audioId)]
				end
				if not parent then
					warn("Parent cannot be nil", debug.traceback())
					return nil
				end
				if audioId == 0 then return nil end
				
				if type(audioId) == "number" or not string.find(audioId, "rbxassetid://", 1, true) then
					audioId = "rbxassetid://" .. audioId
				end
				if pitch and type(pitch) == "table" then
					pitch = Random.new():NextNumber(unpack(pitch))
				end
				if volume and type(volume) == "table" then
					volume = Random.new():NextNumber(unpack(volume))
				end
				if group then
					local soundGroup = game.SoundService:FindFirstChild(group) or nil
				else
					soundGroup = nil
				end
				if timePosition == nil then
					timePosition = 0
				else
					timePosition = timePosition
				end
				local isGargabe = false
				if not pcall(function() local _ = parent.Parent end) then
					local newParent = parent
					pcall(function()
						newParent = CFrame.new(newParent)
					end)
					parent = Instance.new("Part")
					parent.Anchored = true
					parent.CanCollide = false
					parent.CFrame = newParent
					parent.Size = Vector3.new()
					parent.Transparency = 1
					parent.Parent = workspace:WaitForChild("__DEBRIS")
					isGargabe = true
				end
				local sound = Instance.new("Sound")
				sound.SoundId = audioId
				sound.Name = "sound-" .. audioId
				sound.Pitch = pitch and 1
				sound.Volume = volume and 0.5
				sound.SoundGroup = soundGroup
				sound.Looped = looped and false
				sound.MaxDistance = maxDistance and 100
				sound.TimePosition = timePosition
				sound.RollOffMode = Enum.RollOffMode.Linear
				sound.Parent = parent
				if not require(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("Client")).Settings.SoundsEnabled then
					sound:SetAttribute("CachedVolume", sound.Volume)
					sound.Volume = 0
				end
				sound:Play()
				getfenv(originalPlay).AddToGarbageCollection(sound, isGargabe)
				return sound
			end
			
			return originalPlay(...)
		end
	
	end)
	
	if not bypassSuccess then
		print(bypassError)
		LocalPlayer:Kick("Error while bypassing network, try again or wait for an update!")
		return
	end

function FrTeleportToWorld(world, area)
        local Library = require(game:GetService("ReplicatedStorage").Library)
		Library.WorldCmds.Load(world)
		wait(0.25)
		local areaTeleport = Library.WorldCmds.GetMap().Teleports:FindFirstChild(area)
		Library.Signal.Fire("Teleporting")
		task.wait(0.25)
		local Character = game.Players.LocalPlayer.Character
		local Humanoid = Character.Humanoid
		local HumanoidRootPart = Character.HumanoidRootPart
		Character:PivotTo(areaTeleport.CFrame + areaTeleport.CFrame.UpVector * (Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2))
		Library.Network.Fire("Performed Teleport", area)
		task.wait(0.25)
end
function FrTeleportToArea(world, area)
    local areaTeleport = Library.WorldCmds.GetMap().Teleports:FindFirstChild(area)
		local Character = game.Players.LocalPlayer.Character
		local Humanoid = Character.Humanoid
		local HumanoidRootPart = Character.HumanoidRootPart
		Character:PivotTo(areaTeleport.CFrame + areaTeleport.CFrame.UpVector * (Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2))
		Library.Network.Fire("Performed Teleport", area)
    
end
local TimeElapsed = 0
    local ThingsBroke = 0
    local STOP = false
    local MADE = false
    
    HttpService = game:GetService("HttpService")
    
    local timer = coroutine.create(function()
        while 1 do
            TimeElapsed = TimeElapsed + 1
            wait(1)
        end
    end)
    
    coroutine.resume(timer)
    SettingsBreakable = {
        WorldHop = true, -- If This Is True It Will Break Stuff In Every World Up To Cat World
        Area = "", -- If World Hop Is False And This Isnt Blank It Will Only Farm In This Area
        AutoCollectOrbs = true, -- If This Is True It Will Collect The Orbs Automatically
        Loop = false, -- If This Is True It Will Happen All Again And Again (Only Enable If Server Hop Is False)
        WaitTime = 20, -- If Something Isnt Broken Past This Time Then Move On To The Next Thing 1 = 0.1s
        ThingsToBreak = {
        	"Apple",
        	"Orange",
        	"Pineapple",
        	"Pear",
        	"Rainbow Fruit",
        	"Banana"
        } -- List Of Things To Break, If The Name Of The Breakable Contains Any Of These It Will Break It
    }
    WebhookLayout = { -- {amount} | shows the amount of breakables broken {time} | Shows the time it took finish (seconds)
        Title = "Breakables Farmed", -- The Title Of The Webhook
        Description = "You Broke ``{amount}`` **Things** In ``{time}`` **Seconds**!", -- Description Of The Webhook
        Color = tonumber(0x6967d5) -- The Color Of The Webhook
    } -- Will be sent after each server hop if the Webhook thing in SettingsBreakable has a link
    
    function PostWebhook(amount, seconds)
        local StatsPath = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right
        function GetCoinsAmount(name)
            return StatsPath[name].Amount.Text
        end
        local thingsfarming = ""
        local coins = ":coin: **Coins: ** ``" .. GetCoinsAmount("Coins") .. "``\n:coin: **Fantasy Coins: ** ``" .. GetCoinsAmount("Fantasy Coins") .. "``\n:coin: **Tech Coins: ** ``" .. GetCoinsAmount("Tech Coins") .. "``\n:coin: **Rainbow Coins: ** ``" .. GetCoinsAmount("Rainbow Coins") .. "``\n:coin: **Cartoon Coins: ** ``" .. GetCoinsAmount("Cartoon Coins") .. "``\n:gem: **Diamonds: ** ``" .. GetCoinsAmount("Diamonds") .. "``"
        local title = WebhookLayout.Title
        title = string.gsub(title, "{amount}", tostring(amount))
        title = string.gsub(title, "{time}", tostring(seconds))
        local desc = WebhookLayout.Description
        desc = string.gsub(desc, "{amount}", tostring(amount))
        desc = string.gsub(desc, "{time}", tostring(seconds))
        for i, v in pairs(SettingsBreakable.ThingsToBreak) do
            thingsfarming = thingsfarming .. ":rock: ``" .. v .. "``\n"
        end
        syn.request({
            Url = SettingsBreakable.Webhook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode{
                ["content"] = "Username: " .. game.Players.LocalPlayer.Name,
                ["embeds"] = {{
                    ["title"] = title,
                    ["description"] = desc,
                    ["type"] = "rich",
                    ["color"] = WebhookLayout.Color,
                    ["thumbnail"] = {
                        ["url"] = "https://www.biggames.io/_next/static/media/bigGames.66f7ea84.svg",
                        ["height"] = 350,
                        ["width"] = 270
                    },
                    ["author"] = {
                        ["name"] = "Breakable Farmer",
                        ["icon_url"] = "https://tr.rbxcdn.com/d8055fdc4f5c0cb1f7d40f5e10e93eed/150/150/Image/Png"
                    },
                    ["fields"] = {{
                        ["name"] = "Things Farming",
                        ["value"] = thingsfarming,
                        ["inline"] = true
                    },{
                        ["name"] = "Coins",
                        ["value"] = coins,
                        ["inline"] = true
                    }}
                }}
            }
        })
    end
    local WebhookLayout
    local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"));
    while not v1.Loaded do
    	game:GetService("RunService").Heartbeat:Wait();
    end;
    
    function WaitUntilAllThingsHaveLoaded()
        while 1 do
            if #game.Workspace["__THINGS"].Coins:GetChildren() <= 100 then
                break
            end
            wait(0.1)
        end
        if true then
            return
        end
        while 1 do
            oldcount = #game.Workspace["__THINGS"].Coins:GetChildren()
            wait(1)
            newcount = #game.Workspace["__THINGS"].Coins:GetChildren()
            if newcount ~= oldcount then
                break
            end
        end
        while 1 do
            oldcount = #game.Workspace["__THINGS"].Coins:GetChildren()
            wait(1)
            newcount = #game.Workspace["__THINGS"].Coins:GetChildren()
            if newcount == oldcount then
                break
            end
        end
    end
    
    function ShouldBreak(coin)
        for i2, v2 in pairs(SettingsBreakable.ThingsToBreak) do
            if string.find(coin, v2) then
                return true
            end
        end
        return false
    end
    
    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
    local Fire, Invoke = Network.Fire, Network.Invoke
    

    
    while 1 do
        local Ccount = 0
        for i, v in pairs(Invoke("Get Coins")) do
            Ccount = Ccount + 1
        end
        if Ccount >= 10 then break end
        wait(3)
    end
    
    function ForeverPickupOrbs()
      while true do
        orbs = {}
        for i, v in pairs (game.Workspace['__THINGS'].Orbs:GetChildren()) do
            table.insert(orbs, v.Name)
        end
        Fire("Claim Orbs", orbs)
        wait(0.1)
      end
    end
    foreverpickup = coroutine.create(ForeverPickupOrbs)
    if SettingsBreakable.AutoCollectOrbs then
        coroutine.resume(foreverpickup)
    end
    
    
    
    game.Players.LocalPlayer.PlayerGui.Inventory.Enabled = true
    wait(1)
    game.Players.LocalPlayer.PlayerGui.Inventory.Enabled = false
    
    if not SettingsBreakable.WorldHop then
        while 1 do
            wait(0.01)
            if SettingsBreakable.Area == "" then
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(Invoke("Get Coins")) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    Fire("Performed Teleport")
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            else
            pcall(function()
                anycoins = true
                if anycoins then
                    FrTeleportToArea("", SettingsBreakable.Area)
                    Fire("Performed Teleport")
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == SettingsBreakable.Area then
                                if ShouldBreak(v2.n) then
                                    FrTeleportToArea(SettingsBreakable.Area, SettingsBreakable.Area)
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end)
            end
            if not SettingsBreakable.Loop then
                break
            end
            if STOP then break end
            if SettingsBreakable.Loop and not MADE then
                MADE = true
                local screenCenter = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
                
                -- Create the button
                local myButton = Instance.new("TextButton")
                myButton.Parent = game.Players.LocalPlayer.PlayerGui.Main -- Assumes the script is a child of a ScreenGui
                myButton.Position = UDim2.new(0.5, -50, 0.5, -50) -- Set the button's position to the center of the screen
                myButton.Size = UDim2.new(0, 100, 0, 100)
                myButton.TextWrapped = true
                myButton.Text = "Stop Farm"
                myButton.Font = Enum.Font.SourceSansBold
                myButton.FontSize = Enum.FontSize.Size48 -- Set a big cartoony font
                myButton.TextColor3 = Color3.new(1, 1, 1) -- Set the button's text color to white
                myButton.BackgroundTransparency = 0 -- Make the button fill visible
                myButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Set the button's background color to red
                myButton.BorderColor3 = Color3.new(0, 0, 0) -- Set the button's border color to black
                myButton.BorderSizePixel = 10 -- Set the button's border size
                
                -- Add an event listener to the button
                myButton.MouseButton1Click:Connect(function()
                    STOP = true
                    myButton:Destroy()
                end)
            end
        end
    else
        while 1 do
            wait(0.01)
            FrTeleportToWorld("Spawn", "Shop")
            wait(0.5)
            AllCs = Invoke("Get Coins")
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            FrTeleportToWorld("Fantasy", "Fantasy Shop")
            wait(0.5)
            FarmWorld = "Fantasy"
            AllCs = Invoke("Get Coins")
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            FrTeleportToWorld("Tech", "Tech Shop")
            wait(0.5)
            FarmWorld = "Tech"
            AllCs = Invoke("Get Coins")
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            FrTeleportToWorld("Axolotl Ocean", "Axolotl Cave")
            FarmWorld = "Axolotl Ocean"
            AllCs = Invoke("Get Coins")
            wait(0.5)
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            FrTeleportToWorld("Pixel", "Pixel Forest")
            FarmWorld = "Pixel"
            AllCs = Invoke("Get Coins")
            wait(0.5)
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            FrTeleportToWorld("Cat", "Cat Paradise")
            FarmWorld = "Cat"
            AllCs = Invoke("Get Coins")
            wait(0.5)
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            FrTeleportToWorld("Doodle", "Doodle Shop")
            FarmWorld = "Doodle"
            AllCs = Invoke("Get Coins")
            wait(0.5)
            pcall(function()
            for i, v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
                local anycoins = false
                for i2, v2 in pairs(AllCs) do
                    if (v2.a) == v.Name and ShouldBreak(v2.n) then
                        anycoins = true
                    end
                end
                if anycoins then
                    FrTeleportToArea("", v.Name)
                    wait(0.1)
                    for i2, v2 in pairs(Invoke("Get Coins")) do
                        pcall(function()
                            if (v2.a) == v.Name then
                                if ShouldBreak(v2.n) then
                                    local equippedpets = {}
                                    for i3, v3 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal:GetChildren()) do
                                        if v3:IsA("TextButton") then
                                            if v3.Equipped.Visible == true then
                                                table.insert(equippedpets, v3.Name)
                                            end
                                        end
                                    end
                                    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
                                    local Fire, Invoke = Network.Fire, Network.Invoke
                                    n = v2.Name
                                    local v86 = Invoke("Join Coin", i2, equippedpets)
                                    for v88, v89 in pairs(v86) do
                                        Fire("Farm Coin", i2, v88);
                                    end
                                    ThingsBroke = ThingsBroke + 1
                                    count = 0
                                    while 1 do
                                        wait(0.01)
                                        local f = false
                                        for i3, v3 in pairs(Invoke("Get Coins")) do
                                            if i2 == i3 then
                                                f = true
                                            end
                                        end
                                        if count >= SettingsBreakable.WaitTime then break end
                                        if not f then break end
                                        count = count + 1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            end)
            if not SettingsBreakable.Loop then break end
            if STOP then break end
            if SettingsBreakable.Loop and not MADE then
                MADE = true
                local screenCenter = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
                
                -- Create the button
                local myButton = Instance.new("TextButton")
                myButton.Parent = game.Players.LocalPlayer.PlayerGui.Main -- Assumes the script is a child of a ScreenGui
                myButton.Position = UDim2.new(0.5, -50, 0.5, -50) -- Set the button's position to the center of the screen
                myButton.Size = UDim2.new(0, 100, 0, 100)
                myButton.TextWrapped = true
                myButton.Text = "Stop Farm"
                myButton.Font = Enum.Font.SourceSansBold
                myButton.FontSize = Enum.FontSize.Size48 -- Set a big cartoony font
                myButton.TextColor3 = Color3.new(1, 1, 1) -- Set the button's text color to white
                myButton.BackgroundTransparency = 0 -- Make the button fill visible
                myButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Set the button's background color to red
                myButton.BorderColor3 = Color3.new(0, 0, 0) -- Set the button's border color to black
                myButton.BorderSizePixel = 10 -- Set the button's border size
                
                -- Add an event listener to the button
                myButton.MouseButton1Click:Connect(function()
                    STOP = true
                    myButton:Destroy()
                end)
            end
        end
    	    if GetOranges() >= Settings["Fruit"]["Max Fruit"] then
                writefile("fruitfarmT.txt", "false")
            else
            function sHopper()
    local endpoint = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/6284583030/servers/Public?sortOrder=Asc&limit=100'))
    bestserver = {
        p = 0
    }
    function shuffleTable(tbl)
        local size = #tbl
        for i = size, 1, -1 do
            local rand = math.random(size)
            tbl[i], tbl[rand] = tbl[rand], tbl[i]
        end
        return tbl
    end
    randomdata = shuffleTable(endpoint.data)
    for i, v in pairs(randomdata) do
        if v.playing > bestserver['p'] and v.playing <= 2 then
            bestserver['id'] = v.id
            bestserver['p'] = v.playing
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(6284583030, bestserver.id, game.Players.LocalPlayer)
end
while 1 do
    oldid = game.JobId
    sHopper()
    task.wait(1)
    if oldid ~= game.JobId then
        break
    end
end
            end
    end
    
end
end
end

if Settings["Auto Mailbox"]["Enabled"] then
	if Lib.Save.Get().Diamonds >= Settings["Auto Mailbox"]["Min Dias"] then
		FrTeleportToWorld("Spawn", "Shop")
		wait(3)
		user = Settings["Auto Mailbox"]["Recipient"]
	    msg = "Sent To You Cause U Cool"
	    gems = Lib.Save.Get().Diamonds - 100000
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(254.149002, 98.2168579, 349.55304, 0.965907216, -6.73597569e-08, -0.258888513, 6.48122409e-08, 1, -1.83752729e-08, 0.258888513, 9.69664127e-10, 0.965907216)
        wait(1)
        Invoke("Send Mail", {
	        ["Recipient"] = user,
	        ["Diamonds"] = gems,
	        ["Pets"] = {},
	        ["Message"] = msg
    	})
	end
end
boostco = coroutine.create(function()
    while 1 do
        wait(2)
	  if Settings["Boosts"]["Triple Damage"] then
        boostName = "Triple Damage"
        local Library = require(game.ReplicatedStorage.Framework.Library)
        local save = Library.Save.Get()
        found = false
        for i, v in pairs(save.Boosts) do
            if i == boostName then
                found = true
            end
        end
        if not found then
            Fire("Activate Boost", boostName)
        end
	  end
	  if Settings["Boosts"]["Server Damage"] then
            boostName = "Triple Damage"
            local Library = require(game.ReplicatedStorage.Library)
            Library.Load()
            found = false
            for i, v in pairs(Library.ServerBoosts.GetActiveBoosts()) do
                if i == boostName then
                    found = true
                end
            end
            if not found then
                Fire("Activate Server Boost", boostName)
            end
        end
    end
end)
coroutine.resume(boostco)
function GetMulti(B)
		if not B then return 0 end
		local totalMultiplier = 0	
		if B.l then
			for _, v in pairs(B.l) do
				pcall(function() 
					if v.m and tonumber(v.m) then
						totalMultiplier = totalMultiplier + v.m
					end
				end)
			end
			
		end
		return totalMultiplier
	end
local GemsEarned = 0
local TotalGemsEarned = 0
local StartingGems = Library.Save.Get().Diamonds
HttpService = game:GetService("HttpService")
function WH()
	request({
		Url = Settings["Webhooks"]["Server Hop Webhook"],
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode{
            ["content"] = "",
            ["embeds"] = {
			    {
			      ["title"] = "Server Hop Stat Update (v3)",
			      ["description"] = "Successfully Broke Everything In Server. Hopping To New Server!",
			      ["color"] = tonumber(0x0f0063),
			      ["fields"] = {
			        {
			          ["name"] = "Stats",
			          ["value"] = ":clock1: **Time Taken:** ``"..TimeElapsed.."s``\n:gem: **Gems Earned:** ``"..add_suffix(GemsEarned).."``\n:gem: **Total Gems Earned:** ``" .. add_suffix(TotalGemsEarned) .. "``\n:map: **Farming:** ``"..AREATOCHECK.."``"
			        }
			      },
			      ["author"] = {
			        ["name"] = "Mystic Farmer - Stats"
			      }
			    }
			  }
			  }
	})
end

wait(1)

FrTeleportToWorld("Diamond Mine", "Mystic Mine")

if game.Workspace:FindFirstChild("plat") then game.Workspace.plat:Destroy() end
local p = Instance.new("Part") 
p.Anchored = true
p.Name = "plat"
p.Position = Vector3.new(9043.19140625, -38.66098690032959, 2424.636474609375)
p.Size = Vector3.new(100, 1, 100)
p.Parent = game.Workspace
local gui = Instance.new("SurfaceGui")
gui.Parent = p
gui.Face = Enum.NormalId.Top
local textLabel = Instance.new("TextLabel")
textLabel.Text = "Gem Farmer Made By henrymistert#3888 (.gg/henrymistert)"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel.TextColor3 = Color3.new(0, 0, 0)
textLabel.FontSize = Enum.FontSize.Size14
textLabel.Parent = gui
textLabel.TextScaled = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9043.19141, -34.3321552, 2424.63647, -0.938255966, 7.68024719e-08, 0.345941782, 8.24376656e-08, 1, 1.57588176e-09, -0.345941782, 2.99972136e-08, -0.938255966)
AllC = Invoke("Get Coins")
Fire("Performed Teleport")
AllNeededCoins = {}
for i, v in pairs(AllC) do
	if v.a == "Mystic Mine" then
		M = GetMulti(v.b)
		for i2,v2 in pairs(Settings["Multipliers"]) do
			if string.find(v.n, i2) then
				if M >= v2 then table.insert(AllNeededCoins, i) end
			end
		end
	end
end
local equipped = {}

            local lib = require(game.ReplicatedStorage.Library)

            p = lib.Save.Get().PetsEquipped

            for petid, petdata in pairs(p) do
            table.insert(equipped, petid)
            end
CoinsLeft = #AllNeededCoins
for i,v in pairs(AllNeededCoins) do
	attack_coin(v, equipped)
	wait(0.05)
	wait_until_broken(v)
    CoinsLeft = CoinsLeft - 1
end
wait(1)
local EndingGems = Library.Save.Get().Diamonds
GemsEarned = EndingGems - StartingGems
if not isfile("gemtotal.txt") then writefile("gemtotal.txt", "0") end
if not isfile("timetotal.txt") then
    writefile("timetotal.txt", "0") end
if not isfile("timeframe.txt") then
    writefile("timeframe.txt", "0")
end
TotalGemsEarned = GemsEarned + tonumber(readfile("gemtotal.txt"))
writefile("gemtotal.txt", tostring(TotalGemsEarned))
tt = tonumber(readfile("timetotal.txt"))
tt = tt + TimeElapsed
writefile("timeframe.txt", tostring(GemsEarned + tonumber(readfile("timeframe.txt"))))
writefile("timetotal.txt", tostring(tt))
if tt >= Settings["Webhooks"]["Timeframe"] then
    writefile("timetotal.txt", "0")
    pcall(function()
    request({
		Url = Settings["Webhooks"]["Time Frame Webhook"],
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode{
            ["content"] = "",
            ["embeds"] = {
			    {
			      ["title"] = "Time Frame Stat Update (" .. Settings["Webhooks"]["Timeframe"] .. "s)",
			      ["description"] = "Gem update",
			      ["color"] = tonumber(0x0f0063),
			      ["fields"] = {
			        {
			          ["name"] = "Stats",
			          ["value"] = ":gem: **Earnings:** ``".. add_suffix(tonumber(readfile("timeframe.txt"))) .."``"
			        }
			      },
			      ["author"] = {
			        ["name"] = "Mystic Farmer - Stats"
			      }
			    }
			  }
			  }
	})
	end)
    writefile("timeframe.txt", "0")
end
pcall(WH)
wait(1)

function sHopper()
    local endpoint = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/6284583030/servers/Public?sortOrder=Asc&limit=100'))
    bestserver = {
        p = 0
    }
    function shuffleTable(tbl)
        local size = #tbl
        for i = size, 1, -1 do
            local rand = math.random(size)
            tbl[i], tbl[rand] = tbl[rand], tbl[i]
        end
        return tbl
    end
    randomdata = shuffleTable(endpoint.data)
    for i, v in pairs(randomdata) do
        if v.playing > bestserver['p'] and v.playing <= 2 then
            bestserver['id'] = v.id
            bestserver['p'] = v.playing
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(6284583030, bestserver.id, game.Players.LocalPlayer)
end
while 1 do
    oldid = game.JobId
    sHopper()
    task.wait(1)
    if oldid ~= game.JobId then
        break
    end
end
