-- =========================================================
-- INFINITY // ESCAPE TSUNAMI FOR BRAINROT
-- Standalone Universal Loadstring Script
-- =========================================================

local success, runtimeError = pcall(function()

-- 1. Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- 2. Local Player Resolution (Non-blocking & foolproof)
local localPlayer = Players.LocalPlayer
if not localPlayer then
    local startTick = tick()
    while not localPlayer and (tick() - startTick < 3) do
        localPlayer = Players.LocalPlayer
        task.wait(0.1)
    end
end
if not localPlayer then
    localPlayer = Players:GetPlayers()[1]
end

-- 3. Cleanup Existing GUI Instances
pcall(function()
    if gethui and gethui():FindFirstChild("InfinityTsunamiStandaloneGui") then
        gethui().InfinityTsunamiStandaloneGui:Destroy()
    end
end)
pcall(function()
    if localPlayer and localPlayer:FindFirstChild("PlayerGui") and localPlayer.PlayerGui:FindFirstChild("InfinityTsunamiStandaloneGui") then
        localPlayer.PlayerGui.InfinityTsunamiStandaloneGui:Destroy()
    end
end)
pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("InfinityTsunamiStandaloneGui") then
        game:GetService("CoreGui").InfinityTsunamiStandaloneGui:Destroy()
    end
end)

-- 4. ScreenGui Creation & Fail-Safe Parenting
local StandaloneGui = Instance.new("ScreenGui")
StandaloneGui.Name = "InfinityTsunamiStandaloneGui"
StandaloneGui.ResetOnSpawn = false
StandaloneGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
StandaloneGui.IgnoreGuiInset = true
StandaloneGui.DisplayOrder = 999999

local guiParent = nil
if gethui then
    pcall(function()
        guiParent = gethui()
    end)
end
if not guiParent and localPlayer then
    pcall(function()
        guiParent = localPlayer:FindFirstChild("PlayerGui") or localPlayer:WaitForChild("PlayerGui", 4)
    end)
end
if not guiParent then
    pcall(function()
        guiParent = game:GetService("CoreGui")
    end)
end
StandaloneGui.Parent = guiParent

-- 5. Sounds
local clickSound = SoundService:FindFirstChild("Click")
local hoverSound = SoundService:FindFirstChild("Hover")

-- 6. Game Thumbnail / Decal Asset (Escape Tsunami for Brainrots artwork)
local TSUNAMI_DECAL_ASSET_ID = "72243215477695"
local defaultThumbnail = "rbxthumb://type=Asset&id=72243215477695&w=768&h=432"

local function getBannerImage()
    if TSUNAMI_DECAL_ASSET_ID ~= "" then
        if string.find(TSUNAMI_DECAL_ASSET_ID, "://") then
            return TSUNAMI_DECAL_ASSET_ID
        else
            return "rbxthumb://type=Asset&id=" .. TSUNAMI_DECAL_ASSET_ID .. "&w=768&h=432"
        end
    end
    return defaultThumbnail
end

local bannerImageUri = getBannerImage()

-- 7. Main Window Container (590px x 530px)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = StandaloneGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 21, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Position = UDim2.new(0.5, -295, 0.5, -265)
MainFrame.Size = UDim2.new(0, 590, 0, 530)
MainFrame.Visible = true

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 48, 55)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- 8. Top Drag Bar & Header
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(15, 16, 19)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 36)

local TopBarBottomLine = Instance.new("Frame")
TopBarBottomLine.Parent = TopBar
TopBarBottomLine.BackgroundColor3 = Color3.fromRGB(38, 40, 48)
TopBarBottomLine.BorderSizePixel = 0
TopBarBottomLine.Position = UDim2.new(0, 0, 1, -1)
TopBarBottomLine.Size = UDim2.new(1, 0, 0, 1)

local TopLogo = Instance.new("ImageLabel")
TopLogo.Name = "Logo"
TopLogo.Parent = TopBar
TopLogo.BackgroundTransparency = 1.000
TopLogo.Position = UDim2.new(0, 10, 0.5, -11)
TopLogo.Size = UDim2.new(0, 22, 0, 22)
TopLogo.Image = bannerImageUri
TopLogo.ScaleType = Enum.ScaleType.Crop

local TopLogoCorner = Instance.new("UICorner")
TopLogoCorner.CornerRadius = UDim.new(0, 4)
TopLogoCorner.Parent = TopLogo

local TopTitle = Instance.new("TextLabel")
TopTitle.Name = "Title"
TopTitle.Parent = TopBar
TopTitle.BackgroundTransparency = 1.000
TopTitle.Position = UDim2.new(0, 38, 0, 0)
TopTitle.Size = UDim2.new(0, 320, 1, 0)
TopTitle.Font = Enum.Font.GothamBold
TopTitle.Text = "INFINITY // ESCAPE TSUNAMI FOR BRAINROT"
TopTitle.TextColor3 = Color3.fromRGB(240, 240, 245)
TopTitle.TextSize = 12.000
TopTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button (Top right)
local TopCloseBtn = Instance.new("TextButton")
TopCloseBtn.Name = "CloseBtn"
TopCloseBtn.Parent = TopBar
TopCloseBtn.BackgroundColor3 = Color3.fromRGB(35, 20, 22)
TopCloseBtn.BorderSizePixel = 0
TopCloseBtn.Position = UDim2.new(1, -36, 0.5, -12)
TopCloseBtn.Size = UDim2.new(0, 28, 0, 24)
TopCloseBtn.Font = Enum.Font.GothamBold
TopCloseBtn.Text = "✕"
TopCloseBtn.TextColor3 = Color3.fromRGB(255, 95, 95)
TopCloseBtn.TextSize = 12.000

local TopCloseCorner = Instance.new("UICorner")
TopCloseCorner.CornerRadius = UDim.new(0, 4)
TopCloseCorner.Parent = TopCloseBtn

local TopCloseStroke = Instance.new("UIStroke")
TopCloseStroke.Color = Color3.fromRGB(90, 35, 40)
TopCloseStroke.Thickness = 1
TopCloseStroke.Parent = TopCloseBtn

TopCloseBtn.MouseButton1Click:Connect(function()
    if clickSound then clickSound:Play() end
    MainFrame.Visible = false
end)

-- Window Drag Logic
local isDragging = false
local dragStart = nil
local startPos = nil

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        local conn
        conn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
                if conn then conn:Disconnect() end
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- 9. Sidebar Navigation (Width: 155px)
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 16, 19)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0, 0, 0, 36)
Sidebar.Size = UDim2.new(0, 155, 1, -66)

local SidebarRightLine = Instance.new("Frame")
SidebarRightLine.Parent = Sidebar
SidebarRightLine.BackgroundColor3 = Color3.fromRGB(38, 40, 48)
SidebarRightLine.BorderSizePixel = 0
SidebarRightLine.Position = UDim2.new(1, -1, 0, 0)
SidebarRightLine.Size = UDim2.new(0, 1, 1, 0)

-- Tab Buttons Container
local TabButtonsContainer = Instance.new("ScrollingFrame")
TabButtonsContainer.Name = "TabButtons"
TabButtonsContainer.Parent = Sidebar
TabButtonsContainer.BackgroundTransparency = 1.000
TabButtonsContainer.BorderSizePixel = 0
TabButtonsContainer.Position = UDim2.new(0, 0, 0, 6)
TabButtonsContainer.Size = UDim2.new(1, -1, 1, -6)
TabButtonsContainer.ScrollBarThickness = 2
TabButtonsContainer.ScrollBarImageColor3 = Color3.fromRGB(45, 48, 55)
TabButtonsContainer.CanvasSize = UDim2.new(0, 0, 0, 280)

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabButtonsContainer
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 3)

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingLeft = UDim.new(0, 8)
TabPadding.PaddingRight = UDim.new(0, 8)
TabPadding.PaddingTop = UDim.new(0, 6)
TabPadding.Parent = TabButtonsContainer

-- 10. Page View Container (Right Side)
local PageView = Instance.new("Frame")
PageView.Name = "PageView"
PageView.Parent = MainFrame
PageView.BackgroundColor3 = Color3.fromRGB(20, 21, 25)
PageView.BorderSizePixel = 0
PageView.Position = UDim2.new(0, 155, 0, 36)
PageView.Size = UDim2.new(1, -155, 1, -66)

-- 11. Tabs Definition
local pageNames = {
    "Main",
    "Auto Farm",
    "Brainrots",
    "Upgrades",
    "Teleports",
    "Player Mods",
    "Visuals",
    "Settings"
}

local tabButtons = {}
local pages = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Parent = PageView
    page.BackgroundTransparency = 1.000
    page.BorderSizePixel = 0
    page.Size = UDim2.new(1, 0, 1, 0)
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Color3.fromRGB(45, 48, 55)
    page.Visible = false

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.Parent = page
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding = UDim.new(0, 10)

    local pagePadding = Instance.new("UIPadding")
    pagePadding.PaddingLeft = UDim.new(0, 14)
    pagePadding.PaddingRight = UDim.new(0, 14)
    pagePadding.PaddingTop = UDim.new(0, 12)
    pagePadding.PaddingBottom = UDim.new(0, 14)
    pagePadding.Parent = page

    pageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, pageLayout.AbsoluteContentSize.Y + 25)
    end)

    return page
