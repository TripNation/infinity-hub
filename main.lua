-- =========================================================
-- INFINITY HUB // UPDATED GUI + FULL FUNCTIONALITY
-- Run in executor or Command Bar
-- =========================================================

-- Safe cleanup across environments
pcall(function()
    if _G.InfinityGui and typeof(_G.InfinityGui) == "Instance" then
        _G.InfinityGui:Destroy()
    end
end)
pcall(function()
    if gethui then
        local old = gethui():FindFirstChild("InfinityHubGui") or gethui():FindFirstChild("Gui")
        if old then old:Destroy() end
    end
end)
pcall(function()
    local cg = game:GetService("CoreGui")
    local old = cg:FindFirstChild("InfinityHubGui") or cg:FindFirstChild("Gui")
    if old then old:Destroy() end
end)
local localPlayer = game:GetService("Players").LocalPlayer
pcall(function()
    if localPlayer and localPlayer:FindFirstChild("PlayerGui") then
        local old = localPlayer.PlayerGui:FindFirstChild("InfinityHubGui") or localPlayer.PlayerGui:FindFirstChild("Gui")
        if old then old:Destroy() end
    end
end)

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local clickSound = SoundService:FindFirstChild("Click")
local hoverSound = SoundService:FindFirstChild("Hover")

-- Instances:

local InfinityHubGui = Instance.new("ScreenGui")
local FPS_Display = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local StatusDot = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local FpsLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("ImageButton")
local Main = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local FloatingDots = Instance.new("Frame")
local Close = Instance.new("ImageButton")
local DragButton = Instance.new("Frame")
local DragIcon = Instance.new("ImageLabel")
local Logo = Instance.new("ImageLabel")
local TitleText = Instance.new("TextLabel")
local HeaderLine = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local Home = Instance.new("TextButton")
local Line = Instance.new("TextLabel")
local HFrame = Instance.new("Frame")
local Welcome = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local WelcomeText = Instance.new("TextLabel")
local PlayerName = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")
local Liasspai = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Role = Instance.new("TextLabel")
local Scripter = Instance.new("ImageLabel")
local UICorner_6 = Instance.new("UICorner")
local Name_2 = Instance.new("TextLabel")
local Role_2 = Instance.new("TextLabel")
local Support = Instance.new("TextLabel")
local Game = Instance.new("TextButton")
local Line_2 = Instance.new("TextLabel")
local GFrame = Instance.new("Frame")
local Search = Instance.new("TextBox")
local SearchIcon = Instance.new("ImageLabel")
local Catecorys = Instance.new("ImageButton")
local UICorner_7 = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Player = Instance.new("TextLabel")
local Line_3 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local UICorner_8 = Instance.new("UICorner")
local Server = Instance.new("TextButton")
local Line_4 = Instance.new("TextLabel")
local ServerFrame = Instance.new("Frame")
local GameCard = Instance.new("Frame")
local Header = Instance.new("TextLabel")
local SupportBadge = Instance.new("Frame")
local Text = Instance.new("TextLabel")
local GameName = Instance.new("TextLabel")
local PlaceInfo = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")
local StatsCard = Instance.new("Frame")
local Header_2 = Instance.new("TextLabel")
local Players_Lbl = Instance.new("TextLabel")
local Ping = Instance.new("TextLabel")
local Uptime = Instance.new("TextLabel")
local JobId = Instance.new("TextLabel")
local CopyJobBtn = Instance.new("TextButton")
local ActionsCard = Instance.new("Frame")
local Header_3 = Instance.new("TextLabel")
local RejoinBtn = Instance.new("TextButton")
local ServerHopBtn = Instance.new("TextButton")
local Settings = Instance.new("TextButton")
local Line_5 = Instance.new("TextLabel")
local SFrame = Instance.new("Frame")
local Volume = Instance.new("TextLabel")
local UiSounds = Instance.new("TextLabel")
local DragBackground = Instance.new("TextLabel")
local UICorner_9 = Instance.new("UICorner")
local Drag = Instance.new("TextLabel")
local UICorner_10 = Instance.new("UICorner")
local DragCount = Instance.new("TextLabel")
local UI = Instance.new("TextLabel")
local DOTS = Instance.new("TextLabel")
local Box = Instance.new("TextButton")
local On = Instance.new("TextButton")
local Check = Instance.new("ImageLabel")
local GRADIENT = Instance.new("TextLabel")
local Box_2 = Instance.new("TextButton")
local On_2 = Instance.new("TextButton")
local Check_2 = Instance.new("ImageLabel")
local SHADOW = Instance.new("TextLabel")
local Box_3 = Instance.new("TextButton")
local On_3 = Instance.new("TextButton")
local Check_3 = Instance.new("ImageLabel")
local UnloadRow = Instance.new("TextLabel")
local UnloadBtn = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local SupportHOME = Instance.new("ScrollingFrame")
local Github = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local Name_3 = Instance.new("TextLabel")
local Logo_2 = Instance.new("ImageLabel")
local UICorner_13 = Instance.new("UICorner")
local Text_2 = Instance.new("TextLabel")
local SubText = Instance.new("TextLabel")
local Discord = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local Name_4 = Instance.new("TextLabel")
local Logo_3 = Instance.new("ImageLabel")
local UICorner_15 = Instance.new("UICorner")
local Text_3 = Instance.new("TextLabel")
local SubText_2 = Instance.new("TextLabel")

-- Notification Popup Window (Parented to Main so it stays centered inside GUI)
local DiscordPopup = Instance.new("Frame")
local DiscordPopupCorner = Instance.new("UICorner")
local DiscordPopupStroke = Instance.new("UIStroke")
local PopupLogo = Instance.new("ImageLabel")
local PopupTitle = Instance.new("TextLabel")
local PopupLine = Instance.new("Frame")
local PopupLineCorner = Instance.new("UICorner")
local PopupIcon = Instance.new("ImageLabel")
local PopupMsg = Instance.new("TextLabel")
local PopupLink = Instance.new("TextLabel")

--Properties:

InfinityHubGui.Name = "InfinityHubGui"
InfinityHubGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
InfinityHubGui.ResetOnSpawn = false
InfinityHubGui.IgnoreGuiInset = true

local success, parent = pcall(function()
    return (gethui and gethui()) or game:GetService("CoreGui")
end)
if success and parent then
    InfinityHubGui.Parent = parent
else
    if localPlayer then
        InfinityHubGui.Parent = localPlayer:WaitForChild("PlayerGui")
    else
        InfinityHubGui.Parent = game:GetService("StarterGui")
    end
end

_G.InfinityGui = InfinityHubGui
shared.InfinityGui = InfinityHubGui

FPS_Display.Name = "FPS_Display"
FPS_Display.Parent = InfinityHubGui
FPS_Display.AnchorPoint = Vector2.new(1, 0)
FPS_Display.BackgroundColor3 = Color3.fromRGB(44, 46, 50)
FPS_Display.BorderSizePixel = 0
FPS_Display.Position = UDim2.new(1, -6, 0, 4)
FPS_Display.Size = UDim2.new(0, 88, 0, 24)
FPS_Display.ZIndex = 300

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = FPS_Display

StatusDot.Name = "StatusDot"
StatusDot.Parent = FPS_Display
StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
StatusDot.BorderSizePixel = 0
StatusDot.Position = UDim2.new(0, 8, 0.5, -3)
StatusDot.Size = UDim2.new(0, 7, 0, 7)
StatusDot.ZIndex = 301

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = StatusDot

FpsLabel.Name = "FpsLabel"
FpsLabel.Parent = FPS_Display
FpsLabel.BackgroundTransparency = 1.000
FpsLabel.Position = UDim2.new(0, 21, 0, 0)
FpsLabel.Size = UDim2.new(1, -23, 1, 0)
FpsLabel.ZIndex = 301
FpsLabel.Font = Enum.Font.GothamBold
FpsLabel.Text = "FPS: 60"
FpsLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
FpsLabel.TextSize = 12.000
FpsLabel.TextXAlignment = Enum.TextXAlignment.Left

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = InfinityHubGui
ToggleButton.AnchorPoint = Vector2.new(0.5, 0)
ToggleButton.BackgroundTransparency = 1.000
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.5, 0, 0, 8)
ToggleButton.Size = UDim2.new(0, 100, 0, 56)
ToggleButton.ZIndex = 400
ToggleButton.Image = "rbxassetid://17894477503"
ToggleButton.ScaleType = Enum.ScaleType.Fit
ToggleButton.Active = true

