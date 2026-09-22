pcall(function()
    if _G.InfinityGui and typeof(_G.InfinityGui) == "Instance" then
        _G.InfinityGui:Destroy()
    end
end)
pcall(function()
    if gethui then
        local old = gethui():FindFirstChild("Gui")
        if old then old:Destroy() end
    end
end)
pcall(function()
    local cg = game:GetService("CoreGui")
    local old = cg:FindFirstChild("Gui")
    if old then old:Destroy() end
end)
local localPlayer = game:GetService("Players").LocalPlayer
pcall(function()
    if localPlayer and localPlayer:FindFirstChild("PlayerGui") then
        local old = localPlayer.PlayerGui:FindFirstChild("Gui")
        if old then old:Destroy() end
    end
end)


-- Instances:
local Gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local FloatingDots = Instance.new("Frame")
local Close = Instance.new("ImageButton")
local DragButton = Instance.new("Frame")
local DragIcon = Instance.new("ImageLabel")
local Logo = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Home = Instance.new("TextButton")
local Line = Instance.new("TextLabel")
local HFrame = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
local Liasspai = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Role = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Name_2 = Instance.new("TextLabel")
local Role_2 = Instance.new("TextLabel")
local Support = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local Discord = Instance.new("TextButton")
local Icon = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local Special = Instance.new("TextLabel")
local Someone = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Name_3 = Instance.new("TextLabel")
local Welcome = Instance.new("ImageLabel")
local UICorner_6 = Instance.new("UICorner")
local Welcome_2 = Instance.new("TextLabel")
local PlayerName = Instance.new("TextLabel")
local Game = Instance.new("TextButton")
local Line_2 = Instance.new("TextLabel")
local GFrame = Instance.new("Frame")
local Search = Instance.new("TextBox")
local UICorner_7 = Instance.new("UICorner")
local ImageLabel_2 = Instance.new("ImageLabel")
local UICorner_8 = Instance.new("UICorner")
local ServerBtn = Instance.new("TextButton")
local Line_3 = Instance.new("TextLabel")
local ServerFrame = Instance.new("Frame")
local GameCard = Instance.new("Frame")
local GameCardStroke = Instance.new("UIStroke")
local GameHeader = Instance.new("TextLabel")
local GameNameLabel = Instance.new("TextLabel")
local PlaceInfoLabel = Instance.new("TextLabel")
local SupportBadge = Instance.new("Frame")
local SupportBadgeStroke = Instance.new("UIStroke")
local SupportBadgeText = Instance.new("TextLabel")
local SubtitleLabel = Instance.new("TextLabel")
local StatsCard = Instance.new("Frame")
local StatsCardStroke = Instance.new("UIStroke")
local StatsHeader = Instance.new("TextLabel")
local PlayersLabel = Instance.new("TextLabel")
local PingLabel = Instance.new("TextLabel")
local UptimeLabel = Instance.new("TextLabel")
local JobIdLabel = Instance.new("TextLabel")
local CopyJobBtn = Instance.new("TextButton")
local ActionsCard = Instance.new("Frame")
local ActionsCardStroke = Instance.new("UIStroke")
local ActionsHeader = Instance.new("TextLabel")
local RejoinBtn = Instance.new("TextButton")
local ServerHopBtn = Instance.new("TextButton")
local ServerHopBtnStroke = Instance.new("UIStroke")
local Settings = Instance.new("TextButton")
local SFrame = Instance.new("Frame")
local Volume = Instance.new("TextLabel")
local UiSounds = Instance.new("TextLabel")
local DragCount = Instance.new("TextLabel")
local DragBackground = Instance.new("TextLabel")
local UICorner_9 = Instance.new("UICorner")
local Drag = Instance.new("TextLabel")
local UICorner_10 = Instance.new("UICorner")
local Line1 = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local Line2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local UI = Instance.new("TextLabel")
local Dots = Instance.new("TextLabel")
local Box = Instance.new("TextButton")
local On = Instance.new("TextButton")
local Check = Instance.new("ImageLabel")
local Info = Instance.new("Frame")
local OnOff = Instance.new("TextLabel")
local Name_4 = Instance.new("TextLabel")
local Information = Instance.new("TextLabel")
local Line1_2 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local Line2_2 = Instance.new("TextLabel")
local UIGradient_4 = Instance.new("UIGradient")
local Gradient = Instance.new("TextLabel")
local Box_2 = Instance.new("TextButton")
local On_2 = Instance.new("TextButton")
local Check_2 = Instance.new("ImageLabel")
local Info_2 = Instance.new("Frame")
local OnOff_2 = Instance.new("TextLabel")
local Name_5 = Instance.new("TextLabel")
local Information_2 = Instance.new("TextLabel")
local Shadow = Instance.new("TextLabel")
local Box_3 = Instance.new("TextButton")
local On_3 = Instance.new("TextButton")
local Check_3 = Instance.new("ImageLabel")
local Info_3 = Instance.new("Frame")
local OnOff_3 = Instance.new("TextLabel")
local Name_6 = Instance.new("TextLabel")
local Information_3 = Instance.new("TextLabel")
local Line_4 = Instance.new("TextLabel")
local Line_5 = Instance.new("TextLabel")
local UICorner_11 = Instance.new("UICorner")
local UIGradient_5 = Instance.new("UIGradient")

-- Discord Notification Popup Window (Parented to Main so it stays centered inside the GUI)
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

-- Unload GUI Option (Settings Tab)
local Unload = Instance.new("TextLabel")
local UnloadBtn = Instance.new("TextButton")
local UnloadBtnCorner = Instance.new("UICorner")
local UnloadBtnStroke = Instance.new("UIStroke")
local Info_4 = Instance.new("Frame")
local OnOff_4 = Instance.new("TextLabel")
local Name_7 = Instance.new("TextLabel")
local Information_4 = Instance.new("TextLabel")

-- FPS Counter Display (Top Right of Screen)
local FpsGui = Instance.new("Frame")
local FpsCorner = Instance.new("UICorner")
local FpsStroke = Instance.new("UIStroke")
local FpsDot = Instance.new("Frame")
local FpsDotCorner = Instance.new("UICorner")
local FpsLabel = Instance.new("TextLabel")

-- Floating Toggle GUI Button (Draggable Infinity figure 8)
local ToggleButton = Instance.new("ImageButton")

-- Global Mode & Game GUI References
local activeGuiMode = "Hub"

--Properties:

Gui.Name = "Gui"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.IgnoreGuiInset = true

local success, parent = pcall(function()
    return (gethui and gethui()) or game:GetService("CoreGui")
end)
if success and parent then
    Gui.Parent = parent
else
    Gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

_G.InfinityGui = Gui
shared.InfinityGui = Gui

Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.380322784, 0, 0.220715895, 0)
Main.Size = UDim2.new(0, 399, 0, 499)
Main.Visible = true

-- Background FloatingDots container (stays behind buttons)
FloatingDots.Name = "FloatingDots"
FloatingDots.Parent = Main
FloatingDots.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FloatingDots.BackgroundTransparency = 1.000
FloatingDots.BorderSizePixel = 0
FloatingDots.ClipsDescendants = true
FloatingDots.Size = UDim2.new(1, 0, 1, 0)
FloatingDots.Active = false
FloatingDots.ZIndex = 1

Close.Name = "Close"
Close.Parent = Main
Close.AnchorPoint = Vector2.new(1, 0.5)
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.982500017, 0, 0.0439999998, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.AutoButtonColor = false
Close.Image = "rbxassetid://14219436180"

DragButton.Name = "DragButton"
DragButton.Parent = Main
DragButton.AnchorPoint = Vector2.new(1, 0.5)
DragButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DragButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragButton.BorderSizePixel = 0
DragButton.Position = UDim2.new(0.888000011, 0, 0.0439999998, 0)
DragButton.Size = UDim2.new(0, 30, 0, 30)

DragIcon.Name = "DragIcon"
DragIcon.Parent = DragButton
DragIcon.AnchorPoint = Vector2.new(1, 0.5)
DragIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragIcon.BackgroundTransparency = 1.000
DragIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragIcon.BorderSizePixel = 0
DragIcon.Position = UDim2.new(1, 0, 0.5, 0)
DragIcon.Size = UDim2.new(0, 30, 0, 30)
DragIcon.Image = "rbxassetid://94225529221725"

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Logo.BackgroundTransparency = 1.000
Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.0200000275, 0, 0, 0)
Logo.Size = UDim2.new(0, 60, 0, 47)
Logo.Image = "rbxassetid://17894477503"

TextLabel.Parent = Logo
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.783333361, 0, 0.25, 0)
TextLabel.Size = UDim2.new(0, 123, 0, 22)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "INFINITY"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Home.Name = "Home"
Home.Parent = Main
Home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home.BackgroundTransparency = 1.000
Home.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home.BorderSizePixel = 0
Home.Position = UDim2.new(0.0175438598, 0, 0.118000008, 0)
Home.Size = UDim2.new(0, 93, 0, 18)
Home.Font = Enum.Font.GothamBold
Home.Text = "HOME"
Home.TextColor3 = Color3.fromRGB(0, 174, 255)
Home.TextScaled = true
Home.TextSize = 14.000
Home.TextWrapped = true

Line.Name = "Line"
Line.Parent = Home
Line.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line.Size = UDim2.new(0, 75, 0, 1)
Line.Font = Enum.Font.SourceSans
Line.Text = ""
Line.TextColor3 = Color3.fromRGB(0, 0, 0)
Line.TextSize = 14.000

HFrame.Name = "HFrame"
HFrame.Parent = Home
HFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HFrame.BackgroundTransparency = 1.000
HFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HFrame.BorderSizePixel = 0
HFrame.Position = UDim2.new(0, 0, 5.27778196, 0)
HFrame.Size = UDim2.new(0, 375, 0, 381)

Credits.Name = "Credits"
Credits.Parent = HFrame
Credits.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.0133333337, 0, -0.0524934381, 0)
Credits.Size = UDim2.new(0, 99, 0, 50)
Credits.Font = Enum.Font.GothamBold
Credits.Text = "CREDITS"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextSize = 25.000
Credits.TextWrapped = true

Liasspai.Name = "Liasspai"
Liasspai.Parent = HFrame
Liasspai.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Liasspai.BorderColor3 = Color3.fromRGB(0, 0, 0)
Liasspai.BorderSizePixel = 0
Liasspai.Position = UDim2.new(0.0399999991, 0, 0.0787401572, 0)
Liasspai.Size = UDim2.new(0, 30, 0, 30)
Liasspai.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=10895916254&width=420&height=420&format=png"

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = Liasspai

Name.Name = "Name"
Name.Parent = Liasspai
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Position = UDim2.new(1.5, 0, 0.13333334, 0)
Name.Size = UDim2.new(0, 78, 0, 13)
Name.Font = Enum.Font.GothamBold
Name.Text = "LIASSPAI"
Name.TextColor3 = Color3.fromRGB(59, 59, 59)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

