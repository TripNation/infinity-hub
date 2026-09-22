-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"

-- Convert to strings immediately to avoid large-number float precision bugs
local currentPlaceId = tostring(game.PlaceId)
local currentGameId  = tostring(game.GameId)

print("[Infinity Hub] PlaceId=" .. currentPlaceId .. " | UniverseId=" .. currentGameId)

-- =========================================================
-- Hardcoded fallback table (used if config fetch fails)
-- =========================================================
local fallbackGames = {
    ["124216119978534"] = "games/ride_a_pet.lua",
    ["10035204815"]     = "games/ride_a_pet.lua",
    ["131623223084840"] = "games/escape_tsunami.lua",
    ["9363735110"]      = "games/escape_tsunami.lua",
}

-- =========================================================
-- Try to fetch the live games_config.lua from GitHub
-- =========================================================
local supportedGames = {}

local ok, result = pcall(function()
    local code = game:HttpGet(baseUrl .. "games_config.lua")
    local fn = loadstring(code)
    return fn()
end)

if ok and type(result) == "table" then
    for _, g in ipairs(result) do
        if g.PlaceId then
            supportedGames[tostring(g.PlaceId)] = g.Script
        end
        if g.UniverseId then
            supportedGames[tostring(g.UniverseId)] = g.Script
        end
    end
    print("[Infinity Hub] Config loaded — " .. #result .. " game(s) registered.")
else
    warn("[Infinity Hub] Config fetch failed. Reason: " .. tostring(result))
    warn("[Infinity Hub] Using hardcoded fallback table instead.")
    supportedGames = fallbackGames
end

-- Debug: show every registered game key
for k, v in pairs(supportedGames) do
    print("[Infinity Hub] Registered: " .. k .. " -> " .. v)
end

-- =========================================================
-- Route to the correct script
-- =========================================================
local gameScript = supportedGames[currentPlaceId] or supportedGames[currentGameId]

if gameScript then
    print("[Infinity Hub] MATCH FOUND! Injecting: " .. gameScript)
    local loadOk, loadErr = pcall(function()
        loadstring(game:HttpGet(baseUrl .. gameScript))()
    end)
    if not loadOk then
        warn("[Infinity Hub] Script error: " .. tostring(loadErr))
        loadstring(game:HttpGet(baseUrl .. "main.lua"))()
    end
else
    print("[Infinity Hub] No match for this game. Opening default hub.")
    loadstring(game:HttpGet(baseUrl .. "main.lua"))()
end
