-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"

-- Always use string comparisons for PlaceIds to avoid large-number precision issues
local currentPlaceId = tostring(game.PlaceId)
local currentGameId  = tostring(game.GameId)

-- Hardcoded fallback in case config fetch fails
local fallbackGames = {
    ["124216119978534"] = "games/ride_a_pet.lua",
    ["10035204815"]     = "games/ride_a_pet.lua",
    ["131623223084840"] = "games/escape_tsunami.lua",
    ["9363735110"]      = "games/escape_tsunami.lua",
}

-- =========================================================
-- Fetch games_config.lua (no cache buster - CDN caches by
-- path only; query strings don't help with Fastly)
-- =========================================================
local supportedGames = {}
local configOk, configData = pcall(function()
    return loadstring(game:HttpGet(baseUrl .. "games_config.lua"))()\
end)

if configOk and type(configData) == "table" then
    for _, g in ipairs(configData) do
        if g.PlaceId then
            supportedGames[tostring(g.PlaceId)] = g.Script
        end
        if g.UniverseId then
            supportedGames[tostring(g.UniverseId)] = g.Script
        end
    end
    print("[Infinity Hub] Loaded " .. tostring(#configData) .. " game(s) from games_config.lua")
else
    warn("[Infinity Hub] Could not fetch games_config.lua, using fallback list.")
    supportedGames = fallbackGames
end

-- Debug: print what game we detected
print(string.format("[Infinity Hub] Detected PlaceId=%s | UniverseId=%s", currentPlaceId, currentGameId))

-- =========================================================
-- Look up the current game
-- =========================================================
local gameScript = supportedGames[currentPlaceId] or supportedGames[currentGameId]

if gameScript then
    -- -------------------------------------------------------
    -- SUPPORTED GAME → run the game-specific script
    -- -------------------------------------------------------
    print("[Infinity Hub] Supported game! Injecting: " .. gameScript)
    local url = baseUrl .. gameScript
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not ok then
        warn("[Infinity Hub] Failed to run " .. gameScript .. ": " .. tostring(err))
        -- Fallback to hub so user isn't left with nothing
        loadstring(game:HttpGet(baseUrl .. "main.lua"))()
    end
else
    -- -------------------------------------------------------
    -- UNSUPPORTED GAME → open default Infinity Hub
    -- -------------------------------------------------------
    print("[Infinity Hub] Unsupported game. Opening default hub...")
    loadstring(game:HttpGet(baseUrl .. "main.lua"))()
end