Main.Name = "Main"
Main.Parent = InfinityHubGui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.444438607, 0, 0.251117378, 0)
Main.Size = UDim2.new(0, 399, 0, 499)
Main.Visible = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 28, 26)), ColorSequenceKeypoint.new(0.64, Color3.fromRGB(255, 255, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient.Rotation = 90
UIGradient.Parent = Main

FloatingDots.Name = "FloatingDots"
FloatingDots.Parent = Main
FloatingDots.BackgroundTransparency = 1.000
FloatingDots.BorderSizePixel = 0
FloatingDots.ClipsDescendants = true
FloatingDots.Size = UDim2.new(1, 0, 1, 0)

Close.Name = "Close"
Close.Parent = Main
Close.AnchorPoint = Vector2.new(1, 0.5)
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.982500017, 0, 0.0439999998, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Image = "rbxassetid://14219436180"

DragButton.Name = "DragButton"
DragButton.Parent = Main
DragButton.AnchorPoint = Vector2.new(1, 0.5)
DragButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DragButton.BorderSizePixel = 0
DragButton.Position = UDim2.new(0.888000011, 0, 0.0439999998, 0)
DragButton.Size = UDim2.new(0, 30, 0, 30)

DragIcon.Name = "DragIcon"
DragIcon.Parent = DragButton
DragIcon.AnchorPoint = Vector2.new(1, 0.5)
DragIcon.BackgroundTransparency = 1.000
DragIcon.BorderSizePixel = 0
DragIcon.Position = UDim2.new(1, 0, 0.5, 0)
DragIcon.Size = UDim2.new(0, 30, 0, 30)
DragIcon.Image = "rbxassetid://94225529221725"

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundTransparency = 1.000
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.0199999996, 0, 0, 0)
Logo.Size = UDim2.new(0, 60, 0, 47)
Logo.Image = "rbxassetid://17894477503"

TitleText.Name = "TitleText"
TitleText.Parent = Logo
TitleText.BackgroundTransparency = 1.000
TitleText.BorderSizePixel = 0
TitleText.Position = UDim2.new(0.782999992, 0, 0.25, 0)
TitleText.Size = UDim2.new(0, 123, 0, 22)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "INFINITY"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextScaled = true
TitleText.TextWrapped = true

HeaderLine.Name = "HeaderLine"
HeaderLine.Parent = Main
HeaderLine.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HeaderLine.BorderSizePixel = 0
HeaderLine.Position = UDim2.new(0.0299999993, 0, 0.175999999, 0)
HeaderLine.Size = UDim2.new(0, 375, 0, 5)
HeaderLine.Text = ""

UICorner_3.CornerRadius = UDim.new(0, 25)
UICorner_3.Parent = HeaderLine

Home.Name = "Home"
Home.Parent = Main
Home.BackgroundTransparency = 1.000
Home.BorderSizePixel = 0
Home.Position = UDim2.new(0.0175000001, 0, 0.118000001, 0)
Home.Size = UDim2.new(0, 93, 0, 18)
Home.Font = Enum.Font.GothamBold
Home.Text = "HOME"
Home.TextColor3 = Color3.fromRGB(0, 174, 255)
Home.TextScaled = true
Home.TextWrapped = true

Line.Name = "Line"
Line.Parent = Home
Line.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line.Size = UDim2.new(0, 75, 0, 1)
Line.Visible = true
Line.Text = ""

HFrame.Name = "HFrame"
HFrame.Parent = Home
HFrame.BackgroundTransparency = 1.000
HFrame.BorderSizePixel = 0
HFrame.Position = UDim2.new(0, 0, 5.27699995, 0)
HFrame.Size = UDim2.new(0, 375, 0, 381)
HFrame.Visible = true

Welcome.Name = "Welcome"
Welcome.Parent = HFrame
Welcome.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.0266666673, 0, -0.0988173634, 0)
Welcome.Size = UDim2.new(0, 33, 0, 33)
Welcome.Image = "rbxthumb://type=AvatarHeadShot&id=" .. (localPlayer and tostring(localPlayer.UserId) or "1") .. "&w=150&h=150"

UICorner_4.CornerRadius = UDim.new(0, 50)
UICorner_4.Parent = Welcome

WelcomeText.Name = "WelcomeText"
WelcomeText.Parent = Welcome
WelcomeText.BackgroundTransparency = 1.000
WelcomeText.Position = UDim2.new(1.34998858, 0, 0.00371019775, 0)
WelcomeText.Size = UDim2.new(0, 87, 0, 17)
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.Text = "WELCOME"
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextScaled = true
WelcomeText.TextWrapped = true

PlayerName.Name = "PlayerName"
PlayerName.Parent = Welcome
PlayerName.BackgroundTransparency = 1.000
PlayerName.Position = UDim2.new(1.34998858, 0, 0.470621735, 0)
PlayerName.Size = UDim2.new(0, 87, 0, 17)
PlayerName.Font = Enum.Font.SourceSansBold
PlayerName.Text = localPlayer and localPlayer.DisplayName or "Developer"
PlayerName.TextColor3 = Color3.fromRGB(0, 174, 255)
PlayerName.TextScaled = true
PlayerName.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = HFrame
Credits.BackgroundTransparency = 1.000
Credits.Position = UDim2.new(0.0183333326, 0, 0.0214907825, 0)
Credits.Size = UDim2.new(0, 99, 0, 50)
Credits.Font = Enum.Font.GothamBold
Credits.Text = "CREDITS"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextSize = 25.000

Liasspai.Name = "Liasspai"
Liasspai.Parent = HFrame
Liasspai.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Liasspai.BorderSizePixel = 0
Liasspai.Position = UDim2.new(0.0399999991, 0, 0.143616766, 0)
Liasspai.Size = UDim2.new(0, 30, 0, 30)
Liasspai.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=10895916254&width=420&height=420&format=png"

UICorner_5.CornerRadius = UDim.new(0, 50)
UICorner_5.Parent = Liasspai

Name.Name = "Name"
Name.Parent = Liasspai
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(1.5, 0, 0.133000001, 0)
Name.Size = UDim2.new(0, 78, 0, 13)
Name.Font = Enum.Font.GothamBold
Name.Text = "LIASSPAI"
Name.TextColor3 = Color3.fromRGB(200, 200, 200)
Name.TextScaled = true
Name.TextWrapped = true

Role.Name = "Role"
Role.Parent = Liasspai
Role.BackgroundTransparency = 1.000
Role.Position = UDim2.new(1.5, 0, 0.565999985, 0)
Role.Size = UDim2.new(0, 78, 0, 13)
Role.Font = Enum.Font.GothamBold
Role.Text = "GUI/DESIGNER"
Role.TextColor3 = Color3.fromRGB(120, 120, 120)
Role.TextScaled = true
Role.TextWrapped = true

Scripter.Name = "Scripter"
Scripter.Parent = HFrame
Scripter.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Scripter.BorderSizePixel = 0
Scripter.Position = UDim2.new(0.0399999991, 0, 0.259616792, 0)
Scripter.Size = UDim2.new(0, 30, 0, 30)
Scripter.Image = "rbxthumb://type=AvatarHeadShot&id=819458846&w=150&h=150"

UICorner_6.CornerRadius = UDim.new(0, 50)
UICorner_6.Parent = Scripter

Name_2.Name = "Name"
Name_2.Parent = Scripter
Name_2.BackgroundTransparency = 1.000
Name_2.Position = UDim2.new(1.36666667, 0, 0, 0)
Name_2.Size = UDim2.new(0, 86, 0, 16)
Name_2.Font = Enum.Font.GothamBold
Name_2.Text = "TRIPNATION416"
Name_2.TextColor3 = Color3.fromRGB(200, 200, 200)
Name_2.TextScaled = true
Name_2.TextWrapped = true

Role_2.Name = "Role"
Role_2.Parent = Scripter
Role_2.BackgroundTransparency = 1.000
Role_2.Position = UDim2.new(1.5, 0, 0.565999985, 0)
Role_2.Size = UDim2.new(0, 78, 0, 13)
Role_2.Font = Enum.Font.GothamBold
Role_2.Text = "SCRIPTER"
Role_2.TextColor3 = Color3.fromRGB(120, 120, 120)
Role_2.TextScaled = true
Role_2.TextWrapped = true

Support.Name = "Support"
Support.Parent = HFrame
Support.BackgroundTransparency = 1.000
Support.Position = UDim2.new(0.0106666666, 0, 0.324776947, 0)
Support.Size = UDim2.new(0, 265, 0, 50)
Support.Font = Enum.Font.GothamBold
Support.Text = "SUPPORT INFINITY SCRIPTS!"
Support.TextColor3 = Color3.fromRGB(255, 255, 255)
Support.TextSize = 20.000

SupportHOME.Name = "Support (HOME)"
SupportHOME.Parent = Main
SupportHOME.Active = true
SupportHOME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SupportHOME.BackgroundTransparency = 1.000
SupportHOME.BorderSizePixel = 0
SupportHOME.Position = UDim2.new(-0.00249096868, 0, 0.633707345, 0)
SupportHOME.Size = UDim2.new(0, 399, 0, 182)
SupportHOME.Visible = true
SupportHOME.ScrollBarThickness = 2

Github.Name = "Github"
Github.Parent = SupportHOME
Github.BackgroundColor3 = Color3.fromRGB(36, 38, 44)
Github.BorderSizePixel = 0
Github.Position = UDim2.new(0.048, 0, 0, 77)
Github.Size = UDim2.new(0, 360, 0, 65)

UICorner_12.CornerRadius = UDim.new(0, 6)
UICorner_12.Parent = Github

Name_3.Name = "Name"
Name_3.Parent = Github
Name_3.BackgroundTransparency = 1.000
Name_3.Position = UDim2.new(0, 35, 0, 6)
Name_3.Size = UDim2.new(0, 114, 0, 18)
Name_3.Font = Enum.Font.GothamBold
Name_3.Text = "GITHUB"
Name_3.TextColor3 = Color3.fromRGB(242, 242, 242)
Name_3.TextSize = 13.000
Name_3.TextXAlignment = Enum.TextXAlignment.Left

Logo_2.Name = "Logo"
Logo_2.Parent = Github
Logo_2.BackgroundTransparency = 1.000
Logo_2.Position = UDim2.new(0, 8, 0, 7)
Logo_2.Size = UDim2.new(0, 20, 0, 20)
Logo_2.Image = "rbxassetid://102816031861909"

UICorner_13.Parent = Logo_2

Text_2.Name = "Text"
Text_2.Parent = Github
Text_2.BackgroundTransparency = 1.000
Text_2.Position = UDim2.new(0, 8, 0, 28)
Text_2.Size = UDim2.new(1, -16, 0, 16)
Text_2.Font = Enum.Font.Gotham
Text_2.Text = "Come support Infinity Scripts! Come view our Github page!"
Text_2.TextColor3 = Color3.fromRGB(160, 160, 170)
Text_2.TextSize = 10.000
Text_2.TextXAlignment = Enum.TextXAlignment.Left

SubText.Name = "SubText"
SubText.Parent = Github
SubText.BackgroundTransparency = 1.000
SubText.Position = UDim2.new(0, 8, 0, 46)
SubText.Size = UDim2.new(1, -16, 0, 14)
SubText.Font = Enum.Font.GothamBold
SubText.Text = "CLICK TO COPY GITHUB LINK"
SubText.TextColor3 = Color3.fromRGB(0, 174, 255)
SubText.TextSize = 10.000
SubText.TextXAlignment = Enum.TextXAlignment.Left

local GithubClickBtn = Instance.new("TextButton")
GithubClickBtn.Name = "ClickBtn"
GithubClickBtn.Parent = Github
GithubClickBtn.BackgroundTransparency = 1.000
GithubClickBtn.Size = UDim2.new(1, 0, 1, 0)
GithubClickBtn.Text = ""

