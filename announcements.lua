-- ==============================================================================
-- INFINITY HUB // LIVE ANNOUNCEMENTS CLIENT MODULE
-- ==============================================================================
-- Universal announcement listener for Infinity Hub, Loader, and Game scripts.
-- Polls the Infinity Hub admin API and displays animated live notifications.
-- ==============================================================================

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")

-- Safe LocalPlayer resolution
local localPlayer = Players.LocalPlayer
if not localPlayer then
    local startWait = tick()
    while not localPlayer and (tick() - startWait < 3) do
        localPlayer = Players.LocalPlayer
        task.wait(0.1)
    end
end
if not localPlayer then
    pcall(function()
        localPlayer = Players:GetPlayers()[1]
    end)
end

-- Unique session tracker so re-execution seamlessly replaces old loops
local currentSession = tick()
_G.InfinityAnnouncementsSession = currentSession

local InfinityConfig = {
    -- Endpoints to query: Render direct first (fastest/most reliable SSL in executors), then custom domain
    ApiUrls = {
        "https://infinity-admin-ynb5.onrender.com/api/announcements/latest",
        "https://www.infinityhub.space/api/announcements/latest",
        "https://infinityhub.space/api/announcements/latest",
        "http://127.0.0.1:3000/api/announcements/latest",
        "http://localhost:3000/api/announcements/latest"
    },
    PollInterval = 5,
    HubVersion = "2.1.0",
    DebugMode = true
}

local lastSeenAnnouncementId = nil
local activePopup = nil
local announcementsScreenGui = nil

