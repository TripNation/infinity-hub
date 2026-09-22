-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"
local cacheBuster = "?t=" .. tostring(math.floor(tick()))

-- Fallback games if fetching config fails
local fallbackGames = {
    [124216119978534] = "games/ride_a_pet.lua",
    [10035204815] = "games/ride_a_pet.lua",
}

-- Fetch central games list from games_config.lua
local supportedGames = {}
local configSuccess, configData = pcall(function()
    return loadstring(game:HttpGet(baseUrl .. "games_config.lua" .. cacheBuster))()
end)

if configSuccess and type(configData) == "table" then
    for _, g in ipairs(configData) do
        if g.PlaceId then
            supportedGames[g.PlaceId] = g.Script
            supportedGames[tostring(g.PlaceId)] = g.Script
        end
        if g.UniverseId then
            supportedGames[g.UniverseId] = g.Script
            supportedGames[tostring(g.UniverseId)] = g.Script
        end
    end
else
    supportedGames = fallbackGames
end

local placeId = game.PlaceId
local gameId = game.GameId

-- Check both PlaceId and Universe/GameId
local gameScript = supportedGames[placeId] 
    or supportedGames[tostring(placeId)] 
    or supportedGames[gameId] 
    or supportedGames[tostring(gameId)]

if gameScript then
    -- =========================================================
    -- SUPPORTED GAME: Strictly only launch the game script
    -- =========================================================
    print(string.format("[Infinity Hub] Supported game detected! PlaceId: %s | UniverseId: %s. Launching %s...", tostring(placeId), tostring(gameId), tostring(gameScript)))
    
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