Discord.Name = "Discord"
Discord.Parent = SupportHOME
Discord.BackgroundColor3 = Color3.fromRGB(36, 38, 44)
Discord.BorderSizePixel = 0
Discord.Position = UDim2.new(0.048, 0, 0, 6)
Discord.Size = UDim2.new(0, 360, 0, 65)

UICorner_14.CornerRadius = UDim.new(0, 6)
UICorner_14.Parent = Discord

Name_4.Name = "Name"
Name_4.Parent = Discord
Name_4.BackgroundTransparency = 1.000
Name_4.Position = UDim2.new(0, 35, 0, 6)
Name_4.Size = UDim2.new(0, 114, 0, 18)
Name_4.Font = Enum.Font.GothamBold
Name_4.Text = "DISCORD"
Name_4.TextColor3 = Color3.fromRGB(88, 101, 242)
Name_4.TextSize = 13.000
Name_4.TextXAlignment = Enum.TextXAlignment.Left

Logo_3.Name = "Logo"
Logo_3.Parent = Discord
Logo_3.BackgroundTransparency = 1.000
Logo_3.Position = UDim2.new(0, 8, 0, 7)
Logo_3.Size = UDim2.new(0, 20, 0, 20)
Logo_3.Image = "rbxassetid://87492930332581"

UICorner_15.Parent = Logo_3

Text_3.Name = "Text"
Text_3.Parent = Discord
Text_3.BackgroundTransparency = 1.000
Text_3.Position = UDim2.new(0, 8, 0, 28)
Text_3.Size = UDim2.new(1, -16, 0, 16)
Text_3.Font = Enum.Font.Gotham
Text_3.Text = "Join our Discord for scripts, help, and weekly updates!"
Text_3.TextColor3 = Color3.fromRGB(160, 160, 170)
Text_3.TextSize = 10.000
Text_3.TextXAlignment = Enum.TextXAlignment.Left

SubText_2.Name = "SubText"
SubText_2.Parent = Discord
SubText_2.BackgroundTransparency = 1.000
SubText_2.Position = UDim2.new(0, 8, 0, 46)
SubText_2.Size = UDim2.new(1, -16, 0, 14)
SubText_2.Font = Enum.Font.GothamBold
SubText_2.Text = "CLICK TO COPY DISCORD INVITE"
SubText_2.TextColor3 = Color3.fromRGB(0, 174, 255)
SubText_2.TextSize = 10.000
SubText_2.TextXAlignment = Enum.TextXAlignment.Left

local DiscordClickBtn = Instance.new("TextButton")
DiscordClickBtn.Name = "ClickBtn"
DiscordClickBtn.Parent = Discord
DiscordClickBtn.BackgroundTransparency = 1.000
DiscordClickBtn.Size = UDim2.new(1, 0, 1, 0)
DiscordClickBtn.Text = ""

-- GAME TAB
Game.Name = "Game"
Game.Parent = Main
Game.BackgroundTransparency = 1.000
Game.BorderSizePixel = 0
Game.Position = UDim2.new(0.252000004, 0, 0.118000001, 0)
Game.Size = UDim2.new(0, 93, 0, 18)
Game.Font = Enum.Font.GothamBold
Game.Text = "GAME"
Game.TextColor3 = Color3.fromRGB(255, 255, 255)
Game.TextScaled = true
Game.TextWrapped = true

Line_2.Name = "Line"
Line_2.Parent = Game
Line_2.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
Line_2.BorderSizePixel = 0
Line_2.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line_2.Size = UDim2.new(0, 75, 0, 1)
Line_2.Visible = false
Line_2.Text = ""

GFrame.Name = "GFrame"
GFrame.Parent = Game
GFrame.BackgroundTransparency = 1.000
GFrame.BorderSizePixel = 0
GFrame.Position = UDim2.new(-0.957000017, 0, 2.6099999, 0)
GFrame.Size = UDim2.new(0, 375, 0, 381)
GFrame.Visible = false

Search.Name = "Search"
Search.Parent = GFrame
Search.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
Search.BorderSizePixel = 0
Search.Position = UDim2.new(0.05, 0, 0, 0)
Search.Size = UDim2.new(0, 340, 0, 31)
Search.Font = Enum.Font.GothamBold
Search.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Search.PlaceholderText = "SEARCH"
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(255, 255, 255)
Search.TextScaled = true
Search.TextWrapped = true

local UICorner_Search = Instance.new("UICorner")
UICorner_Search.Parent = Search

SearchIcon.Name = "SearchIcon"
SearchIcon.Parent = Search
SearchIcon.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
SearchIcon.BorderSizePixel = 0
SearchIcon.Position = UDim2.new(0.91, 0, 0, 0)
SearchIcon.Size = UDim2.new(0, 31, 0, 31)
SearchIcon.Image = "rbxassetid://11496279085"

local UICorner_SIcon = Instance.new("UICorner")
UICorner_SIcon.Parent = SearchIcon

ScrollingFrame.Name = "GamesScroll"
ScrollingFrame.Parent = GFrame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.048, 0, 0, 38)
ScrollingFrame.Size = UDim2.new(0, 357, 0, 336)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 75, 85)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local GamesListLayout = Instance.new("UIListLayout")
GamesListLayout.Parent = ScrollingFrame
GamesListLayout.SortOrder = Enum.SortOrder.LayoutOrder
GamesListLayout.Padding = UDim.new(0, 8)

-- SERVER TAB
Server.Name = "Server"
Server.Parent = Main
Server.BackgroundTransparency = 1.000
Server.BorderSizePixel = 0
Server.Position = UDim2.new(0.486999989, 0, 0.118000001, 0)
Server.Size = UDim2.new(0, 93, 0, 18)
Server.Font = Enum.Font.GothamBold
Server.Text = "SERVER"
Server.TextColor3 = Color3.fromRGB(255, 255, 255)
Server.TextScaled = true
Server.TextWrapped = true

Line_4.Name = "Line"
Line_4.Parent = Server
Line_4.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
Line_4.BorderSizePixel = 0
Line_4.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line_4.Size = UDim2.new(0, 75, 0, 1)
Line_4.Visible = false
Line_4.Text = ""

ServerFrame.Name = "ServerFrame"
ServerFrame.Parent = Server
ServerFrame.BackgroundTransparency = 1.000
ServerFrame.BorderSizePixel = 0
ServerFrame.Position = UDim2.new(-1.96800005, 0, 2.6099999, 0)
ServerFrame.Size = UDim2.new(0, 375, 0, 381)
ServerFrame.Visible = false

GameCard.Name = "GameCard"
GameCard.Parent = ServerFrame
GameCard.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
GameCard.BorderSizePixel = 0
GameCard.Position = UDim2.new(0, 9, 0, 4)
GameCard.Size = UDim2.new(0, 357, 0, 102)

Header.Name = "Header"
Header.Parent = GameCard
Header.BackgroundTransparency = 1.000
Header.Position = UDim2.new(0, 12, 0, 7)
Header.Size = UDim2.new(0, 150, 0, 14)
Header.Font = Enum.Font.GothamBold
Header.Text = "CURRENT EXPERIENCE"
Header.TextColor3 = Color3.fromRGB(150, 150, 160)
Header.TextSize = 10.000
Header.TextXAlignment = Enum.TextXAlignment.Left

SupportBadge.Name = "SupportBadge"
SupportBadge.Parent = GameCard
SupportBadge.BackgroundColor3 = Color3.fromRGB(45, 15, 15)
SupportBadge.BorderSizePixel = 0
SupportBadge.Position = UDim2.new(1, -144, 0, 7)
SupportBadge.Size = UDim2.new(0, 132, 0, 20)

local UICorner_SupportBadge = Instance.new("UICorner")
UICorner_SupportBadge.CornerRadius = UDim.new(0, 4)
UICorner_SupportBadge.Parent = SupportBadge

Text.Name = "Text"
Text.Parent = SupportBadge
Text.BackgroundTransparency = 1.000
Text.Size = UDim2.new(1, 0, 1, 0)
Text.Font = Enum.Font.GothamBold
Text.Text = "🔴 UNSUPPORTED"
Text.TextColor3 = Color3.fromRGB(255, 65, 65)
Text.TextSize = 10.000

GameName.Name = "GameName"
GameName.Parent = GameCard
GameName.BackgroundTransparency = 1.000
GameName.Position = UDim2.new(0, 12, 0, 27)
GameName.Size = UDim2.new(1, -24, 0, 24)
GameName.Font = Enum.Font.GothamBold
GameName.Text = "Current Experience"
GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
GameName.TextSize = 15.000
GameName.TextXAlignment = Enum.TextXAlignment.Left

PlaceInfo.Name = "PlaceInfo"
PlaceInfo.Parent = GameCard
PlaceInfo.BackgroundTransparency = 1.000
PlaceInfo.Position = UDim2.new(0, 12, 0, 54)
PlaceInfo.Size = UDim2.new(1, -24, 0, 16)
PlaceInfo.Font = Enum.Font.Gotham
PlaceInfo.Text = "Place ID: " .. tostring(game.PlaceId)
PlaceInfo.TextColor3 = Color3.fromRGB(160, 165, 175)
PlaceInfo.TextSize = 11.000
PlaceInfo.TextXAlignment = Enum.TextXAlignment.Left