end

for _, name in ipairs(pageNames) do
    pages[name] = createPage(name)
end

-- Tab Switching Function
local activeTab = nil
local function selectTab(tabName)
    if clickSound then clickSound:Play() end
    activeTab = tabName

    for name, btn in pairs(tabButtons) do
        local ind = btn:FindFirstChild("Indicator")
        if name == tabName then
            btn.BackgroundColor3 = Color3.fromRGB(26, 30, 38)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            if ind then ind.Visible = true end
        else
            btn.BackgroundColor3 = Color3.fromRGB(15, 16, 19)
            btn.TextColor3 = Color3.fromRGB(155, 160, 170)
            if ind then ind.Visible = false end
        end
    end

    for name, page in pairs(pages) do
        page.Visible = (name == tabName)
    end
end

-- Create Tab Buttons
for i, name in ipairs(pageNames) do
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Tab"
    btn.Parent = TabButtonsContainer
    btn.BackgroundColor3 = Color3.fromRGB(15, 16, 19)
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.fromRGB(155, 160, 170)
    btn.TextSize = 11.500
    btn.TextXAlignment = Enum.TextXAlignment.Left

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = btn

    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Parent = btn
    indicator.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    indicator.BorderSizePixel = 0
    indicator.Position = UDim2.new(0, 3, 0.5, -8)
    indicator.Size = UDim2.new(0, 3, 0, 16)
    indicator.Visible = false

    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(1, 0)
    indCorner.Parent = indicator

    btn.MouseButton1Click:Connect(function()
        selectTab(name)
    end)

    tabButtons[name] = btn
end



-- 12. UI Card Helpers
local function createCard(page, title, height)
    local card = Instance.new("Frame")
    card.Name = title .. "Card"
    card.Parent = page
    card.BackgroundColor3 = Color3.fromRGB(16, 17, 21)
    card.BorderSizePixel = 0
    card.Size = UDim2.new(1, 0, 0, height)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(35, 38, 46)
    stroke.Thickness = 1
    stroke.Parent = card

    local header = Instance.new("TextLabel")
    header.Parent = card
    header.BackgroundTransparency = 1.000
    header.Position = UDim2.new(0, 12, 0, 6)
    header.Size = UDim2.new(1, -24, 0, 20)
    header.Font = Enum.Font.GothamBold
    header.Text = title:upper()
    header.TextColor3 = Color3.fromRGB(130, 135, 148)
    header.TextSize = 10.000
    header.TextXAlignment = Enum.TextXAlignment.Left

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Parent = card
    container.BackgroundTransparency = 1.000
    container.Position = UDim2.new(0, 12, 0, 28)
    container.Size = UDim2.new(1, -24, 1, -34)

    local layout = Instance.new("UIListLayout")
    layout.Parent = container
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)

    return card, container
end

local function addToggle(container, text, defaultState, callback)
    local frame = Instance.new("Frame")
    frame.Name = text .. "Toggle"
    frame.Parent = container
    frame.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, 0, 0, 32)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1.000
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Font = Enum.Font.GothamMedium
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 235)
    label.TextSize = 11.500
    label.TextXAlignment = Enum.TextXAlignment.Left

    local switch = Instance.new("TextButton")
    switch.Name = "Switch"
    switch.Parent = frame
    switch.BackgroundColor3 = defaultState and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(38, 40, 48)
    switch.BorderSizePixel = 0
    switch.Position = UDim2.new(1, -44, 0.5, -10)
    switch.Size = UDim2.new(0, 36, 0, 20)
    switch.Text = ""

    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch

    local circle = Instance.new("Frame")
    circle.Name = "Circle"
    circle.Parent = switch
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.BorderSizePixel = 0
    circle.Position = defaultState and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    circle.Size = UDim2.new(0, 16, 0, 16)

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle

    local state = defaultState
    switch.MouseButton1Click:Connect(function()
        state = not state
        if clickSound then clickSound:Play() end
        TweenService:Create(switch, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(38, 40, 48)
        }):Play()
        TweenService:Create(circle, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        }):Play()
        task.spawn(function()
            pcall(callback, state)
        end)
    end)

    return frame
end

local function addButton(container, text, actionText, callback)
    local frame = Instance.new("Frame")
    frame.Name = text .. "ButtonFrame"
    frame.Parent = container
    frame.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, 0, 0, 32)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1.000
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Size = UDim2.new(1, -85, 1, 0)
    label.Font = Enum.Font.GothamMedium
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 235)
    label.TextSize = 11.500
    label.TextXAlignment = Enum.TextXAlignment.Left

    local actionBtn = Instance.new("TextButton")
    actionBtn.Name = "ActionBtn"
    actionBtn.Parent = frame
    actionBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
    actionBtn.BorderSizePixel = 0
    actionBtn.Position = UDim2.new(1, -74, 0.5, -11)
    actionBtn.Size = UDim2.new(0, 66, 0, 22)
    actionBtn.Font = Enum.Font.GothamBold
    actionBtn.Text = actionText or "RUN"
    actionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    actionBtn.TextSize = 10.500

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = actionBtn

    actionBtn.MouseButton1Click:Connect(function()
        if clickSound then clickSound:Play() end
        task.spawn(function()
            pcall(callback, actionBtn)
        end)
    end)

    return frame
end

local function addSlider(container, text, minVal, maxVal, defaultVal, callback)
    local frame = Instance.new("Frame")
    frame.Name = text .. "SliderFrame"
    frame.Parent = container
    frame.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, 0, 0, 44)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1.000
    label.Position = UDim2.new(0, 10, 0, 4)
    label.Size = UDim2.new(1, -60, 0, 18)
    label.Font = Enum.Font.GothamMedium
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 235)
    label.TextSize = 11.000
    label.TextXAlignment = Enum.TextXAlignment.Left

    local valLabel = Instance.new("TextLabel")
    valLabel.Parent = frame
    valLabel.BackgroundTransparency = 1.000
    valLabel.Position = UDim2.new(1, -50, 0, 4)
    valLabel.Size = UDim2.new(0, 42, 0, 18)
    valLabel.Font = Enum.Font.GothamBold
    valLabel.Text = tostring(defaultVal)
    valLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    valLabel.TextSize = 11.000
    valLabel.TextXAlignment = Enum.TextXAlignment.Right

    local sliderBar = Instance.new("TextButton")
    sliderBar.Name = "SliderBar"
    sliderBar.Parent = frame
    sliderBar.BackgroundColor3 = Color3.fromRGB(38, 40, 48)
    sliderBar.BorderSizePixel = 0
    sliderBar.Position = UDim2.new(0, 10, 0, 26)
    sliderBar.Size = UDim2.new(1, -20, 0, 8)
    sliderBar.Text = ""

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = sliderBar

    local initialAlpha = math.clamp((defaultVal - minVal) / (maxVal - minVal), 0, 1)

    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Parent = sliderBar
    fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    fill.BorderSizePixel = 0
    fill.Size = UDim2.new(initialAlpha, 0, 1, 0)

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill

    local draggingSlider = false
    local function updateSlider(input)
        local barAbsPos = sliderBar.AbsolutePosition.X
        local barAbsSize = sliderBar.AbsoluteSize.X
        local alpha = math.clamp((input.Position.X - barAbsPos) / barAbsSize, 0, 1)
        fill.Size = UDim2.new(alpha, 0, 1, 0)
        local value = math.floor(minVal + (maxVal - minVal) * alpha)
        valLabel.Text = tostring(value)
        task.spawn(function()
            pcall(callback, value)
        end)
    end

    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = true
            updateSlider(input)
        end
    end)

    sliderBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)

    return frame
end

-- =========================================================
-- 13. POPULATE MAIN TAB (Matching Screenshot exactly)
-- =========================================================
local mainPage = pages["Main"]

-- Banner Card
local BannerCard = Instance.new("Frame")
BannerCard.Name = "BannerCard"
BannerCard.Parent = mainPage
BannerCard.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
BannerCard.BorderSizePixel = 0
BannerCard.ClipsDescendants = true
BannerCard.Size = UDim2.new(1, 0, 0, 145)

local BannerCorner = Instance.new("UICorner")
BannerCorner.CornerRadius = UDim.new(0, 6)
BannerCorner.Parent = BannerCard

local BannerStroke = Instance.new("UIStroke")
BannerStroke.Color = Color3.fromRGB(45, 48, 55)
BannerStroke.Thickness = 1
BannerStroke.Parent = BannerCard

local BannerImage = Instance.new("ImageLabel")
BannerImage.Name = "BannerImage"
BannerImage.Parent = BannerCard
BannerImage.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
BannerImage.BorderSizePixel = 0
BannerImage.Size = UDim2.new(1, 0, 1, 0)
BannerImage.Image = bannerImageUri
BannerImage.ScaleType = Enum.ScaleType.Crop

-- Light grey / translucent horizontal box along the bottom with game title
local BannerOverlay = Instance.new("Frame")
BannerOverlay.Name = "Overlay"
BannerOverlay.Parent = BannerCard
BannerOverlay.BackgroundColor3 = Color3.fromRGB(42, 45, 54)
BannerOverlay.BackgroundTransparency = 0.35
BannerOverlay.BorderSizePixel = 0
BannerOverlay.Position = UDim2.new(0, 0, 1, -32)
BannerOverlay.Size = UDim2.new(1, 0, 0, 32)

