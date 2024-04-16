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

local itemName -- Declare itemName outside the function
local diamondCost
local avaibleCount
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
                        itemName = itemData.id -- Assign the item name here
                        local availableCount = itemData._am
                        local uid = listingInfo.Item._uid
                        
                        if itemName == "Insta Plant Capsule" or itemName == "Diamond Seed" then
                            local diamondCost = listingInfo.DiamondCost
                            if (itemName == "Insta Plant Capsule" and diamondCost < 10001) or (itemName == "Diamond" and diamondCost < 20001) then
                                print(itemName)
                                _G.itemName = itemName
                                _G.diamondCost = diamondCost
                                _G.Amount = availableCount
                                _G.userId = userId
                                triggerPurchase(listingId, availableCount, userId)
                            end
                        end
                    end
                end
            end
        end
    end
end

processListings(3049767178)
print(_G.itemName)