Role.Name = "Role"
Role.Parent = Liasspai
Role.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Role.BackgroundTransparency = 1.000
Role.BorderColor3 = Color3.fromRGB(0, 0, 0)
Role.BorderSizePixel = 0
Role.Position = UDim2.new(1.5, 0, 0.566666663, 0)
Role.Size = UDim2.new(0, 78, 0, 13)
Role.Font = Enum.Font.GothamBold
Role.Text = "GUI/DESIGNER"
Role.TextColor3 = Color3.fromRGB(59, 59, 59)
Role.TextScaled = true
Role.TextSize = 14.000
Role.TextWrapped = true

ImageLabel.Name = "---"
ImageLabel.Parent = HFrame
ImageLabel.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0399999991, 0, 0.194225729, 0)
ImageLabel.Size = UDim2.new(0, 30, 0, 30)
ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=10895916254&width=420&height=420&format=png"

UICorner_2.CornerRadius = UDim.new(0, 50)
UICorner_2.Parent = ImageLabel

Name_2.Name = "Name"
Name_2.Parent = ImageLabel
Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_2.BackgroundTransparency = 1.000
Name_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_2.BorderSizePixel = 0
Name_2.Position = UDim2.new(1.5, 0, 0.13333334, 0)
Name_2.Size = UDim2.new(0, 78, 0, 13)
Name_2.Font = Enum.Font.GothamBold
Name_2.Text = "???"
Name_2.TextColor3 = Color3.fromRGB(59, 59, 59)
Name_2.TextScaled = true
Name_2.TextSize = 14.000
Name_2.TextWrapped = true

Role_2.Name = "Role"
Role_2.Parent = ImageLabel
Role_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Role_2.BackgroundTransparency = 1.000
Role_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Role_2.BorderSizePixel = 0
Role_2.Position = UDim2.new(1.5, 0, 0.566666663, 0)
Role_2.Size = UDim2.new(0, 78, 0, 13)
Role_2.Font = Enum.Font.GothamBold
Role_2.Text = "SCRIPTER"
Role_2.TextColor3 = Color3.fromRGB(59, 59, 59)
Role_2.TextScaled = true
Role_2.TextSize = 14.000
Role_2.TextWrapped = true

Support.Name = "Support"
Support.Parent = HFrame
Support.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Support.BorderColor3 = Color3.fromRGB(0, 0, 0)
Support.BorderSizePixel = 0
Support.Position = UDim2.new(0, 0, 0.540682316, 0)
Support.Size = UDim2.new(0, 228, 0, 50)
Support.Font = Enum.Font.GothamBold
Support.Text = "WANT TO SUPPORT US?"
Support.TextColor3 = Color3.fromRGB(255, 255, 255)
Support.TextSize = 20.000
Support.TextWrapped = true

UICorner_3.Parent = Support

Discord.Name = "Discord"
Discord.Parent = Support
Discord.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
Discord.BackgroundTransparency = 1.000
Discord.BorderColor3 = Color3.fromRGB(0, 0, 0)
Discord.BorderSizePixel = 0
Discord.Position = UDim2.new(-0.0614035092, 0, 1, 0)
Discord.Size = UDim2.new(0, 200, 0, 50)
Discord.AutoButtonColor = false
Discord.Font = Enum.Font.Gotham
Discord.Text = "DISCORD"
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.TextSize = 25.000

Icon.Name = "Icon"
Icon.Parent = Discord
Icon.Active = false
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.0949999988, 0, 0.239999995, 0)
Icon.Size = UDim2.new(0, 25, 0, 25)
Icon.Image = "rbxassetid://10367063073"

UICorner_4.Parent = Icon

TextLabel_2.Parent = Discord
TextLabel_2.Active = false
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.109999999, 0, 0.479999989, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "CLICK TO COPY DISCORD INVITE"
TextLabel_2.TextColor3 = Color3.fromRGB(140, 140, 140)
TextLabel_2.TextSize = 14.000

Special.Name = "Special"
Special.Parent = HFrame
Special.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Special.BackgroundTransparency = 1.000
Special.BorderColor3 = Color3.fromRGB(0, 0, 0)
Special.BorderSizePixel = 0
Special.Position = UDim2.new(0, 0, 0.272965878, 0)
Special.Size = UDim2.new(0, 240, 0, 50)
Special.Font = Enum.Font.GothamBold
Special.Text = "SPECIAL THANKS TO"
Special.TextColor3 = Color3.fromRGB(255, 255, 255)
Special.TextSize = 25.000
Special.TextWrapped = true

Someone.Name = "Someone"
Someone.Parent = HFrame
Someone.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Someone.BorderColor3 = Color3.fromRGB(0, 0, 0)
Someone.BorderSizePixel = 0
Someone.Position = UDim2.new(0.0399999991, 0, 0.404199481, 0)
Someone.Size = UDim2.new(0, 30, 0, 30)
Someone.Image = "rbxthumb://type=AvatarHeadShot&id=819458846&w=150&h=150"

UICorner_5.CornerRadius = UDim.new(0, 50)
UICorner_5.Parent = Someone

Name_3.Name = "Name"
Name_3.Parent = Someone
Name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_3.BackgroundTransparency = 1.000
Name_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_3.BorderSizePixel = 0
Name_3.Position = UDim2.new(1.79999995, 0, 0.233333334, 0)
Name_3.Size = UDim2.new(0, 110, 0, 15)
Name_3.Font = Enum.Font.GothamBold
Name_3.Text = "TripNation416"
Name_3.TextColor3 = Color3.fromRGB(200, 200, 200)
Name_3.TextScaled = true
Name_3.TextSize = 14.000
Name_3.TextWrapped = true

Welcome.Name = "Welcome"
Welcome.Parent = HFrame
Welcome.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.0320000015, 0, -0.123359583, 0)
Welcome.Size = UDim2.new(0, 25, 0, 25)

UICorner_6.CornerRadius = UDim.new(0, 50)
UICorner_6.Parent = Welcome

Welcome_2.Name = "Welcome"
Welcome_2.Parent = Welcome
Welcome_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome_2.BackgroundTransparency = 1.000
Welcome_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome_2.BorderSizePixel = 0
Welcome_2.Position = UDim2.new(1.41999996, 0, -0.0266662594, 0)
Welcome_2.Size = UDim2.new(0, 78, 0, 13)
Welcome_2.Font = Enum.Font.GothamBold
Welcome_2.Text = "WELCOME"
Welcome_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Welcome_2.TextScaled = true
Welcome_2.TextSize = 14.000
Welcome_2.TextWrapped = true

PlayerName.Name = "PlayerName"
PlayerName.Parent = Welcome
PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1.000
PlayerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerName.BorderSizePixel = 0
PlayerName.Position = UDim2.new(1.41999996, 0, 0.526666284, 0)
PlayerName.Size = UDim2.new(0, 78, 0, 13)
PlayerName.Font = Enum.Font.SourceSansBold
PlayerName.Text = "PlayerName"
PlayerName.TextColor3 = Color3.fromRGB(0, 0, 0)
PlayerName.TextScaled = true
PlayerName.TextSize = 14.000
PlayerName.TextWrapped = true

Game.Name = "Game"
Game.Parent = Main
Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Game.BackgroundTransparency = 1.000
Game.BorderColor3 = Color3.fromRGB(0, 0, 0)
Game.BorderSizePixel = 0
Game.Position = UDim2.new(0.25261274, 0, 0.118000008, 0)
Game.Size = UDim2.new(0, 93, 0, 18)
Game.Font = Enum.Font.GothamBold
Game.Text = "GAME"
Game.TextColor3 = Color3.fromRGB(255, 255, 255)
Game.TextScaled = true
Game.TextSize = 14.000
Game.TextWrapped = true

Line_2.Name = "Line"
Line_2.Parent = Game
Line_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line_2.BorderSizePixel = 0
Line_2.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line_2.Size = UDim2.new(0, 75, 0, 1)
Line_2.Visible = false
Line_2.Font = Enum.Font.SourceSans
Line_2.Text = ""
Line_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Line_2.TextSize = 14.000

GFrame.Name = "GFrame"
GFrame.Parent = Game
GFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GFrame.BackgroundTransparency = 1.000
GFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
GFrame.BorderSizePixel = 0
GFrame.Position = UDim2.new(-0.956752956, 0, 2.61088824, 0)
GFrame.Size = UDim2.new(0, 375, 0, 381)
GFrame.Visible = false

Search.Name = "Search"
Search.Parent = GFrame
Search.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
Search.BorderSizePixel = 0
Search.Position = UDim2.new(0.0484947935, 0, 0, 0)
Search.Size = UDim2.new(0, 357, 0, 31)
Search.Font = Enum.Font.GothamBold
Search.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Search.PlaceholderText = "SEARCH"
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(255, 255, 255)
Search.TextScaled = true
Search.TextSize = 25.000
Search.TextWrapped = true

UICorner_7.Parent = Search

ImageLabel_2.Parent = Search
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(-0.0530973375, 0, 0, 0)
ImageLabel_2.Size = UDim2.new(0, 31, 0, 31)
ImageLabel_2.Image = "rbxassetid://11496279085"

UICorner_8.Parent = ImageLabel_2

-- ==========================================
-- GAME TAB: GAMES LIST CONTAINER
-- ==========================================
local GamesScroll = Instance.new("ScrollingFrame")
GamesScroll.Name = "GamesScroll"
GamesScroll.Parent = GFrame
GamesScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GamesScroll.BackgroundTransparency = 1.000
GamesScroll.BorderSizePixel = 0
GamesScroll.Position = UDim2.new(0.048, 0, 0, 38)
GamesScroll.Size = UDim2.new(0, 357, 0, 336)
GamesScroll.ScrollBarThickness = 3
GamesScroll.ScrollBarImageColor3 = Color3.fromRGB(70, 75, 85)
GamesScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
GamesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local GamesListLayout = Instance.new("UIListLayout")
GamesListLayout.Parent = GamesScroll
GamesListLayout.SortOrder = Enum.SortOrder.LayoutOrder
GamesListLayout.Padding = UDim.new(0, 8)

ServerBtn.Name = "Server"
ServerBtn.Parent = Main
ServerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ServerBtn.BackgroundTransparency = 1.000
ServerBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
ServerBtn.BorderSizePixel = 0
ServerBtn.Position = UDim2.new(0.487681597, 0, 0.118000008, 0)
ServerBtn.Size = UDim2.new(0, 93, 0, 18)
ServerBtn.Font = Enum.Font.GothamBold
ServerBtn.Text = "SERVER"
ServerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerBtn.TextScaled = true
ServerBtn.TextSize = 14.000
ServerBtn.TextWrapped = true

Line_3.Name = "Line"
Line_3.Parent = ServerBtn
Line_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line_3.BorderSizePixel = 0
Line_3.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line_3.Size = UDim2.new(0, 75, 0, 1)
Line_3.Visible = false
Line_3.Font = Enum.Font.SourceSans
Line_3.Text = ""
Line_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Line_3.TextSize = 14.000

