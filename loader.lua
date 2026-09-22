-- =========================================================
-- Infinity Hub - Universal Game Loader / Dispatcher
-- =========================================================

local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"

-- Ensure PlaceId and GameId are loaded
local waitStart = tick()
while (not game.PlaceId or game.PlaceId == 0) and (tick() - waitStart < 3) do
    task.wait(0.1)
end

local currentPlaceId = tostring(game.PlaceId or 0)
local currentGameId  = tostring(game.GameId or 0)

print(string.format("[Infinity Hub Loader] Detected PlaceId: %s | UniverseId: %s", currentPlaceId, currentGameId))

-- =========================================================
-- Launch Live Announcements System in background
-- =========================================================
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet(baseUrl .. "announcements.lua"))()
    end)
end)

-- =========================================================
-- Hardcoded Fallback Registry
-- Guarantees instant matching even if GitHub CDN is stale
-- =========================================================
local fallbackGames = {
    ["124216119978534"] = "games/ride_a_pet.lua",
    ["10035204815"]     = "games/ride_a_pet.lua",
    ["131623223084840"] = "games/escape_tsunami.lua",
    ["9363735110"]      = "games/escape_tsunami.lua",
}

-- =========================================================
-- Fetch latest games_config.lua from GitHub
-- =========================================================
local supportedGames = {}

-- Pre-populate with fallback so supported games always resolve
for k, v in pairs(fallbackGames) do
    supportedGames[k] = v
end

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
    print("[Infinity Hub Loader] Config loaded successfully with " .. #result .. " game(s).")
else
    warn("[Infinity Hub Loader] Config fetch failed or returned non-table. Using built-in fallback registry.")
end

-- =========================================================
-- Route to appropriate script
-- =========================================================
local gameScript = supportedGames[currentPlaceId] 
    or supportedGames[currentGameId] 
    or fallbackGames[currentPlaceId] 
    or fallbackGames[currentGameId]

if gameScript then
    print("[Infinity Hub Loader] ✅ Supported game found! Injecting: " .. gameScript)
    local loadOk, loadErr = pcall(function()
        loadstring(game:HttpGet(baseUrl .. gameScript))()
    end)
    if not loadOk then
        warn("[Infinity Hub Loader] Error running game script: " .. tostring(loadErr))
        warn("[Infinity Hub Loader] Falling back to default hub...")
        loadstring(game:HttpGet(baseUrl .. "main.lua"))()
    end
else
    print("[Infinity Hub Loader] ℹ️ Game is unsupported (" .. currentPlaceId .. "). Launching Infinity Hub...")
    loadstring(game:HttpGet(baseUrl .. "main.lua"))()
end