local BannerOverlayLine = Instance.new("Frame")
BannerOverlayLine.Parent = BannerOverlay
BannerOverlayLine.BackgroundColor3 = Color3.fromRGB(75, 80, 96)
BannerOverlayLine.BorderSizePixel = 0
BannerOverlayLine.Position = UDim2.new(0, 0, 0, 0)
BannerOverlayLine.Size = UDim2.new(1, 0, 0, 1)

local BannerTitle = Instance.new("TextLabel")
BannerTitle.Parent = BannerOverlay
BannerTitle.BackgroundTransparency = 1.000
BannerTitle.Position = UDim2.new(0, 12, 0, 0)
BannerTitle.Size = UDim2.new(1, -24, 1, 0)
BannerTitle.Font = Enum.Font.GothamBold
BannerTitle.Text = "🔥 ESCAPE TSUNAMI FOR BRAINROT"
BannerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BannerTitle.TextSize = 11.000
BannerTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Card 1: EXPERIENCE INFO
local mInfoCard, mInfoContainer = createCard(mainPage, "EXPERIENCE INFO", 110)

local function addInfoRow(container, title, value)
    local row = Instance.new("Frame")
    row.Parent = container
    row.BackgroundTransparency = 1.000
    row.Size = UDim2.new(1, 0, 0, 20)

    local lbl = Instance.new("TextLabel")
    lbl.Parent = row
    lbl.BackgroundTransparency = 1.000
    lbl.Size = UDim2.new(0.5, 0, 1, 0)
    lbl.Font = Enum.Font.GothamMedium
    lbl.Text = title
    lbl.TextColor3 = Color3.fromRGB(150, 155, 165)
    lbl.TextSize = 11.000
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local val = Instance.new("TextLabel")
    val.Parent = row
    val.BackgroundTransparency = 1.000
    val.Position = UDim2.new(0.5, 0, 0, 0)
    val.Size = UDim2.new(0.5, 0, 1, 0)
    val.Font = Enum.Font.GothamBold
    val.Text = value
    val.TextColor3 = Color3.fromRGB(0, 170, 255)
    val.TextSize = 11.000
    val.TextXAlignment = Enum.TextXAlignment.Right
end

addInfoRow(mInfoContainer, "Place ID", tostring(game.PlaceId))
addInfoRow(mInfoContainer, "Universe ID", tostring(game.GameId ~= 0 and game.GameId or 10035204815))
addInfoRow(mInfoContainer, "Current Player", localPlayer and localPlayer.Name or "Unknown")

-- Card 2: QUICK SHORTCUTS
local mQuickCard, mQuickContainer = createCard(mainPage, "QUICK SHORTCUTS", 118)

addButton(mQuickContainer, "Instant Teleport to High Ground", "WARP", function()
    pcall(function()
        local char = localPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 100, 0)
        end
    end)
end)

addButton(mQuickContainer, "Copy Server Invite Link", "COPY", function(btn)
    local placeId = tostring(game.PlaceId)
    local jobId = tostring(game.JobId)
    local inviteUrl = (jobId ~= "" and jobId ~= "0")
        and string.format("https://www.roblox.com/games/start?placeId=%s&gameInstanceId=%s", placeId, jobId)
        or string.format("https://www.roblox.com/games/%s", placeId)

    pcall(function()
        if setclipboard then
            setclipboard(inviteUrl)
        elseif toclipboard then
            toclipboard(inviteUrl)
        elseif set_clipboard then
            set_clipboard(inviteUrl)
        elseif syn and syn.write_clipboard then
            syn.write_clipboard(inviteUrl)
        elseif Clipboard and Clipboard.set then
            Clipboard.set(inviteUrl)
        end
    end)

    if btn then
        local oldText = btn.Text
        local oldBg = btn.BackgroundColor3
        btn.Text = "COPIED!"
        btn.BackgroundColor3 = Color3.fromRGB(35, 175, 95)
        task.delay(1.5, function()
            pcall(function()
                btn.Text = oldText
                btn.BackgroundColor3 = oldBg
            end)
        end)
    end
end)

-- =========================================================
-- 14. AUTO FARM TAB
-- =========================================================
local farmPage = pages["Auto Farm"]
local farmCard, farmContainer = createCard(farmPage, "AUTOMATION & SURVIVAL", 118)

addToggle(farmContainer, "Anti-Tsunami Wave Godmode", false, function(enabled)
    pcall(function()
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and (part.Name:lower():find("wave") or part.Name:lower():find("water") or part.Name:lower():find("tsunami")) then
                part.CanTouch = not enabled
                part.CanCollide = not enabled
            end
        end
    end)
end)

addToggle(farmContainer, "Infinite Height Float", false, function(enabled)
    local char = localPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local bp = char.HumanoidRootPart:FindFirstChild("FloatBodyPosition")
        if enabled then
            if not bp then
                bp = Instance.new("BodyPosition")
                bp.Name = "FloatBodyPosition"
                bp.MaxForce = Vector3.new(0, 1e6, 0)
                bp.Position = char.HumanoidRootPart.Position + Vector3.new(0, 40, 0)
                bp.Parent = char.HumanoidRootPart
            end
        else
            if bp then bp:Destroy() end
        end
    end
end)