-- ==========================================
-- SERVER TAB CONTAINER
-- ==========================================
ServerFrame.Name = "ServerFrame"
ServerFrame.Parent = ServerBtn
ServerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ServerFrame.BackgroundTransparency = 1.000
ServerFrame.BorderSizePixel = 0
ServerFrame.Position = UDim2.new(-1.96774197, 0, 2.61088824, 0)
ServerFrame.Size = UDim2.new(0, 375, 0, 381)
ServerFrame.Visible = false

-- 1. CURRENT EXPERIENCE CARD (Sharp Corners)
GameCard.Name = "GameCard"
GameCard.Parent = ServerFrame
GameCard.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
GameCard.BorderSizePixel = 0
GameCard.Position = UDim2.new(0, 9, 0, 4)
GameCard.Size = UDim2.new(0, 357, 0, 102)

GameCardStroke.Color = Color3.fromRGB(45, 48, 55)
GameCardStroke.Thickness = 1
GameCardStroke.Parent = GameCard

GameHeader.Name = "Header"
GameHeader.Parent = GameCard
GameHeader.BackgroundTransparency = 1.000
GameHeader.Position = UDim2.new(0, 12, 0, 7)
GameHeader.Size = UDim2.new(0, 150, 0, 14)
GameHeader.Font = Enum.Font.GothamBold
GameHeader.Text = "CURRENT EXPERIENCE"
GameHeader.TextColor3 = Color3.fromRGB(150, 150, 160)
GameHeader.TextSize = 10.000
GameHeader.TextXAlignment = Enum.TextXAlignment.Left

SupportBadge.Name = "SupportBadge"
SupportBadge.Parent = GameCard
SupportBadge.BackgroundColor3 = Color3.fromRGB(15, 45, 25)
SupportBadge.BorderSizePixel = 0
SupportBadge.Position = UDim2.new(1, -138, 0, 7)
SupportBadge.Size = UDim2.new(0, 126, 0, 20)

SupportBadgeStroke.Color = Color3.fromRGB(0, 255, 140)
SupportBadgeStroke.Thickness = 1
SupportBadgeStroke.Parent = SupportBadge

SupportBadgeText.Name = "Text"
SupportBadgeText.Parent = SupportBadge
SupportBadgeText.BackgroundTransparency = 1.000
SupportBadgeText.Size = UDim2.new(1, 0, 1, 0)
SupportBadgeText.Font = Enum.Font.GothamBold
SupportBadgeText.Text = "CHECKING..."
SupportBadgeText.TextColor3 = Color3.fromRGB(0, 255, 140)
SupportBadgeText.TextSize = 10.000

GameNameLabel.Name = "GameName"
GameNameLabel.Parent = GameCard
GameNameLabel.BackgroundTransparency = 1.000
GameNameLabel.Position = UDim2.new(0, 12, 0, 27)
GameNameLabel.Size = UDim2.new(1, -24, 0, 24)
GameNameLabel.Font = Enum.Font.GothamBold
GameNameLabel.Text = "Detecting Game..."
GameNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
GameNameLabel.TextSize = 15.000
GameNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
GameNameLabel.TextXAlignment = Enum.TextXAlignment.Left

PlaceInfoLabel.Name = "PlaceInfo"
PlaceInfoLabel.Parent = GameCard
PlaceInfoLabel.BackgroundTransparency = 1.000
PlaceInfoLabel.Position = UDim2.new(0, 12, 0, 54)
PlaceInfoLabel.Size = UDim2.new(1, -24, 0, 16)
PlaceInfoLabel.Font = Enum.Font.Gotham
PlaceInfoLabel.Text = "Place ID: " .. tostring(game.PlaceId)
PlaceInfoLabel.TextColor3 = Color3.fromRGB(160, 165, 175)
PlaceInfoLabel.TextSize = 11.000
PlaceInfoLabel.TextXAlignment = Enum.TextXAlignment.Left

SubtitleLabel.Name = "Subtitle"
SubtitleLabel.Parent = GameCard
SubtitleLabel.BackgroundTransparency = 1.000
SubtitleLabel.Position = UDim2.new(0, 12, 0, 73)
SubtitleLabel.Size = UDim2.new(1, -24, 0, 18)
SubtitleLabel.Font = Enum.Font.GothamBold
SubtitleLabel.Text = "Checking Infinity Hub support status..."
SubtitleLabel.TextColor3 = Color3.fromRGB(0, 174, 255)
SubtitleLabel.TextSize = 11.000
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 2. LIVE SERVER METRICS CARD (Sharp Corners)
StatsCard.Name = "StatsCard"
StatsCard.Parent = ServerFrame
StatsCard.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
StatsCard.BorderSizePixel = 0
StatsCard.Position = UDim2.new(0, 9, 0, 114)
StatsCard.Size = UDim2.new(0, 357, 0, 128)

StatsCardStroke.Color = Color3.fromRGB(45, 48, 55)
StatsCardStroke.Thickness = 1
StatsCardStroke.Parent = StatsCard

StatsHeader.Name = "Header"
StatsHeader.Parent = StatsCard
StatsHeader.BackgroundTransparency = 1.000
StatsHeader.Position = UDim2.new(0, 12, 0, 7)
StatsHeader.Size = UDim2.new(0, 150, 0, 14)
StatsHeader.Font = Enum.Font.GothamBold
StatsHeader.Text = "LIVE SERVER METRICS"
StatsHeader.TextColor3 = Color3.fromRGB(150, 150, 160)
StatsHeader.TextSize = 10.000
StatsHeader.TextXAlignment = Enum.TextXAlignment.Left

PlayersLabel.Name = "Players"
PlayersLabel.Parent = StatsCard
PlayersLabel.BackgroundTransparency = 1.000
PlayersLabel.Position = UDim2.new(0, 12, 0, 28)
PlayersLabel.Size = UDim2.new(0.5, -16, 0, 20)
PlayersLabel.Font = Enum.Font.GothamBold
PlayersLabel.Text = "👥 Players: Loading..."
PlayersLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
PlayersLabel.TextSize = 12.000
PlayersLabel.TextXAlignment = Enum.TextXAlignment.Left

PingLabel.Name = "Ping"
PingLabel.Parent = StatsCard
PingLabel.BackgroundTransparency = 1.000
PingLabel.Position = UDim2.new(0.5, 4, 0, 28)
PingLabel.Size = UDim2.new(0.5, -16, 0, 20)
PingLabel.Font = Enum.Font.GothamBold
PingLabel.Text = "📶 Ping: -- ms"
PingLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
PingLabel.TextSize = 12.000
PingLabel.TextXAlignment = Enum.TextXAlignment.Left

UptimeLabel.Name = "Uptime"
UptimeLabel.Parent = StatsCard
UptimeLabel.BackgroundTransparency = 1.000
UptimeLabel.Position = UDim2.new(0, 12, 0, 56)
UptimeLabel.Size = UDim2.new(1, -24, 0, 20)
UptimeLabel.Font = Enum.Font.GothamBold
UptimeLabel.Text = "⏱️ Server Uptime: 00h 00m 00s"
UptimeLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
UptimeLabel.TextSize = 12.000
UptimeLabel.TextXAlignment = Enum.TextXAlignment.Left

JobIdLabel.Name = "JobId"
JobIdLabel.Parent = StatsCard
JobIdLabel.BackgroundTransparency = 1.000
JobIdLabel.Position = UDim2.new(0, 12, 0, 90)
JobIdLabel.Size = UDim2.new(1, -165, 0, 24)
JobIdLabel.Font = Enum.Font.Gotham
JobIdLabel.Text = "Server ID: " .. string.sub(game.JobId ~= "" and game.JobId or "SinglePlayerServer", 1, 14) .. "..."
JobIdLabel.TextColor3 = Color3.fromRGB(160, 165, 175)
JobIdLabel.TextSize = 11.000
JobIdLabel.TextTruncate = Enum.TextTruncate.AtEnd
JobIdLabel.TextXAlignment = Enum.TextXAlignment.Left

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
CopyJobBtn.AutoButtonColor = true

-- 3. SERVER QUICK ACTIONS CARD (Sharp Corners)
ActionsCard.Name = "ActionsCard"
ActionsCard.Parent = ServerFrame
ActionsCard.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
ActionsCard.BorderSizePixel = 0
ActionsCard.Position = UDim2.new(0, 9, 0, 252)
ActionsCard.Size = UDim2.new(0, 357, 0, 72)

ActionsCardStroke.Color = Color3.fromRGB(45, 48, 55)
ActionsCardStroke.Thickness = 1
ActionsCardStroke.Parent = ActionsCard

ActionsHeader.Name = "Header"
ActionsHeader.Parent = ActionsCard
ActionsHeader.BackgroundTransparency = 1.000
ActionsHeader.Position = UDim2.new(0, 12, 0, 7)
ActionsHeader.Size = UDim2.new(0, 150, 0, 14)
ActionsHeader.Font = Enum.Font.GothamBold
ActionsHeader.Text = "SERVER QUICK ACTIONS"
ActionsHeader.TextColor3 = Color3.fromRGB(150, 150, 160)
ActionsHeader.TextSize = 10.000
ActionsHeader.TextXAlignment = Enum.TextXAlignment.Left

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
RejoinBtn.AutoButtonColor = true

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
ServerHopBtn.AutoButtonColor = true

ServerHopBtnStroke.Color = Color3.fromRGB(0, 174, 255)
ServerHopBtnStroke.Thickness = 1
ServerHopBtnStroke.Parent = ServerHopBtn

Settings.Name = "Settings"
Settings.Parent = Main
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1.000
Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0.720244348, 0, 0.118000008, 0)
Settings.Size = UDim2.new(0, 93, 0, 18)
Settings.Font = Enum.Font.GothamBold
Settings.Text = "SETTINGS"
Settings.TextColor3 = Color3.fromRGB(255, 255, 255)
Settings.TextScaled = true
Settings.TextSize = 14.000
Settings.TextWrapped = true

SFrame.Name = "SFrame"
SFrame.Parent = Settings
SFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SFrame.BackgroundTransparency = 1.000
SFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SFrame.BorderSizePixel = 0
SFrame.Position = UDim2.new(-2.96774197, 0, 2.44444537, 0)
SFrame.Size = UDim2.new(0, 375, 0, 381)
SFrame.Visible = false

Volume.Name = "Volume"
Volume.Parent = SFrame
Volume.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Volume.BackgroundTransparency = 1.000
Volume.BorderColor3 = Color3.fromRGB(0, 0, 0)
Volume.BorderSizePixel = 0
Volume.Position = UDim2.new(0.279999822, 0, 0, 0)
Volume.Size = UDim2.new(0, 166, 0, 32)
Volume.Font = Enum.Font.GothamBold
Volume.Text = "VOLUME"
Volume.TextColor3 = Color3.fromRGB(255, 255, 255)
Volume.TextScaled = true
Volume.TextSize = 14.000
Volume.TextWrapped = true

