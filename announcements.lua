-- ==============================================================================
-- INFINITY HUB // LIVE ANNOUNCEMENTS CLIENT MODULE
-- ==============================================================================
-- Can be required, executed via loadfile, or run directly in your executor.
-- Polls the local/remote Infinity Hub announcement API and displays live popups.
-- ==============================================================================

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local InfinityConfig = {
    -- Primary and fallback URLs (supports 127.0.0.1, localhost, and local IP)
    ApiUrls = {
        "http://127.0.0.1:3000/api/announcements/latest",
        "http://localhost:3000/api/announcements/latest",
        "http://10.0.0.6:3000/api/announcements/latest"
    },
    PollInterval = 5, -- check every 5 seconds for responsive testing
    HubVersion = "2.1.0",
    CurrentModule = "Ride A Pet",
    DebugMode = true
}

local lastSeenAnnouncementId = nil
local activePopup = nil

-- Universal executor request helper
local function FetchRaw(url)
    local reqFn = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    
    -- 1. Try modern executor request API
    if reqFn then
        local ok, res = pcall(function()
            return reqFn({
                Url = url,
                Method = "GET",
                Headers = { ["Cache-Control"] = "no-cache" }
            })
        end)
        if ok and res then
            local body = res.Body or res.body
            if body and body ~= "" and body ~= "null" then
                return body
            end
        end
    end

    -- 2. Try game:HttpGet
    if game.HttpGet then
        local ok, body = pcall(function()
            return game:HttpGet(url)
        end)
        if ok and body and body ~= "" and body ~= "null" then
            return body
        end
    end

    -- 3. Try HttpService:GetAsync
    if HttpService and HttpService.GetAsync then
        local ok, body = pcall(function()
            return HttpService:GetAsync(url)
        end)
        if ok and body and body ~= "" and body ~= "null" then
            return body
        end
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

-- Target filtering
local function ShouldShowAnnouncement(announcement)
    if not announcement or not announcement.active then
        return false
    end

    local target = string.lower(announcement.target or "everyone")

    -- Module filtering
    if (target == "module" or target == "specific module") and announcement.targetModule then
        local reqMod = string.lower(announcement.targetModule)
        local curMod = string.lower(InfinityConfig.CurrentModule or "")
        if not string.find(curMod, reqMod, 1, true) then
            return false
        end
    end

    -- Version filtering
    if announcement.minimumHubVersion and announcement.minimumHubVersion ~= "" then
        local function parseVersion(v)
            local t = {}
            for num in string.gmatch(v:gsub("[^0-9%.]", ""), "%d+") do
                table.insert(t, tonumber(num) or 0)
            end
            while #t < 3 do table.insert(t, 0) end
            return t
        end
        local cVer = parseVersion(InfinityConfig.HubVersion)
        local mVer = parseVersion(announcement.minimumHubVersion)
        for i = 1, 3 do
            if cVer[i] > mVer[i] then break end
            if cVer[i] < mVer[i] then return false end
        end
    end

    return true
end