-- Dedicated ScreenGui provider (Crucial: Frames MUST be inside a ScreenGui)
local function GetAnnouncementGui()
    if announcementsScreenGui and announcementsScreenGui.Parent then
        return announcementsScreenGui
    end

    -- Look for existing GUI to avoid duplicates
    local existing = nil
    pcall(function()
        if gethui then
            existing = gethui():FindFirstChild("InfinityHub_AnnouncementsGui")
        end
    end)
    pcall(function()
        if not existing then
            existing = game:GetService("CoreGui"):FindFirstChild("InfinityHub_AnnouncementsGui")
        end
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
        pcall(function()
            gui.Parent = gethui()
            parented = true
        end)
    end
    if not parented then
        pcall(function()
            gui.Parent = game:GetService("CoreGui")
            parented = true
        end)
    end
    if not parented then
        pcall(function()
            if localPlayer and localPlayer:FindFirstChild("PlayerGui") then
                gui.Parent = localPlayer.PlayerGui
                parented = true
            end
        end)
    end

    announcementsScreenGui = gui
    return gui
end

-- Universal executor request helper
local function FetchRaw(url)
    -- 1. Try modern executor request API
    local reqFn = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if reqFn then
        local ok, res = pcall(function()
            return reqFn({
                Url = url,
                url = url,
                Method = "GET",
                method = "GET",
                Headers = {
                    ["Cache-Control"] = "no-cache",
                    ["User-Agent"] = "InfinityHub-Roblox/2.1"
                }
            })
        end)
        if ok and type(res) == "table" then
            local body = res.Body or res.body
            if body and body ~= "" and body ~= "null" then
                return body
            end
        end
    end

    -- 2. Try game:HttpGet directly inside pcall
    local getOk, body = pcall(function()
        return game:HttpGet(url)
    end)
    if getOk and body and body ~= "" and body ~= "null" then
        return body
    end

    -- 3. Try game:HttpGetAsync inside pcall
    local asyncOk, asyncBody = pcall(function()
        return game:HttpGetAsync(url)
    end)
    if asyncOk and asyncBody and asyncBody ~= "" and asyncBody ~= "null" then
        return asyncBody
    end

    return nil
end

-- Fetch latest announcement trying fallback endpoints
local function FetchLatestAnnouncement()
    local timestamp = tostring(math.floor(tick() * 1000))
    for _, baseUrl in ipairs(InfinityConfig.ApiUrls) do
        local url = baseUrl .. "?_t=" .. timestamp
        local raw = FetchRaw(url)
        if raw then
            local decodeOk, data = pcall(function()
                return HttpService:JSONDecode(raw)
            end)
            if decodeOk and type(data) == "table" and data.id and data.active then
                return data
            end
        end
    end
    return nil
end

local function GetCurrentGameName()
    local pId = tostring(game.PlaceId or 0)
    local uId = tostring(game.GameId or 0)

    if pId == "124216119978534" or uId == "10035204815" then
        return "Ride A Pet"
    elseif pId == "131623223084840" or uId == "9363735110" then
        return "Escape Tsunami For Brainrots"
    end

    if _G.RideAPetGui or _G.RideAPetMainFrame then
        return "Ride A Pet"
    end
    if _G.EscapeTsunamiGui or _G.EscapeTsunamiMainFrame then
        return "Escape Tsunami For Brainrots"
    end

    return "Hub"
end

-- Target filtering
local function ShouldShowAnnouncement(announcement)
    if not announcement or not announcement.active then
        return false
    end

    local target = string.lower(tostring(announcement.target or "everyone"))
    local targetMod = string.lower(tostring(announcement.targetModule or ""))

    -- 1. All games / Everyone
    if target == "everyone" or targetMod == "" or targetMod == "all" or targetMod == "everyone" or targetMod == "null" then
        return true
    end

    -- 2. Specific game selection
    local currentGame = string.lower(GetCurrentGameName())

    -- Ride A Pet
    if string.find(targetMod, "ride", 1, true) or string.find(targetMod, "pet", 1, true) then
        return (string.find(currentGame, "ride", 1, true) ~= nil) or (string.find(currentGame, "pet", 1, true) ~= nil)
    end

    -- Escape Tsunami
    if string.find(targetMod, "tsunami", 1, true) or string.find(targetMod, "escape", 1, true) or string.find(targetMod, "brainrot", 1, true) then
        return (string.find(currentGame, "tsunami", 1, true) ~= nil) or (string.find(currentGame, "brainrot", 1, true) ~= nil)
    end

    return string.find(currentGame, targetMod, 1, true) ~= nil
end

-- Display animated announcement card matching reference design
local function ShowAnnouncementNotification(announcement)
    local screenGui = GetAnnouncementGui()
    if not screenGui then
        warn("[Infinity Hub Announcements] ⚠️ Failed to acquire ScreenGui parent.")
        return
    end

    if activePopup and activePopup.Parent then
        pcall(function() activePopup:Destroy() end)
        activePopup = nil
    end

    -- Sleek Compact Card Container (410x64 pill)
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

    -- Left White Rounded Square
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

    -- Infinity Logo
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

    -- Dismiss Button 'X'
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

    dismissBtn.MouseEnter:Connect(function()
        dismissBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    dismissBtn.MouseLeave:Connect(function()
        dismissBtn.TextColor3 = Color3.fromRGB(140, 145, 160)
    end)

    -- Dynamic Header based on announcement type
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

    -- Message Text
    local msgText = tostring(announcement.message or "")
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Name = "MessageLabel"
    messageLabel.Size = UDim2.new(1, -88, 0, 24)
    messageLabel.Position = UDim2.new(0, 58, 0, 29)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = msgText
    messageLabel.TextColor3 = Color3.fromRGB(220, 222, 230)
    messageLabel.Font = Enum.Font.GothamMedium
    messageLabel.TextSize = 12
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextTruncate = Enum.TextTruncate.AtEnd
    messageLabel.ZIndex = 10002
    messageLabel.Parent = card

    -- Bottom Progress Bar Track
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

    -- Sound effect
    pcall(function()
        local clickSound = SoundService:FindFirstChild("Click")
        if clickSound then clickSound:Play() end
    end)

    -- Slide Down Animation
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
            if card and card.Parent then
                card:Destroy()
            end
        end)
    end

    dismissBtn.MouseButton1Click:Connect(Dismiss)

    -- Auto dismiss timer with countdown
    local duration = tonumber(announcement.duration)
    if duration == nil or duration > 0 then
        local durSecs = (duration and duration > 0) and duration or 10
        TweenService:Create(progressFill, TweenInfo.new(durSecs, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 1, 0)
        }):Play()
        task.delay(durSecs, Dismiss)
    end
end

-- Start background polling loop
task.spawn(function()
    print("[Infinity Hub] 📡 Live Announcement System Active")
    
    while _G.InfinityAnnouncementsSession == currentSession do
        local ok, err = pcall(function()
            local announcement = FetchLatestAnnouncement()
            if announcement and announcement.id and announcement.active then
                if announcement.id ~= lastSeenAnnouncementId then
                    if ShouldShowAnnouncement(announcement) then
                        lastSeenAnnouncementId = announcement.id
                        print(string.format("[Infinity Hub] 📢 Showing Announcement #%d: '%s'", announcement.id, tostring(announcement.message or "")))
                        ShowAnnouncementNotification(announcement)
                    else
                        lastSeenAnnouncementId = announcement.id
                    end
                end
            end
        end)
        
        if not ok and InfinityConfig.DebugMode then
            warn("[Infinity Hub Announcements Error] " .. tostring(err))
        end

        task.wait(InfinityConfig.PollInterval)
    end
end)

return {
    FetchLatestAnnouncement = FetchLatestAnnouncement,
    ShowAnnouncementNotification = ShowAnnouncementNotification
}