UiSounds.Name = "UiSounds"
UiSounds.Parent = Volume
UiSounds.Active = true
UiSounds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UiSounds.BackgroundTransparency = 1.000
UiSounds.BorderColor3 = Color3.fromRGB(0, 0, 0)
UiSounds.BorderSizePixel = 0
UiSounds.Position = UDim2.new(-0.629220963, 0, 1.87637806, 0)
UiSounds.Size = UDim2.new(0, 130, 0, 31)
UiSounds.Font = Enum.Font.GothamBold
UiSounds.Text = "UI SOUNDS"
UiSounds.TextColor3 = Color3.fromRGB(255, 255, 255)
UiSounds.TextScaled = true
UiSounds.TextSize = 14.000
UiSounds.TextWrapped = true

DragCount.Name = "DragCount"
DragCount.Parent = UiSounds
DragCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragCount.BackgroundTransparency = 1.000
DragCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragCount.BorderSizePixel = 0
DragCount.Position = UDim2.new(1.13100004, 0, -0.5, 0)
DragCount.Size = UDim2.new(0, 200, 0, 50)
DragCount.Font = Enum.Font.GothamBold
DragCount.Text = "1"
DragCount.TextColor3 = Color3.fromRGB(255, 255, 255)
DragCount.TextSize = 14.000

DragBackground.Name = "DragBackground"
DragBackground.Parent = UiSounds
DragBackground.Active = true
DragBackground.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
DragBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragBackground.BorderSizePixel = 0
DragBackground.Position = UDim2.new(1.12676907, 0, 0.601612687, 0)
DragBackground.Size = UDim2.new(0, 200, 0, 6)
DragBackground.Font = Enum.Font.SourceSans
DragBackground.Text = ""
DragBackground.TextColor3 = Color3.fromRGB(0, 0, 0)
DragBackground.TextSize = 14.000

UICorner_9.Parent = DragBackground

Drag.Name = "Drag"
Drag.Parent = DragBackground
Drag.Active = true
Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
Drag.BorderSizePixel = 0
Drag.Position = UDim2.new(0.00100006105, 0, -0.0166676845, 0)
Drag.Size = UDim2.new(0, 200, 0, 6)
Drag.Font = Enum.Font.SourceSans
Drag.Text = ""
Drag.TextColor3 = Color3.fromRGB(0, 0, 0)
Drag.TextSize = 14.000

UICorner_10.Parent = Drag

Line1.Name = "Line1"
Line1.Parent = Volume
Line1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line1.BorderSizePixel = 0
Line1.Position = UDim2.new(-0.606237769, 0, 0.4375, 0)
Line1.Size = UDim2.new(-0.538340747, 200, 0.0999995321, 0)
Line1.Font = Enum.Font.SourceSans
Line1.Text = ""
Line1.TextColor3 = Color3.fromRGB(0, 0, 0)
Line1.TextSize = 14.000

UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.30, 0.50), NumberSequenceKeypoint.new(0.44, 0.35), NumberSequenceKeypoint.new(0.60, 0.51), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient.Parent = Line1

Line2.Name = "Line2"
Line2.Parent = Volume
Line2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line2.BorderSizePixel = 0
Line2.Position = UDim2.new(0.960027099, 0, 0.4375, 0)
Line2.Size = UDim2.new(-0.538340747, 200, 0.0999995321, 0)
Line2.Font = Enum.Font.SourceSans
Line2.Text = ""
Line2.TextColor3 = Color3.fromRGB(0, 0, 0)
Line2.TextSize = 14.000

UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.30, 0.50), NumberSequenceKeypoint.new(0.44, 0.35), NumberSequenceKeypoint.new(0.60, 0.51), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient_2.Parent = Line2

UI.Name = "UI"
UI.Parent = SFrame
UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.BackgroundTransparency = 1.000
UI.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.BorderSizePixel = 0
UI.Position = UDim2.new(0.279999822, 0, 0.322834641, 0)
UI.Size = UDim2.new(0, 166, 0, 32)
UI.Font = Enum.Font.GothamBold
UI.Text = "UI"
UI.TextColor3 = Color3.fromRGB(255, 255, 255)
UI.TextScaled = true
UI.TextSize = 14.000
UI.TextWrapped = true

-- ==========================================
-- 1. DOTS ROW & BOX (White box with Checkmark)
-- ==========================================
Dots.Name = "Dots"
Dots.Parent = UI
Dots.Active = true
Dots.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dots.BackgroundTransparency = 1.000
Dots.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dots.BorderSizePixel = 0
Dots.Position = UDim2.new(-0.629220963, 0, 1.80000000, 0)
Dots.Size = UDim2.new(0, 130, 0, 31)
Dots.Font = Enum.Font.GothamBold
Dots.Text = "DOTS"
Dots.TextColor3 = Color3.fromRGB(255, 255, 255)
Dots.TextScaled = true
Dots.TextSize = 14.000
Dots.TextWrapped = true

Box.Name = "Box"
Box.Parent = Dots
Box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Box.BackgroundTransparency = 1.000
Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box.BorderSizePixel = 0
Box.Position = UDim2.new(2.34615374, 0, 0.0322570801, 0)
Box.Size = UDim2.new(0, 28, 0, 28)
Box.Font = Enum.Font.SourceSans
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(0, 0, 0)
Box.TextSize = 14.000

On.Name = "On"
On.Parent = Box
On.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
On.BorderColor3 = Color3.fromRGB(0, 0, 0)
On.BorderSizePixel = 0
On.Position = UDim2.new(0.100000001, 0, 0.115000002, 0)
On.Size = UDim2.new(0, 22, 0, 22)
On.Font = Enum.Font.SourceSans
On.Text = ""
On.TextColor3 = Color3.fromRGB(0, 0, 0)
On.TextSize = 14.000
On.Visible = true

Check.Name = "Check"
Check.Parent = On
Check.Active = false
Check.BackgroundTransparency = 1.000
Check.BorderSizePixel = 0
Check.Position = UDim2.new(0.1, 0, 0.1, 0)
Check.Size = UDim2.new(0.8, 0, 0.8, 0)
Check.Image = "rbxassetid://6031094667"
Check.ImageColor3 = Color3.fromRGB(20, 20, 20)
Check.Visible = true

Info.Name = "Info"
Info.Parent = Dots
Info.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info.BorderSizePixel = 0
Info.Position = UDim2.new(3.06923079, 0, 0, 0)
Info.Size = UDim2.new(0, 148, 0, 142)
Info.Visible = false
Info.ZIndex = 5

OnOff.Name = "On/Off"
OnOff.Parent = Info
OnOff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OnOff.BackgroundTransparency = 1.000
OnOff.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnOff.BorderSizePixel = 0
OnOff.Position = UDim2.new(0.0405405387, 0, 0.183098584, 0)
OnOff.Size = UDim2.new(0, 26, 0, 17)
OnOff.Font = Enum.Font.GothamBold
OnOff.Text = "ON"
OnOff.TextColor3 = Color3.fromRGB(13, 255, 0)
OnOff.TextScaled = true
OnOff.TextSize = 14.000
OnOff.TextWrapped = true

Name_4.Name = "Name"
Name_4.Parent = Info
Name_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_4.BackgroundTransparency = 1.000
Name_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_4.BorderSizePixel = 0
Name_4.Position = UDim2.new(0.0405405387, 0, 0.0352112688, 0)
Name_4.Size = UDim2.new(0, 49, 0, 20)
Name_4.Font = Enum.Font.GothamBold
Name_4.Text = "DOTS"
Name_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_4.TextScaled = true
Name_4.TextSize = 14.000
Name_4.TextWrapped = true

Information.Name = "Information"
Information.Parent = Info
Information.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Information.BackgroundTransparency = 1.000
Information.BorderColor3 = Color3.fromRGB(0, 0, 0)
Information.BorderSizePixel = 0
Information.Position = UDim2.new(0, 0, 0.302816898, 0)
Information.Size = UDim2.new(0, 148, 0, 91)
Information.Font = Enum.Font.GothamBold
Information.Text = "Dots will impact performance. If you would like better performance you can turn this off, this is only for decor."
Information.TextColor3 = Color3.fromRGB(255, 255, 255)
Information.TextScaled = true
Information.TextSize = 14.000
Information.TextWrapped = true

Line1_2.Name = "Line1"
Line1_2.Parent = UI
Line1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line1_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line1_2.BorderSizePixel = 0
Line1_2.Position = UDim2.new(-0.606237769, 0, 0.4375, 0)
Line1_2.Size = UDim2.new(-0.538340747, 200, 0.0999995321, 0)
Line1_2.Font = Enum.Font.SourceSans
Line1_2.Text = ""
Line1_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Line1_2.TextSize = 14.000

UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.30, 0.50), NumberSequenceKeypoint.new(0.44, 0.35), NumberSequenceKeypoint.new(0.60, 0.51), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient_3.Parent = Line1_2

Line2_2.Name = "Line2"
Line2_2.Parent = UI
Line2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line2_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line2_2.BorderSizePixel = 0
Line2_2.Position = UDim2.new(0.960027099, 0, 0.4375, 0)
Line2_2.Size = UDim2.new(-0.538340747, 200, 0.0999995321, 0)
Line2_2.Font = Enum.Font.SourceSans
Line2_2.Text = ""
Line2_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Line2_2.TextSize = 14.000

UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.30, 0.50), NumberSequenceKeypoint.new(0.44, 0.35), NumberSequenceKeypoint.new(0.60, 0.51), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient_4.Parent = Line2_2

-- ==========================================
-- 2. GRADIENT ROW & BOX (White box with Checkmark)
-- ==========================================
Gradient.Name = "Gradient"
Gradient.Parent = UI
Gradient.Active = true
Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gradient.BackgroundTransparency = 1.000
Gradient.BorderColor3 = Color3.fromRGB(0, 0, 0)
Gradient.BorderSizePixel = 0
Gradient.Position = UDim2.new(-0.629220963, 0, 3.50000000, 0)
Gradient.Size = UDim2.new(0, 130, 0, 31)
Gradient.Font = Enum.Font.GothamBold
Gradient.Text = "GRADIENT"
Gradient.TextColor3 = Color3.fromRGB(255, 255, 255)
Gradient.TextScaled = true
Gradient.TextSize = 14.000
Gradient.TextWrapped = true

Box_2.Name = "Box"
Box_2.Parent = Gradient
Box_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Box_2.BackgroundTransparency = 1.000
Box_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box_2.BorderSizePixel = 0
Box_2.Position = UDim2.new(2.34615374, 0, 0.0322570801, 0)
Box_2.Size = UDim2.new(0, 28, 0, 28)
Box_2.Font = Enum.Font.SourceSans
Box_2.Text = ""
Box_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Box_2.TextSize = 14.000

On_2.Name = "On"
On_2.Parent = Box_2
On_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
On_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
On_2.BorderSizePixel = 0
On_2.Position = UDim2.new(0.100000001, 0, 0.115000002, 0)
On_2.Size = UDim2.new(0, 22, 0, 22)
On_2.Font = Enum.Font.SourceSans
On_2.Text = ""
On_2.TextColor3 = Color3.fromRGB(0, 0, 0)
On_2.TextSize = 14.000
On_2.Visible = true

