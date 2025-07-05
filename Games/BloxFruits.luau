-- Load Linoria
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "🌸 yosaH4X 🌸",
    Center = true,
    AutoShow = true,
    TabPadding = 4,
    MenuFadeTime = 0.2
})

-- Kecil banget
Window:SetMinimumSize(Vector2.new(400, 250))
Window:Show()

Library:OnUnload(function()
    print("Script unloaded.")
end)

local Tabs = {
    Main = Window:AddTab("Main"),
    Farm = Window:AddTab("Farm"),
    Misc = Window:AddTab("Misc"),
    Config = Window:AddTab("Config")
}

local MainBox = Tabs.Main:AddLeftGroupbox("yosaH4X Info")
MainBox:AddLabel("Script by yosaH4X 💥")
MainBox:AddDivider()
MainBox:AddButton("Destroy UI", function()
    Library:Unload()
end)

getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().AutoChest = false
getgenv().ESP = false

local FarmBox = Tabs.Farm:AddLeftGroupbox("Farm Controls")
FarmBox:AddToggle("AutoFarm", {
    Text = "Auto Farm",
    Default = false,
    Tooltip = "Enable auto farm mobs",
}):OnChanged(function(value)
    getgenv().AutoFarm = value
end)

FarmBox:AddToggle("AutoBoss", {
    Text = "Auto Boss",
    Default = false,
}):OnChanged(function(value)
    getgenv().AutoBoss = value
end)

FarmBox:AddToggle("AutoChest", {
    Text = "Auto Chest",
    Default = false,
}):OnChanged(function(value)
    getgenv().AutoChest = value
end)

FarmBox:AddToggle("ESP", {
    Text = "ESP",
    Default = false,
}):OnChanged(function(value)
    getgenv().ESP = value
end)

-- Misc
local MiscBox = Tabs.Misc:AddLeftGroupbox("Extra")
MiscBox:AddButton("Teleport to Middle", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 150, 0)
end)

-- Theme & Save
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Config)
ThemeManager:ApplyToTab(Tabs.Config)

-- Anti AFK
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

-- Logic loop
task.spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
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
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        boss.Humanoid.Health = 0
                    until boss.Humanoid.Health <= 0 or not getgenv().AutoBoss
                end
            end)
        end

        if getgenv().AutoChest then
            pcall(function()
                for _, chest in pairs(workspace:GetChildren()) do
                    if chest.Name:match("Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.CFrame
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

Library:Notify("✅ yosaH4X Loaded! Press RightShift to hide/show UI.")
