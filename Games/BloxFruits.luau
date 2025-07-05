-- Load Linoria
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = '🌸 yosaH4X 🌸',
    Center = true,
    AutoShow = true,
    TabPadding = 3,
    MenuFadeTime = 0.2
})

-- Setting ukuran
Window:SetMinimumSize(Vector2.new(450, 300)) -- kecilin ukuran frame
Window:Toggle() -- biar langsung muncul

local Tabs = {
    Main = Window:AddTab('Main'),
    Farming = Window:AddTab('Farming'),
    Misc = Window:AddTab('Misc'),
    Settings = Window:AddTab('Settings'),
}

local MainGroup = Tabs.Main:AddLeftGroupbox('Welcome')
MainGroup:AddLabel('Script by yosaH4X')

-- Toggle variables
getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().Chest = false
getgenv().ESP = false

-- Farming toggles
local FarmGroup = Tabs.Farming:AddLeftGroupbox('Farming Options')
FarmGroup:AddToggle('AutoFarm', {
    Text = 'Auto Farm',
    Default = false,
    Tooltip = 'Farm all enemies',
}):OnChanged(function(value)
    getgenv().AutoFarm = value
end)

FarmGroup:AddToggle('AutoBoss', {
    Text = 'Auto Boss',
    Default = false,
}):OnChanged(function(value)
    getgenv().AutoBoss = value
end)

FarmGroup:AddToggle('Chest', {
    Text = 'Chest',
    Default = false,
}):OnChanged(function(value)
    getgenv().Chest = value
end)

FarmGroup:AddToggle('ESP', {
    Text = 'ESP',
    Default = false,
}):OnChanged(function(value)
    getgenv().ESP = value
end)

-- Misc example
local MiscGroup = Tabs.Misc:AddLeftGroupbox('Miscellaneous')
MiscGroup:AddButton('Teleport to Sea', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
end)

-- Save & Theme
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

Library:Notify('Welcome to yosaH4X!')

-- Logic loops
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Anti AFK
pcall(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- Farming logic
task.spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            v.Humanoid.Health = 0
                        until v.Humanoid.Health <= 0 or not getgenv().AutoFarm
                    end
                end
            end)
        end

        if getgenv().AutoBoss then
            pcall(function()
                local boss = workspace.Enemies:FindFirstChild("Boss")
                if boss and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                    repeat task.wait()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        boss.Humanoid.Health = 0
                    until boss.Humanoid.Health <= 0 or not getgenv().AutoBoss
                end
            end)
        end

        if getgenv().Chest then
            pcall(function()
                for _, chest in pairs(workspace:GetChildren()) do
                    if chest.Name:match("Chest") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = chest.CFrame
                        wait(0.5)
                    end
                end
            end)
        end

        if getgenv().ESP then
            pcall(function()
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if not enemy:FindFirstChild("Highlight") then
                        local highlight = Instance.new("Highlight", enemy)
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
                    end
                end
            end)
        end
    end
end)