local function triggerCollect(collectObj, hrp)
    if not collectObj then return end

    -- 1. ProximityPrompts
    if collectObj:IsA("ProximityPrompt") then
        pcall(function()
            if fireproximityprompt then
                fireproximityprompt(collectObj)
            end
        end)
    end
    for _, prompt in ipairs(collectObj:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") then
            pcall(function()
                if fireproximityprompt then
                    fireproximityprompt(prompt)
                else
                    prompt:InputHoldBegin()
                    task.wait(0.02)
                    prompt:InputHoldEnd()
                end
            end)
        end
    end

    -- 2. ClickDetectors
    if collectObj:IsA("ClickDetector") then
        pcall(function()
            if fireclickdetector then
                fireclickdetector(collectObj)
            end
        end)
    end
    for _, cd in ipairs(collectObj:GetDescendants()) do
        if cd:IsA("ClickDetector") then
            pcall(function()
                if fireclickdetector then
                    fireclickdetector(cd)
                end
            end)
        end
    end

    -- 3. TouchTransmitters and Parts (Non-teleporting interaction)
    if hrp then
        if collectObj:IsA("BasePart") then
            pcall(function()
                if firetouchinterest then
                    firetouchinterest(hrp, collectObj, 0)
                    task.wait(0.01)
                    firetouchinterest(hrp, collectObj, 1)
                end
            end)
        end
        for _, part in ipairs(collectObj:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function()
                    if firetouchinterest then
                        firetouchinterest(hrp, part, 0)
                        task.wait(0.01)
                        firetouchinterest(hrp, part, 1)
                    end
                end)
            end
        end
    end

    -- 4. Remotes inside collectObj
    for _, rem in ipairs(collectObj:GetDescendants()) do
        if rem:IsA("RemoteEvent") then
            pcall(function() rem:FireServer() end)
        elseif rem:IsA("RemoteFunction") then
            pcall(function() rem:InvokeServer() end)
        end
    end
end

local originalCollectData = {}
local hiddenGuis = {}

local function restoreCollectButtons()
    for obj, data in pairs(originalCollectData) do
        pcall(function()
            if obj and obj.Parent then
                if data.cframe then
                    if obj:IsA("Model") then
                        obj:PivotTo(data.cframe)
                    elseif obj:IsA("BasePart") then
                        obj.CFrame = data.cframe
                        obj.CanCollide = data.canCollide
                        if data.anchored ~= nil then
                            obj.Anchored = data.anchored
                        end
                    end
                end
                if data.transparency then
                    obj.Transparency = data.transparency
                end
            end
        end)
    end
    table.clear(originalCollectData)

    for gui, wasEnabled in pairs(hiddenGuis) do
        pcall(function()
            if gui and gui.Parent then
                gui.Enabled = wasEnabled
            end
        end)
    end
    table.clear(hiddenGuis)
end

local function isOwnedByOtherPlayer(base)
    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= localPlayer then
            local oName = other.Name:lower()
            local oDisplay = other.DisplayName:lower()
            local oUserId = tostring(other.UserId)

            -- Check attributes on base
            for _, attrName in ipairs({"Owner", "OwnerName", "Player", "OwnerPlayer", "UserId", "OwnerUserId"}) do
                local val = base:GetAttribute(attrName)
                if val ~= nil then
                    local sVal = tostring(val):lower()
                    if sVal == oName or sVal == oDisplay or sVal == oUserId then
                        return true
                    end
                end
            end

            -- Check Value objects inside base
            for _, valName in ipairs({"Owner", "Player", "UserId", "OwnerUserId", "OwnerValue", "OwnerName", "PlotOwner"}) do
                local obj = base:FindFirstChild(valName) or base:FindFirstChild(valName, true)
                if obj then
                    if obj:IsA("ObjectValue") and obj.Value == other then
                        return true
                    elseif obj:IsA("StringValue") and (obj.Value:lower() == oName or obj.Value:lower() == oDisplay or obj.Value == oUserId) then
                        return true
                    elseif (obj:IsA("IntValue") or obj:IsA("NumberValue")) and obj.Value == other.UserId then
                        return true
                    end
                end
            end

            -- Check signs / text labels within the base
            for _, desc in ipairs(base:GetDescendants()) do
                if desc:IsA("TextLabel") then
                    local txt = desc.Text:lower()
                    if txt:find(oName, 1, true) or txt:find(oDisplay, 1, true) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function isOwnedByLocalPlayer(base)
    local myName = localPlayer.Name:lower()
    local myDisplayName = localPlayer.DisplayName:lower()
    local myUserId = localPlayer.UserId
    local myUserIdStr = tostring(myUserId)

    -- 1. Direct references from localPlayer
    local pBaseVal = localPlayer:FindFirstChild("Base") or localPlayer:FindFirstChild("Plot") or localPlayer:FindFirstChild("MyBase")
    if pBaseVal then
        if pBaseVal:IsA("ObjectValue") and pBaseVal.Value == base then
            return true
        elseif (pBaseVal:IsA("StringValue") or type(pBaseVal.Value) == "string") and tostring(pBaseVal.Value) == base.Name then
            return true
        end
    end
    for _, attrName in ipairs({"Base", "Plot", "BaseId", "PlotId", "MyBase"}) do
        local attr = localPlayer:GetAttribute(attrName)
        if attr and tostring(attr) == base.Name then
            return true
        end
    end

    -- 2. Attributes on base
    for _, attrName in ipairs({"Owner", "OwnerName", "Player", "OwnerPlayer", "UserId", "OwnerUserId", "PlayerUserId"}) do
        local val = base:GetAttribute(attrName)
        if val ~= nil then
            local sVal = tostring(val):lower()
            if sVal == myName or sVal == myDisplayName or sVal == myUserIdStr then
                return true
            end
        end
    end

    -- 3. Value objects inside base
    for _, valName in ipairs({"Owner", "Player", "UserId", "OwnerUserId", "OwnerValue", "OwnerName", "PlotOwner"}) do
        local obj = base:FindFirstChild(valName) or base:FindFirstChild(valName, true)
        if obj then
            if obj:IsA("ObjectValue") and obj.Value == localPlayer then
                return true
            elseif obj:IsA("StringValue") then
                local sVal = tostring(obj.Value):lower()
                if sVal == myName or sVal == myDisplayName or sVal == myUserIdStr then
                    return true
                end
            elseif (obj:IsA("IntValue") or obj:IsA("NumberValue")) and obj.Value == myUserId then
                return true
            end
        end
    end

    -- 4. Signs / text labels within base
    for _, desc in ipairs(base:GetDescendants()) do
        if desc:IsA("TextLabel") then
            local txt = desc.Text:lower()
            if txt:find(myName, 1, true) or txt:find(myDisplayName, 1, true) then
                return true
            end
        end
    end

    return false
end

-- Card 2 in Auto Farm: COLLECT ALL PAD (CASH GIVER)
local function getUserBase()
    local basesFolder = workspace:FindFirstChild("Bases") or workspace:FindFirstChild("Plots") or workspace:FindFirstChild("Tycoons")
    if not basesFolder then return nil end

    for _, base in ipairs(basesFolder:GetChildren()) do
        if not isOwnedByOtherPlayer(base) and isOwnedByLocalPlayer(base) then
            return base
        end
    end

    local explicitBase = basesFolder:FindFirstChild("{564c2876-c480-481e-b522-3163282686a8}")
    if explicitBase and not isOwnedByOtherPlayer(explicitBase) then
        return explicitBase
    end

    return nil
end

local function getFrontOfBaseCFrame(base)
    local char = localPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    -- 1. If player is near their base (within 150 studs), spawn PRECISELY where the player is standing outside!
    if hrp and base then
        local basePos = base:GetPivot().Position
        local dist = (Vector2.new(hrp.Position.X, hrp.Position.Z) - Vector2.new(basePos.X, basePos.Z)).Magnitude
        if dist < 150 then
            local rayParams = RaycastParams.new()
            rayParams.FilterType = RaycastFilterType.Exclude
            rayParams.FilterDescendantsInstances = {char}
            local rayResult = workspace:Raycast(hrp.Position + Vector3.new(0, 5, 0), Vector3.new(0, -30, 0), rayParams)
            local floorY = rayResult and rayResult.Position.Y or (hrp.Position.Y - 2.5)

            return CFrame.new(hrp.Position.X, floorY + 0.5, hrp.Position.Z)
        end
    end

    -- 2. If player is farther away, find the front entrance of the base
    if base then
        local frontPart = nil
        for _, desc in ipairs(base:GetDescendants()) do
            if desc:IsA("BasePart") then
                local n = desc.Name:lower()
                if n:find("upgrade") or n:find("rebirth") or n:find("entrance") or n:find("door") or n:find("sign") or n:find("front") then
                    frontPart = desc
                    break
                end
            end
        end

        local basePivot = base:GetPivot()
        if frontPart then
            local dir = (frontPart.Position - basePivot.Position)
            dir = Vector3.new(dir.X, 0, dir.Z).Unit
            local targetPos = frontPart.Position + dir * 14

            local rayParams = RaycastParams.new()
            rayParams.FilterType = RaycastFilterType.Exclude
            rayParams.FilterDescendantsInstances = {base}
            local rayResult = workspace:Raycast(targetPos + Vector3.new(0, 10, 0), Vector3.new(0, -30, 0), rayParams)
            local floorY = rayResult and rayResult.Position.Y or basePivot.Position.Y

            return CFrame.new(targetPos.X, floorY + 0.5, targetPos.Z)
        end

        local targetPos = basePivot.Position + basePivot.LookVector * 25
        return CFrame.new(targetPos.X, basePivot.Position.Y + 0.5, targetPos.Z)
    end

    return hrp and hrp.CFrame or CFrame.new(0, 5, 0)
end

local function getCentralCollectPad(userBase)
    if not userBase then return workspace:FindFirstChild("CashGiver") end

    -- Direct check on base children
    for _, name in ipairs({"CashGiver", "Collect", "CollectPad", "Collector", "CollectAll", "MainCollect", "Pad", "Circle", "Bank", "Cash"}) do
        local obj = userBase:FindFirstChild(name)
        if obj then return obj end
    end

    -- Check children of userBase (excluding individual brainrot Slots)
    for _, child in ipairs(userBase:GetChildren()) do
        if child.Name ~= "Slots" then
            if child.Name:lower():find("cash") or child.Name:lower():find("collect") or child.Name:lower():find("giver") or child.Name:lower():find("pad") then
                return child
            end
            for _, desc in ipairs(child:GetDescendants()) do
                if desc.Name:lower():find("cashgiver") or desc.Name:lower():find("collectpad") or desc.Name == "Collect" then
                    return desc
                end
            end
        end
    end

    -- Find the large blue/cyan circle pad near the center of the base
    local basePivot = userBase:GetPivot()
    local bestCandidate = nil
    local bestDist = 9999
    for _, desc in ipairs(userBase:GetDescendants()) do
        if desc:IsA("BasePart") and desc.Name ~= "Base" and desc.Name ~= "Floor" then
            if desc:FindFirstChildOfClass("CylinderMesh") or (desc.Size.X >= 4 and desc.Size.Z >= 4 and desc.Size.Y <= 3) then
                local dist = (desc.Position - basePivot.Position).Magnitude
                if dist < bestDist then
                    bestDist = dist
                    bestCandidate = desc
                end
            end
        end
    end
    if bestCandidate then return bestCandidate end

    if workspace:FindFirstChild("CashGiver") then
        return workspace.CashGiver
    end

    return nil
end

local spawnedPadInstance = nil
local padDisplayThread = nil

local function spawnCollectAllPad(actionBtn)
    local userBase = getUserBase()
    if not userBase then
        if actionBtn then actionBtn.Text = "NO PLOT!" end
        task.delay(1.5, function() if actionBtn then actionBtn.Text = "SPAWN" end end)
        return
    end

    local targetCFrame = getFrontOfBaseCFrame(userBase)

    -- Clean up previous instance if already spawned
    if workspace:FindFirstChild("InfinityCollectAllPad") then
        pcall(function() workspace.InfinityCollectAllPad:Destroy() end)
    end

    -- 1. Move that blue circular collect pad from the middle of the base to outside in front of the base
    local centralPad = getCentralCollectPad(userBase)
    local padObj = nil
    if centralPad then
        if centralPad:IsA("Model") then
            if not originalCollectData[centralPad] then
                originalCollectData[centralPad] = { cframe = centralPad:GetPivot() }
            end
            centralPad:PivotTo(targetCFrame)
        elseif centralPad:IsA("BasePart") then
            if not originalCollectData[centralPad] then
                originalCollectData[centralPad] = {
                    cframe = centralPad.CFrame,
                    canCollide = centralPad.CanCollide,
                    transparency = centralPad.Transparency,
                    anchored = centralPad.Anchored
                }
            end
            centralPad.CFrame = targetCFrame
            centralPad.Anchored = true
        end
        padObj = centralPad
    end

    -- 2. Also try game.Workspace.CashGiver
    local cashGiver = workspace:FindFirstChild("CashGiver")
    if cashGiver and cashGiver ~= centralPad then
        pcall(function()
            local clone = cashGiver:Clone()
            clone.Name = "InfinityCollectAllPad"
            clone.Parent = workspace
            if clone:IsA("Model") then
                clone:PivotTo(targetCFrame)
            elseif clone:IsA("BasePart") then
                clone.CFrame = targetCFrame
                clone.Anchored = true
            end
            if not padObj then padObj = clone end
        end)
    end

    -- Fallback: If no pad object exists, create an attractive neon visual pad
    if not padObj or not padObj.Parent then
        local padPart = Instance.new("Part")
        padPart.Name = "InfinityCollectAllPad"
        padPart.Size = Vector3.new(10, 0.8, 10)
        padPart.CFrame = targetCFrame
        padPart.Anchored = true
        padPart.CanCollide = true
        padPart.Material = Enum.Material.Neon
        padPart.Color = Color3.fromRGB(0, 230, 140)

        local cylinder = Instance.new("CylinderMesh")
        cylinder.Parent = padPart

        local sel = Instance.new("SelectionBox")
        sel.Adornee = padPart
        sel.Color3 = Color3.fromRGB(255, 255, 255)
        sel.Parent = padPart

        padPart.Parent = workspace
        padObj = padPart
    end

    spawnedPadInstance = padObj
    local padBasePart = padObj:IsA("BasePart") and padObj or padObj:FindFirstChildWhichIsA("BasePart") or padObj.PrimaryPart
    local padCFrame = padBasePart and padBasePart.CFrame or targetCFrame

    -- 3. Spawn all slot collection pads INSIDE this pad and lock them in place so they don't move
    if userBase:FindFirstChild("Slots") then
        for _, slot in ipairs(userBase.Slots:GetChildren()) do
            local collectObjects = {}
            local directCollect = slot:FindFirstChild("Collect")
            if directCollect then table.insert(collectObjects, directCollect) end
            for _, desc in ipairs(slot:GetDescendants()) do
                if desc.Name == "Collect" and desc ~= directCollect then
                    table.insert(collectObjects, desc)
                end
            end

            for _, collectObj in ipairs(collectObjects) do
                local parts = {}
                if collectObj:IsA("BasePart") then table.insert(parts, collectObj) end
                for _, p in ipairs(collectObj:GetDescendants()) do
                    if p:IsA("BasePart") then table.insert(parts, p) end
                end

                for _, part in ipairs(parts) do
                    if not originalCollectData[part] then
                        originalCollectData[part] = {
                            cframe = part.CFrame,
                            canCollide = part.CanCollide,
                            transparency = part.Transparency,
                            anchored = part.Anchored
                        }
                    end
                    -- Lock inside the pad permanently: anchored, non-collidable, transparent
                    part.CanCollide = false
                    part.Transparency = 1
                    part.Anchored = true
                    part.CFrame = padCFrame * CFrame.new(0, 0.4, 0)
                end
            end
        end
    end

    -- 4. Connect Touched event so stepping on pad collects all slots simultaneously
    if padBasePart then
        padBasePart.Touched:Connect(function(hit)
            local char = hit.Parent
            local p = Players:GetPlayerFromCharacter(char)
            if p == localPlayer then
                if userBase:FindFirstChild("Slots") then
                    for _, slot in ipairs(userBase.Slots:GetChildren()) do
                        local collectObj = slot:FindFirstChild("Collect")
                        if collectObj then
                            triggerCollect(collectObj, char:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                end
            end
        end)

        -- Proximity collection backup (guarantees collection even if CanTouch is disabled for godmode)
        task.spawn(function()
            while spawnedPadInstance and spawnedPadInstance.Parent do
                pcall(function()
                    local char = localPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp and padBasePart and userBase and userBase:FindFirstChild("Slots") then
                        local padPos = padBasePart.Position
                        local dist = (Vector2.new(hrp.Position.X, hrp.Position.Z) - Vector2.new(padPos.X, padPos.Z)).Magnitude
                        if dist < 8 and math.abs(hrp.Position.Y - padPos.Y) < 5 then
                            for _, slot in ipairs(userBase.Slots:GetChildren()) do
                                local collectObj = slot:FindFirstChild("Collect")
                                if collectObj then
                                    triggerCollect(collectObj, hrp)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.2)
            end
        end)
    end

    -- 4. Floating Text above the Pad showing Total Collect Amount
    local bb = Instance.new("BillboardGui")
    bb.Name = "CollectAllBillboard"
    bb.Size = UDim2.new(0, 260, 0, 70)
    bb.StudsOffset = Vector3.new(0, 5, 0)
    bb.AlwaysOnTop = true
    bb.MaxDistance = 250
    bb.Parent = padBasePart

    local title = Instance.new("TextLabel")
    title.Name = "TitleLabel"
    title.Parent = bb
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 22)
    title.Font = Enum.Font.GothamBold
    title.Text = "🌟 COLLECT ALL PAD 🌟"
    title.TextColor3 = Color3.fromRGB(255, 220, 60)
    title.TextSize = 15
    title.TextStrokeTransparency = 0
    title.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)

    local amountLabel = Instance.new("TextLabel")
    amountLabel.Name = "AmountLabel"
    amountLabel.Parent = bb
    amountLabel.BackgroundTransparency = 1
    amountLabel.Position = UDim2.new(0, 0, 0, 24)
    amountLabel.Size = UDim2.new(1, 0, 0, 30)
    amountLabel.Font = Enum.Font.GothamBlack
    amountLabel.Text = "$0 Ready"
    amountLabel.TextColor3 = Color3.fromRGB(50, 255, 140)
    amountLabel.TextSize = 19
    amountLabel.TextStrokeTransparency = 0
    amountLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 15)

    -- Background real-time updater for total collect amount
    if padDisplayThread then task.cancel(padDisplayThread) end
    padDisplayThread = task.spawn(function()
        while spawnedPadInstance and spawnedPadInstance.Parent do
            pcall(function()
                local totalVal = 0
                local hasAmount = false

                if userBase and userBase:FindFirstChild("Slots") then
                    for _, slot in ipairs(userBase.Slots:GetChildren()) do
                        for _, valName in ipairs({"Amount", "Cash", "Value", "Stored", "Coins", "Money", "Income"}) do
                            local valObj = slot:FindFirstChild(valName) or (slot:FindFirstChild("Collect") and slot.Collect:FindFirstChild(valName))
                            if valObj and (valObj:IsA("NumberValue") or valObj:IsA("IntValue")) then
                                totalVal = totalVal + valObj.Value
                                hasAmount = true
                            end
                        end

                        for _, desc in ipairs(slot:GetDescendants()) do
                            if desc:IsA("TextLabel") and desc.Parent and desc.Parent.Name ~= "CollectAllBillboard" then
                                local clean = desc.Text:gsub("[$,]", "")
                                local num = tonumber(clean)
                                if num then
                                    totalVal = totalVal + num
                                    hasAmount = true
                                elseif clean:lower():find("k") then
                                    local kNum = tonumber(clean:lower():gsub("k", ""))
                                    if kNum then
                                        totalVal = totalVal + (kNum * 1000)
                                        hasAmount = true
                                    end
                                elseif clean:lower():find("m") then
                                    local mNum = tonumber(clean:lower():gsub("m", ""))
                                    if mNum then
                                        totalVal = totalVal + (mNum * 1000000)
                                        hasAmount = true
                                    end
                                end
                            end
                        end
                    end
                end

                if hasAmount and totalVal > 0 then
                    local formatted = tostring(math.floor(totalVal))
                    local k
                    while true do
                        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
                        if k == 0 then break end
                    end
                    amountLabel.Text = "$" .. formatted .. " Ready"
                else
                    amountLabel.Text = "Walk over to Collect All"
                end
            end)
            task.wait(0.5)
        end
    end)

    if actionBtn then
        local oldText = actionBtn.Text
        local oldBg = actionBtn.BackgroundColor3
        actionBtn.Text = "SPAWNED!"
        actionBtn.BackgroundColor3 = Color3.fromRGB(35, 175, 95)
        task.delay(1.5, function()
            pcall(function()
                actionBtn.Text = oldText
                actionBtn.BackgroundColor3 = oldBg
            end)
        end)
    end