Check_2.Name = "Check"
Check_2.Parent = On_2
Check_2.Active = false
Check_2.BackgroundTransparency = 1.000
Check_2.BorderSizePixel = 0
Check_2.Position = UDim2.new(0.1, 0, 0.1, 0)
Check_2.Size = UDim2.new(0.8, 0, 0.8, 0)
Check_2.Image = "rbxassetid://6031094667"
Check_2.ImageColor3 = Color3.fromRGB(20, 20, 20)
Check_2.Visible = true

Info_2.Name = "Info"
Info_2.Parent = Gradient
Info_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Info_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info_2.BorderSizePixel = 0
Info_2.Position = UDim2.new(3.06923079, 0, 0, 0)
Info_2.Size = UDim2.new(0, 148, 0, 142)
Info_2.Visible = false

OnOff_2.Name = "On/Off"
OnOff_2.Parent = Info_2
OnOff_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OnOff_2.BackgroundTransparency = 1.000
OnOff_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnOff_2.BorderSizePixel = 0
OnOff_2.Position = UDim2.new(0.0405405387, 0, 0.183098584, 0)
OnOff_2.Size = UDim2.new(0, 26, 0, 17)
OnOff_2.Font = Enum.Font.GothamBold
OnOff_2.Text = "ON"
OnOff_2.TextColor3 = Color3.fromRGB(13, 255, 0)
OnOff_2.TextScaled = true
OnOff_2.TextSize = 14.000
OnOff_2.TextWrapped = true

Name_5.Name = "Name"
Name_5.Parent = Info_2
Name_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_5.BackgroundTransparency = 1.000
Name_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_5.BorderSizePixel = 0
Name_5.Position = UDim2.new(0.0405405387, 0, 0.0140845068, 0)
Name_5.Size = UDim2.new(0, 70, 0, 26)
Name_5.Font = Enum.Font.GothamBold
Name_5.Text = "GRADIENT"
Name_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_5.TextScaled = true
Name_5.TextSize = 14.000
Name_5.TextWrapped = true

Information_2.Name = "Information"
Information_2.Parent = Info_2
Information_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Information_2.BackgroundTransparency = 1.000
Information_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Information_2.BorderSizePixel = 0
Information_2.Position = UDim2.new(0, 0, 0.302816898, 0)
Information_2.Size = UDim2.new(0, 148, 0, 91)
Information_2.Font = Enum.Font.GothamBold
Information_2.Text = "Gradient will impact performance. If you would like better performance you can turn this off, this is only for decor."
Information_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Information_2.TextScaled = true
Information_2.TextSize = 14.000
Information_2.TextWrapped = true

-- ==========================================
-- 3. SHADOW ROW & BOX (White box with Checkmark)
-- ==========================================
Shadow.Name = "Shadow"
Shadow.Parent = UI
Shadow.Active = true
Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow.BackgroundTransparency = 1.000
Shadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(-0.629000008, 0, 5.20000000, 0)
Shadow.Size = UDim2.new(0, 130, 0, 31)
Shadow.Font = Enum.Font.GothamBold
Shadow.Text = "SHADOW"
Shadow.TextColor3 = Color3.fromRGB(255, 255, 255)
Shadow.TextScaled = true
Shadow.TextSize = 14.000
Shadow.TextWrapped = true

Box_3.Name = "Box"
Box_3.Parent = Shadow
Box_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Box_3.BackgroundTransparency = 1.000
Box_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box_3.BorderSizePixel = 0
Box_3.Position = UDim2.new(2.34615374, 0, 0.0322570801, 0)
Box_3.Size = UDim2.new(0, 28, 0, 28)
Box_3.Font = Enum.Font.SourceSans
Box_3.Text = ""
Box_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Box_3.TextSize = 14.000

On_3.Name = "On"
On_3.Parent = Box_3
On_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
On_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
On_3.BorderSizePixel = 0
On_3.Position = UDim2.new(0.100000001, 0, 0.115000002, 0)
On_3.Size = UDim2.new(0, 22, 0, 22)
On_3.Font = Enum.Font.SourceSans
On_3.Text = ""
On_3.TextColor3 = Color3.fromRGB(0, 0, 0)
On_3.TextSize = 14.000
On_3.Visible = true

Check_3.Name = "Check"
Check_3.Parent = On_3
Check_3.Active = false
Check_3.BackgroundTransparency = 1.000
Check_3.BorderSizePixel = 0
Check_3.Position = UDim2.new(0.1, 0, 0.1, 0)
Check_3.Size = UDim2.new(0.8, 0, 0.8, 0)
Check_3.Image = "rbxassetid://6031094667"
Check_3.ImageColor3 = Color3.fromRGB(20, 20, 20)
Check_3.Visible = true

Info_3.Name = "Info"
Info_3.Parent = Shadow
Info_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Info_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info_3.BorderSizePixel = 0
Info_3.Position = UDim2.new(3.06923079, 0, 0, 0)
Info_3.Size = UDim2.new(0, 148, 0, 142)
Info_3.Visible = false

OnOff_3.Name = "On/Off"
OnOff_3.Parent = Info_3
OnOff_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OnOff_3.BackgroundTransparency = 1.000
OnOff_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnOff_3.BorderSizePixel = 0
OnOff_3.Position = UDim2.new(0.0405405387, 0, 0.183098584, 0)
OnOff_3.Size = UDim2.new(0, 26, 0, 17)
OnOff_3.Font = Enum.Font.GothamBold
OnOff_3.Text = "ON"
OnOff_3.TextColor3 = Color3.fromRGB(13, 255, 0)
OnOff_3.TextScaled = true
OnOff_3.TextSize = 14.000
OnOff_3.TextWrapped = true

Name_6.Name = "Name"
Name_6.Parent = Info_3
Name_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_6.BackgroundTransparency = 1.000
Name_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_6.BorderSizePixel = 0
Name_6.Position = UDim2.new(0.0405405387, 0, 0.0140845068, 0)
Name_6.Size = UDim2.new(0, 70, 0, 26)
Name_6.Font = Enum.Font.GothamBold
Name_6.Text = "SHADOW"
Name_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_6.TextScaled = true
Name_6.TextSize = 14.000
Name_6.TextWrapped = true

Information_3.Name = "Information"
Information_3.Parent = Info_3
Information_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Information_3.BackgroundTransparency = 1.000
Information_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Information_3.BorderSizePixel = 0
Information_3.Position = UDim2.new(0, 0, 0.302816898, 0)
Information_3.Size = UDim2.new(0, 148, 0, 91)
Information_3.Font = Enum.Font.GothamBold
Information_3.Text = "Shadows will impact performance. If you would like better performance you can turn this off, this is only for decor."
Information_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Information_3.TextScaled = true
Information_3.TextSize = 14.000
Information_3.TextWrapped = true

-- ==========================================
-- 4. UNLOAD GUI ROW & BUTTON
-- ==========================================
Unload.Name = "Unload"
Unload.Parent = UI
Unload.Active = true
Unload.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Unload.BackgroundTransparency = 1.000
Unload.BorderColor3 = Color3.fromRGB(0, 0, 0)
Unload.BorderSizePixel = 0
Unload.Position = UDim2.new(-0.629000008, 0, 6.90000000, 0)
Unload.Size = UDim2.new(0, 130, 0, 31)
Unload.Font = Enum.Font.GothamBold
Unload.Text = "UNLOAD"
Unload.TextColor3 = Color3.fromRGB(255, 255, 255)
Unload.TextScaled = true
Unload.TextSize = 14.000
Unload.TextWrapped = true

UnloadBtn.Name = "UnloadBtn"
UnloadBtn.Parent = Unload
UnloadBtn.BackgroundColor3 = Color3.fromRGB(190, 35, 35)
UnloadBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
UnloadBtn.BorderSizePixel = 0
UnloadBtn.Position = UDim2.new(2.10000000, 0, 0.05000000, 0)
UnloadBtn.Size = UDim2.new(0, 80, 0, 26)
UnloadBtn.Font = Enum.Font.GothamBold
UnloadBtn.Text = "UNLOAD"
UnloadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UnloadBtn.TextSize = 12.000
UnloadBtn.AutoButtonColor = false

UnloadBtnCorner.CornerRadius = UDim.new(0, 6)
UnloadBtnCorner.Parent = UnloadBtn

UnloadBtnStroke.Color = Color3.fromRGB(255, 75, 75)
UnloadBtnStroke.Thickness = 1
UnloadBtnStroke.Transparency = 0.35
UnloadBtnStroke.Parent = UnloadBtn

Info_4.Name = "Info"
Info_4.Parent = Unload
Info_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Info_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info_4.BorderSizePixel = 0
Info_4.Position = UDim2.new(3.06923079, 0, 0, 0)
Info_4.Size = UDim2.new(0, 148, 0, 142)
Info_4.Visible = false
Info_4.ZIndex = 5

OnOff_4.Name = "On/Off"
OnOff_4.Parent = Info_4
OnOff_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OnOff_4.BackgroundTransparency = 1.000
OnOff_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnOff_4.BorderSizePixel = 0
OnOff_4.Position = UDim2.new(0.0405405387, 0, 0.183098584, 0)
OnOff_4.Size = UDim2.new(0, 60, 0, 17)
OnOff_4.Font = Enum.Font.GothamBold
OnOff_4.Text = "CLOSE"
OnOff_4.TextColor3 = Color3.fromRGB(255, 60, 60)
OnOff_4.TextScaled = true
OnOff_4.TextSize = 14.000
OnOff_4.TextWrapped = true

Name_7.Name = "Name"
Name_7.Parent = Info_4
Name_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_7.BackgroundTransparency = 1.000
Name_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_7.BorderSizePixel = 0
Name_7.Position = UDim2.new(0.0405405387, 0, 0.0140845068, 0)
Name_7.Size = UDim2.new(0, 95, 0, 26)
Name_7.Font = Enum.Font.GothamBold
Name_7.Text = "UNLOAD GUI"
Name_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_7.TextScaled = true
Name_7.TextSize = 14.000
Name_7.TextWrapped = true

Information_4.Name = "Information"
Information_4.Parent = Info_4
Information_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Information_4.BackgroundTransparency = 1.000
Information_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Information_4.BorderSizePixel = 0
Information_4.Position = UDim2.new(0, 0, 0.302816898, 0)
Information_4.Size = UDim2.new(0, 148, 0, 91)
Information_4.Font = Enum.Font.GothamBold
Information_4.Text = "Safely unloads and completely removes the Infinity GUI and all background processes from the game."
Information_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Information_4.TextScaled = true
Information_4.TextSize = 14.000
Information_4.TextWrapped = true

Line_4.Name = "Line"
Line_4.Parent = Settings
Line_4.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
Line_4.BorderSizePixel = 0
Line_4.Position = UDim2.new(0.0939999968, 0, 1.10000002, 0)
Line_4.Size = UDim2.new(0, 75, 0, 1)
Line_4.Visible = false
Line_4.Text = ""

Line_5.Name = "Line"
Line_5.Parent = Main
Line_5.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Line_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line_5.BorderSizePixel = 0
Line_5.Position = UDim2.new(0.0300751887, 0, 0.17635271, 0)
Line_5.Size = UDim2.new(0, 375, 0, 5)
Line_5.Font = Enum.Font.SourceSans
Line_5.Text = ""
Line_5.TextColor3 = Color3.fromRGB(0, 0, 0)
Line_5.TextSize = 14.000

