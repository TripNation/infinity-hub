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
-- Embedded Live Announcements Client (Zero Extra Network Hops)
-- =========================================================
task.spawn(function()
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    local SoundService = game:GetService("SoundService")
    local Players = game:GetService("Players")

    local localPlayer = Players.LocalPlayer
    if not localPlayer then
        local w = tick()
        while not localPlayer and (tick() - w < 3) do
            localPlayer = Players.LocalPlayer
            task.wait(0.1)
        end
    end
    if not localPlayer then
        pcall(function() localPlayer = Players:GetPlayers()[1] end)
    end

    local currentSession = tick()
    _G.InfinityAnnouncementsSession = currentSession

    local ApiUrls = {
        "https://infinity-admin-ynb5.onrender.com/api/announcements/latest",
        "https://www.infinityhub.space/api/announcements/latest",
        "https://infinityhub.space/api/announcements/latest",
        "http://127.0.0.1:3000/api/announcements/latest"
    }

    local lastSeenFingerprint = nil
    local activePopup = nil
    local announcementsScreenGui = nil

    local function GetAnnouncementGui()
        if announcementsScreenGui and announcementsScreenGui.Parent then
            return announcementsScreenGui
        end
        local existing = nil
        pcall(function()
            if gethui then existing = gethui():FindFirstChild("InfinityHub_AnnouncementsGui") end
        end)
        pcall(function()
            if not existing then existing = game:GetService("CoreGui"):FindFirstChild("InfinityHub_AnnouncementsGui") end
        end)
        pcall(function()
            if not existing and localPlayer and localPlayer:FindFirstChild("PlayerGui") then
                existing = localPlayer.PlayerGui:FindFirstChild("InfinityHub_AnnouncementsGui")
            end
        end)
        if existing and existing:IsA("ScreenGui") then
            announcementsScreenGui = existing
            return existing
        end

        local gui = Instance.new("ScreenGui")
        gui.Name = "InfinityHub_AnnouncementsGui"
        gui.ResetOnSpawn = false
        gui.DisplayOrder = 999999
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.IgnoreGuiInset = true

        local parented = false
        if gethui then
            pcall(function() gui.Parent = gethui(); parented = true end)
        end
        if not parented then
            pcall(function() gui.Parent = game:GetService("CoreGui"); parented = true end)
        end
        if not parented and localPlayer and localPlayer:FindFirstChild("PlayerGui") then
            pcall(function() gui.Parent = localPlayer.PlayerGui; parented = true end)
        end

        announcementsScreenGui = gui
        return gui
    end

    local function FetchRaw(url)
        local getOk, body = pcall(function() return game:HttpGet(url) end)
        if getOk and type(body) == "string" and body ~= "" and body ~= "null" then
            return body
        end
        local reqFn = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
        if reqFn then
            local ok, res = pcall(function()
                return reqFn({ Url = url, Method = "GET", Headers = { ["Cache-Control"] = "no-cache" } })
            end)
            if ok and type(res) == "table" then
                local b = res.Body or res.body
                if type(b) == "string" and b ~= "" and b ~= "null" then return b end
            end
        end
        return nil
    end

    local cachedGameName = nil
    local function GetCurrentGameName()
        if cachedGameName then return cachedGameName end
        local pId = tostring(game.PlaceId or 0)
        local uId = tostring(game.GameId or 0)
        if pId == "124216119978534" or uId == "10035204815" then
            cachedGameName = "Ride A Pet"
            return cachedGameName
        elseif pId == "131623223084840" or uId == "9363735110" then
            cachedGameName = "Escape Tsunami For Brainrots"
            return cachedGameName
        end
        pcall(function()
            if _G.RideAPetGui or _G.RideAPetMainFrame or (game:GetService("CoreGui"):FindFirstChild("RideAPetStandaloneGui")) then
                cachedGameName = "Ride A Pet"
            elseif _G.EscapeTsunamiGui or _G.EscapeTsunamiMainFrame or (game:GetService("CoreGui"):FindFirstChild("EscapeTsunamiGui")) then
                cachedGameName = "Escape Tsunami For Brainrots"
            end
        end)
        if cachedGameName then return cachedGameName end
        pcall(function()
            local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
            if info and info.Name then
                local n = string.lower(info.Name)
                if string.find(n, "ride", 1, true) and string.find(n, "pet", 1, true) then
                    cachedGameName = "Ride A Pet"
                elseif string.find(n, "tsunami", 1, true) or string.find(n, "brainrot", 1, true) then
                    cachedGameName = "Escape Tsunami For Brainrots"
                else
                    cachedGameName = info.Name
                end
            end
        end)
        if not cachedGameName then cachedGameName = "Hub" end
        return cachedGameName
    end

    local function UrlEncode(str)
        if not str then return "" end
        local ok, res = pcall(function() return HttpService:UrlEncode(tostring(str)) end)
        if ok and res then return res end
        return tostring(str):gsub("\n", "\r\n"):gsub("([^%w %-%_%.%~])", function(c)
            return string.format("%%%02X", string.byte(c))
        end):gsub(" ", "+")
    end

    local function GetClientParams(extra)
        local clientId = tostring((localPlayer and localPlayer.UserId) or tick())
        local str = "src=roblox&cid=" .. UrlEncode(clientId)
        if extra and extra ~= "" then
            str = str .. "&" .. extra
        end
        return str
    end

    -- Gracefully cleanup any previous session & register exit handler
    if _G.InfinityHubLeaveHook then
        pcall(_G.InfinityHubLeaveHook)
    end
    _G.InfinityHubLeaveHook = function()
        _G.InfinityHubExecutionTracked = false
        local clientId = tostring((localPlayer and localPlayer.UserId) or tick())
        local leaveQ = "?leave=1&src=roblox&cid=" .. UrlEncode(clientId)
        pcall(function()
            local ok = FetchRaw("https://www.infinityhub.space/api/stats/ping" .. leaveQ)
            if not ok then
                FetchRaw("https://infinity-admin-ynb5.onrender.com/api/stats/ping" .. leaveQ)
            end
        end)
    end

    pcall(function()
        game:BindToClose(function()
            if _G.InfinityHubLeaveHook then
                pcall(_G.InfinityHubLeaveHook)
            end
        end)
    end)

    -- Send execution telemetry ping on script injection (exactly once per execution session)
    if not _G.InfinityHubExecutionTracked then
        _G.InfinityHubExecutionTracked = true
        task.spawn(function()
            pcall(function()
                local q = "?" .. GetClientParams("init=1")
                local res = FetchRaw("https://www.infinityhub.space/api/stats/ping" .. q)
                if not res then
                    FetchRaw("https://infinity-admin-ynb5.onrender.com/api/stats/ping" .. q)
                end
            end)
        end)
    end

    local function FetchLatestAnnouncement()
        local timestamp = tostring(math.floor(tick() * 1000))
        local clientQuery = "?" .. GetClientParams("_t=" .. timestamp)
        for _, baseUrl in ipairs(ApiUrls) do
            local url = baseUrl .. clientQuery
            local raw = FetchRaw(url)
            if raw then
                local decodeOk, data = pcall(function() return HttpService:JSONDecode(raw) end)
                if decodeOk and type(data) == "table" and data.id and data.active then
                    return data
                end
            end
        end
        return nil
    end

    local function ShouldShowAnnouncement(announcement)
        if not announcement or not announcement.active then return false end
        local target = string.lower(tostring(announcement.target or "everyone"))
        local targetMod = string.lower(tostring(announcement.targetModule or ""))
        if target == "everyone" or targetMod == "" or targetMod == "all" or targetMod == "everyone" or targetMod == "null" then
            return true
        end
        local currentGame = string.lower(GetCurrentGameName())
        if string.find(targetMod, "ride", 1, true) or string.find(targetMod, "pet", 1, true) then
            return (string.find(currentGame, "ride", 1, true) ~= nil) or (string.find(currentGame, "pet", 1, true) ~= nil)
        end
        if string.find(targetMod, "tsunami", 1, true) or string.find(targetMod, "escape", 1, true) or string.find(targetMod, "brainrot", 1, true) then
            return (string.find(currentGame, "tsunami", 1, true) ~= nil) or (string.find(currentGame, "brainrot", 1, true) ~= nil)
        end
        return string.find(currentGame, targetMod, 1, true) ~= nil
    end

    local function ShowAnnouncementNotification(announcement)
        local screenGui = GetAnnouncementGui()
        if not screenGui then return end
        if activePopup and activePopup.Parent then
            pcall(function() activePopup:Destroy() end)
            activePopup = nil
        end

        local card = Instance.new("Frame")
        card.Name = "InfinityHub_LiveAnnouncement"
        card.AnchorPoint = Vector2.new(0.5, 0)
        card.Size = UDim2.new(0, 410, 0, 64)
        card.Position = UDim2.new(0.5, 0, 0, -85)
        card.BackgroundColor3 = Color3.fromRGB(18, 19, 24)
        card.BorderSizePixel = 0
        card.ZIndex = 9999
        card.Parent = screenGui
        activePopup = card

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = card

        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1
        stroke.Color = Color3.fromRGB(45, 48, 58)
        stroke.Parent = card

        local logoHolder = Instance.new("Frame")
        logoHolder.Name = "LogoHolder"
        logoHolder.Size = UDim2.new(0, 38, 0, 38)
        logoHolder.Position = UDim2.new(0, 12, 0, 13)
        logoHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        logoHolder.BorderSizePixel = 0
        logoHolder.ZIndex = 10000
        logoHolder.Parent = card

        local holderCorner = Instance.new("UICorner")
        holderCorner.CornerRadius = UDim.new(0, 8)
        holderCorner.Parent = logoHolder

        local infinityIcon = Instance.new("ImageLabel")
        infinityIcon.Name = "InfinityIcon"
        infinityIcon.Size = UDim2.new(0, 26, 0, 20)
        infinityIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
        infinityIcon.AnchorPoint = Vector2.new(0.5, 0.5)
        infinityIcon.BackgroundTransparency = 1
        infinityIcon.BorderSizePixel = 0
        infinityIcon.Image = "rbxassetid://17894477503"
        infinityIcon.ImageColor3 = Color3.fromRGB(15, 17, 23)
        infinityIcon.ScaleType = Enum.ScaleType.Fit
        infinityIcon.ZIndex = 10001
        infinityIcon.Parent = logoHolder

        local dismissBtn = Instance.new("TextButton")
        dismissBtn.Name = "DismissBtn"
        dismissBtn.Size = UDim2.new(0, 20, 0, 20)
        dismissBtn.Position = UDim2.new(1, -26, 0, 8)
        dismissBtn.BackgroundTransparency = 1
        dismissBtn.Text = "X"
        dismissBtn.TextColor3 = Color3.fromRGB(140, 145, 160)
        dismissBtn.Font = Enum.Font.GothamBold
        dismissBtn.TextSize = 12
        dismissBtn.ZIndex = 10002
        dismissBtn.Parent = card

        dismissBtn.MouseEnter:Connect(function() dismissBtn.TextColor3 = Color3.fromRGB(255, 255, 255) end)
        dismissBtn.MouseLeave:Connect(function() dismissBtn.TextColor3 = Color3.fromRGB(140, 145, 160) end)

        local rawType = tostring(announcement.type or "announcement")
        local typeLower = string.lower(rawType)
        local formattedType = string.upper(string.sub(typeLower, 1, 1)) .. string.sub(typeLower, 2)
        if formattedType == "" then formattedType = "Announcement" end

        local headerLabel = Instance.new("TextLabel")
        headerLabel.Name = "HeaderLabel"
        headerLabel.Size = UDim2.new(1, -88, 0, 16)
        headerLabel.Position = UDim2.new(0, 58, 0, 12)
        headerLabel.BackgroundTransparency = 1
        headerLabel.Text = "Infinity " .. formattedType
        headerLabel.TextColor3 = Color3.fromRGB(155, 125, 255)
        headerLabel.Font = Enum.Font.GothamBold
        headerLabel.TextSize = 13
        headerLabel.TextXAlignment = Enum.TextXAlignment.Left
        headerLabel.ZIndex = 10002
        headerLabel.Parent = card

        local messageLabel = Instance.new("TextLabel")
        messageLabel.Name = "MessageLabel"
        messageLabel.Size = UDim2.new(1, -88, 0, 24)
        messageLabel.Position = UDim2.new(0, 58, 0, 29)
        messageLabel.BackgroundTransparency = 1
        messageLabel.Text = tostring(announcement.message or "")
        messageLabel.TextColor3 = Color3.fromRGB(220, 222, 230)
        messageLabel.Font = Enum.Font.GothamMedium
        messageLabel.TextSize = 12
        messageLabel.TextXAlignment = Enum.TextXAlignment.Left
        messageLabel.TextYAlignment = Enum.TextYAlignment.Top
        messageLabel.TextTruncate = Enum.TextTruncate.AtEnd
        messageLabel.ZIndex = 10002
        messageLabel.Parent = card

        local progressBarTrack = Instance.new("Frame")
        progressBarTrack.Name = "ProgressBarTrack"
        progressBarTrack.Size = UDim2.new(1, 0, 0, 3)
        progressBarTrack.Position = UDim2.new(0, 0, 1, -3)
        progressBarTrack.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
        progressBarTrack.BorderSizePixel = 0
        progressBarTrack.ZIndex = 10003
        progressBarTrack.Parent = card

        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(0, 2)
        trackCorner.Parent = progressBarTrack

        local progressFill = Instance.new("Frame")
        progressFill.Name = "ProgressFill"
        progressFill.Size = UDim2.new(1, 0, 1, 0)
        progressFill.Position = UDim2.new(0, 0, 0, 0)
        progressFill.BackgroundColor3 = Color3.fromRGB(140, 95, 255)
        progressFill.BorderSizePixel = 0
        progressFill.ZIndex = 10004
        progressFill.Parent = progressBarTrack

        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(0, 2)
        fillCorner.Parent = progressFill

        pcall(function()
            local cs = SoundService:FindFirstChild("Click")
            if cs then cs:Play() end
        end)

        TweenService:Create(card, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0, 20)
        }):Play()

        local isDismissed = false
        local function Dismiss()
            if isDismissed then return end
            isDismissed = true
            local tweenOut = TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, 0, 0, -85)
            })
            tweenOut:Play()
            tweenOut.Completed:Connect(function()
                if card and card.Parent then card:Destroy() end
            end)
        end

        dismissBtn.MouseButton1Click:Connect(Dismiss)

        local duration = tonumber(announcement.duration)
        local durSecs = (duration and duration > 0) and duration or 10
        TweenService:Create(progressFill, TweenInfo.new(durSecs, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 1, 0)
        }):Play()
        task.delay(durSecs, Dismiss)
    end

    _G.InfinitySeenAnnouncements = _G.InfinitySeenAnnouncements or {}
    local seenAnnouncements = _G.InfinitySeenAnnouncements

    -- Load seen announcements from executor disk if available
    pcall(function()
        if readfile and isfile and isfile("infinity_seen_announcements.json") then
            local raw = readfile("infinity_seen_announcements.json")
            local list = HttpService:JSONDecode(raw)
            if type(list) == "table" then
                for _, id in ipairs(list) do
                    seenAnnouncements[tostring(id)] = true
                end
            end
        end
    end)

    local function SaveSeenAnnouncement(id)
        local strId = tostring(id or "")
        if strId == "" then return end
        seenAnnouncements[strId] = true
        pcall(function()
            if writefile then
                local list = {}
                for k, _ in pairs(seenAnnouncements) do
                    table.insert(list, k)
                end
                writefile("infinity_seen_announcements.json", HttpService:JSONEncode(list))
            end
        end)
    end

    print("[Infinity Hub] 📡 Live Announcement System Active in " .. GetCurrentGameName())

    local isInitialCheck = true

    while _G.InfinityAnnouncementsSession == currentSession do
        pcall(function()
            local announcement = FetchLatestAnnouncement()
            if announcement and type(announcement) == "table" and announcement.active then
                local annId = tostring(announcement.id or "")
                local fingerprint = annId .. "_" .. tostring(announcement.message or "")

                -- On the very first check upon injecting, any existing announcement was created in the past.
                -- Mark it as seen immediately so it NEVER plays on injection!
                if isInitialCheck then
                    isInitialCheck = false
                    lastSeenFingerprint = fingerprint
                    SaveSeenAnnouncement(annId)
                    print(string.format("[Infinity Hub] ℹ️ Ignored past announcement #%s on injection", annId))
                    return
                end

                -- Only display if never seen before in this or any previous session
                if not seenAnnouncements[annId] and fingerprint ~= lastSeenFingerprint then
                    lastSeenFingerprint = fingerprint
                    SaveSeenAnnouncement(annId)

                    if ShouldShowAnnouncement(announcement) then
                        print(string.format("[Infinity Hub] 📢 Showing Announcement #%s to %s: '%s'", annId, GetCurrentGameName(), tostring(announcement.message or "")))
                        ShowAnnouncementNotification(announcement)
                    else
                        print(string.format("[Infinity Hub] ℹ️ Skipping Announcement #%s (targeted to '%s', currently in '%s')", annId, tostring(announcement.targetModule or announcement.target), GetCurrentGameName()))
                    end
                end
            else
                isInitialCheck = false
            end
        end)
        task.wait(4)
    end
end)

-- =========================================================
-- Hardcoded Fallback Registry
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
        if g.PlaceId then supportedGames[tostring(g.PlaceId)] = g.Script end
        if g.UniverseId then supportedGames[tostring(g.UniverseId)] = g.Script end
    end
    print("[Infinity Hub Loader] Config loaded successfully with " .. #result .. " game(s).")
else
    warn("[Infinity Hub Loader] Config fetch failed. Using built-in fallback registry.")
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
