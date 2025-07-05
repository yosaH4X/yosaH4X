local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

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

-- Main Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 450, 0, 400)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Header
local Header = Instance.new("TextLabel", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Text = "🌸 yosaH4X 🌸"
Header.TextColor3 = Color3.new(1,1,1)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 18
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Hide Button (icon)
local HideButton = Instance.new("ImageButton", MainFrame)
HideButton.Size = UDim2.new(0, 30, 0, 30)
HideButton.Position = UDim2.new(1, -35, 0, 5)
HideButton.Image = "rbxassetid://13533617921"  -- ganti dengan foto Mahiru jika mau
HideButton.BackgroundTransparency = 1

HideButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Show Button
local ShowButton = Instance.new("ImageButton", ScreenGui)
ShowButton.Size = UDim2.new(0, 50, 0, 50)
ShowButton.Position = UDim2.new(0, 10, 0.5, -25)
ShowButton.Image = "rbxassetid://13533617921" -- ganti ke Mahiru icon
ShowButton.BackgroundTransparency = 1
ShowButton.Visible = false

ShowButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ShowButton.Visible = false
end)

-- When hide
HideButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ShowButton.Visible = true
end)

-- Buttons
local function createToggle(name, var)
    local Btn = Instance.new("TextButton", MainFrame)
    Btn.Size = UDim2.new(0.9, 0, 0, 40)
    Btn.Position = UDim2.new(0.05, 0, 0, #MainFrame:GetChildren() * 45)
    Btn.Text = name .. ": OFF"
    Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14

    Btn.MouseButton1Click:Connect(function()
        getgenv()[var] = not getgenv()[var]
        Btn.Text = name .. ": " .. (getgenv()[var] and "ON" or "OFF")
    end)
end

createToggle("Auto Farm", "AutoFarm")
createToggle("Auto Boss", "AutoBoss")
createToggle("Chest", "Chest")
createToggle("ESP", "ESP")

print("✅ yosaH4X UI loaded with draggable & hide feature!")
