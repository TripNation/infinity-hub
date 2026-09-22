-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"

-- Supported Games Table
-- Maps PlaceId OR GameId (UniverseId) to the script path
local supportedGames = {
    -- Ride A Pet (Place ID and Universe ID)
    [124216119978534] = "games/ride_a_pet.lua",
    [10035204815] = "games/ride_a_pet.lua",
    ["124216119978534"] = "games/ride_a_pet.lua",
    ["10035204815"] = "games/ride_a_pet.lua",
}

local placeId = game.PlaceId
local gameId = game.GameId

-- Check both PlaceId and Universe/GameId as number and string
local gameScript = supportedGames[placeId] 
    or supportedGames[tostring(placeId)] 
    or supportedGames[gameId] 
    or supportedGames[tostring(gameId)]

-- Timestamp to bypass GitHub CDN cache
local cacheBuster = "?t=" .. tostring(math.floor(tick()))

if gameScript then
    -- =========================================================
    -- SUPPORTED GAME: Strictly only launch the game script
    -- =========================================================
    print(string.format("[Infinity Hub] Supported game detected! PlaceId: %s | UniverseId: %s", tostring(placeId), tostring(gameId)))
    
    local url = string.find(gameScript, "^https?://") and gameScript or (baseUrl .. gameScript)
    url = url .. cacheBuster

    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    
    if not success then
        warn(string.format("[Infinity Hub] Failed to run %s: %s", tostring(gameScript), tostring(err)))
    end
else
    -- =========================================================
    -- UNSUPPORTED GAME: Open the default Infinity Hub
    -- =========================================================
    print(string.format("[Infinity Hub] Unsupported game. PlaceId: %s | UniverseId: %s. Opening Hub...", tostring(placeId), tostring(gameId)))
    loadstring(game:HttpGet(baseUrl .. "main.lua" .. cacheBuster))()
end
