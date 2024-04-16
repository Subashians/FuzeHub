local function decodeItemData(itemJson)
    local itemData = HttpService:JSONDecode(itemJson)
    return itemData
end

local function triggerPurchase(listingId, availableCount, userId)
    if availableCount == nil then
        availableCount = 1
    end
    local args = {
        [1] = userId,
        [2] = {
            [listingId] = availableCount
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Booths_RequestPurchase"):InvokeServer(unpack(args))
end

local function processListings(userId)
    local result = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["Trading Plaza"]["Booths Frontend"]).getByOwnerId(userId)

    if result == nil then
        print("getByOwnerId returned nil.")
    else
        if type(result) == "table" and result.Listings then
            local listingsTable = result.Listings
            
            for listingId, listingInfo in pairs(listingsTable) do
                if type(listingInfo) == "table" then
                    if listingInfo.Item and type(listingInfo.Item) == "string" then
                        listingInfo.Item = decodeItemData(listingInfo.Item)
                    end

                    if type(listingInfo.Item) == "table" then
                        local itemData = listingInfo.Item._data
                        local itemName = itemData.id -- Assign the item name here
                        local availableCount = itemData._am
                        local uid = listingInfo.Item._uid
                        
                        if itemName == "Insta Plant Capsule" or itemName == "Diamond" then
                            local diamondCost = listingInfo.DiamondCost
                            print(itemName)
                            if (itemName == "Insta Plant Capsule" and diamondCost < 10001) or (itemName == "Diamond" and diamondCost < 20001) then
                                print(itemName)
                                _G.itemName = itemName
                                _G.diamondCost = diamondCost
                                _G.Amount = availableCount
                                _G.userId = userId
                                triggerPurchase(listingId, availableCount, userId)
                                return true -- Break from the loop if conditions are met
                            end
                        end
                    end
                end
            end
        end
    end
    return false -- Conditions not met or processing failed
end

-- Continuously check listings for every player until conditions are met
while true do
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        local success = processListings(player.UserId)
        if success then
            print("Conditions met. Purchase triggered.")
            break -- Break from the loop if conditions are met for any player
        end
    end 
    wait(0.05) -- Delay between iterations to avoid excessive server load
end