UICorner_11.CornerRadius = UDim.new(0, 25)
UICorner_11.Parent = Line_5

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 28, 26)), ColorSequenceKeypoint.new(0.64, Color3.fromRGB(255, 255, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient_5.Rotation = 90
UIGradient_5.Parent = Main

-- ==========================================
-- DISCORD NOTIFICATION POPUP (Centered INSIDE Main GUI)
-- ==========================================
DiscordPopup.Name = "DiscordPopup"
DiscordPopup.Parent = Main -- Parented to Main so it centers perfectly inside the GUI window
DiscordPopup.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
DiscordPopup.Size = UDim2.new(0, 310, 0, 125)
DiscordPopup.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DiscordPopup.BorderColor3 = Color3.fromRGB(0, 0, 0)
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
PopupLogo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
PopupMsg.Text = "You have copied the discord link to your clipboard."
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

-- ==========================================
-- TOP-RIGHT FPS DISPLAY (Modern Grey Box at Top Border)
-- ==========================================
FpsGui.Name = "FPS_Display"
FpsGui.Parent = Gui
FpsGui.AnchorPoint = Vector2.new(1, 0)
FpsGui.Position = UDim2.new(1, -6, 0, 4)
FpsGui.Size = UDim2.new(0, 88, 0, 24)
FpsGui.BackgroundColor3 = Color3.fromRGB(44, 46, 50)
FpsGui.BackgroundTransparency = 0.050
FpsGui.BorderSizePixel = 0
FpsGui.ZIndex = 300

FpsCorner.CornerRadius = UDim.new(0, 5)
FpsCorner.Parent = FpsGui

FpsStroke.Color = Color3.fromRGB(75, 78, 85)
FpsStroke.Thickness = 1
FpsStroke.Transparency = 0.000
FpsStroke.Parent = FpsGui

FpsDot.Name = "StatusDot"
FpsDot.Parent = FpsGui
FpsDot.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
FpsDot.BorderSizePixel = 0
FpsDot.Position = UDim2.new(0, 8, 0.5, -3.5)
FpsDot.Size = UDim2.new(0, 7, 0, 7)
FpsDot.ZIndex = 301

FpsDotCorner.CornerRadius = UDim.new(1, 0)
FpsDotCorner.Parent = FpsDot

FpsLabel.Name = "FpsLabel"
FpsLabel.Parent = FpsGui
FpsLabel.BackgroundTransparency = 1.000
FpsLabel.BorderSizePixel = 0
FpsLabel.Position = UDim2.new(0, 21, 0, 0)
FpsLabel.Size = UDim2.new(1, -23, 1, 0)
FpsLabel.Font = Enum.Font.GothamBold
FpsLabel.Text = "FPS: --"
FpsLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
FpsLabel.TextSize = 12.000
FpsLabel.TextXAlignment = Enum.TextXAlignment.Left
FpsLabel.ZIndex = 301

-- ==========================================
-- FLOATING TOGGLE BUTTON (Draggable Larger Infinity Figure 8)
-- ==========================================
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Gui
ToggleButton.AnchorPoint = Vector2.new(0.5, 0)
ToggleButton.Position = UDim2.new(0.5, 0, 0, 8)
ToggleButton.Size = UDim2.new(0, 100, 0, 56)
ToggleButton.BackgroundTransparency = 1.000
ToggleButton.BorderSizePixel = 0
ToggleButton.AutoButtonColor = false
ToggleButton.Active = true
ToggleButton.Image = "rbxassetid://17894477503"
ToggleButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.ScaleType = Enum.ScaleType.Fit
ToggleButton.ZIndex = 400

-- Scripts:

local function WXLQN_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	local Main = script.Parent
	local SoundService = game:GetService("SoundService")
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local Players = game:GetService("Players")
	
	local localPlayer = Players.LocalPlayer
	if localPlayer then
		local homeButton = Main:FindFirstChild("Home")
		local hFrame = homeButton and homeButton:FindFirstChild("HFrame")
		local welcomeFrame = hFrame and hFrame:FindFirstChild("Welcome")
		if welcomeFrame then
			welcomeFrame.Image = "rbxthumb://type=AvatarHeadShot&id=" .. localPlayer.UserId .. "&w=150&h=150"
	
			local playerNameLabel = welcomeFrame:FindFirstChild("PlayerName")
			if playerNameLabel then
				playerNameLabel.Text = localPlayer.DisplayName
			end
		end
	end
	
	local clickSound = SoundService:FindFirstChild("Click")
	local hoverSound = SoundService:FindFirstChild("Hover")
	
	local blueColor = Color3.fromRGB(0, 174, 255)
	local whiteColor = Color3.fromRGB(255, 255, 255)
	
	local buttons = {
		Main:FindFirstChild("Home"),
		Main:FindFirstChild("Game"),
		Main:FindFirstChild("Server"),
		Main:FindFirstChild("Settings"),
	}
	
	local activeButton = nil
	
	local homeButton = Main:FindFirstChild("Home")
	local gameButton = Main:FindFirstChild("Game")
	local serverButton = Main:FindFirstChild("Server")
	local settingsButton = Main:FindFirstChild("Settings")
	local hFrame = homeButton and homeButton:FindFirstChild("HFrame")
	local gFrame = gameButton and gameButton:FindFirstChild("GFrame")
	local serverFrame = serverButton and serverButton:FindFirstChild("ServerFrame")
	local sFrame = settingsButton and settingsButton:FindFirstChild("SFrame")
	
	if homeButton then
		local homeLine = homeButton:FindFirstChild("Line")
		if homeLine then
			homeLine.Visible = true
			homeLine.BackgroundColor3 = blueColor
		end
		homeButton.TextColor3 = blueColor
		activeButton = homeButton
	end
	
	if sFrame then sFrame.Visible = false end
	if serverFrame then serverFrame.Visible = false end
	if gFrame then gFrame.Visible = false end
	if hFrame then hFrame.Visible = true end
	
	local closeButton = Main:FindFirstChild("Close")
	if closeButton then
		closeButton.MouseEnter:Connect(function()
			if hoverSound and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
				hoverSound:Play()
			end
		end)
	
		closeButton.MouseButton1Click:Connect(function()
			if clickSound then clickSound:Play() end
		end)
	end
	
	local dragButton = Main:FindFirstChild("DragButton")
	if dragButton then
		dragButton.MouseEnter:Connect(function()
			if hoverSound and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
				hoverSound:Play()
			end
		end)
	
		dragButton.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and clickSound then
				clickSound:Play()
			end
		end)
	end

	-- Discord Auto-Disappearing Notification Popup (Centered inside Main)
	local discordLink = "https://discord.gg/PB8bhAHbJE"
	local activePopupSession = 0

	local function showDiscordNotification()
		-- Copy Discord link to clipboard
		pcall(function()
			if setclipboard then
				setclipboard(discordLink)
			elseif toclipboard then
				toclipboard(discordLink)
			end
		end)

		if clickSound then clickSound:Play() end

		activePopupSession = activePopupSession + 1
		local currentSession = activePopupSession

		-- Appear animation centered inside Main
		DiscordPopup.Visible = true
		DiscordPopup.Size = UDim2.new(0, 260, 0, 105)
		DiscordPopup.Position = UDim2.new(0.5, 0, 0.52, 0)

		local appearTween = TweenService:Create(
			DiscordPopup,
			TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
			{
				Size = UDim2.new(0, 310, 0, 125),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}
		)
		appearTween:Play()

		-- Visible for just enough time to read (~2.6 seconds), then automatically disappears
		task.delay(2.6, function()
			if activePopupSession == currentSession and DiscordPopup.Visible then
				local disappearTween = TweenService:Create(
					DiscordPopup,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
					{
						Size = UDim2.new(0, 250, 0, 95),
						Position = UDim2.new(0.5, 0, 0.52, 0)
					}
				)
				disappearTween:Play()
				disappearTween.Completed:Connect(function()
					if activePopupSession == currentSession then
						DiscordPopup.Visible = false
					end
				end)
			end
		end)
	end

	Discord.MouseButton1Click:Connect(showDiscordNotification)

	Discord.MouseEnter:Connect(function()
		if hoverSound and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			hoverSound:Play()
		end
	end)
	
	for _, button in ipairs(buttons) do
		if button then
			local line = button:FindFirstChild("Line")
			if line and button ~= activeButton then
				line.Visible = false
			end
	
			button.MouseEnter:Connect(function()
				if button ~= activeButton and line then
					line.Visible = true
					line.BackgroundColor3 = whiteColor
				end
				if hoverSound and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
					hoverSound:Play()
				end
			end)
	
			button.MouseLeave:Connect(function()
				if button ~= activeButton and line then
					line.Visible = false
				end
			end)
	
			button.MouseButton1Click:Connect(function()
				if clickSound then clickSound:Play() end
	
				if activeButton and activeButton ~= button then
					local prevLine = activeButton:FindFirstChild("Line")
					if prevLine then prevLine.Visible = false end
					activeButton.TextColor3 = whiteColor
				end
	
				activeButton = button
				if line then
					line.Visible = true
					line.BackgroundColor3 = blueColor
				end
				button.TextColor3 = blueColor
	
				if button == homeButton then
					if hFrame then hFrame.Visible = true end
					if gFrame then gFrame.Visible = false end
					if serverFrame then serverFrame.Visible = false end
					if sFrame then sFrame.Visible = false end
				elseif button == gameButton then
					if hFrame then hFrame.Visible = false end
					if gFrame then gFrame.Visible = true end
					if serverFrame then serverFrame.Visible = false end
					if sFrame then sFrame.Visible = false end
				elseif button == serverButton then
					if hFrame then hFrame.Visible = false end
					if gFrame then gFrame.Visible = false end
					if serverFrame then serverFrame.Visible = true end
					if sFrame then sFrame.Visible = false end
				elseif button == settingsButton then
					if hFrame then hFrame.Visible = false end
					if gFrame then gFrame.Visible = false end
					if serverFrame then serverFrame.Visible = false end
					if sFrame then sFrame.Visible = true end
				end
			end)
		end
	end
end
coroutine.wrap(WXLQN_fake_script)()

local function ZFGUM_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)
	local button = script.Parent
	local main = script.Parent.Parent
	
	button.MouseButton1Click:Connect(function()
		main.Visible = false
	end)
	
	button.MouseEnter:Connect(function()
		button.Size = UDim2.new(0, 35, 0, 35)
	end)
	
	button.MouseLeave:Connect(function()
		button.Size = UDim2.new(0, 30, 0, 30)
	end)
end
coroutine.wrap(ZFGUM_fake_script)()

-- Draggable GUI Window
local function DRAG_SCRIPT()
	local UserInputService = game:GetService("UserInputService")
	local dragging = false
	local dragInput, dragStart, startPos

	local function update(input)
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	DragButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	DragButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	DragButton.MouseEnter:Connect(function()
		DragButton.Size = UDim2.new(0, 35, 0, 35)
	end)
	DragButton.MouseLeave:Connect(function()
		DragButton.Size = UDim2.new(0, 30, 0, 30)
	end)