end

local function resetCollectAllPad(actionBtn)
    pcall(restoreCollectButtons)
    if spawnedPadInstance then
        pcall(function()
            if spawnedPadInstance.Name == "InfinityCollectAllPad" then
                spawnedPadInstance:Destroy()
            end
        end)
        spawnedPadInstance = nil
    end
    if padDisplayThread then
        task.cancel(padDisplayThread)
        padDisplayThread = nil
    end

    if actionBtn then
        local oldText = actionBtn.Text
        local oldBg = actionBtn.BackgroundColor3
        actionBtn.Text = "RESET!"
        actionBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
        task.delay(1.5, function()
            pcall(function()
                actionBtn.Text = oldText
                actionBtn.BackgroundColor3 = oldBg
            end)
        end)
    end
end

local padCard, padContainer = createCard(farmPage, "COLLECT ALL PAD (CASH GIVER)", 118)

addButton(padContainer, "Spawn Collect All Pad", "SPAWN", function(btn)
    spawnCollectAllPad(btn)
end)

addButton(padContainer, "Reset Pads to Slots", "RESET", function(btn)
    resetCollectAllPad(btn)
end)

-- =========================================================
-- 15. BRAINROTS & UPGRADES TAB
-- =========================================================
local brainrotPage = pages["Brainrots"]
local bCard, bContainer = createCard(brainrotPage, "BRAINROT MULTIPLIERS", 125)

