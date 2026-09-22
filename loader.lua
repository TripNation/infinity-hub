-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"

-- Mapping of PlaceId or GameId to the script path or raw URL
-- When you want to support a new game, just add its PlaceId or GameId here!
local supportedGames = {
    -- [PlaceId or GameId] = "games/game_script.lua",
    -- Example:
    -- [8737899170] = "games/pet_sim_99.lua",
    -- [2753915549] = "games/blox_fruits.lua",
}

local placeId = game.PlaceId
local gameId = game.GameId

-- Check if the current game is supported
local gameScript = supportedGames[placeId] or supportedGames[gameId]

if gameScript then
    print(string.format("[Infinity Hub] Supported game detected (ID: %s)! Loading game script...", tostring(placeId)))
    
    local url = string.find(gameScript, "^https?://") and gameScript or (baseUrl .. gameScript)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    
    if not success then
        warn("[Infinity Hub] Failed to load game script: " .. tostring(err))
        warn("[Infinity Hub] Falling back to default Hub...")
        loadstring(game:HttpGet(baseUrl .. "main.lua"))()
    end
else
    print(string.format("[Infinity Hub] Game ID %s is not specifically supported. Loading default hub...", tostring(placeId)))
    loadstring(game:HttpGet(baseUrl .. "main.lua"))()
end