Subtitle.Name = "Subtitle"
Subtitle.Parent = GameCard
Subtitle.BackgroundTransparency = 1.000
Subtitle.Position = UDim2.new(0, 12, 0, 73)
Subtitle.Size = UDim2.new(1, -24, 0, 18)
Subtitle.Font = Enum.Font.GothamBold
Subtitle.Text = "This experience is unsupported by Infinity Hub."
Subtitle.TextColor3 = Color3.fromRGB(255, 65, 65)
Subtitle.TextSize = 11.000
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- Function to check if the current game is present on the Games page
local function updateSupportStatus()
    local isSupported = false
    local currentTitle = string.lower(GameName.Text or "")
    local currentPlaceId = tostring(game.PlaceId)

    for _, item in ipairs(ScrollingFrame:GetChildren()) do
        if item:IsA("Frame") or item:IsA("GuiObject") then
            -- Check card's title label
            local titleObj = item:FindFirstChild("Title") or item:FindFirstChild("GameTitle")
            if titleObj and titleObj:IsA("TextLabel") then
                local cardTitle = string.lower(titleObj.Text)
                if cardTitle ~= "" and (string.find(currentTitle, cardTitle, 1, true) or string.find(cardTitle, currentTitle, 1, true)) then
                    isSupported = true
                    break
                end
            end

            -- Check if card has a PlaceId attribute or Value
            local placeAttr = item:GetAttribute("PlaceId") or (item:FindFirstChild("PlaceId") and item.PlaceId.Value)
            if placeAttr and tostring(placeAttr) == currentPlaceId then
                isSupported = true
                break
            end

            -- Check card name
            local cardName = string.lower(item.Name)
            if cardName ~= "" and cardName ~= "gameslistlayout" and cardName ~= "uilistlayout" then
                if string.find(currentTitle, cardName, 1, true) or string.find(cardName, currentTitle, 1, true) then
                    isSupported = true
                    break
                end
            end
        end
    end

    if isSupported then
        SupportBadge.BackgroundColor3 = Color3.fromRGB(15, 45, 25)
        Text.Text = "🟢 SUPPORTED"
        Text.TextColor3 = Color3.fromRGB(0, 255, 140)
        Subtitle.Text = "This experience is supported by Infinity Hub."
        Subtitle.TextColor3 = Color3.fromRGB(0, 255, 140)
    else
        SupportBadge.BackgroundColor3 = Color3.fromRGB(45, 15, 15)
        Text.Text = "🔴 UNSUPPORTED"
        Text.TextColor3 = Color3.fromRGB(255, 65, 65)
        Subtitle.Text = "This experience is unsupported by Infinity Hub."
        Subtitle.TextColor3 = Color3.fromRGB(255, 65, 65)
    end
end

-- Asynchronously fetch game name and refresh support status
task.spawn(function()
    local sTitle, gInfo = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    end)
    if sTitle and gInfo and gInfo.Name and GameName and GameName.Parent then
        GameName.Text = gInfo.Name
    end
    updateSupportStatus()
end)

-- Auto update if games are dynamically added/removed from the Game page
ScrollingFrame.ChildAdded:Connect(updateSupportStatus)
ScrollingFrame.ChildRemoved:Connect(updateSupportStatus)

StatsCard.Name = "StatsCard"
StatsCard.Parent = ServerFrame
StatsCard.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
StatsCard.BorderSizePixel = 0
StatsCard.Position = UDim2.new(0, 9, 0, 114)
StatsCard.Size = UDim2.new(0, 357, 0, 128)

Header_2.Name = "Header"
Header_2.Parent = StatsCard
Header_2.BackgroundTransparency = 1.000
Header_2.Position = UDim2.new(0, 12, 0, 7)
Header_2.Size = UDim2.new(0, 150, 0, 14)
Header_2.Font = Enum.Font.GothamBold
Header_2.Text = "LIVE SERVER METRICS"
Header_2.TextColor3 = Color3.fromRGB(150, 150, 160)
Header_2.TextSize = 10.000
Header_2.TextXAlignment = Enum.TextXAlignment.Left

Players_Lbl.Name = "Players"
Players_Lbl.Parent = StatsCard
Players_Lbl.BackgroundTransparency = 1.000
Players_Lbl.Position = UDim2.new(0, 12, 0, 28)
Players_Lbl.Size = UDim2.new(0.5, -16, 0, 20)
Players_Lbl.Font = Enum.Font.GothamBold
Players_Lbl.Text = "👥 Players: " .. tostring(#Players:GetPlayers())
Players_Lbl.TextColor3 = Color3.fromRGB(240, 240, 245)
Players_Lbl.TextSize = 12.000
Players_Lbl.TextXAlignment = Enum.TextXAlignment.Left

Ping.Name = "Ping"
Ping.Parent = StatsCard
Ping.BackgroundTransparency = 1.000
Ping.Position = UDim2.new(0.5, 4, 0, 28)
Ping.Size = UDim2.new(0.5, -16, 0, 20)
Ping.Font = Enum.Font.GothamBold
Ping.Text = "📶 Ping: 32 ms"
Ping.TextColor3 = Color3.fromRGB(240, 240, 245)
Ping.TextSize = 12.000
Ping.TextXAlignment = Enum.TextXAlignment.Left

Uptime.Name = "Uptime"
Uptime.Parent = StatsCard
Uptime.BackgroundTransparency = 1.000
Uptime.Position = UDim2.new(0, 12, 0, 56)
Uptime.Size = UDim2.new(1, -24, 0, 20)
Uptime.Font = Enum.Font.GothamBold
Uptime.Text = "⏱️ Server Uptime: 01h 45m 12s"
Uptime.TextColor3 = Color3.fromRGB(240, 240, 245)
Uptime.TextSize = 12.000
Uptime.TextXAlignment = Enum.TextXAlignment.Left

JobId.Name = "JobId"
JobId.Parent = StatsCard
JobId.BackgroundTransparency = 1.000
JobId.Position = UDim2.new(0, 12, 0, 90)
JobId.Size = UDim2.new(1, -165, 0, 24)
JobId.Font = Enum.Font.Gotham
JobId.Text = "Server ID: " .. string.sub(game.JobId ~= "" and game.JobId or "SinglePlayer", 1, 14) .. "..."
JobId.TextColor3 = Color3.fromRGB(160, 165, 175)
JobId.TextSize = 11.000
JobId.TextXAlignment = Enum.TextXAlignment.Left

CopyJobBtn.Name = "CopyJobBtn"
CopyJobBtn.Parent = StatsCard
CopyJobBtn.BackgroundColor3 = Color3.fromRGB(38, 40, 48)
CopyJobBtn.BorderSizePixel = 0
CopyJobBtn.Position = UDim2.new(1, -148, 0, 90)
CopyJobBtn.Size = UDim2.new(0, 136, 0, 24)
CopyJobBtn.Font = Enum.Font.GothamBold
CopyJobBtn.Text = "Copy game Session"
CopyJobBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyJobBtn.TextSize = 11.000

ActionsCard.Name = "ActionsCard"
ActionsCard.Parent = ServerFrame
ActionsCard.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
ActionsCard.BorderSizePixel = 0
ActionsCard.Position = UDim2.new(0, 9, 0, 252)
ActionsCard.Size = UDim2.new(0, 357, 0, 72)

Header_3.Name = "Header"
Header_3.Parent = ActionsCard
Header_3.BackgroundTransparency = 1.000
Header_3.Position = UDim2.new(0, 12, 0, 7)
Header_3.Size = UDim2.new(0, 150, 0, 14)
Header_3.Font = Enum.Font.GothamBold
Header_3.Text = "SERVER QUICK ACTIONS"
Header_3.TextColor3 = Color3.fromRGB(150, 150, 160)
Header_3.TextSize = 10.000
Header_3.TextXAlignment = Enum.TextXAlignment.Left

RejoinBtn.Name = "RejoinBtn"
RejoinBtn.Parent = ActionsCard
RejoinBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
RejoinBtn.BorderSizePixel = 0
RejoinBtn.Position = UDim2.new(0, 12, 0, 26)
RejoinBtn.Size = UDim2.new(0, 158, 0, 36)
RejoinBtn.Font = Enum.Font.GothamBold
RejoinBtn.Text = "REJOIN SERVER"
RejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinBtn.TextSize = 11.000

ServerHopBtn.Name = "ServerHopBtn"
ServerHopBtn.Parent = ActionsCard
ServerHopBtn.BackgroundColor3 = Color3.fromRGB(35, 38, 45)
ServerHopBtn.BorderSizePixel = 0
ServerHopBtn.Position = UDim2.new(1, -170, 0, 26)
ServerHopBtn.Size = UDim2.new(0, 158, 0, 36)
ServerHopBtn.Font = Enum.Font.GothamBold
ServerHopBtn.Text = "SERVER HOP"
ServerHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerHopBtn.TextSize = 11.000

-- SETTINGS TAB
Settings.Name = "Settings"
Settings.Parent = Main
Settings.BackgroundTransparency = 1.000
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0.720000029, 0, 0.118000001, 0)
Settings.Size = UDim2.new(0, 93, 0, 18)
Settings.Font = Enum.Font.GothamBold
Settings.Text = "SETTINGS"
Settings.TextColor3 = Color3.fromRGB(255, 255, 255)
Settings.TextScaled = true
Settings.TextWrapped = true

Line_5.Name = "Line"
Line_5.Parent = Settings
Line_5.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
Line_5.BorderSizePixel = 0
Line_5.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line_5.Size = UDim2.new(0, 75, 0, 1)
Line_5.Visible = false
Line_5.Text = ""

SFrame.Name = "SFrame"
SFrame.Parent = Settings
SFrame.BackgroundTransparency = 1.000
SFrame.BorderSizePixel = 0
SFrame.Position = UDim2.new(-2.96799994, 0, 2.44400001, 0)
SFrame.Size = UDim2.new(0, 375, 0, 381)
SFrame.Visible = false

Volume.Name = "Volume"
Volume.Parent = SFrame
Volume.BackgroundTransparency = 1.000
Volume.BorderSizePixel = 0
Volume.Position = UDim2.new(0.280000001, 0, 0, 0)
Volume.Size = UDim2.new(0, 166, 0, 32)
Volume.Font = Enum.Font.GothamBold
Volume.Text = "VOLUME"
Volume.TextColor3 = Color3.fromRGB(255, 255, 255)
Volume.TextScaled = true
Volume.TextWrapped = true

UiSounds.Name = "UiSounds"
UiSounds.Parent = Volume
UiSounds.BackgroundTransparency = 1.000
UiSounds.Position = UDim2.new(-0.629000008, 0, 1.87600005, 0)
UiSounds.Size = UDim2.new(0, 130, 0, 31)
UiSounds.Font = Enum.Font.GothamBold
UiSounds.Text = "UI SOUNDS"
UiSounds.TextColor3 = Color3.fromRGB(255, 255, 255)
UiSounds.TextScaled = true
UiSounds.TextWrapped = true

