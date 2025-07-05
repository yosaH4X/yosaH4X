local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- ENV
getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().Chest = false
getgenv().ESP = false

-- Remove old gui
if CoreGui:FindFirstChild("yosaH4X_UI") then
    CoreGui:FindFirstChild("yosaH4X_UI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "yosaH4X_UI"
ScreenGui.ResetOnSpawn = false

-- Sidebar
local Sidebar = Instance.new("Frame", ScreenGui)
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local Header = Instance.new("TextLabel", Sidebar)
Header.Size = UDim2.new(1, 0, 0, 50)
Header.Text = "🌸 yosaH4X 🌸"
Header.TextColor3 = Color3.new(1,1,1)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 16
Header.BackgroundTransparency = 1

local Buttons = {
    "Main",
    "Farming",
    "Items",
    "Setting",
    "Local Player",
    "Hold Skill",
    "Sea Event"
}

local Panels = {}

-- Main panel container
local MainPanel = Instance.new("Frame", ScreenGui)
MainPanel.Size = UDim2.new(0, 400, 0, 450)
MainPanel.Position = UDim2.new(0, 160, 0.1, 0)
MainPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainPanel.Visible = true

local UICornerMain = Instance.new("UICorner", MainPanel)
UICornerMain.CornerRadius = UDim.new(0, 8)

-- Hide button (X)
local HideBtn = Instance.new("TextButton", MainPanel)
HideBtn.Size = UDim2.new(0, 30, 0, 30)
HideBtn.Position = UDim2.new(1, -35, 0, 5)
HideBtn.Text = "X"
HideBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
HideBtn.TextColor3 = Color3.new(1,1,1)
HideBtn.Font = Enum.Font.GothamBold
HideBtn.TextSize = 14

HideBtn.MouseButton1Click:Connect(function()
    MainPanel.Visible = not MainPanel.Visible
end)

-- Create buttons & panels
for i, name in ipairs(Buttons) do
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.Position = UDim2.new(0, 0, 0, 50 + (i - 1) * 45)
    Btn.Text = name
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14

    local Panel = Instance.new("Frame", MainPanel)
    Panel.Size = UDim2.new(1, 0, 1, 0)
    Panel.Visible = false
    Panels[name] = Panel

    Btn.MouseButton1Click:Connect(function()
        for k, v in pairs(Panels) do
            v.Visible = false
        end
        Panel.Visible = true
    end)
end

-- Example contents for each panel
local function addToggle(panel, text, varName)
    local Toggle = Instance.new("TextButton", panel)
    Toggle.Size = UDim2.new(0.9, 0, 0, 40)
    Toggle.Position = UDim2.new(0.05, 0, 0, #panel:GetChildren() * 45)
    Toggle.Text = text .. ": OFF"
    Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Toggle.TextColor3 = Color3.new(1,1,1)
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextSize = 14

    Toggle.MouseButton1Click:Connect(function()
        getgenv()[varName] = not getgenv()[varName]
        Toggle.Text = text .. ": " .. (getgenv()[varName] and "ON" or "OFF")
    end)
end

-- Farming panel example
addToggle(Panels["Farming"], "Auto Farm", "AutoFarm")
addToggle(Panels["Farming"], "Auto Boss", "AutoBoss")
addToggle(Panels["Farming"], "Chest", "Chest")
addToggle(Panels["Farming"], "ESP", "ESP")

-- Main panel example
local Info = Instance.new("TextLabel", Panels["Main"])
Info.Size = UDim2.new(1, 0, 0, 30)
Info.Text = "Welcome to yosaH4X!"
Info.TextColor3 = Color3.new(1,1,1)
Info.BackgroundTransparency = 1
Info.Font = Enum.Font.GothamBold
Info.TextSize = 18
Info.Position = UDim2.new(0, 0, 0, 10)

-- Items panel example
local ItemsInfo = Instance.new("TextLabel", Panels["Items"])
ItemsInfo.Size = UDim2.new(1, 0, 0, 30)
ItemsInfo.Text = "Your items will be listed here soon!"
ItemsInfo.TextColor3 = Color3.new(1,1,1)
ItemsInfo.BackgroundTransparency = 1
ItemsInfo.Font = Enum.Font.Gotham
ItemsInfo.TextSize = 14
ItemsInfo.Position = UDim2.new(0, 0, 0, 10)

-- Setting panel example
local SettingInfo = Instance.new("TextLabel", Panels["Setting"])
SettingInfo.Size = UDim2.new(1, 0, 0, 30)
SettingInfo.Text = "Setting config here."
SettingInfo.TextColor3 = Color3.new(1,1,1)
SettingInfo.BackgroundTransparency = 1
SettingInfo.Font = Enum.Font.Gotham
SettingInfo.TextSize = 14
SettingInfo.Position = UDim2.new(0, 0, 0, 10)

-- Auto select first panel
Panels["Main"].Visible = true

print("✅ yosaH4X UI loaded successfully!")
