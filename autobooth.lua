local function decodeItemData(itemJson)
    local _G.itemData = HttpService:JSONDecode(itemJson)
    return _G.itemData
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

local _G.itemName
local _G.diamondCost

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
                        listingInfo.Item = decodeitemData(listingInfo.Item)
                    end

                    if type(listingInfo.Item) == "table" then
                        local _G.itemData = listingInfo.Item._data
                        _G.itemName = _G.itemData.id -- Assign the item name here
                        local availableCount = _G.itemData._am
                        local uid = listingInfo.Item._uid
                        
                        if _G.itemName == "Insta Plant Capsule" or _G.itemName == "Diamond Seed" then
                            local _G.diamondCost = listingInfo.DiamondCost
                            if (_G.itemName == "Insta Plant Capsule" and _G.diamondCost < 10001) or (_G.itemName == "Diamond" and _G.diamondCost < 20001) then
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