DragBackground.Name = "DragBackground"
DragBackground.Parent = UiSounds
DragBackground.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
DragBackground.BorderSizePixel = 0
DragBackground.Position = UDim2.new(1.12699997, 0, 0.601999998, 0)
DragBackground.Size = UDim2.new(0, 200, 0, 6)
DragBackground.Text = ""

UICorner_9.Parent = DragBackground

Drag.Name = "Drag"
Drag.Parent = DragBackground
Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drag.BorderSizePixel = 0
Drag.Size = UDim2.new(0.800000012, 0, 1, 0)
Drag.Text = ""

UICorner_10.Parent = Drag

DragCount.Name = "DragCount"
DragCount.Parent = UiSounds
DragCount.BackgroundTransparency = 1.000
DragCount.Position = UDim2.new(1.13100004, 0, -0.5, 0)
DragCount.Size = UDim2.new(0, 200, 0, 50)
DragCount.Font = Enum.Font.GothamBold
DragCount.Text = "0.8"
DragCount.TextColor3 = Color3.fromRGB(255, 255, 255)
DragCount.TextSize = 14.000

UI.Name = "UI"
UI.Parent = SFrame
UI.BackgroundTransparency = 1.000
UI.Position = UDim2.new(0.280000001, 0, 0.323000014, 0)
UI.Size = UDim2.new(0, 166, 0, 32)
UI.Font = Enum.Font.GothamBold
UI.Text = "UI"
UI.TextColor3 = Color3.fromRGB(255, 255, 255)
UI.TextScaled = true
UI.TextWrapped = true

DOTS.Name = "DOTS"
DOTS.Parent = UI
DOTS.BackgroundTransparency = 1.000
DOTS.Position = UDim2.new(-0.629000008, 0, 1.79999995, 0)
DOTS.Size = UDim2.new(0, 130, 0, 31)
DOTS.Font = Enum.Font.GothamBold
DOTS.Text = "DOTS"
DOTS.TextColor3 = Color3.fromRGB(255, 255, 255)
DOTS.TextScaled = true
DOTS.TextWrapped = true

Box.Name = "Box"
Box.Parent = DOTS
Box.BackgroundTransparency = 1.000
Box.Position = UDim2.new(2.34599996, 0, 0.0320000015, 0)
Box.Size = UDim2.new(0, 28, 0, 28)
Box.Text = ""

On.Name = "On"
On.Parent = Box
On.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
On.BorderSizePixel = 0
On.Position = UDim2.new(0.100000001, 0, 0.115000002, 0)
On.Size = UDim2.new(0, 22, 0, 22)
On.Text = ""

Check.Name = "Check"
Check.Parent = On
Check.BackgroundTransparency = 1.000
Check.Position = UDim2.new(0.100000001, 0, 0.100000001, 0)
Check.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
Check.Image = "rbxassetid://6031094667"
Check.ImageColor3 = Color3.fromRGB(20, 20, 20)

GRADIENT.Name = "GRADIENT"
GRADIENT.Parent = UI
GRADIENT.BackgroundTransparency = 1.000
GRADIENT.Position = UDim2.new(-0.629000008, 0, 3.5, 0)
GRADIENT.Size = UDim2.new(0, 130, 0, 31)
GRADIENT.Font = Enum.Font.GothamBold
GRADIENT.Text = "GRADIENT"
GRADIENT.TextColor3 = Color3.fromRGB(255, 255, 255)
GRADIENT.TextScaled = true
GRADIENT.TextWrapped = true

Box_2.Name = "Box"
Box_2.Parent = GRADIENT
Box_2.BackgroundTransparency = 1.000
Box_2.Position = UDim2.new(2.34599996, 0, 0.0320000015, 0)
Box_2.Size = UDim2.new(0, 28, 0, 28)
Box_2.Text = ""

On_2.Name = "On"
On_2.Parent = Box_2
On_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
On_2.BorderSizePixel = 0
On_2.Position = UDim2.new(0.100000001, 0, 0.115000002, 0)
On_2.Size = UDim2.new(0, 22, 0, 22)
On_2.Text = ""

Check_2.Name = "Check"
Check_2.Parent = On_2
Check_2.BackgroundTransparency = 1.000
Check_2.Position = UDim2.new(0.100000001, 0, 0.100000001, 0)
Check_2.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
Check_2.Image = "rbxassetid://6031094667"
Check_2.ImageColor3 = Color3.fromRGB(20, 20, 20)

SHADOW.Name = "SHADOW"
SHADOW.Parent = UI
SHADOW.BackgroundTransparency = 1.000
SHADOW.Position = UDim2.new(-0.629000008, 0, 5.19999981, 0)
SHADOW.Size = UDim2.new(0, 130, 0, 31)
SHADOW.Font = Enum.Font.GothamBold
SHADOW.Text = "SHADOW"
SHADOW.TextColor3 = Color3.fromRGB(255, 255, 255)
SHADOW.TextScaled = true
SHADOW.TextWrapped = true

Box_3.Name = "Box"
Box_3.Parent = SHADOW
Box_3.BackgroundTransparency = 1.000
Box_3.Position = UDim2.new(2.34599996, 0, 0.0320000015, 0)
Box_3.Size = UDim2.new(0, 28, 0, 28)
Box_3.Text = ""

On_3.Name = "On"
On_3.Parent = Box_3
On_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
On_3.BorderSizePixel = 0
On_3.Position = UDim2.new(0.100000001, 0, 0.115000002, 0)
On_3.Size = UDim2.new(0, 22, 0, 22)
On_3.Text = ""

Check_3.Name = "Check"
Check_3.Parent = On_3
Check_3.BackgroundTransparency = 1.000
Check_3.Position = UDim2.new(0.100000001, 0, 0.100000001, 0)
Check_3.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
Check_3.Image = "rbxassetid://6031094667"
Check_3.ImageColor3 = Color3.fromRGB(20, 20, 20)

UnloadRow.Name = "UnloadRow"
UnloadRow.Parent = UI
UnloadRow.BackgroundTransparency = 1.000
UnloadRow.Position = UDim2.new(-0.629000008, 0, 6.9000001, 0)
UnloadRow.Size = UDim2.new(0, 130, 0, 31)
UnloadRow.Font = Enum.Font.GothamBold
UnloadRow.Text = "UNLOAD"
UnloadRow.TextColor3 = Color3.fromRGB(255, 255, 255)
UnloadRow.TextScaled = true
UnloadRow.TextWrapped = true

UnloadBtn.Name = "UnloadBtn"
UnloadBtn.Parent = UnloadRow
UnloadBtn.BackgroundColor3 = Color3.fromRGB(190, 35, 35)
UnloadBtn.BorderSizePixel = 0
UnloadBtn.Position = UDim2.new(2.0999999, 0, 0.0500000007, 0)
UnloadBtn.Size = UDim2.new(0, 80, 0, 26)
UnloadBtn.Font = Enum.Font.GothamBold
UnloadBtn.Text = "UNLOAD"
UnloadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UnloadBtn.TextSize = 12.000

UICorner_11.CornerRadius = UDim.new(0, 6)
UICorner_11.Parent = UnloadBtn

-- DISCORD POPUP NOTIFICATION (Inside Main)
DiscordPopup.Name = "DiscordPopup"
DiscordPopup.Parent = Main
DiscordPopup.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
DiscordPopup.Size = UDim2.new(0, 310, 0, 125)
DiscordPopup.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DiscordPopup.BorderSizePixel = 0
DiscordPopup.ClipsDescendants = true
DiscordPopup.Visible = false
DiscordPopup.ZIndex = 200

DiscordPopupCorner.CornerRadius = UDim.new(0, 8)
DiscordPopupCorner.Parent = DiscordPopup

DiscordPopupStroke.Color = Color3.fromRGB(50, 50, 50)
DiscordPopupStroke.Thickness = 1
DiscordPopupStroke.Parent = DiscordPopup

PopupLogo.Name = "PopupLogo"
PopupLogo.Parent = DiscordPopup
PopupLogo.BackgroundTransparency = 1.000
PopupLogo.BorderSizePixel = 0
PopupLogo.Position = UDim2.new(0.04, 0, 0.08, 0)
PopupLogo.Size = UDim2.new(0, 32, 0, 25)
PopupLogo.Image = "rbxassetid://17894477503"
PopupLogo.ZIndex = 201

PopupTitle.Name = "PopupTitle"
PopupTitle.Parent = DiscordPopup
PopupTitle.BackgroundTransparency = 1.000
PopupTitle.BorderSizePixel = 0
PopupTitle.Position = UDim2.new(0.16, 0, 0.10, 0)
PopupTitle.Size = UDim2.new(0, 120, 0, 20)
PopupTitle.Font = Enum.Font.GothamBold
PopupTitle.Text = "INFINITY"
PopupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupTitle.TextSize = 14.000
PopupTitle.TextXAlignment = Enum.TextXAlignment.Left
PopupTitle.ZIndex = 201

PopupLine.Name = "PopupLine"
PopupLine.Parent = DiscordPopup
PopupLine.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
PopupLine.BorderSizePixel = 0
PopupLine.Position = UDim2.new(0.04, 0, 0.35, 0)
PopupLine.Size = UDim2.new(0.92, 0, 0, 2)
PopupLine.ZIndex = 201

PopupLineCorner.CornerRadius = UDim.new(0, 25)
PopupLineCorner.Parent = PopupLine

PopupIcon.Name = "PopupIcon"
PopupIcon.Parent = DiscordPopup
PopupIcon.BackgroundTransparency = 1.000
PopupIcon.BorderSizePixel = 0
PopupIcon.Position = UDim2.new(0.05, 0, 0.48, 0)
PopupIcon.Size = UDim2.new(0, 26, 0, 26)
PopupIcon.Image = "rbxassetid://10367063073"
PopupIcon.ZIndex = 201

PopupMsg.Name = "PopupMsg"
PopupMsg.Parent = DiscordPopup
PopupMsg.BackgroundTransparency = 1.000
PopupMsg.BorderSizePixel = 0
PopupMsg.Position = UDim2.new(0.16, 0, 0.44, 0)
PopupMsg.Size = UDim2.new(0.80, 0, 0, 36)
PopupMsg.Font = Enum.Font.GothamBold
PopupMsg.Text = "Link copied to clipboard!"
PopupMsg.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupMsg.TextSize = 12.500
PopupMsg.TextWrapped = true
PopupMsg.TextXAlignment = Enum.TextXAlignment.Left
PopupMsg.ZIndex = 201

