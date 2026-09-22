-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"

-- Mapping of PlaceId or GameId to the script path or raw URL
-- When you want to support a game, put its ID here!
local supportedGames = {
    -- [PlaceId or GameId] = "games/your_script.lua",
    -- Example:
    -- [155615604] = "games/prison_life.lua",
}

local placeId = game.PlaceId
local gameId = game.GameId

-- Check if the current game is in the supported list
local gameScript = supportedGames[placeId] or supportedGames[gameId]

if gameScript then
    -- =========================================================
    -- SUPPORTED GAME: Only load the game script, NEVER the hub
    -- =========================================================
    print(string.format("[Infinity Hub] Supported game detected (ID: %s)! Launching game script...", tostring(placeId)))
    
    local url = string.find(gameScript, "^https?://") and gameScript or (baseUrl .. gameScript)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    
    if not success then
        warn(string.format("[Infinity Hub] Error running script for game %s: %s", tostring(placeId), tostring(err)))
    end
else
    -- =========================================================
    -- UNSUPPORTED GAME: Fall back and open the default Hub
    -- =========================================================
    print(string.format("[Infinity Hub] Game ID %s is not in supported list. Opening default Hub...", tostring(placeId)))
    loadstring(game:HttpGet(baseUrl .. "main.lua"))()
end