local autoUpgradeSpeed = false
addToggle(bContainer, "Auto Upgrade Run Speed", false, function(enabled)
    autoUpgradeSpeed = enabled
    task.spawn(function()
        while autoUpgradeSpeed do
            pcall(function()
                local rem = game:GetService("ReplicatedStorage"):FindFirstChild("UpgradeSpeed") or game:GetService("ReplicatedStorage"):FindFirstChild("Upgrade")
                if rem and rem:IsA("RemoteEvent") then
                    rem:FireServer()
                end
            end)
            task.wait(1)
        end
    end)
end)

local autoRebirth = false
addToggle(bContainer, "Auto Rebirth Score Multiplier", false, function(enabled)
    autoRebirth = enabled
    task.spawn(function()
        while autoRebirth do
            pcall(function()
                local rem = game:GetService("ReplicatedStorage"):FindFirstChild("Rebirth") or game:GetService("ReplicatedStorage"):FindFirstChild("AutoRebirth")
                if rem and rem:IsA("RemoteEvent") then
                    rem:FireServer()
                end
            end)
            task.wait(2)
        end
    end)
end)

-- Card 2 in Brainrots: WAVE PROTECTION (ACTIVETSUNAMIS)
local waveCard, waveContainer = createCard(brainrotPage, "WAVE PROTECTION (ACTIVETSUNAMIS)", 152)

local removeWavesEnabled = false
local phaseWavesEnabled = false
local tempInvulnerable = false

-- 1. Anti-Death & Anti-Damage Character Shield
local function protectPlayer()
    pcall(function()
        local char = localPlayer.Character
        if not char then return end

        -- Disable CanTouch on all character parts so no Touched event ever fires (on client or server)
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.CanTouch = false
            end
        end

        -- Prevent Humanoid Death & BreakJoints
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            hum.BreakJointsOnDeath = false
            if hum.Health < hum.MaxHealth then
                hum.Health = hum.MaxHealth
            end
        end

        -- Invisible ForceField to block any TakeDamage calls
        if not char:FindFirstChildOfClass("ForceField") then
            local ff = Instance.new("ForceField")
            ff.Visible = false
            ff.Parent = char
        end

        -- Disable Touched connections on character parts if executor supports getconnections
        if getconnections then
            for _, desc in ipairs(char:GetDescendants()) do
                if desc:IsA("BasePart") then
                    for _, conn in ipairs(getconnections(desc.Touched)) do
                        pcall(function() conn:Disable() end)
                    end
                end
            end
        end

        -- Anti-push impulse dampener: keep character stable against sudden wave physics blasts
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp and hrp.AssemblyLinearVelocity.Magnitude > 75 then
            hrp.AssemblyLinearVelocity = Vector3.new(0, math.clamp(hrp.AssemblyLinearVelocity.Y, -20, 20), 0)
        end
    end)
end

-- 2. Hook RemoteEvents to block any client-to-server Damage/Kill remotes
pcall(function()
    if hookmetamethod then
        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if (method == "FireServer" or method == "fireServer") and not checkcaller() then
                local n = tostring(self.Name):lower()
                if (removeWavesEnabled or phaseWavesEnabled or tempInvulnerable) and (n:find("damage") or n:find("kill") or n:find("die") or n:find("death") or n:find("hurt") or n:find("tsunami") or n:find("hit")) then
                    return nil
                end
            end
            return oldNamecall(self, ...)
        end)
    end
end)