PopupLink.Name = "PopupLink"
PopupLink.Parent = DiscordPopup
PopupLink.BackgroundTransparency = 1.000
PopupLink.BorderSizePixel = 0
PopupLink.Position = UDim2.new(0.16, 0, 0.76, 0)
PopupLink.Size = UDim2.new(0.80, 0, 0, 18)
PopupLink.Font = Enum.Font.Gotham
PopupLink.Text = "https://discord.gg/PB8bhAHbJE"
PopupLink.TextColor3 = Color3.fromRGB(0, 174, 255)
PopupLink.TextSize = 11.000
PopupLink.TextXAlignment = Enum.TextXAlignment.Left
PopupLink.ZIndex = 201


-- =========================================================
-- FUNCTIONALITY & CONTROLLER LOGIC
-- =========================================================

-- Helper to find active game script (Ride A Pet)
local function getActiveGameGui()
    local candidate = _G.ActiveGameScript or shared.ActiveGameScript
    if candidate and candidate.Gui and candidate.Gui.Parent then
        local frame = candidate.MainFrame or candidate.Gui:FindFirstChild("MainFrame") or candidate.Gui:FindFirstChild("Main")
        return candidate.Gui, frame
    end
    if _G.RideAPetGui and _G.RideAPetGui.Parent then
        local frame = _G.RideAPetMainFrame or _G.RideAPetGui:FindFirstChild("MainFrame") or _G.RideAPetGui:FindFirstChild("Main")
        return _G.RideAPetGui, frame
    end

    local names = {"RideAPetStandaloneGui", "RideAPetGui", "Ride-A-Pet", "RideAPet"}
    local foundGui = nil
    local foundFrame = nil

    local function searchContainer(container)
        if foundGui or not container then return end
        for _, name in ipairs(names) do
            local s, res = pcall(function()
                return container:FindFirstChild(name)
            end)
            if s and res then
                foundGui = res
                pcall(function()
                    foundFrame = res:FindFirstChild("MainFrame") or res:FindFirstChild("Main") or res:FindFirstChildOfClass("Frame")
                end)
                return
            end
        end
    end

    pcall(function() if gethui then searchContainer(gethui()) end end)
    if not foundGui then pcall(function() searchContainer(game:GetService("CoreGui")) end) end
    if not foundGui and localPlayer and localPlayer:FindFirstChild("PlayerGui") then
        pcall(function() searchContainer(localPlayer.PlayerGui) end)
    end
    if not foundGui and InfinityHubGui and InfinityHubGui.Parent then
        pcall(function() searchContainer(InfinityHubGui.Parent) end)
    end

    return foundGui, foundFrame
end

-- Tab Switching logic
local blueColor = Color3.fromRGB(0, 174, 255)
local whiteColor = Color3.fromRGB(255, 255, 255)

local tabButtons = { Home, Game, Server, Settings }
local tabFrames = {
    Home = HFrame,
    Game = GFrame,
    Server = ServerFrame,
    Settings = SFrame
}

local activeTabBtn = Home

local function selectTab(btn, frame)
    if clickSound then clickSound:Play() end
    for _, b in ipairs(tabButtons) do
        local l = b:FindFirstChild("Line")
        if b == btn then
            b.TextColor3 = blueColor
            if l then l.Visible = true end
        else
            b.TextColor3 = whiteColor
            if l then l.Visible = false end
        end
    end
    for name, f in pairs(tabFrames) do
        f.Visible = (f == frame)
    end
    SupportHOME.Visible = (frame == HFrame)
    if frame == ServerFrame and updateSupportStatus then
        updateSupportStatus()
    end
    activeTabBtn = btn
end

for _, b in ipairs(tabButtons) do
    local l = b:FindFirstChild("Line")
    b.MouseEnter:Connect(function()
        if b ~= activeTabBtn and l then
            l.Visible = true
            l.BackgroundColor3 = whiteColor
        end
        if hoverSound and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            hoverSound:Play()
        end
    end)
    b.MouseLeave:Connect(function()
        if b ~= activeTabBtn and l then
            l.Visible = false
            l.BackgroundColor3 = blueColor
        end
    end)
end

Home.MouseButton1Click:Connect(function() selectTab(Home, HFrame) end)
Game.MouseButton1Click:Connect(function() selectTab(Game, GFrame) end)
Server.MouseButton1Click:Connect(function() selectTab(Server, ServerFrame) end)
Settings.MouseButton1Click:Connect(function() selectTab(Settings, SFrame) end)

-- Initial tab selection
selectTab(Home, HFrame)

-- Close Button
Close.MouseButton1Click:Connect(function()
    if clickSound then clickSound:Play() end
    Main.Visible = false
end)

-- Window Dragging logic
local isDragging = false
local dragStartPos = nil
local startFramePos = nil

DragButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStartPos = input.Position
        startFramePos = Main.Position

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
        local delta = input.Position - dragStartPos
        Main.Position = UDim2.new(
            startFramePos.X.Scale,
            startFramePos.X.Offset + delta.X,
            startFramePos.Y.Scale,
            startFramePos.Y.Offset + delta.Y
        )
    end
end)

-- Toggle Button (Figure 8) Drag & Click
local btnDragging = false
local btnMoved = false
local btnDragStart = nil
local btnStartPos = nil

local function toggleVisibility()
    if clickSound then clickSound:Play() end
    if Main.Visible then
        Main.Visible = false
        return
    end

    local gameGui, gameMainFrame = getActiveGameGui()
    if gameGui and gameMainFrame and gameMainFrame.Visible then
        gameMainFrame.Visible = false
        Main.Visible = false
        return
    end

    if gameGui and gameMainFrame and not _G.HubInFocus then
        gameMainFrame.Visible = true
        Main.Visible = false
        return
    end

    _G.HubInFocus = true
    shared.HubInFocus = true
    Main.Visible = true
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        btnDragging = true
        btnMoved = false
        btnDragStart = input.Position
        btnStartPos = ToggleButton.Position

        local conn
        conn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                btnDragging = false
                if conn then conn:Disconnect() end
                if not btnMoved then
                    toggleVisibility()
                end
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if btnDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - btnDragStart
        if math.abs(delta.X) > 4 or math.abs(delta.Y) > 4 then
            btnMoved = true
        end
        ToggleButton.Position = UDim2.new(
            btnStartPos.X.Scale,
            btnStartPos.X.Offset + delta.X,
            btnStartPos.Y.Scale,
            btnStartPos.Y.Offset + delta.Y
        )
    end
end)

-- Discord & GitHub Copy Notification
local function showNotification(url, title)
    pcall(function()
        if setclipboard then
            setclipboard(url)
        elseif toclipboard then
            toclipboard(url)
        end
    end)
    if clickSound then clickSound:Play() end

    PopupMsg.Text = "Copied " .. title .. " link to clipboard!"
    PopupLink.Text = url
    DiscordPopup.Visible = true
    DiscordPopup.Size = UDim2.new(0, 260, 0, 105)
    DiscordPopup.Position = UDim2.new(0.5, 0, 0.52, 0)

    TweenService:Create(DiscordPopup, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 310, 0, 125),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()

    task.delay(2.6, function()
        if DiscordPopup.Visible then
            local t = TweenService:Create(DiscordPopup, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 250, 0, 95),
                Position = UDim2.new(0.5, 0, 0.52, 0)
            })
            t:Play()
            t.Completed:Connect(function() DiscordPopup.Visible = false end)
        end
    end)
end

DiscordClickBtn.MouseButton1Click:Connect(function()
    showNotification("https://discord.gg/PB8bhAHbJE", "Discord")
end)

GithubClickBtn.MouseButton1Click:Connect(function()
    showNotification("https://github.com/TripNation/infinity-hub", "GitHub")
end)



-- Search Bar Filter
Search:GetPropertyChangedSignal("Text"):Connect(function()
    local q = string.lower(Search.Text)
    for _, item in ipairs(ScrollingFrame:GetChildren()) do
        if item:IsA("Frame") then
            local title = item:FindFirstChild("Title")
            if title and title:IsA("TextLabel") then
                item.Visible = (q == "" or string.find(string.lower(title.Text), q, 1, true) ~= nil)
            end
        end
    end
end)

-- FPS Counter Loop
local frameCount = 0
local lastFpsTime = tick()
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    local elapsed = now - lastFpsTime
    if elapsed >= 0.35 then
        local fps = math.floor((frameCount / elapsed) + 0.5)
        frameCount = 0
        lastFpsTime = now
        if FpsLabel and FpsLabel.Parent then
            FpsLabel.Text = string.format("FPS: %d", fps)
            if fps >= 50 then
                StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
            elseif fps >= 30 then
                StatusDot.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
            else
                StatusDot.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            end
        end
    end
end)

-- Live Server Metrics
task.spawn(function()
    while task.wait(1) do
        if not InfinityHubGui or not InfinityHubGui.Parent then break end
        pcall(function()
            Players_Lbl.Text = string.format("👥 Players: %d / %s", #Players:GetPlayers(), tostring(Players.MaxPlayers))
            local ping = 0
            if localPlayer and localPlayer:GetNetworkPing() then
                ping = math.floor(localPlayer:GetNetworkPing() * 1000 + 0.5)
            end
            Ping.Text = string.format("📶 Ping: %d ms", ping)
            local uptime = math.floor(workspace.DistributedGameTime)
            local hrs = math.floor(uptime / 3600)
            local mins = math.floor((uptime % 3600) / 60)
            local secs = uptime % 60
            Uptime.Text = string.format("⏱️ Server Uptime: %02dh %02dm %02ds", hrs, mins, secs)
        end)
    end
end)

-- Rejoin & Server Hop
RejoinBtn.MouseButton1Click:Connect(function()
    if clickSound then clickSound:Play() end
    RejoinBtn.Text = "REJOINING..."
    pcall(function()
        if #Players:GetPlayers() <= 1 then
            localPlayer:Kick("\n[Infinity Hub] Rejoining server...")
            task.wait(0.5)
            TeleportService:Teleport(game.PlaceId, localPlayer)
        else
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
        end
    end)
end)

ServerHopBtn.MouseButton1Click:Connect(function()
    if clickSound then clickSound:Play() end
    ServerHopBtn.Text = "HOPPING..."
    task.spawn(function()
        local success, servers = pcall(function()
            local sfUrl = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100"
            return game:HttpGet(sfUrl)
        end)
        if success and servers then
            local parsed = HttpService:JSONDecode(servers)
            if parsed and parsed.data then
                for _, s in ipairs(parsed.data) do
                    if type(s) == "table" and s.id ~= game.JobId and s.playing < s.maxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, localPlayer)
                        return
                    end
                end
            end
        end
        TeleportService:Teleport(game.PlaceId, localPlayer)
    end)
end)