end
coroutine.wrap(DRAG_SCRIPT)()

-- =========================================================
-- FLOATING DOTS SYSTEM & SETTINGS TOGGLES (Checkmarks inside boxes)
-- =========================================================
local fpsConnection = nil

local function SETTINGS_SYSTEM()
	local TweenService = game:GetService("TweenService")
	local SoundService = game:GetService("SoundService")
	local clickSound = SoundService:FindFirstChild("Click")

	local activeTweens = {}
	local activeDots = {}
	local maxDots = 28
	local dotsEnabled = true

	local function createDot(randomStartY)
		if not dotsEnabled then return end

		local dot = Instance.new("Frame")
		dot.Name = "ParticleDot"
		dot.BorderSizePixel = 0
		dot.BackgroundColor3 = Color3.fromRGB(220, 240, 255)
		dot.Active = false
		dot.ZIndex = 1

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(1, 0)
		corner.Parent = dot

		local size = math.random(3, 7)
		dot.Size = UDim2.new(0, size, 0, size)

		local startX = math.random(2, 98) / 100
		local startY = randomStartY or (1.05 + (math.random(0, 10) / 100))
		local targetY = -0.1
		local driftX = math.clamp(startX + (math.random(-15, 15) / 100), 0.02, 0.98)

		dot.Position = UDim2.new(startX, 0, startY, 0)
		dot.BackgroundTransparency = math.random(30, 60) / 100
		dot.Parent = FloatingDots

		table.insert(activeDots, dot)

		local distance = startY - targetY
		local duration = (distance / 1.15) * math.random(5, 9)

		local moveTween = TweenService:Create(
			dot,
			TweenInfo.new(duration, Enum.EasingStyle.Linear),
			{
				Position = UDim2.new(driftX, 0, targetY, 0),
				BackgroundTransparency = 1
			}
		)

		table.insert(activeTweens, moveTween)

		moveTween.Completed:Connect(function()
			for i, t in ipairs(activeTweens) do
				if t == moveTween then
					table.remove(activeTweens, i)
					break
				end
			end
			for i, d in ipairs(activeDots) do
				if d == dot then
					table.remove(activeDots, i)
					break
				end
			end
			dot:Destroy()

			if dotsEnabled then
				createDot(false)
			end
		end)

		moveTween:Play()
	end

	local function startDots()
		dotsEnabled = true
		for i = 1, maxDots do
			createDot(math.random(0, 100) / 100)
		end
	end

	local function stopDots()
		dotsEnabled = false
		for _, tween in ipairs(activeTweens) do
			pcall(function() tween:Cancel() end)
		end
		table.clear(activeTweens)

		for _, dot in ipairs(activeDots) do
			pcall(function() dot:Destroy() end)
		end
		table.clear(activeDots)

		FloatingDots:ClearAllChildren()
	end

	-- Initialize DOTS particles as ON
	startDots()

	-- 1. DOTS TOGGLE (Checkmark toggles, box stays visible)
	local function toggleDots()
		if clickSound then clickSound:Play() end
		dotsEnabled = not dotsEnabled
		Check.Visible = dotsEnabled
		if dotsEnabled then
			startDots()
			OnOff.Text = "ON"
			OnOff.TextColor3 = Color3.fromRGB(13, 255, 0)
		else
			stopDots()
			OnOff.Text = "OFF"
			OnOff.TextColor3 = Color3.fromRGB(255, 60, 60)
		end
	end

	Box.MouseButton1Click:Connect(toggleDots)
	On.MouseButton1Click:Connect(toggleDots)
	Dots.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			toggleDots()
		end
	end)

	Dots.MouseEnter:Connect(function() Info.Visible = true end)
	Dots.MouseLeave:Connect(function() Info.Visible = false end)

	-- 2. GRADIENT TOGGLE (Checkmark toggles, box stays visible)
	local gradientEnabled = true
	local function toggleGradient()
		if clickSound then clickSound:Play() end
		gradientEnabled = not gradientEnabled
		Check_2.Visible = gradientEnabled
		UIGradient_5.Enabled = gradientEnabled
		OnOff_2.Text = gradientEnabled and "ON" or "OFF"
		OnOff_2.TextColor3 = gradientEnabled and Color3.fromRGB(13, 255, 0) or Color3.fromRGB(255, 60, 60)
	end
	Box_2.MouseButton1Click:Connect(toggleGradient)
	On_2.MouseButton1Click:Connect(toggleGradient)

	Gradient.MouseEnter:Connect(function() Info_2.Visible = true end)
	Gradient.MouseLeave:Connect(function() Info_2.Visible = false end)

	-- 3. SHADOW TOGGLE (Checkmark toggles, box stays visible)
	local shadowEnabled = true
	local function toggleShadow()
		if clickSound then clickSound:Play() end
		shadowEnabled = not shadowEnabled
		Check_3.Visible = shadowEnabled
		OnOff_3.Text = shadowEnabled and "ON" or "OFF"
		OnOff_3.TextColor3 = shadowEnabled and Color3.fromRGB(13, 255, 0) or Color3.fromRGB(255, 60, 60)
	end
	Box_3.MouseButton1Click:Connect(toggleShadow)
	On_3.MouseButton1Click:Connect(toggleShadow)

	Shadow.MouseEnter:Connect(function() Info_3.Visible = true end)
	Shadow.MouseLeave:Connect(function() Info_3.Visible = false end)

	-- 4. UNLOAD GUI (Safely removes GUI, disconnects FPS counter, stops particles)
	local function unloadGui()
		if clickSound then clickSound:Play() end

		if fpsConnection then
			pcall(function() fpsConnection:Disconnect() end)
			fpsConnection = nil
		end

		if stopDots then
			pcall(stopDots)
		end

		pcall(function()
			Gui:Destroy()
		end)
	end

	UnloadBtn.MouseButton1Click:Connect(unloadGui)
	Unload.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			unloadGui()
		end
	end)

	UnloadBtn.MouseEnter:Connect(function()
		UnloadBtn.BackgroundColor3 = Color3.fromRGB(225, 45, 45)
	end)
	UnloadBtn.MouseLeave:Connect(function()
		UnloadBtn.BackgroundColor3 = Color3.fromRGB(190, 35, 35)
	end)

	Unload.MouseEnter:Connect(function() Info_4.Visible = true end)
	Unload.MouseLeave:Connect(function() Info_4.Visible = false end)
end
coroutine.wrap(SETTINGS_SYSTEM)()

-- =========================================================
-- FPS COUNTER SYSTEM (Top Right of Screen)
-- =========================================================
local function FPS_SYSTEM()
	local RunService = game:GetService("RunService")
	local frameCount = 0
	local lastTime = tick()

	fpsConnection = RunService.RenderStepped:Connect(function()
		frameCount = frameCount + 1
		local currentTime = tick()
		local elapsed = currentTime - lastTime

		if elapsed >= 0.35 then
			local currentFps = math.floor((frameCount / elapsed) + 0.5)
			frameCount = 0
			lastTime = currentTime

			if FpsLabel and FpsLabel.Parent then
				FpsLabel.Text = string.format("FPS: %d", currentFps)
				if currentFps >= 50 then
					FpsLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
					FpsDot.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
				elseif currentFps >= 30 then
					FpsLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
					FpsDot.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
				else
					FpsLabel.TextColor3 = Color3.fromRGB(255, 120, 120)
					FpsDot.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
				end
			end
		end
	end)
end
coroutine.wrap(FPS_SYSTEM)()

-- Helper to detect any open/running game script loaded from the hub
local function getActiveGameGui()
	-- 1. Direct reference check via _G or shared
	local candidate = _G.ActiveGameScript or shared.ActiveGameScript
	if candidate and candidate.Gui and candidate.Gui.Parent then
		local frame = candidate.MainFrame or candidate.Gui:FindFirstChild("MainFrame") or candidate.Gui:FindFirstChild("Main")
		return candidate.Gui, frame
	end

	return nil, nil
end

-- =========================================================
-- FLOATING TOGGLE BUTTON SYSTEM (Drag & Drop + Show/Hide GUI)
-- =========================================================
local function TOGGLE_BUTTON_SYSTEM()
	local UserInputService = game:GetService("UserInputService")
	local SoundService = game:GetService("SoundService")
	local TweenService = game:GetService("TweenService")
	local clickSound = SoundService:FindFirstChild("Click")
	local hoverSound = SoundService:FindFirstChild("Hover")

	local isDragging = false
	local dragStartPos = nil
	local buttonStartPos = nil
	local hasMoved = false

	local function toggleGuiVisibility()
		if clickSound then clickSound:Play() end

		-- 1. If Infinity Hub is currently visible on screen, close it
		if Main.Visible then
			Main.Visible = false
			return
		end

		-- 2. If a game script is currently open/visible on screen, close (hide) it
		local gameGui, gameMainFrame = getActiveGameGui()
		if gameGui and gameMainFrame and gameMainFrame.Visible then
			gameMainFrame.Visible = false
			Main.Visible = false
			return
		end

		-- 3. If a game script was recently open and user closed it via figure 8, reopen it
		if gameGui and gameMainFrame and not _G.HubInFocus then
			gameMainFrame.Visible = true
			Main.Visible = false
			return
		end

		-- 4. Otherwise, reopen Infinity Hub
		_G.HubInFocus = true
		shared.HubInFocus = true
		Main.Visible = true
	end

	-- Hover feedback (tints to neon cyan and smoothly enlarges)
	ToggleButton.MouseEnter:Connect(function()
		if hoverSound and not isDragging and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			hoverSound:Play()
		end
		TweenService:Create(ToggleButton, TweenInfo.new(0.18), {
			ImageColor3 = Color3.fromRGB(0, 174, 255),
			Size = UDim2.new(0, 110, 0, 62)
		}):Play()
	end)

	ToggleButton.MouseLeave:Connect(function()
		TweenService:Create(ToggleButton, TweenInfo.new(0.18), {
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(0, 100, 0, 56)
		}):Play()
	end)

	-- Drag & Drop and Click / Tap detection
	ToggleButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			isDragging = true
			hasMoved = false
			dragStartPos = input.Position
			buttonStartPos = ToggleButton.Position

			local endConnection
			endConnection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					isDragging = false
					if endConnection then
						endConnection:Disconnect()
						endConnection = nil
					end

					if not hasMoved then
						toggleGuiVisibility()
					end
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStartPos
			if math.abs(delta.X) > 4 or math.abs(delta.Y) > 4 then
				hasMoved = true
			end
			ToggleButton.Position = UDim2.new(
				buttonStartPos.X.Scale,
				buttonStartPos.X.Offset + delta.X,
				buttonStartPos.Y.Scale,
				buttonStartPos.Y.Offset + delta.Y
			)
		end
	end)
end
coroutine.wrap(TOGGLE_BUTTON_SYSTEM)()