-- 3. Eliminate / Neutralize Wave with Void Teleport
local function processTsunamiWave(wave, shouldDestroy)
    if not wave then return end
    pcall(function()
        local voidCF = CFrame.new(0, -999999, 0)

        -- Neutralize and disable scripts/connections first
        for _, desc in ipairs(wave:GetDescendants()) do
            if desc:IsA("BasePart") then
                desc.CanCollide = false
                desc.CanTouch = false
                desc.CanQuery = false
                desc.AssemblyLinearVelocity = Vector3.zero
                desc.AssemblyAngularVelocity = Vector3.zero
                desc.Velocity = Vector3.zero
                desc.RotVelocity = Vector3.zero
                if getconnections then
                    for _, c in ipairs(getconnections(desc.Touched)) do
                        pcall(function() c:Disable() end)
                    end
                end
            elseif desc:IsA("Script") or desc:IsA("LocalScript") then
                pcall(function() desc.Disabled = true end)
            elseif desc:IsA("TouchTransmitter") or desc:IsA("BodyVelocity") or desc:IsA("LinearVelocity") or desc:IsA("VectorForce") or desc:IsA("BodyPosition") then
                pcall(function() desc:Destroy() end)
            end
        end

        if wave:IsA("BasePart") then
            wave.CanCollide = false
            wave.CanTouch = false
            wave.CanQuery = false
            wave.AssemblyLinearVelocity = Vector3.zero
            wave.AssemblyAngularVelocity = Vector3.zero
        end

        -- Teleport 1,000,000 studs into the void so hitbox cannot overlap player during removal
        if shouldDestroy then
            if wave:IsA("Model") then
                pcall(function() wave:PivotTo(voidCF) end)
            end
            for _, p in ipairs(wave:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.CFrame = voidCF
                    p.Transparency = 1
                end
            end
            pcall(function() wave:Destroy() end)
        end
    end)
end

local function purgeActiveTsunamis(shouldDestroy)
    protectPlayer()
    pcall(function()
        local tsunamisFolder = workspace:FindFirstChild("ActiveTsunamis")
        if tsunamisFolder then
            for _, wave in ipairs(tsunamisFolder:GetChildren()) do
                processTsunamiWave(wave, shouldDestroy)
            end
        end
        for _, obj in ipairs(workspace:GetChildren()) do
            if obj.Name:lower():find("tsunami") or obj.Name:lower():find("wave") then
                processTsunamiWave(obj, shouldDestroy)
            end
        end
    end)
end

-- 4. Real-time frame enforcement via RunService.Stepped
RunService.Stepped:Connect(function()
    if removeWavesEnabled or phaseWavesEnabled or tempInvulnerable then
        protectPlayer()
    end
end)

-- 5. Real-time watcher on workspace.ActiveTsunamis
pcall(function()
    local function watchFolder(folder)
        if not folder then return end
        folder.ChildAdded:Connect(function(child)
            task.defer(function()
                if removeWavesEnabled then
                    protectPlayer()
                    processTsunamiWave(child, true)
                elseif phaseWavesEnabled then
                    protectPlayer()
                    processTsunamiWave(child, false)
                end
            end)
        end)
    end

    local existingFolder = workspace:FindFirstChild("ActiveTsunamis")
    if existingFolder then
        watchFolder(existingFolder)
    end

    workspace.ChildAdded:Connect(function(child)
        if child.Name == "ActiveTsunamis" then
            watchFolder(child)
            task.defer(function()
                if removeWavesEnabled then
                    protectPlayer()
                    for _, w in ipairs(child:GetChildren()) do
                        processTsunamiWave(w, true)
                    end
                elseif phaseWavesEnabled then
                    protectPlayer()
                    for _, w in ipairs(child:GetChildren()) do
                        processTsunamiWave(w, false)
                    end
                end
            end)
        elseif child.Name:lower():find("tsunami") or child.Name:lower():find("wave") then
            task.defer(function()
                if removeWavesEnabled then
                    protectPlayer()
                    processTsunamiWave(child, true)
                elseif phaseWavesEnabled then
                    protectPlayer()
                    processTsunamiWave(child, false)
                end
            end)
        end
    end)
end)

-- Background loop to sweep periodically
task.spawn(function()
    while true do
        if removeWavesEnabled then
            protectPlayer()
            purgeActiveTsunamis(true)
        elseif phaseWavesEnabled then
            protectPlayer()
            purgeActiveTsunamis(false)
        end
        task.wait(0.2)
    end
end)

addToggle(waveContainer, "Remove Waves (No Push / No Hurt)", false, function(enabled)
    removeWavesEnabled = enabled
    if enabled then
        protectPlayer()
        purgeActiveTsunamis(true)
    end
end)

addToggle(waveContainer, "Phase Waves (Ghost / No Push)", false, function(enabled)
    phaseWavesEnabled = enabled
    if enabled then
        protectPlayer()
        purgeActiveTsunamis(false)
    end
end)

addButton(waveContainer, "Clear Active Waves Now", "CLEAR", function(btn)
    tempInvulnerable = true
    protectPlayer()
    purgeActiveTsunamis(true)

    -- Continuous 3.5-second anti-death bubble while wave finishes passing
    task.spawn(function()
        local start = tick()
        while tick() - start < 3.5 do
            protectPlayer()
            purgeActiveTsunamis(true)
            task.wait(0.08)
        end
        tempInvulnerable = false
    end)

    if btn then
        local oldText = btn.Text
        local oldBg = btn.BackgroundColor3
        btn.Text = "CLEARED!"
        btn.BackgroundColor3 = Color3.fromRGB(35, 175, 95)
        task.delay(1.5, function()
            pcall(function()
                btn.Text = oldText
                btn.BackgroundColor3 = oldBg
            end)
        end)
    end
end)

-- Card 3 in Brainrots: BRAINROT GRABBER
local grabCard, grabContainer = createCard(brainrotPage, "BRAINROT GRABBER (BEST /S)", 195)

local autoGrabBestEnabled = false
local grabberActive = false

-- Utility to extract numeric /s multiplier/value from string or instance
local function parseBrainrotValue(descendant)
    local bestVal = 0
    if not descendant then return 0 end

    -- 1. Direct Value objects
    for _, valName in ipairs({"Value", "PerSecond", "Rate", "Income", "Multiplier", "Cash", "Amount", "Coins", "Money"}) do
        local obj = descendant:FindFirstChild(valName)
        if obj and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            if obj.Value > bestVal then
                bestVal = obj.Value
            end
        end
    end

    -- 2. Scan TextLabels/SurfaceGuis for "/s", "/sec", "$", numbers
    for _, item in ipairs(descendant:GetDescendants()) do
        if item:IsA("NumberValue") or item:IsA("IntValue") then
            if item.Value > bestVal then bestVal = item.Value end
        elseif item:IsA("TextLabel") or item:IsA("TextButton") then
            local txt = item.Text:lower()
            if txt:find("/s") or txt:find("/sec") or txt:find("$") or txt:find("x") then
                local clean = txt:gsub("/s", ""):gsub("/sec", ""):gsub("[$,x+]", ""):gsub("%s+", "")
                local multiplier = 1
                if clean:find("m") then
                    multiplier = 1000000
                    clean = clean:gsub("m", "")
                elseif clean:find("k") then
                    multiplier = 1000
                    clean = clean:gsub("k", "")
                elseif clean:find("b") then
                    multiplier = 1000000000
                    clean = clean:gsub("b", "")
                end
                local n = tonumber(clean)
                if n and (n * multiplier) > bestVal then
                    bestVal = n * multiplier
                end
            end
        end
    end

    return bestVal
end

-- Find all collectible brainrots on map (outside player bases)
local function findBestBrainrot()
    local bestObj = nil
    local bestScore = -1
    local bestName = "Unknown"

    local myBase = getUserBase()

    local searchContainers = {
        workspace:FindFirstChild("Brainrots"),
        workspace:FindFirstChild("Drops"),
        workspace:FindFirstChild("Collectibles"),
        workspace:FindFirstChild("Items"),
        workspace:FindFirstChild("Spawns"),
        workspace:FindFirstChild("Spawned"),
        workspace:FindFirstChild("Debris"),
        workspace:FindFirstChild("Pickups")
    }

    local candidates = {}
    for _, container in ipairs(searchContainers) do
        if container then
            for _, child in ipairs(container:GetChildren()) do
                table.insert(candidates, child)
            end
        end
    end

    -- Also check direct workspace children that match brainrot names or items
    for _, child in ipairs(workspace:GetChildren()) do
        if child.Name ~= "Terrain" and child.Name ~= "Camera" and child.Name ~= "Bases" and child.Name ~= "Plots" and child.Name ~= "Tycoons" and child.Name ~= "ActiveTsunamis" then
            local n = child.Name:lower()
            if n:find("brainrot") or n:find("drop") or n:find("item") or n:find("spawn") or n:find("collect") then
                table.insert(candidates, child)
            end
        end
    end

    for _, cand in ipairs(candidates) do
        -- Ensure candidate is not inside user base or another base
        local inBase = false
        if myBase and cand:IsDescendantOf(myBase) then inBase = true end
        if not inBase then
            local val = parseBrainrotValue(cand)
            -- If no explicit value, score by highest number in name or default 1
            if val <= 0 then
                local numInName = tonumber(cand.Name:match("%d+"))
                val = numInName or 1
            end
            if val > bestScore then
                bestScore = val
                bestObj = cand
                bestName = cand.Name
            end
        end
    end

    return bestObj, bestScore, bestName
end

-- Action: Pick up / trigger claim for a brainrot item
local function interactAndPickup(target, hrp)
    if not target or not hrp then return end
    pcall(function()
        -- 1. Touch interaction
        local targetPart = target:IsA("BasePart") and target or target:FindFirstChildWhichIsA("BasePart") or target.PrimaryPart
        if targetPart then
            if firetouchinterest then
                firetouchinterest(hrp, targetPart, 0)
                task.wait(0.05)
                firetouchinterest(hrp, targetPart, 1)
            else
                hrp.CFrame = targetPart.CFrame
            end
        end

        -- 2. ProximityPrompt interaction
        for _, desc in ipairs(target:GetDescendants()) do
            if desc:IsA("ProximityPrompt") then
                if fireproximityprompt then
                    fireproximityprompt(desc)
                else
                    desc:InputHoldBegin()
                    task.wait(0.05)
                    desc:InputHoldEnd()
                end
            elseif desc:IsA("ClickDetector") and fireclickdetector then
                fireclickdetector(desc)
            elseif desc:IsA("TouchTransmitter") and desc.Parent and firetouchinterest then
                firetouchinterest(hrp, desc.Parent, 0)
                task.wait(0.05)
                firetouchinterest(hrp, desc.Parent, 1)
            end
        end
    end)
end

-- Main Grab Cycle: Teleport to best -> Pick up -> Teleport back to plot to claim
local function grabBestBrainrotCycle(actionBtn)
    if grabberActive then return end
    grabberActive = true

    task.spawn(function()
        pcall(function()
            local char = localPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then
                grabberActive = false
                return
            end

            local userBase = getUserBase()
            local baseClaimCFrame = userBase and getFrontOfBaseCFrame(userBase) or hrp.CFrame

            -- Protect player during teleportation so waves or hazards cannot kill
            protectPlayer()

            local bestObj, bestScore, bestName = findBestBrainrot()
            if not bestObj then
                if actionBtn then actionBtn.Text = "NONE FOUND!" end
                task.delay(1.5, function() if actionBtn then actionBtn.Text = "GRAB BEST" end end)
                grabberActive = false
                return
            end

            local targetPart = bestObj:IsA("BasePart") and bestObj or bestObj:FindFirstChildWhichIsA("BasePart") or bestObj.PrimaryPart
            local targetCF = targetPart and targetPart.CFrame or bestObj:GetPivot()

            if actionBtn then actionBtn.Text = "WARPING..." end

            -- Step 1: Teleport to the best brainrot
            protectPlayer()
            hrp.CFrame = targetCF + Vector3.new(0, 3, 0)
            task.wait(0.2)

            -- Step 2: Auto Pick it up
            interactAndPickup(bestObj, hrp)
            task.wait(0.35)

            -- Step 3: Teleport back to player's plot to claim
            if actionBtn then actionBtn.Text = "CLAIMING..." end
            protectPlayer()
            hrp.CFrame = baseClaimCFrame + Vector3.new(0, 3, 0)
            task.wait(0.2)

            -- Step 4: Claim on plot (trigger base dropoff / claim pads)
            if userBase then
                for _, desc in ipairs(userBase:GetDescendants()) do
                    if desc:IsA("BasePart") then
                        local n = desc.Name:lower()
                        if n:find("claim") or n:find("deposit") or n:find("slot") or n:find("collect") then
                            interactAndPickup(desc, hrp)
                        end
                    end
                end
            end

            if actionBtn then
                actionBtn.Text = "CLAIMED!"
                task.delay(1.5, function() actionBtn.Text = "GRAB BEST" end)
            end
        end)

        grabberActive = false
    end)
end

-- Toggle: Auto Grab Best Brainrot Loop
addToggle(grabContainer, "Auto Grab Best Brainrot (/s)", false, function(enabled)
    autoGrabBestEnabled = enabled
    if enabled then
        task.spawn(function()
            while autoGrabBestEnabled do
                pcall(function()
                    grabBestBrainrotCycle(nil)
                end)
                task.wait(2)
            end
        end)
    end
end)

-- Button: Instant Grab Best Brainrot Now
addButton(grabContainer, "Grab Best Brainrot & Claim", "GRAB", function(btn)
    grabBestBrainrotCycle(btn)
end)

-- Button: Teleport To My Plot
addButton(grabContainer, "Teleport to My Plot", "WARP", function(btn)
    pcall(function()
        local char = localPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local userBase = getUserBase()
        if hrp and userBase then
            local cf = getFrontOfBaseCFrame(userBase)
            hrp.CFrame = cf + Vector3.new(0, 3, 0)
            if btn then
                local oldText = btn.Text
                btn.Text = "WARPED!"
                task.delay(1.5, function() btn.Text = oldText end)
            end
        elseif btn then
            btn.Text = "NO PLOT!"
            task.delay(1.5, function() btn.Text = "WARP" end)
        end
    end)
end)


local upgradePage = pages["Upgrades"]
local uCard, uContainer = createCard(upgradePage, "CHARACTER BOOSTS", 85)

addButton(uContainer, "Max All Available Free Upgrades", "UPGRADE", function()
    pcall(function()
        for _, rem in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if rem:IsA("RemoteEvent") and (rem.Name:lower():find("upgrade") or rem.Name:lower():find("buy")) then
                rem:FireServer()
            end
        end
    end)
end)

-- =========================================================
-- 16. TELEPORTS TAB
-- =========================================================
local tpPage = pages["Teleports"]
local tpCard, tpContainer = createCard(tpPage, "WARP LOCATIONS", 125)

addButton(tpContainer, "Teleport to Spawn / Lobby", "WARP", function()
    pcall(function()
        local char = localPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local spawnPoint = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Lobby")
            if spawnPoint then
                char.HumanoidRootPart.CFrame = (spawnPoint:IsA("BasePart") and spawnPoint.CFrame or spawnPoint:GetPivot()) + Vector3.new(0, 5, 0)
            else
                char.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
            end
        end
    end)
end)

addButton(tpContainer, "Teleport Safe Zone Mountain", "WARP", function()
    pcall(function()
        local char = localPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 150, 0)
        end
    end)
end)