CopyJobBtn.MouseButton1Click:Connect(function()
    if clickSound then clickSound:Play() end
    local sessionUrl = string.format("https://www.roblox.com/games/start?placeId=%d&gameInstanceId=%s", game.PlaceId, game.JobId)
    pcall(function()
        if setclipboard then setclipboard(sessionUrl)
        elseif toclipboard then toclipboard(sessionUrl) end
    end)
    CopyJobBtn.Text = "COPIED LINK!"
    task.delay(1.5, function()
        if CopyJobBtn and CopyJobBtn.Parent then CopyJobBtn.Text = "Copy game Session" end
    end)
end)

-- Settings Toggles
local dotsOn = true
local gradientOn = true
local shadowOn = true

local function setupToggle(btn, onBox, checkImg, callback)
    local state = true
    local function toggle()
        if clickSound then clickSound:Play() end
        state = not state
        checkImg.Visible = state
        if callback then callback(state) end
    end
    btn.MouseButton1Click:Connect(toggle)
    onBox.MouseButton1Click:Connect(toggle)
end

setupToggle(Box, On, Check, function(state)
    dotsOn = state
    FloatingDots.Visible = state
end)

setupToggle(Box_2, On_2, Check_2, function(state)
    gradientOn = state
    UIGradient.Enabled = state
end)

setupToggle(Box_3, On_3, Check_3, function(state)
    shadowOn = state
end)

-- Volume Bar logic
local draggingVol = false
DragBackground.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingVol = true
        local relX = math.clamp((input.Position.X - DragBackground.AbsolutePosition.X) / DragBackground.AbsoluteSize.X, 0, 1)
        relX = math.floor(relX * 10 + 0.5) / 10
        Drag.Size = UDim2.new(relX, 0, 1, 0)
        DragCount.Text = tostring(relX)
        if clickSound then clickSound.Volume = 1.25 * relX end
        if hoverSound then hoverSound.Volume = 0.25 * relX end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingVol = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingVol and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local relX = math.clamp((input.Position.X - DragBackground.AbsolutePosition.X) / DragBackground.AbsoluteSize.X, 0, 1)
        relX = math.floor(relX * 10 + 0.5) / 10
        Drag.Size = UDim2.new(relX, 0, 1, 0)
        DragCount.Text = tostring(relX)
        if clickSound then clickSound.Volume = 1.25 * relX end
        if hoverSound then hoverSound.Volume = 0.25 * relX end
    end
end)

-- Unload Button
UnloadBtn.MouseButton1Click:Connect(function()
    if clickSound then clickSound:Play() end
    InfinityHubGui:Destroy()
end)

-- =========================================================
-- DYNAMIC GAMES LIST GENERATOR
-- Automatically loads all games from games_config.lua and
-- creates their cards on the GAME tab in the Hub!
-- =========================================================
local function POPULATE_GAMES_SYSTEM()
	local baseUrl = "https://raw.githubusercontent.com/TripNation/infinity-hub/main/"
	local cacheBuster = "?t=" .. tostring(math.floor(tick()))

	local defaultGames = {
		{
			Name = "Ride A Pet",
			PlaceId = 124216119978534,
			UniverseId = 10035204815,
			Desc = "Auto Farm, Train, Ride & Mods",
			Thumbnail = "rbxthumb://type=GameThumbnail&id=10035204815&w=768&h=432",
			Script = "games/ride_a_pet.lua"
		}
	}

	local gamesList = nil
	local s, data = pcall(function()
		return loadstring(game:HttpGet(baseUrl .. "games_config.lua" .. cacheBuster))()
	end)
	if s and type(data) == "table" then
		gamesList = data
	else
		gamesList = defaultGames
	end

	if not ScrollingFrame then return end

	for _, g in ipairs(gamesList) do
		local card = Instance.new("Frame")
		card.Name = g.Name .. "Card"
		card.Parent = ScrollingFrame
		card.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
		card.BorderSizePixel = 0
		card.Size = UDim2.new(1, 0, 0, 72)
		card:SetAttribute("PlaceId", g.PlaceId or 0)
		card:SetAttribute("UniverseId", g.UniverseId or 0)

		local stroke = Instance.new("UIStroke")
		stroke.Color = Color3.fromRGB(45, 48, 55)
		stroke.Thickness = 1
		stroke.Parent = card

		local thumb = Instance.new("ImageLabel")
		thumb.Name = "Thumbnail"
		thumb.Parent = card
		thumb.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
		thumb.BorderSizePixel = 0
		thumb.Position = UDim2.new(0, 8, 0, 8)
		thumb.Size = UDim2.new(0, 56, 0, 56)
		thumb.ClipsDescendants = true
		thumb.ScaleType = Enum.ScaleType.Crop
		thumb.Image = g.Thumbnail or ("rbxthumb://type=GameThumbnail&id=" .. tostring(g.UniverseId or g.PlaceId or 0) .. "&w=768&h=432")

		local thumbStroke = Instance.new("UIStroke")
		thumbStroke.Color = Color3.fromRGB(45, 48, 55)
		thumbStroke.Thickness = 1
		thumbStroke.Parent = thumb

		local title = Instance.new("TextLabel")
		title.Name = "Title"
		title.Parent = card
		title.BackgroundTransparency = 1.000
		title.Position = UDim2.new(0, 72, 0, 8)
		title.Size = UDim2.new(0, 180, 0, 18)
		title.Font = Enum.Font.GothamBold
		title.Text = g.Name
		title.TextColor3 = Color3.fromRGB(255, 255, 255)
		title.TextSize = 14.000
		title.TextXAlignment = Enum.TextXAlignment.Left

		local desc = Instance.new("TextLabel")
		desc.Name = "Desc"
		desc.Parent = card
		desc.BackgroundTransparency = 1.000
		desc.Position = UDim2.new(0, 72, 0, 27)
		desc.Size = UDim2.new(0, 180, 0, 14)
		desc.Font = Enum.Font.Gotham
		desc.Text = g.Desc or "Custom game script & mods"
		desc.TextColor3 = Color3.fromRGB(150, 150, 160)
		desc.TextSize = 10.000
		desc.TextXAlignment = Enum.TextXAlignment.Left

		local badge = Instance.new("TextLabel")
		badge.Name = "Badge"
		badge.Parent = card
		badge.BackgroundTransparency = 1.000
		badge.Position = UDim2.new(0, 72, 0, 45)
		badge.Size = UDim2.new(0, 110, 0, 16)
		badge.Font = Enum.Font.GothamBold
		badge.Text = "🟢 SUPPORTED"
		badge.TextColor3 = Color3.fromRGB(0, 255, 140)
		badge.TextSize = 9.000
		badge.TextXAlignment = Enum.TextXAlignment.Left

		local btn = Instance.new("TextButton")
		btn.Name = "LaunchBtn"
		btn.Parent = card
		btn.BackgroundColor3 = Color3.fromRGB(36, 38, 45)
		btn.BorderSizePixel = 0
		btn.Position = UDim2.new(1, -74, 0.5, -13)
		btn.Size = UDim2.new(0, 66, 0, 26)
		btn.Font = Enum.Font.GothamBold
		btn.Text = "OPEN ❯"
		btn.TextColor3 = Color3.fromRGB(240, 240, 245)
		btn.TextSize = 10.000

		local btnStroke = Instance.new("UIStroke")
		btnStroke.Color = Color3.fromRGB(65, 70, 80)
		btnStroke.Thickness = 1
		btnStroke.Parent = btn

		btn.MouseEnter:Connect(function()
			btn.BackgroundColor3 = Color3.fromRGB(48, 52, 60)
			btnStroke.Color = Color3.fromRGB(90, 95, 105)
		end)
		btn.MouseLeave:Connect(function()
			btn.BackgroundColor3 = Color3.fromRGB(36, 38, 45)
			btnStroke.Color = Color3.fromRGB(65, 70, 80)
		end)

		local cardClick = Instance.new("TextButton")
		cardClick.Name = "CardClick"
		cardClick.Parent = card
		cardClick.BackgroundTransparency = 1.000
		cardClick.Size = UDim2.new(1, -85, 1, 0)
		cardClick.Text = ""
		cardClick.ZIndex = 5

		local function launchGame()
			if clickSound then clickSound:Play() end
			Main.Visible = false
			_G.HubInFocus = false
			shared.HubInFocus = false

			-- If the player is currently in this game, run script directly
			local isCurrentGame = (g.PlaceId and game.PlaceId == g.PlaceId) or (g.UniverseId and game.GameId == g.UniverseId)
			if isCurrentGame or not g.PlaceId then
				local scriptUrl = string.find(g.Script, "^https?://") and g.Script or (baseUrl .. g.Script)
				loadstring(game:HttpGet(scriptUrl .. "?t=" .. tostring(tick())))()
			else
				-- If player is in a different game, teleport to the game
				TeleportService:Teleport(g.PlaceId, localPlayer)
			end
		end

		btn.MouseButton1Click:Connect(launchGame)
		cardClick.MouseButton1Click:Connect(launchGame)
	end
end
coroutine.wrap(POPULATE_GAMES_SYSTEM)()

print("✅ [Infinity Hub] Loaded successfully!")