-- Display animated announcement card
local function ShowAnnouncementNotification(announcement)
    local targetParent = _G.InfinityGui or shared.InfinityGui
    if not targetParent then
        pcall(function()
            targetParent = (gethui and gethui()) or game:GetService("CoreGui"):FindFirstChild("InfinityHubGui") or game:GetService("CoreGui")
        end)
    end

    if not targetParent and localPlayer and localPlayer:FindFirstChild("PlayerGui") then
        targetParent = localPlayer.PlayerGui:FindFirstChild("InfinityHubGui") or localPlayer.PlayerGui
    end

    if not targetParent then
        targetParent = game:GetService("CoreGui")
    end

    -- Remove existing popup if any
    if activePopup and activePopup.Parent then
        activePopup:Destroy()
        activePopup = nil
    end

    local card = Instance.new("Frame")
    card.Name = "InfinityHub_LiveAnnouncement_" .. tostring(announcement.id)
    card.Size = UDim2.new(0, 380, 0, 115)
    card.Position = UDim2.new(0.5, -190, 0, -130)
    card.BackgroundColor3 = Color3.fromRGB(15, 20, 32)
    card.BorderSizePixel = 0
    card.ZIndex = 9999
    card.Parent = targetParent
    activePopup = card

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.5
    stroke.Parent = card

    local typeColors = {
        ["announcement"] = Color3.fromRGB(59, 130, 246),
        ["update"]       = Color3.fromRGB(139, 92, 246),
        ["important"]    = Color3.fromRGB(239, 68, 68),
        ["warning"]      = Color3.fromRGB(245, 158, 11),
        ["maintenance"]  = Color3.fromRGB(236, 72, 153),
        ["new script"]   = Color3.fromRGB(16, 185, 129),
    }
    local aType = string.lower(announcement.type or "announcement")
    local accentColor = typeColors[aType] or Color3.fromRGB(139, 92, 246)
    stroke.Color = accentColor

    -- Type Tag
    local typeBadge = Instance.new("TextLabel")
    typeBadge.Size = UDim2.new(0, 95, 0, 18)
    typeBadge.Position = UDim2.new(0, 14, 0, 10)
    typeBadge.BackgroundColor3 = accentColor
    typeBadge.BackgroundTransparency = 0.82
    typeBadge.Text = string.upper(aType)
    typeBadge.TextColor3 = accentColor
    typeBadge.Font = Enum.Font.GothamBold
    typeBadge.TextSize = 10
    typeBadge.ZIndex = 10000
    typeBadge.Parent = card

    local badgeCorner = Instance.new("UICorner")
    badgeCorner.CornerRadius = UDim.new(0, 4)
    badgeCorner.Parent = typeBadge

    -- Hub Brand Label
    local brand = Instance.new("TextLabel")
    brand.Size = UDim2.new(0, 180, 0, 18)
    brand.Position = UDim2.new(0, 118, 0, 10)
    brand.BackgroundTransparency = 1
    brand.Text = "INFINITY HUB ANNOUNCEMENT"
    brand.TextColor3 = Color3.fromRGB(148, 163, 184)
    brand.Font = Enum.Font.GothamBold
    brand.TextSize = 10
    brand.TextXAlignment = Enum.TextXAlignment.Left
    brand.ZIndex = 10000
    brand.Parent = card

    -- Dismiss Button
    local dismissBtn = Instance.new("TextButton")
    dismissBtn.Size = UDim2.new(0, 24, 0, 24)
    dismissBtn.Position = UDim2.new(1, -34, 0, 8)
    dismissBtn.BackgroundColor3 = Color3.fromRGB(26, 32, 48)
    dismissBtn.Text = "✕"
    dismissBtn.TextColor3 = Color3.fromRGB(220, 225, 240)
    dismissBtn.Font = Enum.Font.GothamBold
    dismissBtn.TextSize = 12
    dismissBtn.ZIndex = 10001
    dismissBtn.Parent = card

    local dismissCorner = Instance.new("UICorner")
    dismissCorner.CornerRadius = UDim.new(0, 6)
    dismissCorner.Parent = dismissBtn

    -- Title
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1, -44, 0, 22)
    titleLbl.Position = UDim2.new(0, 14, 0, 32)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = tostring(announcement.title or "Announcement")
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 14
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.ZIndex = 10000
    titleLbl.Parent = card

    -- Message
    local msgLbl = Instance.new("TextLabel")
    msgLbl.Size = UDim2.new(1, -28, 0, 48)
    msgLbl.Position = UDim2.new(0, 14, 0, 56)
    msgLbl.BackgroundTransparency = 1
    msgLbl.Text = tostring(announcement.message or "")
    msgLbl.TextColor3 = Color3.fromRGB(203, 213, 225)
    msgLbl.Font = Enum.Font.Gotham
    msgLbl.TextSize = 12
    msgLbl.TextWrapped = true
    msgLbl.TextXAlignment = Enum.TextXAlignment.Left
    msgLbl.TextYAlignment = Enum.TextYAlignment.Top
    msgLbl.ZIndex = 10000
    msgLbl.Parent = card

    -- Play sound if exists
    pcall(function()
        local clickSound = SoundService:FindFirstChild("Click")
        if clickSound then clickSound:Play() end
    end)

    -- Slide In
    TweenService:Create(card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -190, 0, 20)
    }):Play()

    local isDismissed = false
    local function Dismiss()
        if isDismissed then return end
        isDismissed = true
        local outTween = TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -190, 0, -140)
        })
        outTween:Play()
        outTween.Completed:Connect(function()
            if card and card.Parent then card:Destroy() end
        end)
    end

    dismissBtn.MouseButton1Click:Connect(Dismiss)

    -- Auto Dismiss Timer
    local duration = tonumber(announcement.duration)
    if duration == nil or duration > 0 then
        local durSecs = (duration and duration > 0) and duration or 10
        task.delay(durSecs, function()
            Dismiss()
        end)
    end
end

-- Start background polling loop
task.spawn(function()
    if InfinityConfig.DebugMode then
        print("[Infinity Hub] 📡 Live Announcement System Active — polling " .. InfinityConfig.ApiUrls[1])
    end

    while true do
        pcall(function()
            local announcement = FetchLatestAnnouncement()
            if announcement and announcement.id and announcement.active then
                if announcement.id ~= lastSeenAnnouncementId then
                    if ShouldShowAnnouncement(announcement) then
                        lastSeenAnnouncementId = announcement.id
                        print(string.format("[Infinity Hub] 📢 Announcement #%d: '%s'", announcement.id, announcement.title))
                        ShowAnnouncementNotification(announcement)
                    else
                        lastSeenAnnouncementId = announcement.id
                    end
                end
            end
        end)
        task.wait(InfinityConfig.PollInterval or 5)
    end
end)

return {
    FetchLatestAnnouncement = FetchLatestAnnouncement,
    ShowAnnouncementNotification = ShowAnnouncementNotification
}