-- =========================================================
-- 17. PLAYER MODS TAB
-- =========================================================
local playerPage = pages["Player Mods"]
local pCard, pContainer = createCard(playerPage, "PHYSICS & MOVEMENT", 240)

local currentSpeed = 16
addSlider(pContainer, "WalkSpeed Multiplier", 16, 250, 16, function(val)
    currentSpeed = val
    pcall(function()
        local char = localPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = val
        end
    end)
end)

local currentJump = 50
addSlider(pContainer, "JumpPower Boost", 50, 300, 50, function(val)
    currentJump = val
    pcall(function()
        local char = localPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.UseJumpPower = true
            char.Humanoid.JumpPower = val
        end
    end)
end)

local infJump = false
addToggle(pContainer, "Infinite Jump in Air", false, function(enabled)
    infJump = enabled
end)

UserInputService.JumpRequest:Connect(function()
    if infJump then
        pcall(function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

local noclip = false
addToggle(pContainer, "Noclip Through Obstacles", false, function(enabled)
    noclip = enabled
end)

RunService.Stepped:Connect(function()
    if noclip then
        pcall(function()
            local char = localPlayer.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end)

-- Maintain walkspeed/jump on respawn
localPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        task.wait(0.2)
        hum.WalkSpeed = currentSpeed
        hum.UseJumpPower = true
        hum.JumpPower = currentJump
    end
end)

-- =========================================================
-- 18. VISUALS & ESP TAB
-- =========================================================
local visPage = pages["Visuals"]
local vCard, vContainer = createCard(visPage, "LIGHTING & SENSORS", 125)

local fullbright = false
addToggle(vContainer, "Fullbright World Lighting", false, function(enabled)
    fullbright = enabled
    pcall(function()
        if enabled then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 1e6
            Lighting.GlobalShadows = false
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.FogEnd = 10000
            Lighting.GlobalShadows = true
        end
    end)
end)

local waveEsp = false
local waveBox = nil
addToggle(vContainer, "Tsunami Wave Tracker ESP", false, function(enabled)
    waveEsp = enabled
    if not enabled and waveBox then
        waveBox:Destroy()
        waveBox = nil
    end
    task.spawn(function()
        while waveEsp do
            pcall(function()
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") and (part.Name:lower():find("wave") or part.Name:lower():find("tsunami")) then
                        if not waveBox then
                            waveBox = Instance.new("Highlight")
                            waveBox.FillColor = Color3.fromRGB(0, 170, 255)
                            waveBox.OutlineColor = Color3.fromRGB(255, 255, 255)
                            waveBox.Adornee = part
                            waveBox.Parent = part
                        end
                        break
                    end
                end
            end)
            task.wait(2)
        end
    end)
end)

-- =========================================================
-- 19. SETTINGS & SERVER CONTROLS TAB
-- =========================================================
local setPage = pages["Settings"]
local sCard, sContainer = createCard(setPage, "SERVER & UI OPTIONS", 160)

addButton(sContainer, "Copy Discord Server Link", "COPY", function()
    local link = "https://discord.gg/infinityhub"
    if setclipboard then
        setclipboard(link)
    end
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Infinity Hub",
            Text = "Discord link copied to clipboard!",
            Duration = 4
        })
    end)
end)

addButton(sContainer, "Rejoin Current Server", "REJOIN", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
end)

addButton(sContainer, "Unload Infinity Script", "UNLOAD", function()
    if clickSound then clickSound:Play() end
    if waveBox then waveBox:Destroy() end
    StandaloneGui:Destroy()
end)

-- =========================================================
-- 20. BOTTOM STATUS BAR
-- =========================================================
local BottomBar = Instance.new("Frame")
BottomBar.Name = "BottomBar"
BottomBar.Parent = MainFrame
BottomBar.BackgroundColor3 = Color3.fromRGB(15, 16, 19)
BottomBar.BorderSizePixel = 0
BottomBar.Position = UDim2.new(0, 0, 1, -30)
BottomBar.Size = UDim2.new(1, 0, 0, 30)

local BottomTopLine = Instance.new("Frame")
BottomTopLine.Parent = BottomBar
BottomTopLine.BackgroundColor3 = Color3.fromRGB(38, 40, 48)
BottomTopLine.BorderSizePixel = 0
BottomTopLine.Size = UDim2.new(1, 0, 0, 1)

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = BottomBar
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.BorderSizePixel = 0
DiscordBtn.Position = UDim2.new(0, 10, 0.5, -10)
DiscordBtn.Size = UDim2.new(0, 80, 0, 20)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.Text = "DISCORD"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 10.000

local dCorner = Instance.new("UICorner")
dCorner.CornerRadius = UDim.new(0, 4)
dCorner.Parent = DiscordBtn

DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard("https://discord.gg/infinityhub") end
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Infinity Hub",
            Text = "Discord invite copied!",
            Duration = 3
        })
    end)
end)

local ExecLabel = Instance.new("TextLabel")
ExecLabel.Parent = BottomBar
ExecLabel.BackgroundTransparency = 1.000
ExecLabel.Position = UDim2.new(0, 100, 0, 0)
ExecLabel.Size = UDim2.new(0, 160, 1, 0)
ExecLabel.Font = Enum.Font.Gotham
local execName = (identifyexecutor and identifyexecutor()) or "Universal"
ExecLabel.Text = "Exec: " .. tostring(execName)
ExecLabel.TextColor3 = Color3.fromRGB(130, 135, 145)
ExecLabel.TextSize = 10.500
ExecLabel.TextXAlignment = Enum.TextXAlignment.Left

local FpsLabel = Instance.new("TextLabel")
FpsLabel.Parent = BottomBar
FpsLabel.BackgroundTransparency = 1.000
FpsLabel.Position = UDim2.new(1, -140, 0, 0)
FpsLabel.Size = UDim2.new(0, 130, 1, 0)
FpsLabel.Font = Enum.Font.Gotham
FpsLabel.Text = "60 FPS  |  v1.0"
FpsLabel.TextColor3 = Color3.fromRGB(130, 135, 145)
FpsLabel.TextSize = 10.500
FpsLabel.TextXAlignment = Enum.TextXAlignment.Right

local lastFpsUpdate = tick()
local frameCount = 0
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    if now - lastFpsUpdate >= 1 then
        local fps = math.round(frameCount / (now - lastFpsUpdate))
        FpsLabel.Text = tostring(fps) .. " FPS  |  v1.0"
        frameCount = 0
        lastFpsUpdate = now
    end
end)

-- =========================================================
-- 21. FLOATING DRAGGABLE TOGGLE BUTTON (Open / Close Menu)
-- =========================================================
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "InfinityToggleButton"
ToggleButton.Parent = StandaloneGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(24, 25, 30)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0, 16, 0.5, -20)
ToggleButton.Size = UDim2.new(0, 115, 0, 36)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "🌊 INFINITY"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 13.000
ToggleButton.ZIndex = 20

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 170, 255)
ToggleStroke.Thickness = 1.5
ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ToggleStroke.Parent = ToggleButton

-- Draggable Toggle Button Logic
local isToggleDragging = false
local toggleDragStart = nil
local toggleStartPos = nil

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isToggleDragging = true
        toggleDragStart = input.Position
        toggleStartPos = ToggleButton.Position

        local conn
        conn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                task.delay(0.05, function()
                    isToggleDragging = false
                end)
                if conn then conn:Disconnect() end
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isToggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - toggleDragStart
        ToggleButton.Position = UDim2.new(
            toggleStartPos.X.Scale,
            toggleStartPos.X.Offset + delta.X,
            toggleStartPos.Y.Scale,
            toggleStartPos.Y.Offset + delta.Y
        )
    end
end)

local toggleDebounce = false
ToggleButton.MouseButton1Click:Connect(function()
    if isToggleDragging or toggleDebounce then return end
    toggleDebounce = true
    if clickSound then clickSound:Play() end
    MainFrame.Visible = not MainFrame.Visible
    task.delay(0.2, function() toggleDebounce = false end)
end)

-- Keybind Toggles (RightControl or RightShift)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and (input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Enum.KeyCode.RightShift) then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Default Active Tab
selectTab("Main")

-- Notification
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Infinity Hub",
        Text = "Loaded! Click 🌊 INFINITY or press RightShift to toggle.",
        Duration = 6
    })
end)

print("[Infinity] Escape Tsunami for brainrot script loaded successfully!")

end) -- End of pcall

if not success then
    warn("[Infinity Script Error]: " .. tostring(runtimeError))
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Infinity Load Error",
            Text = tostring(runtimeError):sub(1, 80),
            Duration = 10
        })
    end)
end