-- Volume drag bar logic
local function VOLUME_SYSTEM()
	local UserInputService = game:GetService("UserInputService")
	local SoundService = game:GetService("SoundService")
	local bg = DragBackground
	local draggingVolume = false

	local clickSound = SoundService:FindFirstChild("Click")
	local hoverSound = SoundService:FindFirstChild("Hover")

	local function updateVolume(input)
		local relX = math.clamp((input.Position.X - bg.AbsolutePosition.X) / bg.AbsoluteSize.X, 0, 1)
		relX = math.floor(relX * 10 + 0.5) / 10

		Drag.Size = UDim2.new(relX, 0, 1, 0)
		DragCount.Text = tostring(relX)

		if clickSound then clickSound.Volume = 1.25 * relX end
		if hoverSound then hoverSound.Volume = 0.25 * relX end
	end

	bg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			draggingVolume = true
			updateVolume(input)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			draggingVolume = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if draggingVolume and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			updateVolume(input)
		end
	end)
end
coroutine.wrap(VOLUME_SYSTEM)()

-- =========================================================
-- SERVER TAB LOGIC (Game Info, Support Status, Live Metrics & Actions)
-- =========================================================
local function SERVER_SYSTEM()
	local MarketplaceService = game:GetService("MarketplaceService")
	local TeleportService = game:GetService("TeleportService")
	local HttpService = game:GetService("HttpService")
	local Players = game:GetService("Players")
	local SoundService = game:GetService("SoundService")
	local clickSound = SoundService:FindFirstChild("Click")

	-- Table of games with dedicated/full Infinity Hub support
	-- (You can add any Place ID or Game ID here!)
	local supportedHubGames = {
		[8737899170] = "Pet Simulator 99",
		[155615604] = "Prison Life",
		[2753915549] = "Blox Fruits",
		[4520749081] = "King Legacy",
		[6872265039] = "BedWars",
		[189707] = "Natural Disaster Survival",
		[10042455759] = "Doors",
		[6516141723] = "Doors",
		[9285238704] = "Race Clicker",
		[13775256536] = "Blade Ball",
		[286090429] = "Arsenal",
		[1962086868] = "Tower of Hell",
	}

	local placeId = game.PlaceId
	local detectedGameName = (game.Name ~= "" and game.Name) or ""

	-- Function to evaluate whether the current game is supported or posted on the GAME page (GFrame)
	local function checkGameSupported(expName)
		local curPlaceId = game.PlaceId
		local curGameId = game.GameId

		-- 1. Check supportedHubGames lookup table
		if supportedHubGames[curPlaceId] or (curGameId and supportedHubGames[curGameId]) then
			return true
		end

		-- Normalize detected game name for matching
		local normDetected = ""
		if expName and type(expName) == "string" and expName ~= "" then
			normDetected = string.lower(string.gsub(expName, "[^%w%s]", ""))
		end

		-- 2. Inspect GAME page (GFrame) to check if game is posted there
		if GFrame then
			local descendants = GFrame:GetDescendants()
			for _, item in ipairs(descendants) do
				-- Ignore Search bar and its icon
				if item ~= Search and item.Name ~= "Search" and item.Name ~= "ImageLabel_2" then
					-- Check Text properties (TextButton, TextLabel, TextBox)
					if item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox") then
						local text = item.Text
						if text and text ~= "" and string.upper(text) ~= "SEARCH" then
							local lowerText = string.lower(text)
							-- Match Place ID or Game ID in text
							if string.find(lowerText, tostring(curPlaceId), 1, true) or (curGameId and string.find(lowerText, tostring(curGameId), 1, true)) then
								return true
							end
							-- Match experience name in text
							if normDetected ~= "" then
								local normText = string.lower(string.gsub(text, "[^%w%s]", ""))
								if normText ~= "" and (string.find(normDetected, normText, 1, true) or string.find(normText, normDetected, 1, true)) then
									return true
								end
							end
						end
					end

					-- Check Instance name
					local itemName = item.Name
					if itemName and itemName ~= "" then
						if itemName == tostring(curPlaceId) or (curGameId and itemName == tostring(curGameId)) then
							return true
						end
						if normDetected ~= "" and not item:IsA("UIComponent") and not item:IsA("UIStroke") and not item:IsA("UICorner") and not item:IsA("UIGradient") and not item:IsA("UIPadding") and not item:IsA("UIListLayout") and not item:IsA("UIGridLayout") then
							local normName = string.lower(string.gsub(itemName, "[^%w%s]", ""))
							if normName ~= "" and (string.find(normDetected, normName, 1, true) or string.find(normName, normDetected, 1, true)) then
								return true
							end
						end
					end

					-- Check custom attributes (e.g. PlaceId attribute)
					pcall(function()
						local attrs = item:GetAttributes()
						for _, v in pairs(attrs) do
							if tostring(v) == tostring(curPlaceId) or (curGameId and tostring(v) == tostring(curGameId)) then
								return true
							end
							if normDetected ~= "" and type(v) == "string" then
								local normVal = string.lower(string.gsub(v, "[^%w%s]", ""))
								if normVal ~= "" and (string.find(normDetected, normVal, 1, true) or string.find(normVal, normDetected, 1, true)) then
									return true
								end
							end
						end
					end)
				end
			end
		end

		return false
	end

	-- Function to update badge UI
	local function updateSupportBadge(supported)
		if supported then
			SupportBadge.BackgroundColor3 = Color3.fromRGB(15, 55, 25)
			SupportBadgeStroke.Color = Color3.fromRGB(0, 255, 140)
			SupportBadgeText.Text = "🟢 SUPPORTED"
			SupportBadgeText.TextColor3 = Color3.fromRGB(0, 255, 140)
			SubtitleLabel.Text = "This experience is supported by Infinity Hub."
			SubtitleLabel.TextColor3 = Color3.fromRGB(0, 255, 140)
		else
			SupportBadge.BackgroundColor3 = Color3.fromRGB(50, 15, 15)
			SupportBadgeStroke.Color = Color3.fromRGB(255, 60, 60)
			SupportBadgeText.Text = "🔴 NOT SUPPORTED"
			SupportBadgeText.TextColor3 = Color3.fromRGB(255, 60, 60)
			SubtitleLabel.Text = "This experience is not currently supported."
			SubtitleLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
		end
	end

	-- Initial check & badge update
	local isSupported = checkGameSupported(detectedGameName)
	updateSupportBadge(isSupported)

	-- 1. Fetch real experience/game name
	task.spawn(function()
		local success, productInfo = pcall(function()
			return MarketplaceService:GetProductInfo(placeId)
		end)
		if success and productInfo and productInfo.Name then
			detectedGameName = productInfo.Name
			GameNameLabel.Text = productInfo.Name
		else
			GameNameLabel.Text = (game.Name ~= "" and game.Name) or ("Place ID: " .. tostring(placeId))
		end

		-- Re-check with the fetched experience name
		isSupported = checkGameSupported(detectedGameName)
		updateSupportBadge(isSupported)
	end)

	-- Listen for any games dynamically added to the GAME tab (GFrame)
	if GFrame then
		GFrame.DescendantAdded:Connect(function()
			task.wait(0.1)
			isSupported = checkGameSupported(detectedGameName)
			updateSupportBadge(isSupported)
		end)
		GFrame.DescendantRemoving:Connect(function()
			task.wait(0.1)
			isSupported = checkGameSupported(detectedGameName)
			updateSupportBadge(isSupported)
		end)
	end

	-- 3. Live Server Metrics Loop (every 1 second)
	task.spawn(function()
		while task.wait(1) do
			if not Gui or not Gui.Parent then break end
			-- Live Player Count
			pcall(function()
				PlayersLabel.Text = string.format("👥 Players: %d / %s", #Players:GetPlayers(), tostring(Players.MaxPlayers))
			end)
			-- Live Ping
			pcall(function()
				local ping = 0
				if localPlayer and localPlayer:GetNetworkPing() then
					ping = math.floor(localPlayer:GetNetworkPing() * 1000 + 0.5)
				end
				if ping == 0 then
					local perf = game:GetService("Stats"):FindFirstChild("PerformanceStats")
					if perf and perf:FindFirstChild("Ping") then
						ping = math.floor(perf.Ping:GetValue())
					end
				end
				PingLabel.Text = string.format("📶 Ping: %d ms", ping)
			end)
			-- Live Server Uptime
			pcall(function()
				local uptime = math.floor(workspace.DistributedGameTime)
				local hrs = math.floor(uptime / 3600)
				local mins = math.floor((uptime % 3600) / 60)
				local secs = uptime % 60
				UptimeLabel.Text = string.format("⏱️ Server Uptime: %02dh %02dm %02ds", hrs, mins, secs)
			end)
		end
	end)

	-- 4. Copy Game Session URL Button
	CopyJobBtn.MouseButton1Click:Connect(function()
		if clickSound then clickSound:Play() end
		local sessionUrl = string.format("https://www.roblox.com/games/start?placeId=%d&gameInstanceId=%s", game.PlaceId, game.JobId)
		pcall(function()
			if setclipboard then
				setclipboard(sessionUrl)
			elseif toclipboard then
				toclipboard(sessionUrl)
			end
		end)
		CopyJobBtn.Text = "COPIED LINK!"
		task.delay(1.5, function()
			if CopyJobBtn and CopyJobBtn.Parent then
				CopyJobBtn.Text = "Copy game Session"
			end
		end)
	end)

	-- 5. Rejoin Server Button
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

	-- 6. Server Hop Button
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
					for _, server in ipairs(parsed.data) do
						if type(server) == "table" and server.id ~= game.JobId and server.playing < server.maxPlayers then
							TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, localPlayer)
							return
						end
					end
				end
			end
			-- Fallback
			TeleportService:Teleport(game.PlaceId, localPlayer)
		end)
	end)
end
coroutine.wrap(SERVER_SYSTEM)()

-- =========================================================
-- GAME TAB SEARCH SYSTEM
-- ==========================================
local function GAME_SEARCH_SYSTEM()
	if Search and GamesScroll then
		Search:GetPropertyChangedSignal("Text"):Connect(function()
			local query = string.lower(Search.Text)
			for _, item in ipairs(GamesScroll:GetChildren()) do
				if item:IsA("Frame") then
					local titleLabel = item:FindFirstChild("Title")
					if titleLabel and titleLabel:IsA("TextLabel") then
						if query == "" or string.find(string.lower(titleLabel.Text), query, 1, true) then
							item.Visible = true
						else
							item.Visible = false
						end
					end
				end
			end
		end)
	end
end
coroutine.wrap(GAME_SEARCH_SYSTEM)()

-- =========================================================
-- DYNAMIC GAMES LIST GENERATOR
-- Automatically loads all games from games_config.lua and
-- creates their cards on the GAME tab in the Hub!
-- =========================================================
local function POPULATE_GAMES_SYSTEM()
	local SoundService = game:GetService("SoundService")
	local TeleportService = game:GetService("TeleportService")
	local clickSound = SoundService:FindFirstChild("Click")
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

	if not GamesScroll then return end

	for _, g in ipairs(gamesList) do
		local card = Instance.new("Frame")
		card.Name = g.Name .. "Card"
		card.Parent = GamesScroll
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