-- =========================================================
-- INFINITY HUB // LIVE ANNOUNCEMENTS CLIENT SYSTEM
-- =========================================================
task.spawn(function()
	local AnnouncementConfig = {
		ApiUrls = {
			"http://127.0.0.1:3000/api/announcements/latest",
			"http://localhost:3000/api/announcements/latest",
			"http://10.0.0.6:3000/api/announcements/latest"
		},
		PollInterval = 5,
		HubVersion = "2.1.0",
		CurrentModule = "Ride A Pet"
	}

	local lastSeenId = nil
	local activeCard = nil

	local function RequestGet(url)
		local reqFn = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
		if reqFn then
			local ok, res = pcall(function()
				return reqFn({
					Url = url,
					Method = "GET",
					Headers = { ["Cache-Control"] = "no-cache" }
				})
			end)
			if ok and res then
				local b = res.Body or res.body
				if b and b ~= "" and b ~= "null" then return b end
			end
		end

		if game.HttpGet then
			local ok, b = pcall(function()
				return game:HttpGet(url)
			end)
			if ok and b and b ~= "" and b ~= "null" then return b end
		end

		if HttpService and HttpService.GetAsync then
			local ok, b = pcall(function()
				return HttpService:GetAsync(url)
			end)
			if ok and b and b ~= "" and b ~= "null" then return b end
		end

		return nil
	end

	local function GetLatest()
		local t = tostring(math.floor(tick() * 1000))
		for _, base in ipairs(AnnouncementConfig.ApiUrls) do
			local url = base .. "?_t=" .. t
			local raw = RequestGet(url)
			if raw then
				local s, data = pcall(function()
					return HttpService:JSONDecode(raw)
				end)
				if s and type(data) == "table" and data.id and data.active then
					return data
				end
			end
		end
		return nil
	end

	local function GetCurrentGameName()
		local pId = tostring(game.PlaceId)
		local uId = tostring(game.GameId)

		-- Match PlaceId / UniverseId from games_config.lua
		if pId == "124216119978534" or uId == "10035204815" then
			return "Ride A Pet"
		elseif pId == "131623223084840" or uId == "9363735110" then
			return "Escape Tsunami For Brainrots"
		end

		-- Check if game script GUI is currently active
		if _G.RideAPetGui or _G.RideAPetMainFrame then
			return "Ride A Pet"
		end
		if _G.EscapeTsunamiGui or _G.EscapeTsunamiMainFrame then
			return "Escape Tsunami For Brainrots"
		end

		-- Check GameName label inside Infinity Hub
		if GameName and GameName.Text and GameName.Text ~= "" and GameName.Text ~= "Unknown Game" then
			local gTxt = string.lower(GameName.Text)
			if string.find(gTxt, "ride", 1, true) or string.find(gTxt, "pet", 1, true) then
				return "Ride A Pet"
			elseif string.find(gTxt, "tsunami", 1, true) or string.find(gTxt, "brainrot", 1, true) then
				return "Escape Tsunami For Brainrots"
			end
			return GameName.Text
		end

		return "Hub"
	end

	local function ShouldShow(announcement)
		if not announcement or not announcement.active then return false end

		local target = string.lower(announcement.target or "everyone")
		local targetMod = string.lower(announcement.targetModule or "")

		-- 1. If target is "All" / "everyone" or targetModule is "all", show to the whole hub!
		if target == "everyone" or targetMod == "" or targetMod == "all" or targetMod == "everyone" then
			return true
		end

		-- 2. Specific game selection
		local currentGame = string.lower(GetCurrentGameName())

		-- Ride A Pet check
		if string.find(targetMod, "ride", 1, true) or string.find(targetMod, "pet", 1, true) then
			return string.find(currentGame, "ride", 1, true) or string.find(currentGame, "pet", 1, true)
		end

		-- Escape Tsunami For Brainrots check
		if string.find(targetMod, "tsunami", 1, true) or string.find(targetMod, "escape", 1, true) or string.find(targetMod, "brainrot", 1, true) then
			return string.find(currentGame, "tsunami", 1, true) or string.find(currentGame, "brainrot", 1, true)
		end

		-- Custom game name match
		return string.find(currentGame, targetMod, 1, true) ~= nil
	end


	local function DisplayAnnouncement(announcement)
		if activeCard and activeCard.Parent then
			activeCard:Destroy()
			activeCard = nil
		end

		local parentGui = InfinityHubGui or (gethui and gethui()) or game:GetService("CoreGui")

		-- Sleek Compact Card Container (matching reference)
		local card = Instance.new("Frame")
		card.Name = "InfinityHub_LiveAnnouncement"
		card.AnchorPoint = Vector2.new(0.5, 0)
		card.Size = UDim2.new(0, 410, 0, 64)
		card.Position = UDim2.new(0.5, 0, 0, -85) -- Start above screen
		card.BackgroundColor3 = Color3.fromRGB(18, 19, 24)
		card.BorderSizePixel = 0
		card.ZIndex = 9999
		card.Parent = parentGui
		activeCard = card

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
		logoHolder.Position = UDim2.new(0, 12, 0, 10)
		logoHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		logoHolder.BorderSizePixel = 0
		logoHolder.ZIndex = 10000
		logoHolder.Parent = card

		local holderCorner = Instance.new("UICorner")
		holderCorner.CornerRadius = UDim.new(0, 8)
		holderCorner.Parent = logoHolder

		-- Infinity Logo inside White Square
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

		-- Dynamic Header based on announcement type (e.g., "Infinity Update", "Infinity Warning")
		local rawType = tostring(announcement.type or "Announcement")
		local formattedType = rawType:gsub("(%a)([%w_']*)", function(first, rest)
			return first:upper() .. rest:lower()
		end)
		if formattedType == "" then formattedType = "Announcement" end
		local headerText = "Infinity " .. formattedType

		-- Top Header
		local headerLbl = Instance.new("TextLabel")
		headerLbl.Name = "Header"
		headerLbl.Size = UDim2.new(1, -85, 0, 18)
		headerLbl.Position = UDim2.new(0, 58, 0, 10)
		headerLbl.BackgroundTransparency = 1
		headerLbl.Text = headerText
		headerLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
		headerLbl.Font = Enum.Font.GothamBold
		headerLbl.TextSize = 13
		headerLbl.TextXAlignment = Enum.TextXAlignment.Left
		headerLbl.ZIndex = 10000
		headerLbl.Parent = card

		-- Bottom Message: Announcement message
		local msgText = tostring(announcement.message or "")
		if announcement.title and announcement.title ~= "" and announcement.title ~= "Infinity Hub" and announcement.title ~= "Infinity Announcements" and announcement.title ~= headerText then
			msgText = announcement.title .. ": " .. msgText
		end

		local msgLbl = Instance.new("TextLabel")
		msgLbl.Name = "Message"
		msgLbl.Size = UDim2.new(1, -85, 0, 18)
		msgLbl.Position = UDim2.new(0, 58, 0, 28)
		msgLbl.BackgroundTransparency = 1
		msgLbl.Text = msgText
		msgLbl.TextColor3 = Color3.fromRGB(180, 185, 195)
		msgLbl.Font = Enum.Font.GothamMedium
		msgLbl.TextSize = 11
		msgLbl.TextTruncate = Enum.TextTruncate.AtEnd
		msgLbl.TextXAlignment = Enum.TextXAlignment.Left
		msgLbl.ZIndex = 10000
		msgLbl.Parent = card

		-- Bottom Duration Progress Bar Track
		local progressTrack = Instance.new("Frame")
		progressTrack.Name = "ProgressTrack"
		progressTrack.Size = UDim2.new(1, -24, 0, 3)
		progressTrack.Position = UDim2.new(0, 12, 1, -7)
		progressTrack.BackgroundColor3 = Color3.fromRGB(38, 42, 54)
		progressTrack.BorderSizePixel = 0
		progressTrack.ZIndex = 10000
		progressTrack.Parent = card

		local trackCorner = Instance.new("UICorner")
		trackCorner.CornerRadius = UDim.new(0, 2)
		trackCorner.Parent = progressTrack

		-- Progress Bar Fill
		local progressFill = Instance.new("Frame")
		progressFill.Name = "ProgressFill"
		progressFill.Size = UDim2.new(1, 0, 1, 0)
		progressFill.BackgroundColor3 = Color3.fromRGB(230, 235, 245)
		progressFill.BorderSizePixel = 0
		progressFill.ZIndex = 10001
		progressFill.Parent = progressTrack

		local fillCorner = Instance.new("UICorner")
		fillCorner.CornerRadius = UDim.new(0, 2)
		fillCorner.Parent = progressFill

		-- Sound
		pcall(function()
			if clickSound then clickSound:Play() end
		end)

		-- Slide Down Animation
		TweenService:Create(card, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, 0, 0, 18)
		}):Play()

		local dismissed = false
		local function Dismiss()
			if dismissed then return end
			dismissed = true
			local outTween = TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Position = UDim2.new(0.5, 0, 0, -85)
			})
			outTween:Play()
			outTween.Completed:Connect(function()
				if card and card.Parent then card:Destroy() end
			end)
		end

		dismissBtn.MouseButton1Click:Connect(Dismiss)

		-- Animate Progress Bar countdown and Auto-dismiss
		local dur = tonumber(announcement.duration)
		if dur == nil or dur > 0 then
			local durSecs = (dur and dur > 0) and dur or 10
			TweenService:Create(progressFill, TweenInfo.new(durSecs, Enum.EasingStyle.Linear), {
				Size = UDim2.new(0, 0, 1, 0)
			}):Play()
			task.delay(durSecs, Dismiss)
		end
	end

	print("[Infinity Hub] 📡 Live Announcement System Active")
	task.wait(2)

	while true do
		pcall(function()
			local announcement = GetLatest()
			if announcement and announcement.id and announcement.active then
				if announcement.id ~= lastSeenId then
					if ShouldShow(announcement) then
						lastSeenId = announcement.id
						print(string.format("[Infinity Hub] 📢 New Announcement #%d: '%s'", announcement.id, announcement.title))
						DisplayAnnouncement(announcement)
					else
						lastSeenId = announcement.id
					end
				end
			end
		end)
		task.wait(AnnouncementConfig.PollInterval)
	end
end)
